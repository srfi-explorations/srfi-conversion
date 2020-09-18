#! /usr/bin/env chibi-scheme

#| Given input signatures, generate HTML with the recommended markup.

* TODO

  - Automate testing.

  - Specify the input syntax precisely.

    - Handle macros expressed with square brackets.

* See "example-signatures.scm" for example input.
|#

(import (scheme base)
        (scheme char)
        (scheme process-context)
        (scheme read)
        (scheme write)
        (srfi 1)
        (srfi 130)
        (srfi 166)
        (chibi sxml)
	(srfi-index)
	(utilities))

(define (prepose sep xs)
  (append-map (lambda (x) (list sep x)) xs))

(define (space-prepose xs)
  (prepose " " xs))

(define (interpose sep xs)
  (if (null? xs) '() (cdr (prepose sep xs))))

(define (comma-separate xs) (interpose ", " xs))
(define (space-separate xs) (interpose " " xs))

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

(define (signature->sxml signature)
  (define (parenthesized html-id name arguments returns note)
    `(dt (@ (id ,html-id))
	 "("
	 (dfn ,name)
	 ,(if (null? arguments)
	      `(")" (span))
	      `(span ,arguments ")"))
	 ,@(if returns
	       `((span (@ (class "returns"))
		       " "
		       ,long-rightwards-arrow
		       " "
		       ,@(comma-separate
			  (map (lambda (r) (show #f (pretty r)))
			       returns))))
	       '())
	 ,@(if note `(" " (p ,note)) '())))
  (define (syntax-args arguments literals)
    (let descend ((arguments arguments))
      (cond ((null? arguments) '())
	    ((pair? arguments)
	     `("("
	       ,@(space-separate (map descend arguments))
	       ")"))
	    ((symbol? arguments)
	     (cond ((eq? arguments '...) arguments)
		   ((memq arguments literals)
		    `(code ,arguments))
		   (else `(var ,arguments))))
	    (else (error "Unexpected macro argument." arguments)))))
  (let* ((arguments (signature/arguments signature))
	 (name (signature/name signature))
	 (note (signature/note signature))
	 (returns (signature/returns signature))
	 (type (signature/type signature))
	 (html-id (signature-html-id (symbol->string name))))
    (case (signature/type signature)
      ((other) `(dt (@ (id ,html-id)) (dfn ,name)))
      ((procedure)
       (parenthesized html-id
		      name
		      (space-prepose (map (lambda (a) `(var ,a)) arguments))
		      returns
		      note))
      ((syntax)
       (parenthesized html-id
		      name
		      (syntax-args arguments (signature/literals signature))
		      returns
		      note))
      (else (error "Unrecognized type." type)))))

(define (main)
  (let ((signatures (map list->signatures (read-all-forms))))
    (sxml-display-as-html
     `(html
       (head (title "SRFI Signatures")
	     (link (@ (rel "stylesheet") (href "signature.css"))))
       (body
	(dl (@ (class "signatures"))
	    ,(map (lambda (s)
		    (cond ((signature? s) (signature->sxml s))
			  ((pair? s)
			   (if (null? (cdr s))
			       (signature->sxml (car s))
			       `(div ,(map signature->sxml s))))
			  (else '())))
		  signatures)))))))

(main)