(load "general.scm")
(define (count-leaves x)
  (cond ((null? x) 0)
	((not (pair? x)) 1)
	(else (+ (count-leaves (car x))
		 (count-leaves (cdr x))))))

(count-leaves (list (list 1 2) (list 3 4)) )

;;map over trees
(define (scale-tree tree factor)
  (if (null? tree)
      nil
      (let ((a (car tree))
	    (d (cdr tree)))
	(cons (if (pair? a)
		  (scale-tree a factor)
		  (* factor a))
	      (scale-tree d factor)))))

(scale-tree (list 1 2) 2)
(define list2 (list (list (list 10 11) 1 2) (list 3 4) 5 (list 6 7) 2))
list2
(scale-tree list2 2)

;;my version in ters of map in 2-2-1.scm
;;it goes wrong when apply to list2 which has nested two layer
(define (scale-tree tree factor)
  (if (null? tree)
      nil
      (let ((a (car tree))
	    (d (cdr tree)))
	(cons (if (pair? a)
		  (map (lambda (x) (* x factor)) a)
		  (* a factor))
	      (scale-tree d factor)))))

(scale-tree (list 1 2) 2)
(define list2 (list (list (list 10 11) 1 2) (list 3 4) 5 (list 6 7) 2))
list2
;;(scale-tree list2 2)

;;sicp verison in terms of map
(define (scale-tree tree factor)
  (map (lambda (first)
	 (if (pair? first)
	     (scale-tree first factor)
	     (* first factor)))
       tree))


(scale-tree (list 1 2) 2)
(define list2 (list (list (list 10 11) 1 2) (list 3 4) 5 (list 6 7) 2))
list2
(scale-tree list2 2)


