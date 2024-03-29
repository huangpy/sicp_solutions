(define (fib n)
  (cond ((= n 0) 1)
	((= n 1) 1)
	(else (+ (fib (- n 1))  (fib (- n 2))))))

(fib 5)

(define (fib2 n)
  (define (fib2-iter before after n)
    (if (= n 0)
	before
	(fib2-iter after (+ before after) (- n 1))))
  (fib2-iter 0 1 n)
  )

(fib2 5)

(define (count-change amount)
  (cc amount 5))

(define (cc amount kinds-of-coins)
  (cond ((= amount 0) 1)
	((or (< amount 0) (= kinds-of-coins 0)) 0)
	(else (+ (cc amount (- kinds-of-coins 1))
		 (cc (- amount (first-denomination kinds-of-coins))
		     kinds-of-coins)))))

(define (first-denomination kinds-of-coins)
  (cond ((= kinds-of-coins 5) 50)
	((= kinds-of-coins 4) 25)
	((= kinds-of-coins 3) 10)
	((= kinds-of-coins 2) 5)
	((= kinds-of-coins 1) 1)))
