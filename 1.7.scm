;: the initial, flawed definition of sqrt
(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x)
                 x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (sqrt x)
  (sqrt-iter 1.0 x))

;;; This sqrt procedure is accurate for general cases, but runs into two
;;; separate problems when applied to the two extremes of size. Both
;;; problems are rooted in the use of the constant limit of 0.001 to judge
;;; all discrepancies of size. 

;;; The first problem, which relates to taking the square root of very
;;; small numbers, is easy to explain. When dealing with numbers in the
;;; relative size range of 0.001, their relative differences might be
;;; quite large while still being less than 0.001 apart in value. This
;;; leads to inaccurate guesses still passing the good-enough test and
;;; being passed through.

;: Example:

1 ]=> (sqrt 0.001)

;Value: .04124542607499115

;;; The second problem is a bit more complex, and has to do with the
;;; limitations of Scheme's representation of numbers. At some limit of
;;; size, which is around the order of 14 digits, applying Newton's method
;;; no longer changes the value of the guess, but the square of the guess
;;; will still not be within 0.001 of of x. 

;;; The guess is still a fairly close approximation of the square root 
;;; of x, but the test falls apart because the arbitrary value 0.001 
;;; does not reflect the precision that Scheme allocates to numbers of 
;;; this size.

;: Example
1 ]=> (sqrt 10000000000000)
;: this procedure never terminates

;;; A properly functioning sqrt procedure based on Newton's method must
;;; take into account the degree of change between the guesses over time,
;;; rather than testing the guess against an arbitrary limit. There will
;;; still be an arbitrary limit applied, but only to the change in the
;;; guess relative to its previous iteration, rather than the distance
;;; of the square of the guess from the number being rooted.

;;; Measuring degree of change instead of what we may call "distance from
;;; correctness" only works because of the reliability of Newton's method
;;; for providing a closer approximation of a square root at each
;;; iteration. If Newton's method were to fail to do so for any reason,
;;; this approach could be seen as inferior to a goalpost-oriented
;;; approach.



;: tests degree of change rather than distance from a target
(define (good-enough? guess last-guess)
  (< (abs (- 1 (/ guess last-guess))) 0.001))

(define (sqrt-iter guess last-guess x)
  (if (good-enough? guess last-guess)
      guess
      (sqrt-iter (improve guess x) guess x)))

;: Initial value for last-guess can be anything that won't satisfy
;: good-enough? on the first iteration.
(define (sqrt x)
  (sqrt-iter 1.0 2.0 x))

;: All the other procedures can stay the same.



;: testing code loaded into 1.7-test.scm

1 ]=> (sqrt 0.001)

;Value: .03162278245070105

1 ]=> (sqrt 10000000000000)

;Value: 3162277.6640104805

