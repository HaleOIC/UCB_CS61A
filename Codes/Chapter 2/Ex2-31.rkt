#lang sicp
(define (tree-map proc tree)
  (if (pair? tree)
      (cons (tree-map proc (car tree))
              (tree-map proc (cdr tree)))
      (if (number? tree)
          (proc tree)
          nil)))


(define square (lambda (x) (* x x)))
(define (square-tree tree) (tree-map square  tree))

(square-tree
 (list 1
       (list 2(list 3 4 )5)
       (list 6 7)))