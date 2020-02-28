;;; Find SRFIs using Unicode characters

(import (scheme base) (scheme write) (srfi 1) (srfi 69) (srfi 95))
(import (utilities) (srfi-alist))

(define (hash-table-increment! table key)
  (hash-table-update!/default table key (lambda (x) (+ x 1)) 0))

(define (find-non-ascii-characters string)
  (define (ascii-char? char) (< (char->integer char) #x80))
  (let ((in (open-input-string string)) (chars (make-hash-table)))
    (let loop ((count 0))
      (let ((char (read-char in)))
        (cond ((eof-object? char)
               (values count (hash-table-keys chars)))
              ((ascii-char? char)
               (loop count))
              (else
               (hash-table-increment! chars char)
               (loop (+ count 1))))))))

(define (find-non-ascii-per-srfi)
  (filter (lambda (x) (not (= 0 (cadr x))))
          (sort (map (lambda (srfi)
                       (let-values (((count chars)
                                     (find-non-ascii-characters
                                      (srfi-html srfi))))
                         (cons* (srfi-number srfi) count chars)))
                     srfi-alist)
                (lambda (a b) (> (cadr a) (cadr b))))))

(define (main) (for-each disp (find-non-ascii-per-srfi)))

(main)
