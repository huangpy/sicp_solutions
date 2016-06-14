(load "ex1-37.scm")

(define (natural-cont-frac k)
  (define (n i) 1.0)
  (define (d i)
    (cond ((= (remainder i 3) 2) (* 2 (/ (+ i 1) 3)))
	  (else 1)))
  (+ 2 (cont-frac n d k)))

(natural-cont-frac 3)
(natural-cont-frac 4)
