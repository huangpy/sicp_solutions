(load "ex2-18.scm")
(load "2-2-1.scm")
(load "general.scm")
(define x (list (list 1 2) (list 3 4) (list 5 6) 7))
x
(reverse x)

;;in terms of reverse and map in 2-2-1.scm
(define (deep-reverse items)
  (map reverse (reverse items)))


(deep-reverse x)

(define (deep-reverse x)
  (define (get-reverse-item item)
    (if (pair? item)
	(deep-reverse item)
	item))
  (define (iter subitems result)
    (if (null? subitems)
	result
	(iter (cdr subitems)
	      (cons (get-reverse-item (car subitems))
		    result))))
  (iter x nil))

(define x2 (list (list 1 2) (list 3 4) (list 5 6)))
(deep-reverse x2)
(deep-reverse x)
