;;recursive process
(define (cont-frac n d k)
  (define (iter i)
    (let ((N (n i))
	  (D (d i)))
      (if (= i k)
	  (/ N D)
	  (/ N (+ D (iter (+ i 1)))))))
  (iter 1))

(cont-frac (lambda (x) 1.0)
	   (lambda (x) 1.0)
	   11)


;;iterative process
(define (cont-frac-iterative n d k)
  (define (iter i result)
    (let ((N (n i))
	  (D (d i)))
      (if (= i 0)
	  result
	  (iter (- i 1)
		(/ N (+ D result))))))
  (iter k 0))

(cont-frac-iterative (lambda (x) 1.0)
		     (lambda (x) 1.0)
		     11)


