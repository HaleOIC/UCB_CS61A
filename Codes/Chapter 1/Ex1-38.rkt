#lang sicp
(define k 1000)
(define (cont-frac Df Nf k)
  (define (iter x)
    (if (= x k)
        (/ (Nf x) (Df x))
        (/ (Nf x) (+ (Df x) (iter (+ x 1))))))
  (iter 1))

(define ans (+ 2
               (cont-frac (lambda (x)
                            (cond ((= (remainder (+ x 1) 3) 0)
                                   (* 2 (/ (+ x 1) 3)))
                                  (else 1)
                                  ))
                          (lambda (x)
                            1.0)
                          k)))
ans
