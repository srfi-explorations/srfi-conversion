(define-library (srfi-index)
  (export list->signature
	  signature/arguments
	  signature/literals
	  signature/name
	  signature/note
	  signature/returns
	  signature/type)
  (import (scheme base)
	  (chibi match))
  (include "srfi-index.scm"))