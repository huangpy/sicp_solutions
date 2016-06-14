(load "2-2-3.scm")
(define (accumulate-n op init seqs)
  (if (null? (car seqs))
      nil
      (cons (accumulate op init
			(accumulate (lambda (x y)
				      (cons (car x) y))
				    nil seqs))
	    (accumulate-n op init
			  (accumulate (lambda (x y)
					(cons (cdr x) y))
				      nil seqs)))))

(define l1 (list (list 1 2 3) (list 4 5 6) (list 7 8 9) (list 10 11 12)))
(accumulate-n + 0 l1)
