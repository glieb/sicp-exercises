; Alyssa's new-if procedure
(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

; our test of Alyssa's new-if procedure
(define (sqrt-iter guess x)
  (new-if (good-enough? guess x)
          guess
          (sqrt-iter (improve guess x)
                     x)))

;;; Taking square roots with this new sqrt-iter will fail because it does
;;; not properly take advantage of the reasons why Lisp can use recursion.
;;; Attempting to interpret the new-if on the inside of sqrt-iter will
;;; attempt to call the sqrt-iter on the tail end, even if the predicate
;;; does not resolve to a true value. The internal sqrt-iter will then
;;; call its own internal new-if, and the process will repeat ad infinitum.
;;; This happens because all procedure arguments are evaluated before
;;; being substituted into the procedure body when a procedure is called.
;;; The if special form works because it is interpreted lazily, and does
;;; not call its "arguments" unless they are needed. Trying to recreate
;;; the if special form as a procedure is successful except in cases that
;;; need to exploit its lazy nature, such as when creating recursive
;;; procedures.
