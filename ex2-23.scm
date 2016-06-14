(load "general.scm")
(define (for-each proc items)
  (define (proc-and-next n subitems)
    (proc n)
    (for-each proc subitems)) 
  (if (null? items)
      nil
      (proc-and-next (car items) (cdr items))))

;;use "begin"  to execute several clause in "if" clause
(define (for-each proc items)
  (if (null? items)
      nil
      (begin (proc (car items))
	     (for-each proc (cdr items)))))

(for-each (lambda (x) (newline) (display x))
	  (list 1 2 3 4))
