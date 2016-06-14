
;;data object: interval
;;assumes that we have constructor make-interval
;;and selectors: lower-bound, upper-bound
(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
		 (+ (upper-bound x) (upper-bound y))))

(define (mul-interval x y)
  (let ((lower-bound-x (lower-bound x))
	(upper-bound-x (upper-bound x))
	(lower-bound-y (lower-bound y))
	(upper-bound-y (upper-bound y)))
    (let ((p1 (* lower-bound-x lower-bound-y))
	  (p2 (* lower-bound-x upper-bound-y))
	  (p3 (* upper-bound-x lower-bound-y))
	  (p4 (* upper-bound-x upper-bound-y)))
      (make-interval (min p1 p2 p3 p4)
		     (max p1 p2 p3 p4)))))


(define (div-interval x y)
  (mul-interval x
		(make-interval (/ 1.0 (upper-bound y) )
			       (/ 1.0 (lower-bound y) ))))

;;ex2-7
;;implement of the interval data object absrraction
;;constructor
(define (make-interval a b) (cons a b))
;;selectors
(define (lower-bound x) (min (car x) (cdr x)))
(define (upper-bound x) (max (car x) (cdr x)))

;;another implemention of interval, this is procedural representation
;;(define make-interval cons)
;;(define lower-bound car)
;;(define upper-bound cdr)

;;ex2-8
(define (sub-interval x y)
  (make-interval (- (lower-bound x) (upper-bound y))
		 (- (upper-bound x) (lower-bound y))))

(define i1 (make-interval 4 8))
(define i2 (make-interval (- 1) (- 3)))
(define i3 (make-interval 1 2))
(define i4 (make-interval 6 9))
(define i5 (make-interval -6 9))

(sub-interval i1 i2)
(sub-interval i1 i3)

(div-interval i1 i5)
