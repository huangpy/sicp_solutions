(load "general.scm")
(define nil (quote ()))
(define (same-parity i . else)
  (let ((first-remainder (remainder i 2)))
    (define (same-remainder rmd1 n)
      (= rmd1 (remainder n 2)))
    (define (iter items)
      (if (null? items)
	  nil
	  (if (same-remainder first-remainder
			      (car items))
	      (cons (car items) (iter (cdr items)))
	      (iter (cdr items) ))))
    (iter else)))

(same-parity 1 )
(same-parity 1 2)
(same-parity 1 2 3 4 5 6)
(same-parity 2 2 3 4 5 6)

