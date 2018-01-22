;;; Specify register machines that implement each of the following procedures.

; a. Recursive exponentiation:

(define (expt b n)
  (if (= n 0)
      1
      (* b (expt b (- n 1)))))

;;; SOLUTION

(controller
    (assign continue (label exp-done))
    (assign p (const 1))
  exp-loop
    (test (op =) (reg n) (const 0))
    (branch (label continue))
    (save continue)
    (assign n (op -) (reg n) (const 1))
    (assign continue (label after-exp))
    (goto (label exp-loop))
  after-exp
    (restore continue)
    (assign p (op *) (reg b) (reg p))
    (goto (reg continue))
  exp-done)

; b. Iterative exponentiation:

(define (expt b n)
  (define (expt-iter counter product)
    (if (= counter 0)
        product
	(expt-iter (- counter 1)
		   (* b product))))
  (expt-iter n 1))

;;; SOLUTION

(controller
    (assign p (const 1))
  exp-loop
    (test (op =) (reg n) (const 0))
    (branch (label exp-done))
    (assign n (op -) (reg n) (const 1))
    (assign p (op *) (reg b) (reg p))
    (goto (label exp-loop))
  exp-done)

;;; As might have been predicted from a thorough reading of Chapter 1, the
;;; iterative register machine is much simpler and requires less memory.

;;; The recursive solution saves a number of 'after-exp' labels in the stack
;;; equal to 'n', while the iterative solution simply allows the register 
;;; itself to function as a form of stack, without all the need for saving 
;;; labels and redirecting control.

;;; Interpreter-friendly versions:

(define expt-machine-recursive
  (make-machine
    '(b n p continue)
    (list (list '= =) (list '- -) (list '* *))
    '(begin
        (assign continue (label exp-done))
        (assign p (const 1))
      exp-loop
        (test (op =) (reg n) (const 0))
        (branch (label after-exp))
        (save continue)
        (assign n (op -) (reg n) (const 1))
        (assign continue (label after-exp))
        (goto (label exp-loop))	
      after-exp
        (restore continue)
        (assign p (op *) (reg b) (reg p))
        (goto (reg continue))
      exp-done)))

(define expt-machine-iter
  (make-machine
    '(b n p)
    (list (list '= =) (list '- -) (list '* *))
    '(begin
      (assign p (const 1))
    exp-loop
      (test (op =) (reg n) (const 0))
      (branch (label exp-done))
      (assign n (op -) (reg n) (const 1))
      (assign p (op *) (reg b) (reg p))
      (goto (label exp-loop))
    exp-done)))
