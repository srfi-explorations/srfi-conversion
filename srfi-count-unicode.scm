;;; Find SRFIs using Unicode characters

(import (scheme base)
        (scheme char)
        (scheme write)
        (srfi 1)
        (srfi 95))

(import (chibi html-parser))
(import (srfi-alist))

(define (displayln . xs) (for-each display xs) (newline))

(define (count-non-ascii-characters string)
  (define (ascii-char? char) (< (char->integer char) #x80))
  (let ((in (open-input-string string)))
    (let loop ((count 0))
      (let ((char (read-char in)))
        (cond ((eof-object? char) count)
              ((ascii-char? char) (loop count))
              (else (loop (+ count 1))))))))

(define (count-non-ascii-per-srfi)
  (filter (lambda (x) (not (= 0 (cdr x))))
          (sort (map (lambda (srfi)
                       (cons (srfi-number srfi)
                             (count-non-ascii-characters
                              (srfi-html srfi))))
                     srfi-alist)
                (lambda (a b) (> (cdr a) (cdr b))))))

(define (main)
  (for-each displayln (count-non-ascii-per-srfi)))

(main)
