1 ]=> (load "mit/ch5-regsim.scm")

;Loading "mit/ch5-regsim.scm"... done
;Value 13: (register simulator loaded)

1 ]=> (load "ch5/expt-machine-recursive.scm")

;Loading "ch5/expt-machine-recursive.scm"... done
;Value: expt-machine-recursive

1 ]=> (set-register-contents! expt-machine-recursive 'b 2)

;Value: done

1 ]=> (set-register-contents! expt-machine-recursive 'n 5)

;Value: done

1 ]=> (start expt-machine-recursive)

;Value: done

1 ]=> (get-register-contents expt-machine-recursive 'p)

;Value: 32

1 ]=> (load "ch5/expt-machine-iter.scm")

;Loading "ch5/expt-machine-iter.scm"... done
;Value: expt-machine-iter

1 ]=> (set-register-contents! expt-machine-iter 'b 2)

;Value: done

1 ]=> (set-register-contents! expt-machine-iter 'n 5)

;Value: done

1 ]=> (start expt-machine-iter)

;Value: done

1 ]=> (get-register-contents expt-machine-iter 'p)

;Value: 32
