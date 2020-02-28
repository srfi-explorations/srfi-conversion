(import (scheme base) (scheme char) (scheme read) (scheme write))

(define right-arrow #\x27f6)

(define (writeln x) (write x) (newline))

(define (generator->list generator)
  (let loop ((xs '()))
    (let ((x (generator)))
      (if (eof-object? x) (reverse xs) (loop (cons x xs))))))

(define (string-contains-char? string char)
  (not (not (member char (string->list string)))))

(define (read-char? match?)
  (let ((char (peek-char)))
    (and (not (eof-object? char)) (match? char) (read-char))))

(define (read-char* match?)
  (let loop ((chars '()))
    (let ((char (read-char? match?)))
      (if char (loop (cons char chars))
          (and (not (null? chars)) (list->string (reverse chars)))))))

(define (skip-char* match?) (not (not (read-char* match?))))

(define (standalone-char? char)
  (string-contains-char? (string-append "()." (string right-arrow))
                         char))

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

(define (main) (for-each writeln (read-all-tokens)))

(main)
