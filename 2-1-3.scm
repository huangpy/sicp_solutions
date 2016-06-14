;;version-1
(define (cons x y)
  (define (dispatch m)
    (cond ((= m 0) x)
	  ((= m 1) y)
	  (else (error "arguemnt should be 0 or 1"))))
  dispatch)

;;可以看出来返回lambda也可以保存数据值(这里的x，y)
;;version-2
(define (cons x y)
  (lambda (m)
    (cond ((= m 0) x)
	  ((= m 1) y)
	  (else (error "arguemnt should be 0 or 1")))))

(define (car z) (z 0))
(define (cdr z) (z 1))

(define p (cons 2 3))
(car p)
(cdr p)

