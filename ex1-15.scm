(define (abs x)
  (if (< x 0)
      (- x)
      x))

(define (cube x) (* x x x))

(define (p x) (- (* 3 x) (* 4 (cube x))))

(define (sine angle)
  (if (not (> (abs angle) 0.1))
      angle
      (p (sine (/ angle 3.0)))))

(sine 12.15) ;;number of steps: 5

;;multiple by 3
(sine (* 12.15 3)) ;; number of steps: 6


