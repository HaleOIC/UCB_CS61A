#lang sicp
;;; PART 2

;;;
;;; The following test cases explore the evaluation of simple expressions.
;;;

-37
; Value: -37

(* 3 4)
; value: 12

(> 10 9.7)
; Value: true

(- ( if ( > 3 4 )
        7
        10)
   (/ 16 10))
; value: 8.4

(* (- 25 10)
   (+ 6 3))
; value: 135

+
; value: procedure: +

(define double ( lambda (x) (* 2 x)))
; value: procedure: double

double
(define c 4)
c
; value: 4

(double c)
; value: 8

c
; value: 4

(double (double (+ c 5 )))
; value: 36

(define times-2 double)
(times-2 c)
; value: 8

(define d c)
(= c d)
; value: true

(cond ((>= c 2) d)
      ((= c (- d 5)) (+ c d))
      (else (abs (- c d))))
; value: 4

