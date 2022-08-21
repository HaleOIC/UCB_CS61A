#lang sicp
(define (square-tree tar)
  (define square (lambda (x) (* x x)))
  (if (pair? tar)
      (cons (square-tree (car tar))
              (square-tree (cdr tar)))
      (if (number? tar)
          (square tar)
          nil)))

(square-tree
 (list 1
       (list 2(list 3 4 )5)
       (list 6 7)))
  