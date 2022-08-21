#lang sicp
(define square (lambda(x) (* x x)))
#|
(define (square-list items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things) 
              (cons (square (car things))
                    answer))))
  (iter items nil))

because the procedure is iterative process,
So the new answer will be placed into the behind position
and the end it will be reversed
|#
(define (square-list items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons answer
                    (square (car things))))))
  (iter items nil))
#|
iterative has unfortunately be placed in the front of the
answer that get from the new one.
|#
(square-list (list 1 2 3 4))