fl-e-pi/4

((exit status-code))

((string->foo string) (returns foo-vector))

((string->quux string) (returns quux-vector))

(group
 ((string->vector string) (returns char-vector) (note "(R7RS Small)"))
 ((string->vector string start) (returns char-vector))
 ((string->vector string start end) (returns char-vector))
 ((string->list string) (returns char-list) (note "(R7RS Small)"))
 ((string->list string start) (returns char-list))
 ((string->list string start end) (returns char-list)))

(group
 ((vector->string char-vector) (returns string) (note "(R7RS Small)"))
 ((vector->string char-vector start) (returns string))
 ((vector->string char-vector start end) (returns string))
 ((list->string char-list) (returns string) (note "(R5RS)")))

((implementation-name) (returns string))

((with-input-from-string string thunk) (returns value))

((with-output-to-string thunk) (returns string) (note "From R5RS and IEEE."))

(group
 (syntax (arg-ands) (returns boolean))
 (syntax (arg-ands (variable expr ...) ...))
 (syntax (arg-ands (caller variable expr ...) ...))
 (syntax (arg-ands common caller (variable expr ...) ...)
	 (literals common))
 (syntax (arg-ands common caller (caller variable expr ...) ...)
	 (literals common)))

((quotient n1 n2) (returns q r))