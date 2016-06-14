;;signal an error if the divisor interval spans zero
(define (div-interval x y)
  (let ((l (lower-bound y))
	(h (upper-bound y)))
    (if (and (< l 0) (> h 0))
	(error "the divisor interval spans zero!")
	(mul-interval x
		(make-interval (/ 1.0 y )
			       (/ 1.0 l ))))))

(define (div-interval x y)
  (let ((spans-zero (and (< (lower-bound y) 0)
			 (> (upper-bound y) 0))))
    (mul-interval x
		  (make-interval (/ 1.0
				    ((if spans-zero lower-bound upper-bound) y))
				 (/ 1.0
				    ((if spans-zero upper-bound lower-bound) y))))))


(div-interval i1 i5)
