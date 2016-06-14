(load "2-1-4.scm")
(load "ex2-12.scm")
(load "ex2-11.scm")
(define (par1 r1 r2)
  (div-interval (mul-interval r1 r2)
		 (add-interval r1 r2)))

(define (par2 r1 r2)
  (let ((one (make-interval 1 1)))
    (div-interval one
		   (add-interval (div-interval one r1)
				 (div-interval one r2)))))

(define r1 (make-center-width 40000 0.001))
(define r2 (make-center-width 80000 0.001))
(center  (par1 r1 r2))
(percent  (par1 r1 r2))
(center  (par2 r1 r2))                             
(percent  (par2 r1 r2))

(center  (par1 r1 r1))
(percent  (par1 r1 r1))


(define i1 (make-interval (/ 100.0 10000000000) (/ 100.0 1000000)))
(define i2 (make-interval  (/ 200.0 10000000000) (/ 200.0 1000000)))
(div-interval i1 i1)
(div-interval i1 i2)

(define i3 (make-center-percent 50 0.000001))
(define i4 (make-center-percent 60 0.000001))
(div-interval i3 i3)
(div-interval i3 i4)
(div-interval i4 i4)


