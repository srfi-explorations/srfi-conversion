;;; List all other tags contained inside a <pre> tag in each SRFI

(import (scheme base) (scheme write) (srfi 69) (srfi 95))
(import (sxml-utilities) (srfi-alist))

(define (disp . xs) (for-each display xs) (newline))

(define (html-fancy-tags-inside-pre html)
  (let ((fancy (make-hash-table)))
    (element-fold
     (html-string->sxml html)
     (lambda (elem fancy)
       (if (not (equal? 'pre (car elem))) fancy
           (tag-names-fold elem
                           (lambda (tag fancy)
                             (if (equal? 'pre tag) fancy
                                 (begin (hash-table-set! fancy tag #t)
                                        fancy)))
                           fancy)))
     fancy)
    (map string->symbol (sort (map symbol->string (hash-table-keys fancy))
                              string<?))))

(define (main)
  (for-each (lambda (srfi)
              (let ((fancy (html-fancy-tags-inside-pre (srfi-html srfi))))
                (unless (null? fancy)
                  (disp (cons (srfi-number srfi) fancy)))))
            srfi-alist))

(main)
