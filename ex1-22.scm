(define (square x)
  (* x x))

;;test primality
(define (smallest-divisor n)
  (find-divisor n 2))
(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
	((divides? test-divisor n) test-divisor)
	(else (find-divisor n (+ test-divisor 1)))))
(define (divides? a b)
  (= (remainder b a) 0))

(define (prime? n)
  (= n (smallest-divisor n)))



;;evaluate the time
(define (timed-prime-test n)
  (start-prime-test n (runtime)))
(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime n (- (runtime) start-time))
      #f))
(define (report-prime n elapsed-time)
  (newline)
  (display n)
  (display " *** ")
  (display elapsed-time))

;;check the primality of consecutive odd integers


(define (even? n)
  (= (remainder n 2) 0))


(define (search-for-primes start-n counter)
  (if (even? start-n)
      (search-for-primes-iter (+ start-n 1) counter)
      (search-for-primes-iter start-n counter)))

(define (search-for-primes-iter start-n counter)
  (if (> counter 0)
      (if (timed-prime-test start-n)
	  (search-for-primes-iter (+ start-n 2) (- counter 1))
	  (search-for-primes-iter (+ start-n 2) counter))
      "COMPUTE COMPLETE"))
