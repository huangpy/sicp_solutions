(load "2-2-1.scm")
(define (reverse items)
  (if (null? (cdr items))
      (list  (car items))
      (append (reverse (cdr items)) (list (car items)))))

(define list1 (list 1 2 3 4))
(reverse list1)

;;better version from http://wiki.drewhess.com/wiki/SICP_exercise_2.18
(define (reverse items)
  (if (null? items)
      '()
      (append (reverse (cdr items)) (cons (car items) '() ))))

(define list1 (list 1 2 3 4))
(reverse list1)

;;in iterative style, this version is even easier than recursion
(define (reverse items)
  (define (iter subitems result)
    (cond ((null? subitems) result)
	  ((pair? subitems) (iter (cdr subitems) (cons (car subitems) result)))
	  (else subitems)))
  (iter items '()))

(define list1 (list 1 2 3 4))
(reverse list1)

(reverse (list (list 1 2) (list 3 4)))
