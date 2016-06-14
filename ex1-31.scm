(load "general.scm")
(define (product term a next b)
  (if (> a b)
      1
      (* (term a) (product term (next a) next b))))

(define (product-iterative term a next b)
  (define (iter a result)
    (if (> a b)
	result
	(iter (next a) (* result (term a)))))
  (iter a 1))

(define (ordinary-product a b)
  (define (identical x) x)
  (product-iterative identical a inc b))

(ordinary-product 2 5)

(define (cal-pi n)
  (define (identical x) x)
  (define (term-numerator i)
    (if (odd? i)
	(+ i 1)
	(+ i 2)))
  (define (term-denominator i)
    (if (odd? i)
	(+ i 2)
	(+ i 1)))
  (* 4.0 (/  (product term-numerator 1 inc n)
	     (product term-denominator 1 inc n))))

(cal-pi 1000)

(define (factorial n)
  (define (term x) x)
  (product term 1 inc n))

(factorial 4)


