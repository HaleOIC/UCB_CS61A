#lang sicp
(define (make-interval x y)
  (cond ((> x y) (make-interval y x))
        (else (cons x y))))
(define (lower-bound tar) (car tar))
(define (upper-bound tar) (cdr tar))
(define (print tar)
  (newline)
  (display (lower-bound tar))
  (display ",")
  (display (upper-bound tar)))

(define (sub-interval x y)
  (make-interval (- (lower-bound x) (upper-bound y))
                 (- (upper-bound x) (lower-bound y))))
(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
                 (+ (upper-bound x) (upper-bound y))))
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

(define (mid-interval tar)
  (/ (+ (lower-bound tar) (upper-bound tar)) 2.0))
(define (width tar)
  (/ (- (upper-bound tar) (lower-bound tar)) 2.0))
(define (percent tar)
  (let ((mid (mid-interval tar))
        (wid (width tar)))
    (/ wid mid)))


(define (par1 r1 r2)
  (div-interval (mul-interval r1 r2)
                (add-interval r1 r2)))
(define (par2 r1 r2)
  (let ((one (make-interval 1 1))) 
    (div-interval one
                  (add-interval (div-interval one r1)
                                (div-interval one r2)))))



;test
(define x (make-interval 5.75 6.25))
(define y (make-interval 3.8 4.2))
(define ans1 (par1 x y))
(define ans2 (par2 x y))
(percent ans1)
(percent ans2)
; so she is right 