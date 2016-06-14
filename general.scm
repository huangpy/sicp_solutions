(define (abs x)
  ((if (> x 0)
       +
       -)
   x))

(define (square n)
  (* n n))

(define (cube n)
  (* n n n))

(define (inc n)
  (+ n 1))

(define (odd? n)
  (not (= (remainder n 2) 0)))

(define (even? n)
  (= (remainder n 2) 0))

(define (average x y)
  (/ (+ x y) 2.0))

(define (positive? x) (> x 0))

(define (negative? x) (< x 0))

(define (good-enough? a b tolerance)
  (< (abs (- a b)) tolerance))

(define (xor bool1 bool2)
  (if (or (and bool1 bool2)
	  (and (not bool1) (not bool2)))
      #f
      #t))

(define nil (quote ()))
