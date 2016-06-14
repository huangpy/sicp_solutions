(load "general.scm")
(define (search f neg-point pos-point)
  (let ((midpoint (average neg-point pos-point)))
    (if (close-enough? neg-point pos-point)
	midpoint
	(let ((test-value (f midpoint)))
	  (cond ((positive? test-value) (search f neg-point midpoint))
		((negative? test-value) (search f midpoint pos-point))
		(else midpoint))))))

(define (half-interval-method f a b)
  (let ((a-value (f a))
	(b-value (f b)))
    (cond ((and (negative? a-value) (positive? b-value))
	   (search f a b))
	  ((and (negative? b-value) (positive? a-value))
	   (search f b a))
	  (else
	   (error "Values are not of opposite sign" a b)))))

(define (close-enough? x y) (< (abs (- x y)) 0.001))


(half-interval-method sin 2.0 4.0)

(half-interval-method (lambda (x) (- (cube x) (* 2 x) 3))
		      1.0
		      2.0)

(define tolerance 0.00001)
(define (fixed-point f first-guess)
  (define (try guess)
    (let ((next (f guess)))
      (if (good-enough? guess next tolerance)
	  next
	  (try next))))
  (try first-guess))

(fixed-point cos 1.0)

;;solution to the equation y = siny + cosy
(fixed-point (lambda (y) (+ (sin y) (cos y)))
	     1.0)
  
