(load "ex2-36.scm")
(load "ex2-18.scm")
(define (dot-product v w)
  (accumulate + 0 (map * v w)))

(define (matrix-*-vector m v)
  (map (lambda (x)
	 (dot-product x v))
       m))

(define (transpose mat)
  (accumulate-n (lambda (x y)
		  (reverse (cons x y)))
		nil
		mat))
(transpose (list (list 1 2) (list 3 4)))
