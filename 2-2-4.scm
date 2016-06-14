#lang racket
(require (planet "sicp.ss" ("soegaard" "sicp.plt" 2 1)))

;;(paint einstein)

(define wave einstein)

(define wave2 (beside wave (flip-vert wave)))
(define wave4 (below wave2 wave2))

(paint wave2)
(paint wave4)

(define (flipped-pairs painter)
  (let ((painter2 (beside painter (flip-vert painter))))
    (below painter2 painter2)))

(define wave5 (flipped-pairs wave))
(paint wave5)

(define (right-split painter n)
  (if (= n 0)
      painter
      (let ((smaller (right-split painter (- n 1))))
	(beside painter (below smaller smaller)))))

(paint (right-split wave 2))

(define (up-split painter n)
  (if (= n 0)
      painter
      (let ((smaller (up-split painter (- n 1))))
	(below painter (beside smaller smaller)))))

(paint (up-split wave 2))

(define (corner-split painter n)
  (if (= n 0)
      painter
      (let ((up (up-split painter (- n 1)))
	    (right (right-split painter (- n 1)))
	    (corner (corner-split painter (- n 1))))
	(below (beside painter (below right right))
	       (beside (beside up up) corner)))))

(paint (corner-split wave 2))

(define (square-limit painter n)
  (if (= n 0)
      painter
      (let ((top-left (flip-horiz (corner-split painter (- n 1))))
	    (top-right (corner-split painter (- n 1)))
	    (bottom-left (flip-vert (flip-horiz (corner-split painter (- n 1)))))
	    (bottom-right (flip-vert (corner-split painter (- n 1)))))
	(below (beside bottom-left bottom-right)
	       (beside top-left top-right)))))

(paint (square-limit wave 3))


;;higher-order operations
(define (square-of-four tl tr bl br)
  (lambda (p)
    (let ((top (beside (tl p) (tr p)))
	  (bottom (beside (bl p) (br p))))
      (below bottom top))))

(define (flipped-pairs2 painter)
  (let ((combine4 (square-of-four identity flip-vert
				  identity flip-vert)))
    (combine4 painter)))
;;因为paiter是直接从flipped-pairs传给sqare-of-four，所以也可以简单定义为
(define flipped-pairs3 (square-of-four identity flip-vert
				       identity flip-vert))
(display "flipped-pairs3")
(newline)
(paint (flipped-pairs3 wave))

;;这个就不能简单定义了，因为传给quare-limit的painter要经过(corner-split)后才传给square-of-four，和上面的flipped-pairs3的直接传递painter不一样！
(define (square-limit2 painter n)
  (let ((combine4 (square-of-four flip-horiz identity
				  rotate180 flip-vert)))
    (combine4 (corner-split painter (- n 1)))))

(paint (square-limit2 wave 3))


;;ex2-45
(define (split big-small small-small n)
  (lambda (painter)
    (if (= n 0)
	painter
	(let ((smaller ((split big-small small-small (- n 1)) painter)))
	  (big-small painter (small-small smaller smaller))))))

(define (right-split2 painter n)
  (let ((rl (split beside below n)))
    (rl painter)))

(paint (right-split2 wave 3))

(define (up-split2 painter n)
  (let ((ul (split below beside n)))
    (ul painter)))

(paint (up-split2 wave 3))

;;above is my solution, another better way is that which does pass n to split, 把它延迟到返回的procedure里面传入
(define (split2 big-small small-small)
  (lambda (painter n)
    (if (= n 0)
	painter
	(let ((smaller ((split2 big-small small-small) painter (- n 1))))
	  (big-small painter (small-small smaller smaller))))))

(define (right-split3 painter n)
  ((split2 beside below) painter n))
;;another definition of right-split, this is simpler
(define right-split4 (split2 beside below))

(paint (right-split4 wave 3))

;;use inner definition to simplify the split,因为上面的版本都缺乏对自身的引用，所以导致let里面冗长
(define (split3 big-small small-small)
  (define (inner painter n)
    (if (= n 0)
	painter
	(let ((smaller (inner painter (- n 1))))
	  (big-small painter (small-small smaller smaller)))))
  inner)

(define right-split5 (split3 beside below))
(define up-split5 (split3 below beside))

(paint (right-split5 wave 3))


;;Frames
(define (frame-coord-map frame)
  (lambda (v)
    (add-vect (origin-frame frame)
	      (add-vect (scale-vect (xcor-vect v)
				    (edge1-frame frame))
			(scale-vect (ycor-vect v)
				    (edge2-frame frame))))))

(define (frame-coord-map1 frame)
  (lambda (v)
    (vector-add (frame-origin frame)
		(vector-add (vector-scale (vector-xcor v)
					  (frame-edge1 frame))
			    (vector-scale (vector-ycor v)
					  (frame-edge2 frame))))))


;;ex2-46.scm
;;constructor
(define (make-vect x y) (list x y))
;;selectors
(define (define (xcor-vect v) (car v)))
(define (define (ycor-vect v) (cadr v)))

(define (add-vect v1 v2)
  (make-vect (+ (xcor-vect v1) (xcor-vect v2))
	     (+ (ycor-vect v1) (ycor-vect v2))))

(define (sub-vect v1 v2)
  (make-vect (- (xcor-vect v1) (xcor-vect v2))
	     (- (ycor-vect v1) (ycor-vect v2))))

