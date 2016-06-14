(load "ex1-37.scm")
(load "general.scm")
(define (tan-cf x k)
  (define (n i)
    (if (= i 1)
	x
	(- (square x))))
  (define (d i)
    (- (* 2 i) 1))
  (cont-frac-iterative n d k))

;;45 angle
(tan-cf 0.785 5)
(tan 0.785)
