(load "general.scm")
(load "ex2-40.scm")
(load "2-2-3.scm")

(define (unique-triples n)
  (flatmap (lambda (i)
	     (map (lambda (j) (cons i j))
		  (unique-pairs (- i 1))))
       (enumerate_interval 1 n)))

(unique-triples 5)

(define (sum-s-triples n s)
  (filter (lambda (subset) (= (accumulate + 0 subset) s))
	  (unique-triples n)))



(sum-s-triples 5 8)