(define (scale-vect s v)
  (make-vect (* s (xcor-vect v))
	     (* s (ycor-vect v))))


;;ex2-47.scm
;;version-1
(define (make-frame origin edge1 edge2)
  (list origin edge1 edge2))

(define (origin-frame frame)
  (car frame))

(define (edge1-frame frame)
  (cadr frame))

(define (edge2-frame frame)
  (caddr frame))


;;Painters
(define (segments->painter segment-list)
  (lambda (frame)
    (for-each (lambda (segment)
		(draw-line ((frame-coord-map frame) (start-segment segment))
			   ((frame-coord-map frame) (end-segment segment))))
	      segment-list)))


;;ex2-48.scm
(define (make-segment start-vect end-vect)
  (list start-vect end-vect))

(define (start-segment segment) (car segment))

(define (end-segment segment) (cadr segment))



;;ex2-49.scm
;;a
(define top-left (make-vect 0.0 1.0))

(define top-right (make-vect 1.0 1.0))

(define bottom-left (make-vect 0.0 0.0))

(define bottom-right (make-vect 1.0 0.0))

(define top (make-segment top-left top-right))

(define left (make-segment top-left bottom-left))

(define right (make-segment top-right bottom-right))

(define bottom (make-segment bottom-left bottom-right))

(segments->painter (list top bottom left right))

;;b
(define left-top (make-vect 0.0 1.0))

(define right-bottom (make-vect 1.0 0.0))

(define right-top (make-vect 1.0 1.0))

(define left-bottom (make-vect 0.0 0.0))

(define left-top-to-right-bottom (make-segment left-top
                                               right-bottom))

(define right-top-to-left-bottom (make-segment right-top
                                               left-bottom))

(segments->painter (list left-top-to-right-bottom
                         right-top-to-left-bottom))


;;another more simple version
; a. 
 (define outline 
   (let ((segments '( 
                     ((0 0) (0 1)) 
                     ((0 1) (1 1)) 
                     ((1 1) (1 0)) 
                     ((1 0) (0 0)) 
                    ))) 
     (segments->painter segments))) 
  
 ; b. 
 (define cross 
   (let ((segments '( 
                     ((0 0) (1 1)) 
                     ((0 1) (1 0)) 
                    ))) 
     (segments->painter segments))) 
  
 ; c. 
 (define diamond 
   (let ((segments '( 
                     ((0 0.5) (0.5 1)) 
                     ((0.5 1) (1 0.5)) 
                     ((1 0.5) (0.5 0)) 
                     ((0.5 0) (0 0.5)) 
                    ))) 
     (segments->painter segments))) 


;;Transforming and combining painters
(define (transform-painter painter origin corner1 corner2)
  (lambda (frame)
    (let ((m (frame-coord-map frame)))
      (let ((new-origin (m origin)))
	(painter
	 (make-frame new-origin
		     (sub-vect (m corner1) new-origin)
		     (sub-vect (m corner2) new-origin)))))))

(define (flip-vert painter)
  (transform-painter painter
		     (make-vect 0.0 1.0)
		     (make-vect 1.0 1.0)
		     (make-vect 0.0 0.0)))



(define (beside painter1 painter2)
  (let ((split-point (make-vect 0.5 1.0)))
    (let ((painter-left
	   (transform-painter painter1
			      (make-vect 0.0 0.0)
			      split-point
			      (make-vect 0.0 1.0)))
	  (painter-right
	   (transform-painter painter1
			      split-point
			      (make-vect 1.0 0.0)
			      (make-vect 0.5 1.0))))
      (lambda (frame)
	(painter-left frame)
	(painter-right frame))) ))



;;ex2-50.scm
(define (flip-horiz painter)
  (transform-painter painter
		     (make-vect 1.0 0.0)
		     (make-vect 0.0 0.0)
		     (make-vect 1.0 1.0)))

(define (rotate-180 painter)
  (transform-painter painter
		     (make-vect 1.0 1.0)
		     (make-vect 1.0 0.0)
		     (make-vect 0.0 1.0)))
(define (rotate270 painter) 
   (transform-painter painter 
                      (make-vect 0.0 1.0) 
                      (make-vect 0.0 0.0) 
                      (make-vect 1.0 1.0))) 


;;ex2-51.scm
(define (rotate-90 painter)
  (transform-painter painter
		     (make-vect 1.0 0.0)
		     (make-vect 0.0 0.0)
		     (make-vect 1.0 1.0)))

;;my solution is wrong
(define (below painter1 painter2)
  (rotate-90 (beside painter1 painter2)))

;;right solution
(define (below painter1 painter2)
  (rotate-90 (beside (rotate-270 painter1) (rotate-270 painter2))))



;;ex2.52.scm
;;a

;;b
(define (corner-split painter n)
  (if (= n 0)
      painter
      (let ((up (up-split painter (- n 1)))
	    (right (right-split painter (- n 1)))
	    (corner (corner-split painter (- n 1))))
	(beside (below (painter up))
		(below (corner right))))))

;;c
(define (square-limit2 painter n)
  (let ((combine4 (square-of-four flip-vert rotat180
				  identity flip-horiz)))
    (combine4 (corner-split painter (- n 1)))))

(paint (square-limit2 wave 3))

