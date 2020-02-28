(import (scheme base) (scheme char) (scheme read) (scheme write))
(import (utilities))

(define right-arrow #\x27f6)

(define standalone-chars (string-append "()." (string right-arrow)))

(define (standalone-char? char) (string-contains-char? standalone-chars char))

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

(define (read-all-tokens) (generator->list read-token))

(define (string->tokens s) (with-input-from-string s read-all-tokens))

(define (main) (for-each writeln (map string->tokens (read-all-lines))))

(main)
