(define (dec n) (- n 1))

(define (inc n) (+ n 1))

(define (plus a b)
  (if (= a 0)
      b
      (inc (plus (dec a) b))))

(define (plus2 a b)
  (if (= a 0)
      b
      (plus2 (dec a) (inc b))))
