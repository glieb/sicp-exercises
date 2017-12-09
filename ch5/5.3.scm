;;; Design a machine to compute square roots using Newton's method, as 
;;; described in Section 1.1.7.

;;; The original Scheme

(define (sqrt x)
  (define (good-enough? guess)
    (< (abs (- square guess) x)) 0.001)
  (define (improve guess)
    (average guess (/ x guess)))
  (define (sqrt-iter guess)
    (if (good enough? guess)
        guess
	(sqrt-iter (improve guess))))
  (sqrt-iter 1.0))

;;; The Register Machine Language code

(controller test-g
	      (test (op good-enough?) (reg g) (reg x))
	      (branch (label sqrt-done))
	      (assign g (op improve) (reg g) (reg x))
	      (goto test-g)
	    sqrt-done)

;;; The Scheme functions 'improve' and 'good-enough?' are provided to us as
;;; primitives, which greatly simplifies the solution. Most of the work
;;; involved in defining the 'sqrt' procedure to begin with was in defining
;;; those two primitives. Once those are defined, it suffices to use a 
;;; single declarative sentence:

;;; Improve the guess until it's good enough.
