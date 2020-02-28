(import (scheme base) (scheme char) (scheme read) (scheme write))
(import (utilities) (signature-reader))

(define (read-all-tokens) (generator->list read-token))

(define (string->tokens s) (with-input-from-string s read-all-tokens))

(define (main) (for-each writeln (map string->tokens (read-all-lines))))

(main)
