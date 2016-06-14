(load "general.scm")
(define (iterative-improve good-enough? improve)
  (define (iter guess)
    (if (good-enough? guess)
	guess
	(iter (improve guess))))
  (lambda (guess) (iter guess)))


;;rewrite sqrt in terms of iterative-improve
(define (sqrt x)
  (define (good-enough? guess)
    (< (abs (- (square guess) x)) 0.001))
  (define (improve guess)
    (average guess (/ x guess)))
  ((iterative-improve good-enough? improve) 1.0))

(sqrt 9)
(sqrt 16)

;;rewrite fixed-point in terms of iterative-improve
(define (fixed-point f first-guess)
  (define (good-enough? guess)
    (< (abs (- (f guess) guess)) 0.0001))
  (define (improve guess)
    (f guess))
  ((iterative-improve good-enough? improve) 1.0))

(fixed-point cos 1.0)

