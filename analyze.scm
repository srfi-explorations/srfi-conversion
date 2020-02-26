(import (scheme base) (scheme write) (srfi-alist))

(for-each (lambda (srfi) (write (car srfi)) (newline))
          srfi-alist)
