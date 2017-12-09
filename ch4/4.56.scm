; a
(and (supervisor ?name (Bitdiddle Ben))
     (address ?name ?place))

; b
(and (salary ?person ?p-salary)
     (salary (Bitdiddle Ben) ?ben-salary)
     (lisp-value > ?p-salary ?ben-salary))

; c
(and (supervisor ?person ?super)
     (not (job ?super (computer . ?anything)))
     (job ?super ?super-job))
