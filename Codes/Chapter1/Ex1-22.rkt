#lang sicp
(define (prime? x)
  (= (minest-divisor x) x))

(define (minest-divisor x)
  (find-divisor x 2))

(define (find-divisor tar base)
  (define (divides? x y)
    (= (remainder y x) 0))
  (define (square x) (* x x))
  (cond ((> (square base) tar) tar)
        ((divides? base tar) base)
        (else (find-divisor tar (+ base 1)))))

(define (media x sum count startime)
  (display x)
  (newline)
  (search-iter (+ x 1) (+ sum 1) count startime))

(define (search-iter base sum count startime)
  (cond ((not (< sum count)) (print-time startime))
        ((prime? base)
          (media base sum count startime))
        (else (search-iter (+ base 1) sum count startime)) ))

(define (calc-time n)
  (display "...")
  (newline)
  (search-iter n 0 3 runtime))

 (define (print-time startime)
   (define total (abs (- (startime) (runtime) )))
   (newline)
   (display total)
   (newline))
  

(calc-time 10)
(calc-time 1000000)








#|
(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))
(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime (- (runtime) start-time))))
(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

(define (find-smallest-divisor x)
  (find-divisor x 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (square x) (* x x))

(define (divides? x y)
  (= (remainder y x) 0))

(define (prime? x)
  (= (find-smallest-divisor x) x))

(define (search-for-primes range)
 |#