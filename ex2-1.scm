(load "general.scm")
(load "2-1-1.scm")

;;my solution is too complicated...
(define (make-rat n d)
  (if (xor (positive? n) (positive? d))
      (cons (- (abs n)) (abs d))
      (cons (abs n) (abs d))))

;;solution from http://community.schemewiki.org/?sicp-ex-2.1

(define (make-rat n d)
  (let ((g ((if (< d 0) - +) (abs (gcd n d)))))
    (cons (/ n g) (/ d g))))

(print-rat (make-rat 1 2))
(print-rat (make-rat (- 1) 2))
(print-rat (make-rat 1 (- 2)))
(print-rat (make-rat (- 1) (- 2)))
 
