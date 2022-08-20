#lang sicp
(define (make-segment start-point end-point)
  (cons start-point end-point))

(define (start-segment line)
  (car line))
(define (end-segment line)
  (cdr line))

(define (make-point x y)
  (cons x y))

(define (x-point p)
  (car p))

(define (y-point p)
  (cdr p))

(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

(define (midpoint-segment line)
  (let ((x-aver-point (/ (+ (x-point (start-segment line)) (x-point (end-segment line))) 2))
        (y-aver-point (/ (+ (y-point (start-segment line)) (y-point (end-segment line))) 2)))
    (make-point x-aver-point y-aver-point)))



(print-point (midpoint-segment line))

  
                       
           


