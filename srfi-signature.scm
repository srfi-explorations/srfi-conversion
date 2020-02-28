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

;; TODO: Accept HTML as input.  Strip it before generating output, but preserve
;; the ID (which may be encoded as an anchor name).

(import (scheme base)
        (scheme case-lambda)
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

(define (signature-string->sxml line)
  (let-values (((sexp return comment) (string->3-part-signature line)))
    (if (symbol? sexp)
        `(((dt id ,sexp)                ; TODO: Escape the name here.
           (raw "&#8203;")
           ((dfn) ,sexp)))
        (let ((name (car sexp))
              (arguments (cdr sexp)))
          `(((dt id ,name)              ; TODO: Escape the name here.
             "("
             ((dfn) ,name)
             ,@(if (null? arguments) '()
                   `(" "
                     ((span)
                      ,@(cdr (append-map (lambda (a) `(" " ((var) ,a)))
                                         arguments)))))
             ")"
             ,@(if return `(((span) (raw " &xrarr; ") ,return)) '())
             ,@(if comment `(((p) ,comment)) '())))))))

(define (main)
  (let ((lines (read-all-lines)))
    (unless (null? lines)
      (show #t
            (if (null? (cdr lines))
                (html 0 (signature-string->sxml (car lines)))
                (html 2 `((div) ,@(map signature-string->sxml lines))))
            nl))))

(define (main/3-part)
  (for-each (lambda (line)
              (let-values (((sexp return comment)
                            (string->3-part-signature line)))
                (writeln sexp)
                (writeln return)
                (writeln comment)
                (newline)))
            (read-all-lines)))

(define (main/sxml)
  (for-each writeln (map signature-string->sxml (read-all-lines))))

(main)
