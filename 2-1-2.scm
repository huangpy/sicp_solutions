(load "1-2-5.scm")
(define (make-rat n d) (cons n d))

(define (numer x)
  (let ((g (gcd (car x) (cdr x))))
    (/ (car x) n)))

(define (denom x)
  (let ((g (gcd (car x) (cdr x))))
    (/ (cdr x) n)))



