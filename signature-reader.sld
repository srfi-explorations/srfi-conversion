(define-library (signature-reader)
  (export read-3-part-signature string->3-part-signature)
  (import (scheme base) (scheme read) (srfi 1) (srfi 130))
  (import (utilities))
  (begin

    (define after-arrow
      (let ((arrows '("->" "→" "⟶")))
        (lambda (string)
          (cond ((find (lambda (a) (string-prefix? a string)) arrows)
                 => (lambda (a)
                      (string-trim-both (string-drop string (string-length a)))))
                (else #f)))))

    (define (parse-tail string)
      (cond ((after-arrow (string-trim string))
             => (lambda (s) (string-split s " " 'strict-infix 1)))
            (else #f)))

    (define (read-3-part-signature)
      (let* ((sexp (read))
             (tail (read-line)))
        (cond ((not tail) (values sexp #f #f))
              ((eof-object? tail) (values sexp #f #f))
              ((parse-tail tail)
               => (lambda (return+comment)
                    (values sexp
                            (string-trim (car return+comment))
                            (cond ((null? (cdr return+comment)) #f)
                                  (else (string-trim (cadr return+comment)))))))
              (else (values sexp #f #f)))))

    (define (string->3-part-signature line)
      (with-input-from-string line read-3-part-signature))))
