#lang sicp
(car ''abracadabra)

#|
because the (car ''something) will be interpreted as
(car (quote (quote something)))
the first thing is queto
so the interpreter will show the message queto.
|#