;;(load "./general.scm")

(define (square n)
  (* n n))

(define (cube n)
  (* n n n))

(define (inc n)
  (+ n 1))

(inc 2)

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
	 (sum term (next a) next b))))



(define (sum-cube a b)
  (sum cube a inc b))

(sum-cube 1 10)



(define (identity x) x)

(define (sum-integers a b)
  (sum identity a inc b))

(sum-integers 1 10)

(define (pi-sum-term x)
  (/ 1.0 (* x (+ x 2))))

(define (pi-sum-next x) (+ x 4))

(define (pi-sum a b)
  (define (pi-term x)
    (/ 1.0 (* x (+ x 2))))
  (define (pi-next x)
    (+ x 4))
  (sum pi-term a pi-next b))

(* 8 (pi-sum 1 1000))


;;integral
(define (integral f a b dx)
  (define (add-dx x) (+ x dx))
  (* dx (sum f (+ a (/ dx 2.0)) add-dx b)))

(integral cube 0 1 0.001)
(integral square 0 1 0.001)

(define (integral f a b dx)
  (define (add-dx x) (+ x dx))
  (* dx (sum f (+ a (/ dx 2.0)) add-dx b)))

(integral cube 0 1 0.001)
