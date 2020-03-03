(define-record-type signature
    (make-signature name type arguments returns literals note)
    signature?
  (arguments signature/arguments)	; list of symbols, lists, and vectors
  (literals signature/literals)		; symbols (for syntax only) or #f
  (name signature/name)			; symbol
  (note signature/note)			; string or #f
  (returns signature/returns)		; symbol, list of symbols, or #f
  (type signature/type))		; symbol ∈ { procedure, syntax, other }

(define (list->signature x)
  (match x
	 ((? symbol? x) (make-signature x 'other #f #f #f #f))
	 (('syntax (name args ...) ('literals lits ...))
	  (make-signature name 'syntax args #f lits #f))
	 (('syntax (name args ...) ('literals lits ...) ('returns rets ...))
	  (make-signature name 'syntax args rets lits #f))
	 (('syntax (name args ...) ('returns rets ...))
	  (make-signature name 'syntax args rets #f #f))
	 (('syntax (name args ...))
	  (make-signature name 'syntax args #f #f #f))
	 (((name args ...) ('returns rets ...) ('note nts ...))
	  (make-signature name 'procedure args rets #f nts))
	 (((name args ...) ('returns rets ...))
	  (make-signature name 'procedure args rets #f #f))
	 (((name args ...))
	  (make-signature name 'procedure args #f #f #f))
	 (('group sigs ...) (map list->signature sigs))
	 (else (error "Unrecognized signature expression." x))))