(define-library (utilities)
  (export disp writeln with-input-from-string string-contains-char?
          hash-table-increment!
          generator->list read-all-lines read-char? read-char* skip-char*)
  (import (scheme base) (scheme read) (scheme write) (srfi 69))
  (begin

    (define (disp . xs) (for-each display xs) (newline))

    (define (writeln x) (write x) (newline))

    (define (with-input-from-string string proc)
      (call-with-port (open-input-string string)
                      (lambda (in)
                        (parameterize ((current-input-port in))
                          (proc)))))

    (define (string-contains-char? string char)
      (not (not (member char (string->list string)))))

    (define (hash-table-increment! table key)
      (hash-table-update!/default table key (lambda (x) (+ x 1)) 0))

    (define (generator->list generator)
      (let loop ((xs '()))
        (let ((x (generator)))
          (if (eof-object? x) (reverse xs) (loop (cons x xs))))))

    (define (read-all-lines) (generator->list read-line))

    (define (read-char? match?)
      (let ((char (peek-char)))
        (and (not (eof-object? char)) (match? char) (read-char))))

    (define (read-char* match?)
      (let loop ((chars '()))
        (let ((char (read-char? match?)))
          (if char (loop (cons char chars))
              (and (not (null? chars)) (list->string (reverse chars)))))))

    (define (skip-char* match?) (not (not (read-char* match?))))))
