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

(define (plist->alist plist)
  (let next ((accumulator '())
             (plist plist))
    (if (null? plist)
        (reverse accumulator)
        (next (cons (cons (car plist) (cadr plist))
                    accumulator)
              (cddr plist)))))

(define (interpose sep xs) (cdr (append-map (lambda (x) (list sep x)) xs)))

(define (ascii-alphanumeric? char)
  (or (char<=? #\A char #\Z)
      (char<=? #\a char #\z)
      (char<=? #\0 char #\9)))

(define (html-element tag attributes body)
  (each "<"
        tag
        (joined/prefix
         (lambda (a) (each (car a) "=" (written (html-escape (cdr a)))))
         (plist->alist attributes)
         " ")
        ">"
        body
        "</"
        tag
        ">"))

(define (html* indentation level tree)
  (define (descend tree) (html indentation level tree))
  (cond ((number? tree) tree)
        ((string? tree) (html-escape tree))
        ((symbol? tree) (html-escape (symbol->string tree)))
        ((pair? tree)
         (cond ((and (pair? (car tree))
                     (or (symbol? (caar tree))
                         (string? (caar tree))))
                (html-element (caar tree)
                              (cdar tree)
                              (joined descend (cdr tree))))
               ((eq? (car tree) 'raw)
                (each-in-list (cdr tree)))
               (else (joined descend tree))))
        (else (error "Malformed HTML tree." tree))))

(define tab-amount 2)

(define html
  (case-lambda
    ((tree) (html* 0 0 tree))
    ((level tree) (html 0 level tree))
    ((indentation level tree)
     (if (positive? level)
         (each nl
               (each (space-to (* tab-amount indentation))
                     (html* (+ indentation 1) (- level 1) tree)))
         (html* indentation level tree)))))

(define (weird->uscore string)
  (define (mangle char)
    (if (ascii-alphanumeric? char) (char-downcase char) #\_))
  (let loop ((in (string->list string)) (out '()) (had-uscore? #t))
    (if (null? in) (list->string (reverse out))
        (let* ((char (mangle (car in))) (uscore? (char=? #\_ char)))
          (loop (cdr in) (if (and uscore? had-uscore?) out (cons char out))
                uscore?)))))

(define unique-html-id
  (let ((used '()))
    (lambda (string)
      (let loop ((n 1))
        (let ((id (if (= n 1) string
                      (string-append string "_" (number->string n)))))
          (cond ((member id used) (loop (+ n 1)))
                (else (set! used (cons id used))
                      id)))))))

(define (signature-html-id string)
  (unique-html-id (string-append "def_" (weird->uscore string))))

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
               ,@(if (null? arguments) '()
                     `(" " (span ,@(interpose " " (map (lambda (a) `(var ,a))
                                                       arguments)))))
               ")"
               ,@(if return `((span ,long-rightwards-arrow ,return)) '())
               ,@(if comment `((p ,comment)) '()))))))

(define (main/forms)
  (for-each (lambda (line)
              (let ((forms (with-input-from-string line read-all-forms)))
                (writeln forms)))
            (read-all-lines)))

(define (main/3-part)
  (for-each (lambda (line)
              (let-values (((sexp return comment)
                            (string->3-part-signature line)))
                (writeln sexp)
                (writeln return)
                (writeln comment)
                (newline)))
            (read-all-lines)))

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
