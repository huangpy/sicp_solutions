(load "2-2-3.scm")
(load "2-2-1.scm")
(define (queens board-size)
  (define (queen-cols k)
    (if (= k 0)
	(list empty-board)
	(filter
	 (lambda (positions) (safe? k positions))
	 (flatmap (lambda (rest-of-queens)
		    (map (lambda (new-row)
			   (adjoin-position new-row k rest-of-queens))
			 (enumerate-interval 1 board-size)))
		  (queen-cols (- k 1))))))
  (queen-cols board-size))

(define (adjoin-position new-row k rest-of-queens)
  (cons new-row rest-of-queens))

(define empty-board nil)

(define (safe? k positions)
  (define (item-check val index sub-pos)
    (if (null? sub-pos)
	#t
	(let ((diff (abs (- (car sub-pos) val))))
	  (if (or (= diff 0)
		  (= diff (+ index 1)))
	      #f
	      (item-check val (+ index 1) (cdr sub-pos))))))
  (item-check (car positions) 0 (cdr positions)))

(queens 8)
(queens 4)

(for-each (lambda (i)
       (display i)
       (newline))
     (queens 5))

