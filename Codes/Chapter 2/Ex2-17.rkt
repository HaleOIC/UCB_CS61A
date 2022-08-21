#lang sicp
(define (last-pair tar)
  (if (null? (cdr tar))
      (car tar)
      (last-pair (cdr tar))))
(last-pair (list 23 72 149 34))