(define zero (lambda (f) (lambda (x) x)))

(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))

;;one is (add-1 zero), that can reduce to
(define one
  (lambda (f) (lambda (x) (f x))))

;;two is (add-1 one), that can reduce to
(define two
  (lambda (f) (lambda (x) (f (f x)))))

;;and three
(define three
  (lambda (f) (lambda (x) (f (f (f x))))))

(define (add a b)
  (lambda (f) (lambda (x)
		((a f) ((b f) x)))))

