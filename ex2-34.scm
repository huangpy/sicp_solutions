(load "2-2-3.scm")
(define (horner-eval x coefficient-sequence)
  (accumulate (lambda (a b)
		(+ a (* x b)))
	      0
	      coefficient-sequence))

(horner-eval 2 (list 1 3 0 5 0 1))
