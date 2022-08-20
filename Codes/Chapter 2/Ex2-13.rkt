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

(define (mid-interval tar)
  (/ (+ (lower-bound tar) (upper-bound tar)) 2.0))
(define (width tar)
  (/ (- (upper-bound tar) (lower-bound tar)) 2.0))
(define (percent tar)
  (let ((mid (mid-interval tar))
        (wid (width tar)))
    (/ wid mid)))
(define (make-interval-center c per)
  (make-interval (- c (* c per))
                 (+ c (* c per))))

(define (times inter1 inter2)
  (make-interval-center (* (mid-interval inter1)
                           (mid-interval inter2)
                           (+ 1 (* (percent inter1)
                                   (percent inter2))))
                        (/ (+ (percent inter1)
                           (percent inter2))
                           (+ 1 (* (percent inter1)
                                   (percent inter2))))))




;test
(define x (make-interval 7 9))
(define y (make-interval-center 5 0.4))
(print y)
(define ans (times x y))
(print ans)
    