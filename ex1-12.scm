

(define (pascal n i)
  (cond
;;      ((= n 1) 1)
;;	((= n 2) 1)
	((or (= i 1) (= i n)) 1)
	(else (+ (pascal (- n 1) (- i 1)) (pascal (- n 1) i)))))

(pascal 1 1)
(pascal 2 1)
(pascal 3 2)
(pascal 5 3)

;;large number
;;(pascal 1024 256)

