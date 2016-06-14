(load "general.scm")
(load "ex1-42.scm")
;;wrong solution of myself
(define (repeated-w f n)
  (define (iter i)
    (if (= i 1)
	f
	(lambda (x) (f ((iter (- i 1)) x)))))
  (iter n))

;;solution from http://sicp.readthedocs.io/en/latest/chp1/43.html
;;recursion
(define (repeated f n)
  (if (= n 1)
      f
      (lambda (x) (f ((repeated f (- n 1)) x)))))

;;recursion using 'let'
(define (repeated f n)
  (if (= n 1)
      f
      (let ((next-f (repeated f (- n 1))))
	(lambda (x) (f (next-f x))))))

;;recursion using 'let' -v2, this version is better for understanding
(define (repeated f n)
  (if (= n 1)
      f
      (lambda (x)
	(let ((next-f (repeated f (- n 1))))
	  (f (next-f x))))))

;;iteration, store state(is a lambda-function here) in result-f
(define (repeated f n)
  (define (iter i result-f)
    (if (= i 1)
	result-f
	(iter (- i 1)
	      (lambda (x)
		(result-f (f x)))))) ;;这里改成 (f (result-f x))也是一样的，而且更好理解
  (iter n f))

;;recursion using 'compose' in ex1-42.scm
(define (repeated f n)
  (define (iter i)
    (if (= i 1)
	f
	(compose f (iter (- i 1))))))


;;iteration using 'compose' in ex1-42.scm
(define (repeated f n)
  (define (iter i result-f)
    (if (= i 1)
	result-f
	(iter (- i 1)
	      (compose f result-f))))
  (iter n f))


((repeated square 2) 5)
((repeated-w square 2) 5)
