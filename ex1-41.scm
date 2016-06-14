(load "general.scm")
(define (double f)
  (lambda (x) (f (f x))))

((double inc) 3)

(((double (double double)) inc) 5)
