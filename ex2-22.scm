(load "general.scm")
(load "2-2-1.scm")
;;in terms of append in 2-2-1.scm, but the complexity is more than n
(define (square-list items)
  (define (iter subitems result)
    (if (null? subitems)
	result
	(iter (cdr subitems)
	      (append result (list (square (car subitems)))))))
  (iter items nil))

(square-list (list 1 2 3 4))

;;in terms of reverse, the complexity is n
(load "ex2-18.scm")
(define (square-list items)
  (define (iter subitems result)
    (if (null? subitems)
	(reverse result);; reverse the result
	(iter (cdr subitems)
	      (cons (square (car subitems)) result))))
  (iter items nil))

(square-list (list 1 2 3 4))
