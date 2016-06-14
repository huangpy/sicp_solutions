(load "general.scm")
(load "1-3-3.scm")
(define (average-damp f)
  (lambda (x) (average x (f x))))

((average-damp square) 10)

(define (sqrt x)
  (fixed-point (average-damp (lambda (y) (/ y x)))
	       1.0))

(sqrt 25)

;;second time
(define (average-damp f)
  (lambda (x) (average x (f x))))

((average-damp square) 10)

(define (sqrt x)
  (fixed-point (average-damp )))

;;derivative
(define dx 0.00001)
(define (deriv g)
  (lambda (x) (/ (- (g (+ x dx))
		    (g x))
		 dx)))

((deriv cube) 5)

;;Newton method
(define (newton-transform g)
  (lambda (x)
    (- x
       (/ (g x)
	  ((deriv g) x)))))
(define (newton-method g guess)
  (fixed-point (newton-transform g) guess))

(define (sqrt x)
  (newton-method (lambda (y) (- (square y) x))
		 1.0))

(sqrt 4)


;;abstractions and first-class abstraction
(define (fixed-point-of-transform g transform guess)
  (fixed-point (transform g) guess))

;;version-1
(define (sqrt x)
  (fixed-point-of-transform (lambda (y) (/ x y))
			    average-damp
			    (1.0)))

;;version-2
(define (sqrt x)
  (fixed-point-of-transform (lambda (y) (- (square y) x))
			    newton-transform
			    1.0))

(sqrt 4)
