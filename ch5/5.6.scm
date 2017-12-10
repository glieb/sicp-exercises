;;; Ben Bitdiddle observes that the Fibonacci machine's controller sequence
;;; has an extra 'save' and an extra 'restore', which can be removed to 
;;; make a faster machine. What are these instructions?

;;; In the 'afterfib-n-1' block, the 'continue' register is restored and 
;;; then saved again without modification. This is not only inefficient, 
;;; but it also complicates the analysis of the stack from the previous 
;;; exercise. The analysis without these redundant expressions is shown 
;;; below.

'()
'((label fib-done))
'(4 (label fib-done))
'((label afterfib-n-1) 4 (label fib-done))
'(3 (label afterfib-n-1) 4 (label fib-done))
'((label afterfib-n-1) 3 (label afterfib-n-1) 4 (label fib-done))
'(2 (label afterfib-n-1) 3 (label afterfib-n-1) 4 (label fib-done))
'((label afterfib-n-1) 3 (label afterfib-n-1) 4 (label fib-done)) ; n restored
'(1 (label afterfib-n-1) 3 (label afterfib-n-1) 4 (label fib-done))
'((label afterfib-n-1) 3 (label afterfib-n-1) 4 (label fib-done)) 
  ; val restored to 1
'(3 (label afterfib-n-1) 4 (label fib-done))
'((label afterfib-n-1) 4 (label fib-done)) ; n restored
'(1 (label afterfib-n-1) 4 (label fib-done))
'((label afterfib-n-1) 4 (label fib-done)) ; val restored to 1
'(4 (label fib-done)) ; val is now 2
'((label fib-done)) ; n restored
'(2 (label fib-done))
'((label afterfib-n-2) 2 (label fib-done))
'(2 (label afterfib-n-2) 2 (label fib-done))
'((label afterfib-n-2) 2 (label fib-done)) ; n restored
'(1 (label afterfib-n-2) 2 (label fib-done)) 
'((label afterfib-n-2) 2 (label fib-done)) ; val restored to 1
'(2 (label fib-done))
'((label fib-done)) ; val restored to 2
'() ; val is now 3

;;; The inner workings of the Fibonacci machine are still not easy to grasp,
;;; but the absence of contracting and immediately re-expanding stacks makes 
;;; it slightly easier to reason about.
