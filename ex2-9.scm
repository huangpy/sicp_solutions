(load "2-1-4.scm")
(define (width-interval x)
  (abs (/ (- (upper-bound x)
	     (lower-bound x))
	  2.0)))

(add-interval i1 i2)
(width-interval i2)
(width-interval (add-interval i2 i1))
(width-interval (add-interval i2 i4))

(define i5 (make-interval 0 10))
(define i6 (make-interval 0 2))
(width-interval (mul-interval i5 i6))



