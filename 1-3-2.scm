;;lambda
(lambda (x) (+ x 4))

((lambda (x y) (+ x y)) 3 4)

(define (plus x y)
  (+ x y))

(define ppp plus)

(ppp 2 3)

(define (plus4 x) (+ x 4))


(define plus4 (lambda (x) (+ x 4)))
(plus4 3)


;;let
(define (f x y)
  (define a (+ 1 (* x y)))
  (define b (- 1 y))
  (+ (* x (square a))
     (* y b)
     (* a b)))

(define (f x y)
  (define (f-helper a b)
    (+ (* x (square a))
       (* y b)
       (* a b)))
  (f-helper (+ 1 (* x y)) (- 1 y)))

(define (f x y)
  ((lambda (a b)
     (+ (* x (square a))
	(* y b)
	(* a b)))
   (+ 1 (* x y))
   (- 1 y)))

(define (f x y)
  (let ((a (+ 1 (* x y)))
	(b (- 1 y)))
    (+ (* x (square a))
       (* y b)
       (* a b))))

(define x 5)

(+ (let ((x 3))
     (+ x (* x 10)))
   x)

(let ((x 3)
      (y (+ x 2)))
  (* x y))


