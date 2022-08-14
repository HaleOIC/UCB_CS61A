#lang sicp
(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

(define (sqrt-iter guess x)
  (new-if (good-enough? guess x)
          guess
          (sqrt-iter (improve guess x)
                     x)))

(define (average x y)
  (/ (+ x y) 2))


(define (good-enough? guess x)
 (< (abs (- (square guess) x)) 0.01))

(define (improve guess x)
 (average guess (/ x guess)))

(define (square x)
  (* x x))

(sqrt-iter 1 3)


;;;beacause of the cond's feature: all the clauses will be calculated 
;;;when they are transported to the procedure,so the iteration will be 
;;;called constently.
;;;No matter what situation you wanna change if you use the new-if
;;;the parametters will be calculated and the outcome is into the unstoppable loop.

              