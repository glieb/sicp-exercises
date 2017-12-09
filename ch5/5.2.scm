;;; Verbose: data paths + controller

(data-paths
  (registers
    ((name n))
    ((name p)
     (buttons ((name p<-f) (source (operation mult)))))
    ((name c)
     (buttons ((name c<-o) (source (operation add))))))
  (operations
    ((name mult) (inputs (register p) (register c))
    ((name add) (inputs (register c) (constant 0))))
    ((name >) (inputs (register c) (register n)))))
(controller
  test-c
    (test >)
    (branch (label fact-done))
    (p<-f)
    (c<-o)
    (goto (label test-c))
  fact-done)

  ;;; Simple: controller only

(controller
  start
    (assign (reg p) (const 1))
    (assign (reg c) (const 1))
  test-c
    (test (op >) (reg c) (reg n))
    (branch (label fact-done))
    (assign p (op mult) (reg p) (reg c))
    (assign c (op add) (reg c) (const 1))
    (goto (label test-c))
  fact-done)