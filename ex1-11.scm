(define (f n)
  (if (< n 3)
      n
      (+ (f (- n 1))
	 (f (- n 2))
	 (f (- n 3)))))

(f 3)
(f 4)
(f 5)

(define (f2 n)
  (f-iter 0 1 2 n))

(define (f-iter a b c count)
  (if (= 0 count)
      a
      (f-iter b c (+ a b c) (- count 1))))

(f2 3)
(f2 4)
(f2 5)
