(load "2-2-3.scm")
;;my solution which didn't use map
(define (count-leaves t)
  (accumulate (lambda (x y)
		(+ (if (pair? x)
		       (count-leaves x)
		       1)
		   y))
	      0
	      t))
(count-leaves (list 1 (list 2 3) 4 ))

;;another solution in terms of map and accumulate
(define (count-leaves t)
  (accumulate +
	      0
	      (map
	       (lambda (x)
		 (if (pair? x)
		     (count-leaves x)
		     1))
	       t)))

(count-leaves (list 1 (list 2 3) 4))
