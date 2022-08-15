#lang sicp
(define (expmod base exp m)
 (cond ((= exp 0) 1)
       ((even? exp)
        (remainder (* (expmod base (/ exp 2) m)
                      (expmod base (/ exp 2) m))
                   m))
       (else
        (remainder (* base (expmod base (- exp 1) m))
                   m))))



;;; this is easy to find that
;;; because the program uses the implicative process so the (expmod base (/exp 2)m)
;;; will be calculated twice in one process.
;;; when you calculate the procedure. the answer will be changed.