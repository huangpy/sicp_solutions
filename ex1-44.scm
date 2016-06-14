(load "ex1-43.scm")
(define dx 0.00001)
;;right solution
(define (smooth f)
  (lambda (x)
    (/ (+ (f (- x dx))
	  (f x)
	  (f (+ x dx)))
       3)))
(define (n-smooth f n)
    (let ((n-times-smooth (repeated smooth n)))
        (n-times-smooth f)))

;;my wrong solution
(define (n-smooth f n)
  (repeated (lambda (x)
	      (/ (+ (f (- x dx))
		    (f x)
		    (f (+ x dx)))
		 3))
	    n)) 
((n-smooth square 10) 5)
