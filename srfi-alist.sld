(define-library (srfi-alist)
  (export srfi-number srfi-html srfi-alist)
  (import (scheme base) (scheme file) (trivial-tar-reader))
  (begin
    (define srfi-number car)
    (define srfi-html cdr)
    (define srfi-alist
      (let ((head (list #f)))
        (define max-srfi 184)
        (define (file-name->srfi-number file-name)
          (let loop ((num 0))
            (and (<= num max-srfi)
                 (if (equal? file-name
                             (let ((num (number->string num)))
                               (string-append "./"
                                              "srfi-" num "/"
                                              "srfi-" num ".html")))
                     num (loop (+ num 1))))))
        (call-with-port
         (open-input-file "srfi.tar")
         (lambda (port)
           (read-tar-entries
            (lambda (file-name file-data)
              (let ((num (file-name->srfi-number file-name)))
                (when num
                  (let* ((html (utf8->string file-data))
                         (entry (cons num html)))
                    (let insert ((prev head))
                      (if (or (null? (cdr prev))
                              (< (car entry)
                                 (car (cadr prev))))
                          (set-cdr! prev (cons entry (cdr prev)))
                          (insert (cdr prev))))))))
            port)))
        (cdr head)))))
