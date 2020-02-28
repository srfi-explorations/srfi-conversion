(define-library (signature-reader)
  (export read-token read-all-tokens read-all-forms
          read-3-part-signature string->3-part-signature)
  (import (scheme base) (scheme char) (scheme read) (srfi 1) (srfi 130))
  (import (utilities))
  (begin

    (define rightwards-arrow #\x2192)
    (define long-rightwards-arrow #\x27F6)
    (define arrow-chars (list rightwards-arrow long-rightwards-arrow))
    (define arrow-symbols
      (cons '|->| (map string->symbol (map string arrow-chars))))
    (define (arrow? obj) (member obj arrow-symbols))

    ;;;

    (define standalone-chars (string-append "()." (list->string arrow-chars)))

    (define (standalone-char? char)
      (string-contains-char? standalone-chars char))

    (define (token-first-char? char)
      (or (char=? #\- char)  ; Needed to parse -> as a symbol.
          (char-alphabetic? char)))

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

    (define (read-all-tokens) (generator->list read-token))

    ;;;

    (define (read-all-forms)
      (define tokens (read-all-tokens))
      (define (read-token? match?)
        (let ((head (if (null? tokens) (eof-object) (car tokens)))
              (tail (if (null? tokens) tokens (cdr tokens))))
          (and (match? head) (begin (set! tokens tail) head))))
      (define (open?  tok) (eqv? '|(| tok))
      (define (close? tok) (eqv? '|)| tok))
      (define (read-delimited delimiter?)
        (let loop ((acc '()))
          (if (read-token? delimiter?) (reverse acc)
              (loop (cons (read-nested) acc)))))
      (define (read-list?) (and (read-token? open?) (read-delimited close?)))
      (define (read-nested)
        (or (read-list?) (read-token? symbol?) (error "Syntax error")))
      (read-delimited eof-object?))

    ;;;

    (define (read-3-part-signature)
      (let ((forms (read-all-forms))
            (sexp #f)
            (retu #f)
            (comm #f))
        (unless (null? forms)
          (set! sexp (car forms))
          (unless (or (list? sexp) (and (symbol? sexp) (not (arrow? sexp))))
            (error "Bad S-expression"))
          (set! forms (cdr forms))
          (unless (null? forms)
            (unless (arrow? (car forms))
              (error "Expected arrow instead of" (car forms)))
            (set! forms (cdr forms))
            (unless (null? forms)
              (set! retu (car forms))
              (set! forms (cdr forms))
              (unless (null? forms)
                (set! comm (car forms))
                (set! forms (cdr forms))
                (unless (null? forms)
                  (error "Spurious item at end of list"))))))
        (values sexp retu comm)))

    (define (string->3-part-signature line)
      (with-input-from-string line read-3-part-signature))))
