;;; List the SRFIs containing one or more images.

(import (scheme base) (scheme write))
(import (sxml-utilities) (srfi-alist))

(define (disp . xs) (for-each display xs) (newline))

(define (html-image-count html)
  (tag-names-fold
   (html-string->sxml html)
   (lambda (tag count) (if (equal? 'img tag) (+ count 1) count))
   0))

(define (main)
  (for-each (lambda (srfi)
              (let ((count (html-image-count (srfi-html srfi))))
                (when (> count 0) (disp (cons (srfi-number srfi) count)))))
            srfi-alist))

(main)
