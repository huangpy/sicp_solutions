(load "2-2-1.scm")
;;solution one of directly
(define (square-tree tree)
  (if (null? tree)
      nil
      (let ((a (car tree))
	    (d (cdr tree)))
	(cons (if (pair? a)
		  (square-tree a)
		  (* a a))
	      (square d)))))

(square-tree (list 1 (list 2 (list 3 4) 5) (list 6 7)))

;;solution 2 in terms of map in 2-2-1.scm
(define (square-tree tree)
  (map (lambda (first)
	 (if (pair? first)
	     (square-tree first)
	     (square first)))
       tree))

(square-tree (list 1 (list 2 (list 3 4) 5) (list 6 7)))
