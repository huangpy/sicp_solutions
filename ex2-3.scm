(load "general.scm")
(load "ex2-2.scm")
(load "ex1-45.scm")

;;这里的思路是不同的constructor，但是slectors都是取出最基本的三个点，然后再在这基础上封装出：表示三条边以及三条边长度的方法。注意最基本的seletor不提供给计算周长和面积的方法使用，而使用封装好了的方法

;;constructor version-1 in terms of three points
(define (make-rectangles point1 point2 point3)
  (cons (cons point1 point2) point3))

;;constructor version-2 in terms of two points and one segment
(define (make-rectangles2 segment point)
  (cons (cons (start-segment segment)
	      (end-segment segment))
	point))

;;public selectors working with two versions of constructor
(define (firstpoint-rectangles rectangles)
  (car (car rectangles)))

(define (secondpoint-rectangles rectangles)
  (cdr (car rectangles)))

(define (thirdpoint-rectangles rectangles)
  (cdr rectangles))

;;constructor version-3 in terms of two points and one segment
(define (make-rectangles3 segment point)
  (cons segment point))

(define (firstpoint-rectangles rectangles)
  (start-segment (car rectangles)))

(define (secondpoint-rectangles rectangles)
  (end-segment (car rectangles)))

(define (thirdpoint-rectangles rectangles)
  (cdr rectangles))

;;找出线段的selectors
(define (firstsegment-rectangles rectangles)
  (make-segment (firstpoint-rectangles rectangles)
		(secondpoint-rectangles rectangles)))

(define (secondsegment-rectangles rectangles)
  (make-segment (secondpoint-rectangles rectangles)
		(thirdpoint-rectangles rectangles)))

(define (thirdsegment-rectangles rectangles)
  (make-segment (thirdpoint-rectangles rectangles)
		(firstpoint-rectangles rectangles)))

;;calculate length of a segment
(define (length-segment segment)
  (sqrt (+ (square  (- (x-point (start-segment segment))
		       (x-point (end-segment segment))))
	   (square  (- (y-point (start-segment segment))
		       (y-point (end-segment segment)))))))

;;calculate length for every segment in the rectangles
(define (segmenta-ractangles rectangles)
  (length-segment (firstsegment-rectangles rectangles)))
(define (segmentb-ractangles rectangles)
  (length-segment (secondsegment-rectangles rectangles)))
(define (segmentc-ractangles rectangles)
  (length-segment (thirdsegment-rectangles rectangles)))

;;use
(define (perimeter rectangles)
  (+ (segmenta-ractangles rectangles)
     (segmentb-ractangles rectangles)
     (segmentc-ractangles rectangles)))

(define (area rectangles)
  (let ((a (segmenta-ractangles rectangles))
	(b (segmentb-ractangles rectangles))
	(c (segmentc-ractangles rectangles))
	(p (/ (perimeter rectangles) 2)))
    (sqrt (*
	   p
	   (- p a)
	   (- p b)
	   (- p c)))))

(define point1 (make-point 0 0))
(define point2 (make-point 0 3))
(define point3 (make-point 3 0))

;;use constructor version-1
(define rectangles1 (make-rectangles point1 point2 point3))
(perimeter rectangles1)
(area rectangles1)

;;use constructor version-2
(define segment (make-segment point1 point2))
(define rectangles2 (make-rectangles2 segment point3))
(perimeter rectangles1)
(area rectangles1)

;;use constructor version-3
(define segment (make-segment point1 point2))
(define rectangles3 (make-rectangles3 segment point3))
(perimeter rectangles1)
(area rectangles1)

