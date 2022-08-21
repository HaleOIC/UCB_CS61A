#lang sicp
(define (same-parity p . w)
  (define (recur tar)
    (if (null? tar)
        nil
        (if (even? (abs (- (car tar) p)))
            (cons (car tar) (recur (cdr tar) ))
            (recur (cdr tar)))))
  (cons p (recur w)))

(same-parity 1 2 3 4 5 6 7 8)
(same-parity 2 3 4 5 6 7)

; recursive process is used in forward order
; while iterative process is used in r
everse order