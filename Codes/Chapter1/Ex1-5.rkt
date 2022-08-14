#lang sicp
(define (p) (p))
;;; It will call itself all the time and into a unstoppable loop
(define (test x y )
  (if (= x 0)
      0
      y))
(test 0 (p))
;;; when we use this combination,because the SICP using the applicative order
;;; so it will calculate all the parameter right away.
;;; but if it use the normal order then the unstoppable loop will not come into affect.