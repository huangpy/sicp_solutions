(load "2-3-3.scm")
(load "2-2-1.scm")

;;element-of-set? is the same as 2-3-3.scm

(define (adjoin-set x set) (cons x set))

(define (union-set set1 set2)
  (append set1 set2))

(define (intersection-set-dupli set1 set2)
  (let ((inter (intersection-set set1 set2))
	(union (union-set set1 set2)))
    (filter (lambda (x)
	      (element-of-set? x inter))
	    union)))

(intersection-set-dupli '(2 3 2 1 3 ) '(2 3 2 1 4 4 2))

(intersection-set '(2 3 2 1 3 ) '(2 3 2 1 4 4 2))
