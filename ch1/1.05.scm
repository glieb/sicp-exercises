(define (p) (p))
(define (test x y)
  (if (= x 0)
      0
      y))

(test 0 (p))

;;; p is a procedure that enters an infinite recursive loop as soon as it
;;; it is called. The test expression determines whether (p) will ever
;;; have to be called inside a procedure that will discard it anyway. In
;;; applicative order evaluation, which Scheme uses, the procedure will
;;; will run indefinitely. This is because applicative order evaluates
;;; the procedure arguments as soon as the procedure is called. In normal
;;; order evaluation, however, the procedure will terminate and return 0.
;;; This is because normal order evaluation, or lazy evaluation, does not
;;; evaluate procedure arguments until or unless they are needed. However,

(define (p) (p))
(define (test x y)
  (if (= x 0)
      0
      (y)))

(test 0 p)

;;; This procedure will terminate in applicative order evaluation or normal
;;; order evaluation. This is because the test expression no longer uses
;;; the evaluation of p, or (p), as a function argument. p is only
;;; evaluated syntactically in the alternative portion of the if statement,
;;; which is never triggered.
