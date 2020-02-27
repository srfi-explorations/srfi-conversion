;;; List the SRFIs containing one or more images.

(import (scheme base) (scheme write))
(import (sxml-utilities) (srfi-alist))

(define (disp . xs) (for-each display xs) (newline))

(define (html-contains-image? html)
  (tag-names-fold (html-string->sxml html)
                  (lambda (tag img?) (or img? (equal? 'img tag)))
                  #f))

(define (main)
  (for-each (lambda (srfi)
              (when (html-contains-image? (srfi-html srfi))
                (disp (srfi-number srfi))))
            srfi-alist))

(main)
