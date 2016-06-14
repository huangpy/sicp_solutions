;;Quotation
(define a 1)
(define b 2)
(list a b)
(list 'a 'b)
(list 'a b)

(car '(a b c))
(cdr '(a b c))

(eq? 'a 'a)
(eq? 'a 'A) ;;#t
(eq? 'a 'b)

(define (memq item x)
  (cond ((null? x) false)
	((eq? item (car x)) x)
	(else (memq item (cdr x)))))

(memq 'apple '(pear banana prune))
(memq 'apple '(pear apple prune))
(memq 'apple '(x (apple sauce) y apple pear))
