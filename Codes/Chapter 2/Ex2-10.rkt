#lang sicp
(define (make-interval a b) (cons a b))
(define (upper-bound x) (cdr x))
(define (lower-bound x) (car x))
(define (print tar)
  (display (car tar))
  (newline)
  (display (cdr tar)))

(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))

(define (div-interval x y)
  (if (and (> (upper-bound y) 0)
           (< (lower-bound y) 0))
      (error "you can not divide a interval that spans zero!")
      (mul-interval x
                    (make-interval (/ 1.0 (upper-bound y))
                                   (/ 1.0 (lower-bound y))))))

(define x (make-interval 7 9))
(define y (make-interval -3 7))
(define inter1 (div-interval x y ))
(print inter1)

