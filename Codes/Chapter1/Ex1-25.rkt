#lang sicp
(define (fast-expt b n)
 (cond ((= n 0) 1)
 ((even? n) (square (fast-expt b (/ n 2))))
 (else (* b (fast-expt b (- n 1))))))

(define (square x) (* x x))

(define (expmod base exp m)
 (remainder (fast-expt base exp) m))

(expmod 2 5 7)

;;;althought the answer is right. but if using it into the fast prime tester
;;;the outcome itself is so large so the time limit will not be confronted.


