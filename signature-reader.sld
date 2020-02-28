(define-library (signature-reader)
  (export read-token read-3-part-signature string->3-part-signature)
  (import (scheme base) (scheme char) (scheme read) (srfi 1) (srfi 130))
  (import (utilities))
  (begin

    (define right-arrow #\x27f6)

    (define standalone-chars (string-append "()." (string right-arrow)))

    (define (standalone-char? char)
      (string-contains-char? standalone-chars char))

    (define token-first-char? char-alphabetic?)

    (define (token-subsequent-char? char)
      (or (token-first-char? char) (char-numeric? char)
          (string-contains-char? "+-*/._-<>" char)))

    (define (read-token)
      (skip-char* char-whitespace?)
      (or (let ((char (read-char? standalone-char?)))
            (and char (string->symbol (string char))))
          (let ((char (read-char? token-first-char?)))
            (and char (string->symbol
                       (string-append (string char)
                                      (read-char* token-subsequent-char?)))))
          (let ((char (peek-char)))
            (if (eof-object? char) char (error "Syntax error:" char)))))

    ;;;

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
