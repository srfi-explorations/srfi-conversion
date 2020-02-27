(define-library (sxml-utilities)
  (export html-string->sxml tag-body element-fold tag-names-fold
          element-for-each tag-names-for-each)
  (import (scheme base))
  (cond-expand (chibi  (import (chibi io) (chibi string)))
               (gauche (import (srfi 13) (gauche base))))
  (import (chibi html-parser))
  (begin

    (define (html-string->sxml html)
      (call-with-port (open-input-string html) html->sxml))

    (define (symbol-prefix? prefix sym)
      (string-prefix? prefix (symbol->string sym)))

    (define (tag-body elem)
      (cond ((not (pair? (cdr elem))) '())
            ((and (pair? (cadr elem)) (eqv? '@ (caadr elem)))
             (cddr elem))
            (else (cdr elem))))

    (define (element-fold elem kons knil)
      (let do-elem ((elem elem) (acc knil))
        (if (not (pair? elem)) acc
            (let do-list ((elems (tag-body elem))
                          (acc (let ((tag (car elem)))
                                 (if (symbol-prefix? "*" tag) acc
                                     (kons elem acc)))))
              (if (null? elems) acc
                  (do-list (cdr elems) (do-elem (car elems) acc)))))))

    (define (tag-names-fold elem kons knil)
      (element-fold elem (lambda (e acc) (kons (car e) acc)) knil))

    (define (element-for-each proc elem)
      (element-fold elem (lambda (e _) (proc e) #f) #f))

    (define (tag-names-for-each proc elem)
      (element-fold elem (lambda (e _) (proc (car e)) #f) #f))))
