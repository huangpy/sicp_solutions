
;;logorithmic number using recursion
(define (multi a b)
  (cond ((= b 0) 0)
	((= (remainder b 2) 0) (multi (+ a a) (/ b 2)))
	(else (+ a (multi a (- b 1))))))

(multi 2 4)
(multi 3 5)

;;logorithmic number using iteration
(define (multi2 a b)
  (multi2-iter a b 0))

(define (multi2-iter a b result)
  (cond ((= b 0) result)
	((= (remainder b 2) 0) (multi2-iter (+ a a) (/ b 2) result))
	(else (multi2-iter (+ result a) a (- b 1)))))

(multi2 2 4)
