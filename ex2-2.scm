;; use wishful thinking which means that use segment before implementing it
(define (midpoint-segment segment)
  (let ((s-point (start-segment segment))
	(e-point (end-segment segment)))
    (make-point (average (x-point s-point)
		   (x-point e-point))
		(average (y-point s-point)
		   (y-point e-point)))))

(define (print-point point)
  (newline)
  (display "(")
  (display (x-point point))
  (display ",")
  (display (y-point point))
  (display ")"))

;;implement segment in terms of point
(define (make-segment point1 point2)
  (cons point1 point2))

(define (start-segment segment)
  (car segment))

(define (end-segment segment)
  (cdr segment))

;;implement point in terms of numbers
(define (make-point x y)
  (cons x y))

(define (x-point point)
  (car point))

(define (y-point point)
  (cdr point))

;;use
(define point1 (make-point 2 3))
(define point2 (make-point 5 6))
(define segment (make-segment point1 point2))

(print-point (midpoint-segment segment))
