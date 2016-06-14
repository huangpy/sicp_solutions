(load "general.scm")
(load "1-2-2.scm")
(load "2-2-1.scm")

;; procedures below are the independant standard component
(define (sum-odd-squares tree)
  (if (null? tree)
      0
      (let ((a (car tree)))
	(+ (if (pair? a)
	       (sum-odd-squares a)
	       (if (odd? a) (square a) 0))
	   (sum-odd-squares (cdr tree))))))

(sum-odd-squares (list 1 2 3 4 5))

(define (even-fibs n)
  (define (next k)
    (if (> k n)
	nil
	(let ((f (fib k)))
	  (if (even? f)
	      (cons f (next (+ k 1)))
	      (next (+ k 1))))))
  (next 0))

(even-fibs 10)

;;Sequence Operations
(define (map proc sequence)
  (if (null? sequence)
      nil
      (cons (proc (car sequence)) (map proc (cdr sequence)))))

(define (filter predicate sequence)
  (if (null? sequence)
      nil
      (let ((a (car sequence)))
	(if (predicate a)
	    (cons a (filter predicate (cdr sequence)))
	    (filter predicate (cdr sequence))))))

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence) (accumulate op initial (cdr sequence)))))

;;in terms of append in 2-2-1.scm
(define (enumerate_tree tree)
  (if (null? tree)
      nil
      (let ((a (car tree)))
	(append (if (pair? a)
		    (enumerate_tree a)
		    (list a))
		(enumerate_tree (cdr tree))))))

(enumerate_tree (list 1 (list 2 3) 4))

(define (enumerate_interval low high)
  (if (> low high)
      nil
      (cons low (enumerate_interval (+ low 1) high))))

(define enumerate-interval enumerate_interval)

;;use the component procedures above to construct conventional interface
(define (sum-odd-squares tree)
  (accumulate + 0
	      (map square
		   (filter odd?
			   (enumerate_tree tree)))))

(sum-odd-squares (list 1 (list 2 3) 4))

(define (even-fibs n)
  (accumulate cons nil
	      (filter even?
		       (map fib
			    (enumerate_interval 0 n)))))

(even-fibs 10)

;;reuse peices from above to construct another procedure
(define (list-fib-square n)
  (accumulate cons nil
	      (map square
		   (map fib
			(enumerate_interval 0 n)))))

(list-fib-square 10)

;;another conventional data-processing application
(define (salary-of-highest-paid-programmer records)
  (accumulate max 0
	      (map salary
		   (filter programmer? records))))


;;nested mapping

(define (make-flat-map n)
  (accumulate append
	      nil
	      (map (lambda (i)
		     (map (lambda (j) (list i j))
			  (enumerate_interval 1 (- i 1))))
		   (enumerate_interval 1 n))))

(make-flat-map 3)

;;the combination of mapping and accumulating with append is so common
(define (flatmap proc seq)
  (accumulate append nil (map proc seq)))

(load "1-2-6.scm")
(define (prime-sum? pair)
  (prime? (+ (car pair) (cadr pair))))

(define (make-pair-sum pair)
  (list (car pair)
	(cadr pair)
	(+ (car pair) (cadr pair))))

(define (prime-sum-pairs n)
  (map make-pair-sum
       (filter prime-sum?
	       (flatmap
		(lambda (i)
		  (map (lambda (j) (list i j))
		       (enumerate_interval 1 (- i 1))))
		(enumerate_interval 1 n)))))


(prime-sum-pairs 5)

;;nested mapping are also useful for sequence other than those that enumerate intervals
(define (permutations s)
  (if (null? s)
      (list nil)
      (flatmap (lambda (x)
		 (map (lambda (p) (cons x p))
		      (permutations (remove x s))))
	       s)))

(define (remove x s)
  (filter (lambda (a) (not (= a x))) s))

(permutations (list 1 2 3))
