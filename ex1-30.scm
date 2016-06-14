(load "1-3-1.scm")

(define (sum-iterative term a next b)
  (define (iter a result)
    (if (> a b)
	result
	(iter (next a) (+ result (term a)))))
  (iter a 0))

(define (sum-cube a b)
  (sum-iterative cube a inc b))

(sum-cube 1 10)



