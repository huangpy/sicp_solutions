(define (factorial n)
  (if (= n 1)
      1
      (* (factorial (- n 1)) n)))

(define (factorial-li n)
  (define (factorial-li-iter result counter)
    (if (> counter n)
	result
	(factorial-li-iter (* result counter) (+ counter 1))))
  (factorial-li-iter 1.0 1))
