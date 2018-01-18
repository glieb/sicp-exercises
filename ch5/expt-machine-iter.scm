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
