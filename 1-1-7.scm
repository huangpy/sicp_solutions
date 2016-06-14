

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x)
		 x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? guess x)
  (< (abs (-  (square guess) x)) 0.001))

(define (square x) (* x x))

(define (abs x)
  (if (< x 0)
      (- x)
      x))

(define (sqrt x)
  (sqrt-iter 1.0 x))

(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
	(else else-clause)))

(new-if (= 2 3) 0 5)

(new-if (= 1 1) 0 5)

(define (new-sqrt-iter guess x)
  (new-if (good-enough? guess x)
      guess
      (new-sqrt-iter (improve guess x)
		 x)))

(define (new-sqrt x)
  (new-sqrt-iter 1.0 x))

(if #t (display "good") (display "bad"))

(new-if #t (display "good") (display "bad"))

(define (sqrt-2 x)
  (define (sqrt-iter guess-new guess-old)
    (if (good-enough? guess-new guess-old)
	guess-new
	(sqrt-iter (improve guess-new) guess-new)))
  (define (improve guess)
    (/ (+ guess (/ x guess)) 2))
  (define (good-enough? a b)
    (< (/ (abs (- a b)) b) 0.001))
  (sqrt-iter 1.0 x))


