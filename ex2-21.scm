(load "2-2-1.scm")
(define (square-list items)
  (if (null? items)
      nil
      (let ((item (car items)))
	(cons (* item item)
	      (square-list (cdr items))))))

(define list1 (list 1 2 3 4))
(square-list list1)

(define (square-list items)
  (map (lambda (x) (* x x)) items))

(define list1 (list 1 2 3 4))
(square-list list1)


