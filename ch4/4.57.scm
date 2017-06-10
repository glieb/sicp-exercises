;;; Part 1: Rule Definition

(rule (can-replace ?person-1 ?person-2)
      (and (or (same (job ?person-1) (job ?person-2))
               (can-do-job (job ?person-1) (job ?person-2)))
           (not (same ?person-1 ?person-2))))

;;; Part 2: Queries

; a
(can-replace ?person (Fect Cy D))

; b
(and (can-replace ?person-1 ?person-2)
     (lisp-value < (salary ?person-1) (salary ?person-2))
     (salary ?person-1)
     (salary ?person-2))
