(define-library (trivial-tar-reader)
  (export read-tar-entries)
  (import (scheme base) (scheme read))
  (begin

    (define (bytevector-all-nulls? bv)
      (let loop ((i (- (bytevector-length bv) 1)))
        (or (< i 0) (and (= 0 (bytevector-u8-ref bv i)) (loop (- i 1))))))

    (define (bytevector-null-terminate bv start end)
      (let loop ((i start))
        (if (or (= i end) (= 0 (bytevector-u8-ref bv i)))
            (bytevector-copy bv start i) (loop (+ i 1)))))

    (define (bytevector-octal-ref bv start len)
      (define (octal-digit-value byte)
        (if (<= #x30 byte #x37) (- byte #x30) (error "Not octal digit" byte)))
      (let nulls ((last (+ start len -1)))
        (if (= 0 (bytevector-u8-ref bv last))
            (nulls (- last 1))
            (let digits ((i start) (val 0))
              (if (> i last) val
                  (digits
                   (+ i 1)
                   (+ (* 8 val)
                      (octal-digit-value (bytevector-u8-ref bv i)))))))))

    (define (read-tar-entries proc port)
      (let ((head (read-bytevector 512 port)))
        (unless (or (eof-object? head)
                    (< (bytevector-length head) 512)
                    (= 0 (bytevector-u8-ref head 0))
                    (bytevector-all-nulls? head))
          (let* ((file-name (utf8->string
                             (bytevector-null-terminate head 0 100)))
                 (type-flag (integer->char (bytevector-u8-ref head 156)))
                 (file-size (bytevector-octal-ref head 124 12))
                 (file-data (read-bytevector file-size port)))
            (let ((r (truncate-remainder file-size 512)))
              (unless (= r 0) (read-bytevector (- 512 r) port)))
            (when (or (char=? type-flag #\0) (char=? type-flag #\null))
              (proc file-name file-data)))
          (read-tar-entries proc port))))))
