; The `make-operation-exp` procedure:

(define (make-operation-exp exp machine labels operations)
  (let ((op (lookup-prim (operation-exp-op exp)
                         operations))
        (aprocs
         (map (lambda (e)
                (make-primitive-exp e machine labels))
              (operation-exp-operands exp))))
    (lambda ()
      (apply op (map (lambda (p) (p)) aprocs)))))

;;; The trouble arises from the fact that labels are counted as primitives just
;;; like constants and registers, when the reality is that they cannot have
;;; operations performed on them like any other primitive. The procedure being
;;; mapped onto the operands should discriminate between labels and other
;;; primitives.

(define (make-operation-exp exp machine labels operations)
  (let ((op (lookup-prim (operation-exp-op exp)
                         operations))
        (aprocs
         (map (lambda (e)
                (if (label-exp? e)
                    (error "Cannot operate on label: ASSEMBLE" e)
                    (make-primitive-exp e machine labels))
              (operation-exp-operands exp)))))
    (lambda ()
      (apply op (map (lambda (p) (p)) aprocs)))))
