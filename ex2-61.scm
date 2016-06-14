(load "2-3-3.scm")
(define (adjoin-set x set)
  (cond ((null? set) (list x))
	((= x (car set)) set)
	((< x (car set)) (cons x set))
	(else (cons (car set) (adjoin-set x (cdr set))))))

(adjoin-set 2 '(1 2 3))
(adjoin-set 2 '(1 3))
(adjoin-set 2 '(2 3))



