#lang sicp
(define (set-to-wow! x)
    (set-car! (car x) 'wow!)
    x)