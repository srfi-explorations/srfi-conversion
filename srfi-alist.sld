(define-library (srfi-alist)
  (export srfi-number srfi-html srfi-alist)
  (import (scheme base) (scheme file) (trivial-tar-reader))
  (begin
    (define (make-srfi number html) (cons number html))
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
              (let ((number (file-name->srfi-number file-name)))
                (when number
                  (let* ((html (utf8->string file-data))
                         (srfi (make-srfi number html)))
                    (let insert ((prev head))
                      (if (or (null? (cdr prev))
                              (< (srfi-number srfi)
                                 (srfi-number (cadr prev))))
                          (set-cdr! prev (cons srfi (cdr prev)))
                          (insert (cdr prev))))))))
            port)))
        (cdr head)))))
