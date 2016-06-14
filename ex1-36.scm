(load "1-3-3.scm")

(define (fixed-point f first-guess)
  (define (try guess)
    (newline)
    (display guess)
    (let ((next (f guess)))
      (if (good-enough? guess next tolerance)
	  next
	  (try next)))
    )
  (try first-guess))

(fixed-point cos 1.0)

(fixed-point (lambda (x)
	       (/ (log 1000) (log x)))
	     2.0)

;;use average damping
(fixed-point (lambda (x)
	       (average x (/ (log 1000) (log x))))
	     2.0)


