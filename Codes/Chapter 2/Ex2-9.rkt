#lang sicp
(define (make-interval a b) (cons a b))
(define (upper-bound x) (cdr x))
(define (lower-bound x) (car x))

(define (sub-interval x y)
  (make-interval (- (lower-bound x) (upper-bound y))
                 (- (upper-bound x) (lower-bound y))))

(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
                 (+ (upper-bound x) (upper-bound y))))


(define (width x)
  (/ (- (upper-bound x) (lower-bound x)) 2))

(define (add-width x y)
  (+ (width x) (width y)))
(define (sub-width x y)
  (+ (width x) (width y)))

(define x (make-interval 7 9))
(define y (make-interval 3 7))
(define inter1 (add-interval x y ))
(define inter2 (sub-interval x y))

(add-width x y)
(width inter1)
(sub-width x y)
(width inter2)