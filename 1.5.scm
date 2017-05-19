(define (p) (p))
(define (test x y)
  (if (= x 0)
      0
      y))

(test 0 (p))

;;; (p) is a procedure that enters an infinite recursive loop as soon
;;; as it is called. The test procedure determines whether (p) will ever
;;; have to be called inside a function that will discard it anyway.
;;; In normal order evaluation, where all of the expressions are fully
;;; expanded by their substitutions before any evaluation occurs, the
;;; test will result in an infinite loop due to the attempted substitution
;;; of (p) with (p), which will go on endlessly. In applicative order
;;; evaluation, however, the y value of test will never be called as long
;;; as the predicate (= x 0) returns true, and the procedure will simply
;;; resolve to 0.
