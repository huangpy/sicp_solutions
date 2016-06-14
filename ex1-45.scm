(load "1-3-4.scm")
(load "ex1-43.scm")
(load "1-3-3.scm")
(define (nth-exp y n)
  (if (= n 1)
      y
      (* y (nth-exp y (- n 1)))))

(define (nth-root-equation x n)
  (lambda (y) (/ x
		 (nth-exp y (- n 1)))))

(define (log2 n)
  (define (iter p r)
    (if (< n r)
	(- p 1)
	(iter (+ p 1) (* r 2))))
  (iter 1 2))



(define (nth-root x n)
  (let ((repeat-average-damp (repeated average-damp (log2 n))))
    (fixed-point  (repeat-average-damp (nth-root-equation x n)) 1.0 )))

;;another version with a little change which return a function
(define (nth-root-2 n)
  (let ((repeat-average-damp (repeated average-damp (log2 n))))
    (lambda (x) (fixed-point (repeat-average-damp (nth-root-equation x n)) 1.0))))


(nth-root 4 2)

(define (sqrt x)
  (nth-root x 2))

(sqrt 16)

(define sqrt (nth-root-2 2))

(sqrt 4)

