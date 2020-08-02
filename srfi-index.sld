(define-library (srfi-index)
  (export list->signatures
	  signature/arguments
	  signature/literals
	  signature/name
	  signature/note
	  signature/returns
	  signature/type)
  (import (scheme base)
	  (chibi match)
	  (srfi 1)
	  (srfi 166))
  (include "srfi-index.scm"))