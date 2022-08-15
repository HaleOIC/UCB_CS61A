#lang sicp
(define (expmod base times mod)
  (cond ((= times 0) 1)
        ((nontrivial-square-root? base mod) 0)
        ((even? times)
         (remainder (square (expmod base (/ times 2) mod))
                    mod))
        (else
         (remainder (* base (expmod base (- times 1) mod))
                    mod))))

(define (square x) (* x x))

(define (nontrivial-square-root? a n)
  (and (not (= a 1))
       (not (= a (- n 1)))
       (= 1 (remainder (square a)n))))

(define (Miller-Rabin-test tar)
  (test-iter tar (ceiling(/ tar 2))))

(define (test-iter n times)
  (cond ((= times 0) true)
        ((= (expmod(+ (random (-  n 1)) 1) (- n 1) n) 1)
         (test-iter n (- times 1)))
        (else false)))

(Miller-Rabin-test 561)
(Miller-Rabin-test 1105)
(Miller-Rabin-test 1729)
(Miller-Rabin-test 2465)
(Miller-Rabin-test 2821)
(Miller-Rabin-test 6601)

                   
        
                     
  
            