;;; Count how many times each HTML tag is used in the SRFI collection.

(import (scheme base) (scheme write) (srfi 69) (srfi 95))
(import (utilities) (sxml-utilities) (srfi-alist))

(define (hash-table-increment! table key)
  (hash-table-update!/default table key (lambda (x) (+ x 1)) 0))

(define (count-html-tags! html counts)
  (tag-names-for-each (lambda (tag) (hash-table-increment! counts tag))
                      (html-string->sxml html)))

(define (main)
  (let ((counts (make-hash-table)))
    (for-each (lambda (srfi) (count-html-tags! (srfi-html srfi) counts))
              srfi-alist)
    (for-each (lambda (tag-name)
                (let ((count (hash-table-ref counts tag-name)))
                  (disp (list tag-name count))))
              (sort (hash-table-keys counts)
                    (lambda (tag-a tag-b)
                      (> (hash-table-ref counts tag-a)
                         (hash-table-ref counts tag-b)))))))

(main)
