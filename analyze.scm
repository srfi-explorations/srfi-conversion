(import (scheme base) (scheme write) (srfi-alist))

(for-each (lambda (srfi) (write (srfi-number srfi)) (newline))
          srfi-alist)
