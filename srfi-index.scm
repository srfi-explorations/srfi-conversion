(define-record-type signature
    (make-signature name type arguments returns literals note)
    signature?
  (arguments signature/arguments)	; list of symbols, lists, and vectors
  (literals signature/literals)		; symbols (for syntax only) or #f
  (name signature/name)			; symbol
  (note signature/note)			; string or #f
  (returns signature/returns)		; symbol, list of symbols, or #f
  (type signature/type))		; symbol ∈ { procedure, syntax, other }

(define (list->signatures x)
  (let* ((kind (cond ((assq 'kind x) => cadr)
		     (else (error "No kind specified." x))))
	 (source (cond ((assq 'source x) => cadr) (else #f)))
	 (note (and source (show #f "source: " source))))
    (append-map
     (lambda (slot)
       (match slot
	      (('signature (name . arguments) ('returns . r))
	       (list (make-signature name
				     kind
				     arguments
				     r
				     #f
				     note)))
	      (('signature (name . arguments))
	       (list (make-signature name kind arguments #f #f note)))
	      (x '())))
     x)))