(load "2-2-1.scm")
;;my solution: use procedures in 2-2-1.scm
(define (last-pair items)
  (list (list-ref items (- (length items) 1))))

(define list1 (list 1 2 3 4))
(last-pair list1)


;;directly in a iterative style
;;http://www.cnblogs.com/robertzml/archive/2010/02/19/1669204.html
(define (last-pair items)
  (if (null? (cdr items))
      (car items)
      (last-pair (cdr items))))

(define list1 (list 1 2 3 4))
(last-pair list1)

