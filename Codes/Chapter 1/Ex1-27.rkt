#lang sicp
(define (expmod base times m)
  (cond ((= times 0) 1)
        ((even? times) (remainder (square (remainder (expmod base (/ times 2) m) m)) m))
        ((odd? times) (remainder (* base (expmod base (- times 1) m)) m)))
)
(define (square x) (* x x))

(define (test-prime tar times)
  (define (try x)
    (= (expmod x tar tar) x))
  (cond ((= times 0) true)
        ((try (+ 1 (random(- tar 1))))
         (test-prime tar (- times 1)))
        (else false)))


(test-prime 561 10)
(test-prime 1105 10)
(test-prime 1729 10)
(test-prime 2465 10)
(test-prime 2821 10)
(test-prime 6601 10)
                     