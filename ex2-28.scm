(define (make-mobile left right)
  (list left right))

(define (left-branch mobile)
  (car mobile))

(define (right-branch mobile)
  (cadr mobile))

(define (make-branch length structure)
  (list length structure))

(define (branch-length branch)
  (car branch))

(define (branch-structure branch)
  (cadr branch))

(define (total-weight mobile)
  (define (get-struc-weight struc)
    (if (pair? struc)
	(total-weight struc)
	struc))
  (let ((lstruc (branch-structure (left-branch mobile)))
	(rstruc (branch-structure (right-branch mobile))))
    (+ (get-struc-weight lstruc)
       (get-struc-weight rstruc))))

(define lbran1 (make-branch 1 2))
(define rbran (make-branch 3 4))
(define mobile (make-mobile lbran1 rbran))
(total-weight mobile)

(define lbran2 (make-branch 5 mobile))
(define rbran2 (make-branch 7 8))
(define mobile2 (make-mobile lbran2 rbran2))
(right-branch mobile2)
(branch-structure (left-branch mobile2))
(total-weight mobile2)



(define (is-balanced-mobile mobile)
  (define (torque-branch branch)
    (let ((struc (branch-structure branch)))
      (if (not (pair? struc))
	  (* (branch-length branch) struc)
	  (+ (torque-branch (left-branch struc))
	     (torque-branch (right-branch struc))))))

  (define (is-balanced-branch branch)
    (let ((s (branch-structure branch)))
      (if (pair? s)
	  (is-balanced-mobile s)
	  #t)))
  
  (let ((lbran (left-branch mobile))
	(rbran (right-branch mobile)))
    (and (= (torque-branch lbran)
	    (torque-branch rbran))
	 (is-balanced-branch lbran)
	 (is-balanced-branch rbran))))

(is-balanced-mobile mobile)
(define lbran3 (make-branch 2 8))
(define rbran3 (make-branch 4 4))
(define mobile3 (make-mobile lbran3 rbran3))
(is-balanced-mobile mobile3)
(define lbran4 (make-branch 6 mobile3))
tr(define rbran4 (make-branch 4 8))
(define mobile4 (make-mobile lbran4 rbran4))
(is-balanced-mobile mobile4)


;;change mobile's constructors
(define (make-mobile left right)
  (cons left right))

(define (make-branch length structure)
  (cons length structure))

;;we should change responding selectors to work with the new constructors
(define (left-branch mobile)
  (car mobile))

(define (right-branch mobile)
  (cdr mobile))

(define (branch-length branch)
  (car branch))

(define (branch-structure branch)
  (cdr branch))

(define lbran3 (make-branch 2 8))
(define rbran3 (make-branch 4 4))
(define mobile3 (make-mobile lbran3 rbran3))
(is-balanced-mobile mobile3)

(define lbran4 (make-branch 6 mobile3))
(define rbran4 (make-branch 4 8))
(define mobile4 (make-mobile lbran4 rbran4))
(cdar mobile4)
(is-balanced-mobile mobile)






