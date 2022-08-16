#lang sicp
;;;(gcd 206 40)
;;;(gcd 40 6)
;;;(gcd 6 4)
;;;(gcd 4 2)
;;;(gcd 2 0)
;;;2
;;;the total times for using the remainder is five.
(define (gcd a b)
    (if (= b 0)
        a
        (gcd b (remainder a b))))
