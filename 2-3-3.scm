(load "general.scm")
(define (element-of-set? x set)
  (cond ((null? set) false)
	((equal? x (car set)) true)
	(else (element-of-set? x (cdr set)))))

(define (adjoin-set x set)
  (if (element-of-set? x set)
      set
      (cons x set)))

;;my iterative iteration
(define (intersection-set set1 set2)
  (define (help inter aset)
    (if (null? aset)
	inter
	(let ((f (car aset)))
	  (help (if (element-of-set? f set2)
		    (adjoin-set f inter)
		    inter)
		(cdr aset)))))
  (help nil set1))

(intersection-set '(1 2 3 4) '(7 2 3 5 6))
(intersection-set '(1 2) '(3 4))

;;book recursive solution
(define (intersection-set set1 set2)
  (cond ((or (null? set1) (null? set2)) nil)
	((element-of-set? (car set1) set2)
	 (cons (car set1)
	       (intersection-set (cdr set1) set2)))
	(else (intersection-set (cdr set1) set2))))


(intersection-set '(1 2 3 4) '(7 2 3 5 6))

(define (union-set set1 set2)
  (cond ((null? set1) set2)
	((null? set2) set1)
	((element-of-set? (car set1) set2)
	 (union-set (cdr set1) set2))
	(else (cons (car set1)
	       (union-set (cdr set1) set2)))))

(union-set '(1 2 3) '(2 3 4))



;;Sets as ordered lists
(define (element-of-set? x set)
  (cond ((null? set) false)
	((= x (car set)) true)
	((< x (car set)) false)
	(else (element-of-set? x (cdr set)))))

(define (intersection-set set1 set2)
  (if (or (null? set1) (null? set2))
      nil
      (let ((x1 (car set1))
	    (x2 (car set2)))
	(cond ((= x1 x2)
	       (cons x1 (intersection-set (cdr set1) (cdr set2))))
	      ((< x1 x2) (intersection-set (cdr set1) set2))
	      ((> x1 x2) (intersection-set set1 (cdr set2)))))))

(intersection-set '(1 2 3) '(2 3 4))



;;Sets as binary trees
(define (make-tree entry left right)
  (list entry left right))

(define (entry tree) (car tree))

(define (left-branch tree) (cadr tree))

(define (right-branch tree) (caddr tree))

(define (element-of-set? x set)
  (cond ((null? set) false)
	((= x (entry set)) true)
	((< x (entry set)) (element-of-set? x (left-branch set)))
	((> x (entry set)) (element-of-set? x (right-branch set)))))

(define (adjoin-set x set)
  (cond ((null? set) (make-tree x nil nil))
	((< x (entry set))
	 (make-tree (entry set)
		    (adjoin-set x (left-branch set))
		    (right-branch set)))
	((> x (entry set))
	 (make-tree (entry set)
		    (left-branch set)
		    (adjoin-set x (right-branch set))))))
