(import (scheme base) (scheme write) (srfi-alist))

(for-each (lambda (srfi) (pp (car srfi)))
          srfi-alist)
