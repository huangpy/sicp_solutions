(define list1 (list 1 3 (list 5 7) 9))
(car (cdr (car (cdr (cdr list1)))))
(cddr list1)
;;(cdar list1)
(car (cdaddr list1))


(define list2 (list (list 7)))
(car (car list2))
(caar list2)

(define list3 (list 1 (list 2 (list 3 (list 4 (list 5 (list 6 7)))))))
(car (cdr (car (cdr (car (cdr (car (cdr (car (cdr (car (cdr list3))))))))))))
(cadadr (cadadr (cadadr list3)))

(define list4 (list 1 (list 2 3)))
(cdr list4)
