(define (a-plus-abs-b a b)
  ((if (> b 0) + -)) a b)

;;; The procedure a-plus-abs-b adds the absolute value of b to a. Instead
;;; of taking the absolute value of b and adding it directly, ie:

(define (a-plus-abs-b a b)
  (+ (a (abs b))))

;;; The procedure tests b to see if it is greater than zero. If b is 
;;; greater than zero, a and b can simply be added. If b is less than 
;;; zero, b can simply be subtracted from a. The behavior of the two
;;; procedures is therefore equivalent.

;;; This behavior is possible because of scheme's treatment of procedures
;;; as first class objects.

(if (> b 0) + -)

;;; This if expression returns a procedure object to be used as the
;;; operator of the outer expression. The resulting possibilities are

(+ a b)

;;; or

(- a b)

;;; depending on the value of b.
