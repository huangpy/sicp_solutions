(define (even? n)
  (= (remainder n 2) 0))

(define (square x)
  (* x x))

(define (suc-expt b n)
  (suc-expt-iter 1 b n))

(define (suc-expt-iter a b n)
  (cond ((= n 0) a)
	((even? n) (suc-expt-iter a (square b) (/ n 2)))
	(else (suc-expt-iter (* a b) b (- n 1)))))

(suc-expt 2 3)
