;;recursive process
(define (accumulate combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a)
		(accumulate combiner null-value term (next a) next b))))

;;iterative process
(define (accumulate-iterative combiner null-value term a next b)
  (define (iter a result)
    (if (> a b)
	result
	(iter (next a) (combiner result (term a)))))
  (iter a null-value))


(define (sum term a next b)
  (define (combiner x y) (+ x y))
  (define null-value 0)
  (accumulate-iterative combiner null-value term a next b))


(define (identical-sum a b)
  (define (term k) k)
  (define (next k) (+ k 1))
  (sum term a next b))

(identical-sum 2 4)

(define (product term a next b)
  (define (combiner x y) (* x y))
  (define null-value 1)
  (accumulate combiner null-value term a next b))

(define (identical-product a b)
  (define (term k) k)
  (define (next k) (+ k 1))
  (product term a next b))

(identical-product 2 4)
