#lang sicp
(define (make-accumulator value)
    (lambda (add-value)
        (set! value (+ value add-value))
        value))