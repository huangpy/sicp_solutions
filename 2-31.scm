(load "2-2-1.scm")
(define (subsets s)
  (if (null? s)
      (list nil)
      (let ((rest (subsets (cdr s))))
	(append rest (map car
			  rest)))))

(define list1 (list 1))
(subsets list1)
