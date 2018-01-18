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
