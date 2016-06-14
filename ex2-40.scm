(load "2-2-3.scm")
(define (unique-pairs n)
  (flatmap (lambda (i)
	     (map (lambda (j) (list i j))
		  (enumerate_interval 1 (- i 1))))
	   (enumerate_interval 1 n))
  )

(unique-pairs 4)

(define (prime-sum-pairs n)
  (map make-pair-sum
       (filter prime-sum?
	       (unique-pairs n))))

(prime-sum-pairs 4)
