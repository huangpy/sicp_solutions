(load "1-3-4.scm")
(load "general.scm")
(define (cubic-root a b c)
  (define (cubic a b c)
    (lambda (x) (+ (cube x) (* a (square x)) (* b x) c)))
  (newton-method (cubic a b c) 1))

(cubic-root (- 1) (- 1) 1)
