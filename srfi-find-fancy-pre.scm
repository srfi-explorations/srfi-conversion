;;; List all other tags contained inside a <pre> tag in each SRFI

(import (scheme base) (scheme write) (srfi 69) (srfi 95))
(import (sxml-utilities) (srfi-alist))

(define (disp . xs) (for-each display xs) (newline))

(define (sort-symbols symbols)
  (map string->symbol (sort (map symbol->string symbols) string<?)))

(define (html-other-tags-inside-pre html)
  (let ((other-tags (make-hash-table)))
    (element-for-each
     (lambda (elem)
       (when (equal? 'pre (car elem))
         (tag-names-for-each
          (lambda (tag)
            (unless (equal? 'pre tag)
              (hash-table-set! other-tags tag #t)))
          elem)))
     (html-string->sxml html))
    (sort-symbols (hash-table-keys other-tags))))

(define (main)
  (for-each (lambda (srfi)
              (let ((tags (html-other-tags-inside-pre (srfi-html srfi))))
                (unless (null? tags)
                  (disp (cons (srfi-number srfi) tags)))))
            srfi-alist))

(main)
