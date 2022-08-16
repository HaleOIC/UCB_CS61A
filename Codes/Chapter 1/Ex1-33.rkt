#lang sicp
(define (filtered-accumulate combiner null-value term a next b filter)
  (define (iter a)
    (if (> a b)
        null-value
        (if (filter a)
            (combiner (term a) (iter (next a)))
            (combiner null-value (iter (next a)) )
            )))
  (iter a))

(define (sum-prime-square a b)
  (define (prime? x)
    (define (next p)
      (+ p 1))
    (define (smallest-divisor p)
      (find-divisor p 2))
    
    (define (find-divisor tar guess)
      (if (divides? tar guess)
          guess
          (find-divisor tar (next guess))))
    (define (divides? y x)
      (= (remainder y x) 0))
    (= (smallest-divisor x) x))
  
  (filtered-accumulate +
                       0
                       (lambda (x)
                         (* x x))
                       a
                       (lambda (x) (+ x 1))
                       b
                       (lambda (x)
                         (prime? x))
                       ))

(define (pro-pos-int tar)
  (define (gcd x y)
    (if (< x y) (gcd y x))
    (if (= y 0)
        x
        (gcd y (remainder x y))))
        
    
  (filtered-accumulate *
                       1
                       (lambda (x) x)
                       1
                       (lambda (x) (+ x 1))
                       tar
                       (lambda (x)
                         (= (gcd x tar) 1))
                       ))



;test
(sum-prime-square 2 7)
(pro-pos-int 57)