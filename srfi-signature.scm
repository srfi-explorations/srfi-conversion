#! /usr/bin/env chibi-scheme

;;;; Given a signature on the input line, generate HTML with the recommended
;;;; markup.

;; Accept input in these forms:

;;    (exit return-code)
;;    ...

;;    (string->vector string)                 -> char-vector (R7RS-small)
;;    (string->vector string start)           -> char-vector
;;    (string->vector string start end)       -> char-vector
;;    (string->list string)                   -> char-list   (R7RS-small)
;;    (string->list string start)             -> char-list
;;    (string->list string start end)         -> char-list
;;    ...

;;    (vector->string char-vector)            -> string (R7RS-small)
;;    (vector->string char-vector start)      -> string
;;    (vector->string char-vector start end)  -> string
;;    (list->string char-list)                -> string (R5RS)
;;    ...

;; TODO: Escape everything necessary.

;; TODO: Accept HTML as input.  Strip it before generating output, but
;; preserve the ID (which may be encoded as an anchor name).

(import (scheme base)
        (scheme case-lambda)
        (scheme char)
        (scheme process-context)
        (scheme read)
        (scheme write)
        (srfi 1)
        (srfi 130)
        (srfi 159 base)
        (chibi sxml))
(import (utilities) (signature-reader))

(define (interpose sep xs) (cdr (append-map (lambda (x) (list sep x)) xs)))

(define (ascii-alphanumeric? char)
  (or (char<=? #\A char #\Z)
      (char<=? #\a char #\z)
      (char<=? #\0 char #\9)))

(define tab-amount 2)

(define (weird->hyphen string)
  (define (mangle char)
    (cond ((char=? char #\-) char)
	  ((ascii-alphanumeric? char) (char-downcase char))
	  (else #\-)))
  (let loop ((in (string->list string)) (out '()) (had-hyphen? #t))
    (if (null? in) (list->string (reverse out))
        (let* ((char (mangle (car in))) (hyphen? (char=? #\- char)))
          (loop (cdr in) (if (and hyphen? had-hyphen?) out (cons char out))
                hyphen?)))))

(define unique-html-id
  (let ((used '()))
    (lambda (string)
      (let loop ((n 1))
        (let ((id (if (= n 1) string
                      (string-append string "-" (number->string n)))))
          (cond ((member id used) (loop (+ n 1)))
                (else (set! used (cons id used))
                      id)))))))

(define (signature-html-id string)
  (unique-html-id (string-append "def-" (weird->hyphen string))))

(define zero-width-space "\x200B;")
(define long-rightwards-arrow "\x27F6;")  ; &xrarr;

(define (signature-string->sxml string)
  (let-values (((sexp return comment) (string->3-part-signature string)))
    (let* ((name-only? (symbol? sexp))
           (name (symbol->string (if name-only? sexp (car sexp))))
           (arguments (if name-only? #f (map symbol->string (cdr sexp))))
           (html-id (signature-html-id name)))
      (if name-only?
          `(dt (@ (id ,html-id))
               (b "Variable")
               " "
               (dfn ,name))
          `(dt (@ (id ,html-id))
               "("
               (dfn ,name)
               ,@(if (null? arguments)
		     '()
                     `(" "
		       (span ,@(interpose
				" "
				(map (lambda (a) `(var ,a)) arguments)))))
               ")"
               ,@(if return `((span ,long-rightwards-arrow ,return)) '())
               ,@(if comment `((p ,comment)) '()))))))

(define (main)
  (let ((dts (map signature-string->sxml (read-all-lines))))
    (sxml-display-as-html '(link (@ (rel "stylesheet") (href "srfi.css"))))
    (newline)
    (case (length dts)
      ((0))
      ((1)
       (sxml-display-as-html (car dts))
       (newline))
      (else
       ;; TODO: Use SXML library or auto-formatter to indent HTML.
       (disp "<div>")
       (for-each (lambda (dt)
                   (display (make-string tab-amount #\space))
                   (sxml-display-as-html dt)
                   (newline))
                 dts)
       (disp "</div>")))))

(main)
