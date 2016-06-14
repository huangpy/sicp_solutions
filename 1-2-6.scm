(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (* test-divisor test-divisor) n) n)
	((divides? n test-divisor) test-divisor)
	(else (find-divisor n (+ test-divisor 1)))))

(define (divides? n test-divisor)
  (= (remainder n test-divisor) 0))

(define (prime? n)
  (= (smallest-divisor n) n))


(prime? 5)
(prime? 9)

(define (even? n)
  (= (remainder n 2) 0))

(define (square n)
  (* n n))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
	((even? exp)
	 (remainder (square (expmod base (/ exp 2) m)) m))
	(else
	 (remainder (* base (expmod base (- exp 1) m)) m))))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) true)
	((fermat-test n) (fast-prime? n (- times 1)))
	(else false)))


