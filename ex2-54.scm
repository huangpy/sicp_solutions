(load "2-3-1.scm")
(define (equal? a b)
  (cond ((and (symbol? a) (symbol? b)) (eq? a b))
	((and (list? a) (list? b)) (list-equal? a b))
	(else (error "The a and b is not the same type"))))
(define (list-equal? lista listb)
  (let ((a-null? (null? lista))
	(b-null? (null? listb)))
    (cond ((and a-null? b-null?) true)
	  ((or a-null? b-null?) false)
	  ((eq? (car lista) (car listb))
	   (equal? (cdr lista) (cdr listb)))
	  (else false))))

(equal? 'a 'a)
(equal? 'a 'b)
(equal? '(this is a list) '(this is a list))
(equal? '(this is a list) '(this is not a list))
(equal? '(this is a list) '(this (is a) list))
(equal? 'a '(a))

(car ''abc)
(car 'a)
'quote
