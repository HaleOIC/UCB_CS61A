#lang sicp
(define (fringe tar)
  (if (pair? tar)
      (append (fringe (car tar)) (fringe (cdr tar)))
      (if (number? tar)
          (list tar)
          nil)))


(define x (list (list 1 2)(list 3 4)))
(fringe x)
(fringe (list x x))
