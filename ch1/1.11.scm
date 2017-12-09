;: f(n) = n                          if n < 3
;: f(n) = f(n-1) + 2f(n-2) + 3f(n-3) if n >= 3

;: recursive
(define (f n)
  (if (< n 3)
      n
      (+ (f (- n 1))
         (* 2 (f (- n 2)))
         (* 3 (f (- n 3))))))

;: iterative
(define (f n) 
  (define (iter a b c count) 
     (if (= count 0) 
         a 
         (iter b c (+ c (* 2 b) (* 3 a)) (- count 1))))
  (iter 0 1 2 n))

;;; The iterative solution exploits the fact that the recursive
;;; definition relies on the three previous values of f to calculate
;;; the newest value. In the iter procedure, the three previous
;;; results are stored as arguments in a structure reminiscent of
;;; an assembly line.
