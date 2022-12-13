#lang sicp
(define (make-cycle x)
    (set-cdr! (last-pair x) x)
    x)