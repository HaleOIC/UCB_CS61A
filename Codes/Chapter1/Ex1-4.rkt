#lang sicp
;;; (if (> b 0) + -)
;;; this combination has returned the combination which is the primitive procedure
;;; and the combination which accepts the returned value is use the value to calculate the next step value
(define (a-plus-abs-b a b)
  ((if(> b 0) + -) a b ))