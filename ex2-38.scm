(load "2-2-3.scm")
(define (fold-left op init sequence)
  (define (iter result rest)
    (if (null? rest)
	result
	(iter (op result (car rest))
	      (cdr rest))))
  (iter init sequence))

(define fold-right accumulate)

(fold-right / 1 (list 1 2 3))
(fold-left / 1 (list 1 2 3))
(fold-right list nil (list 1 2 3))
(fold-left list nil (list 1 2 3))

(fold-left cons nil (list 1 2 3))
(fold-right cons nil (list 1 2 3))

;;if the op satisfy associative law, like + *
(fold-left + 0 (list 1 2 3))
(fold-right + 0 (list 1 2 3))

