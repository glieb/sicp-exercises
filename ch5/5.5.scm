;;; Hand-simulate the factorial and Fibonacci machines, using some non-trivial
;;; input (requiring execution of at least one recursive call). Show the 
;;; contents of the stack at each significant point in the execution.

;;; This exercise will be structured in the following way. The preceding 
;;; comment describes the machine being simulated, followed by the 
;;; procedure call (written as it would be in Scheme). The uncommented lines 
;;; describe the stack at each change. Each change to the stack during the 
;;; simulation will result in its own successive line. Stacks are represented
;;; as lists.

; Factorial Machine (factorial 3)

'()
'((label fact-done))
'(3 (label fact-done))
'((label after-fact) 3 (label fact-done))
'(2 (label after-fact) 3 (label fact-done))
'((label after-fact) 3 (label fact-done))
'(3 (label fact-done)) ; val is now 2
'((label fact-done))
'() ; val is now 6

; Fibonacci Machine (fib 4)

'()
'((label fib-done))
'(4 (label fib-done))
'((label afterfib-n-1) 4 (label fib-done))
'(3 (label afterfib-n-1) 4 (label fib-done))
'((label afterfib-n-1) 3 (label afterfib-n-1) 4 (label fib-done))
'(2 (label afterfib-n-1) 3 (label afterfib-n-1) 4 (label fib-done))
'((label afterfib-n-1) 3 (label afterfib-n-1) 4 (label fib-done)) ; n restored
'(3 (label afterfib-n-1) 4 (label fib-done))
'((label afterfib-n-1) 3 (label afterfib-n-1) 4 (label fib-done))
'(1 (label afterfib-n-1) 3 (label afterfib-n-1) 4 (label fib-done))
'((label afterfib-n-1) 3 (label afterfib-n-1) 4 (label fib-done)) 
  ; val restored to 1
'(3 (label afterfib-n-1) 4 (label fib-done))
'((label afterfib-n-1) 4 (label fib-done))
'(4 (label fib-done))
'((label afterfib-n-1) 4 (label fib-done))
'(1 (label afterfib-n-1) 4 (label fib-done))
'((label afterfib-n-1) 4 (label fib-done)) ; val restored to 1
'(4 (label fib-done)) ; val is now 2
'((label fib-done)) ; n restored
'()
'((label fib-done))
'(2 (label fib-done))
'((label afterfib-n-2) 2 (label fib-done))
'(2 (label afterfib-n-2) 2 (label fib-done))
'((label afterfib-n-2) 2 (label fib-done)) ; n restored
'(2 (label fib-done))
'((label afterfib-n-2) 2 (label fib-done)) 
'(1 (label afterfib-n-2) 2 (label fib-done)) 
'((label afterfib-n-2) 2 (label fib-done)) ; val restored to 1
'(2 (label fib-done))
'((label fib-done)) ; val restored to 2
'() ; val is now 3

;;; The analysis of (fib 4) shows how each successive saved value for n must 
;;; have its own Fibonacci number calculated in a recursive tree. It is not 
;;; nearly as easy to understand as (factorial 3), but it does reveal a 
;;; pattern on close inspection.
