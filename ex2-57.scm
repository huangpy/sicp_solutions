(load "2-2-1.scm")
(load "2-2-3.scm")
(load "ex2-56.scm")
(load "general.scm")

(define (combine-third exp symb)
  (define (help rest)
    (if (= (length rest) 2)
	(list symb (car rest) (cadr rest))
	(list symb (car rest) (help (cdr rest)))))
  (let ((t (cddr exp)))
    (if (= (length t) 1)
	(car t)
	(help t))))

(define (augend s) (combine-third s '+))

(define (multiplicand s) (combine-third s '*))

;;this is a very simple solution from http://sicp.readthedocs.io/en/latest/chp2/57.html
(define (augend s)
  (if (> (length s) 3)
      (cons '+ (cddr s))
      (caddr s)))

(define (multiplicand p)
  (if (> (length p) 3)
      (cons '* (cddr p))
      (caddr p)))

;;another simple solution in terms of accumulate
(define (augend s)
  (accumulate make-sum 0 (cddr s)))

(define (multiplicand p)
  (accumulate make-product 1 (cddr p)))

(multiplicand '(* x y (+ x 3)))

(deriv '(* x y (+ x 3)) 'x)


