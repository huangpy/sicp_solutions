(load "2-2-1.scm")
(load "2-3-2.scm")

;;a
(define (make-sum a1 a2)
  (cond ((=number? a1 0) a2)
	((=number? a2 0) a1)
	((and (number? a1) (number? a2)) (+ a1 a2))
	(else (list a1 '+ a2))))

(define (make-product m1 m2)
  (cond ((or (=number? m1 0) (=number? m2 0)) 0)
	((=number? m1 1) m2)
	((=number? m2 1) m1)
	((and (number? m1) (number? m2)) (* m1 m2))
	(else (list m1 '*y m2))))


(define (sum? x) (and (pair? x) (eq? (cadr x) '+)))

(define (addend s) (car s))
;;augend need no change

(define (make-product m1 m2) (list m1 '* m2))

(define (product? x) (and (pair? x) (eq? (cadr x) '*)))

(define (multiplier p) (car p))
;;multiplicand need no change

(deriv '(x + (3 * (x + (y + 2)))) 'x)


;;b
;;my solution-1
(define (augend s)
  (if (> (length s) 3)
      (cddr s)
      (caddr s)))

(define (multiplicand s)
  (if (> (length s) 3)
      (cddr s)
      (caddr s)))

;;my another simple solution in terms of accumulate
(define (augend1 s)
  (accumulate make-sum
	      0
	      (filter (lambda (x) (not (eq? '+ x)))
		       (cddr s))))

(define (multiplicand1 s)
  (accumulate make-product
	      1
y	      (filter (lambda (x) (not (eq? '* x)))
		       (cddr s))))

(augend '(x + y + z))
(multiplicand '(x * y * (a + b) * z))

(deriv '(x + 3 * (x + y + 2)) 'x)
(deriv '(x + y * z) 'x)
(deriv '(x * y + z) 'x)
