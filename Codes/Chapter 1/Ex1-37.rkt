#lang sicp
(define k 13)
; after testing, we can find that when k equals to 13
; the first four characters will be confirmed.


; recurisive process as follows
#|
(define (cont-frac Df Nf k)
  (define (iter x)
    (if (= x k)
        (/ (Nf x) (Df x))
        (/ (Nf x) (+ (Df x) (iter (+ x 1))))))
  (iter 1))
|#
; iterative process as follows
(define (cont-frac Df Nf k)
  (define (iter x result)
    (if (= x 0)
        result
        (iter (- x 1)
              (/ (Nf x) (+ (Df x) result)))))
  (iter k 0))
(cont-frac (lambda (i) 1.0)
           (lambda (i) 1.0)
           k)