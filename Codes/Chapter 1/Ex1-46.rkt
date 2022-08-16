#lang sicp
(define (iterative-improve judge improve)
  (lambda (x)
    (define (iter val)
       (if (judge val)
           val
           (iter (improve val))))
     (iter x )))

; rewrite sqrt
(define (sqrt tar)
  (define tolerance 0.00001)
  (define judge
    (lambda (x)
      (< (abs (- (* x x) tar)) tolerance) ))
  (define improve (lambda (x)
                    (/ (+ x (/ tar x)) 2)))
  ((iterative-improve judge improve)1.0))

(sqrt 109)
;rewrite fixed-point proceure
(define (fixed-point f)
  (define tolerance 0.001)
  (define judge
    (lambda (x)
      (< (abs (- x (f x))) tolerance)))
  (define improve (lambda (x)
                    (f x)))
  ((iterative-improve judge improve) 1.1))

(fixed-point (lambda (x) (+ 1 (/ 1 x))))
(fixed-point (lambda (x) (/ (+ (/ 2 x) x) 2)))