;;; Count how many times each HTML tag is used in the SRFI collection.

(import (scheme base) (scheme write) (srfi 69) (srfi 95))
(import (sxml-utilities) (srfi-alist))

(define make-set make-hash-table)
(define set-elems hash-table-keys)
(define (add-to-set elem set) (hash-table-set! set elem #t) set)
(define (symbol<? a b) (string<? (symbol->string a) (symbol->string b)))

(define (hash-table-increment! table key)
  (hash-table-update!/default table key (lambda (x) (+ x 1)) 0))

(define (disp . xs) (for-each display xs) (newline))

(define (count-html-tags! html counts)
  (tag-names-fold (html-string->sxml html)
                  (lambda (tag counts)
                    (hash-table-increment! counts tag)
                    counts)
                  counts))

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
