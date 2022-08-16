#lang sicp
(define (nth-root n tar)


  ; define the target function
  (define (pow x times)
    (if (= times 0) 1 (* x (pow x (- times 1)))))

  (define tarf (lambda (x)
                 (/ tar
                    (pow x (- n 1))))
                     )
  
  (define (average-damp f)
    (lambda (x) (average x (f x))))

  (define average (lambda (x y) (/ (+ x y) 2)))
  
  ; repeated procedure 
   (define (repeated f n) 
   (if (= n 1) 
       f 
       (lambda (x) (f ((repeated f (- n 1)) x))))) 


  (define (n-times-average-damp f)
    (lambda (x)
      ((repeated (average-damp f)
                 (+ (floor (log n)) 1)) x)
       ))
  ; fixed-point procedure
 
  (define tolerance 0.00001)
  (define (fixed-point f first-guess)
    (define (close-enough? v1 v2)
      (< (abs (- v1 v2)) tolerance))
    (define (try guess)
      (let ((next (f guess)))
        (if (close-enough? guess next)
            next
            (try next))))
    (try first-guess))

  ; body
  (fixed-point (n-times-average-damp tarf) 1.0)
)


(nth-root 5 1890)