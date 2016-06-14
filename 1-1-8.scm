(define (square x) (* x x))

(define (abs x)
  (if (< x 0)
      (- x)
      x))

(define (sqrt x)
  (define (sqrt-iter guess)
    (if (good-enough? guess)
	guess
	(sqrt-iter (improve guess))))
  (define (improve guess)
    (/ (+ guess (/ x guess)) 2))
  (define (good-enough? guess)
    (< (abs (-  (square guess) x)) 0.001))
  (sqrt-iter 1.0))

