; Register machine code in question:

start
  (goto (label here))
here
  (assign a (const 3))
  (goto (label there))
here
  (assign a (const 4))
(goto (label there))
  there

;;; Because labels are looked up using the `assoc` function, only the first
;;; `here` label in the list of labels is relevant. The second `here` label
;;; will never be reached, as no `goto` can concievably point to it and the
;;; preceding instruction is a `goto`. The value of `a` is 3.

; Modified `extract-labels`:

(define (extract-labels text receive)
	(if (null? text)
			(receive '() '())
			(extract-labels
				(cdr text)
				(lambda (insts labels)
					(let ((next-inst (car text)))
						(if (symbol? next-inst)
								(if (assoc next-inst labels)
										(error "Repeated label: ASSEMBLE"
													 next-inst)
										(receive insts
												 		 (cons (make-label-entry next-inst
																							       insts)
															 		 labels)))
								(receive (cons (make-instruction next-inst)
															 insts)
												 labels)))))))

;;; A simple `if` statement solves the problem.
