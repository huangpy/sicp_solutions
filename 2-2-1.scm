(define list1 (list 1 2 3 4))
(define list2 (list 9 10))
(car list1)
(cdr list1)
(car (cdr list1))
(car (cdr (cdr list1)))
(cdr (cdr list2)) ;;nil

(cons 10 list1)
(cons 0 (cdr list1))
(cons list1 10)

;;bad usage
(cons list1 list2)
(cons list1 10)
(cons list1 '())
(cons '() list1)

;;list operations
;;get the (+ n 1)th item in a list
(define (list-ref items n)
  (if (= n 0)
      (car items)
      (list-ref (cdr items) (- n 1))))

(list-ref list1 0)
(list-ref list1 1)
(list-ref list1 2)

;;count the length of a list in a recursive style
(define (length items)
  (if (null? items)
      0
      (+ 1 (length (cdr items)))))

(length list1)

;;count the length of a list in a iterative style
(define (length items)
  (define (iter subitems count)
    (if (null? subitems)
	count
	(iter (cdr subitems) (+ count 1))))
  (iter items 0))

(length list1)


;;append operations
;;in a recursive style
(define (append list-a list-b)
  (if (null? list-a)
      list-b
      (cons (car list-a) (append (cdr list-a) list-b))))

(append list1 list2)
(append list2 list1)

;;in a iterative style
(define (append list-a list-b)
  (define (iter n result)
    (if (< n 0)
	result
	(iter (- n 1) (cons (list-ref list-a n) result))))
  (iter (- (length list-a) 1) list-b))

(append list1 list2)
(append list2 list1)


;;mapping over list
(define nil (quote ()))
(define (scale-list items factor)
  (if (null? items)
      nil
      (cons (* factor (car items)) (scale-list (cdr items) factor))))

(define list1 (list 1 2 3 4))
(scale-list list1 2)

;;higher-order procedure
(define (map proc items)
  (if (null? items)
      nil
      (cons (proc (car items)) (map proc (cdr items)))))

;;represent "scale-list" in terms of map
(define (scale-list items factor)
  (define (proc n)
    (* n factor))
  (map proc items))
;;represent "scale-list" in terms of map and lambda
(define (scale-list items factor)
  (map (lambda (x) (* x factor)) items))

(define list1 (list 1 2 3 4))
(scale-list list1 2)

;;directly use abs replace proc
(map abs (list -1 -2))

;;use lambda replace proc
(map (lambda (x) (* x x)) list1)

