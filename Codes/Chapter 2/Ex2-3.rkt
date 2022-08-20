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

(define (make-rect length width)
  (cons length width))

(define (perimeter rect)
  (* 2 (+ (calc (car rect)) (calc (cdr rect)))))

(define (area rect)
  (* (calc (car rect)) (calc (cdr rect))))

(define (calc line)
  (sqrt (+ (square (- (x-point (car line)) (x-point (cdr line))))
           (square(- (y-point (car line)) (y-point (cdr line)))))))

(define square (lambda (x) (* x x)))

(perimeter (make-rect (make-segment (make-point 0 0) (make-point 3 4))
                      (make-segment (make-point 0 0) (make-point 4 -3))))
(area (make-rect (make-segment (make-point 0 0) (make-point 3 4))
                      (make-segment (make-point 0 0) (make-point 4 -3))))