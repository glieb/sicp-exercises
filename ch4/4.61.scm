;;; next-to rule as written, for context

(rule (?x next-to ?y in (?x ?y . ?u)))
(rule (?x next-to ?y in (?v . ?z))
      (?x next-to ?y in ?z))


; first query
(?x next-to ?y in (1 (2 3) 4))

; result
(1 next-to (2 3) in (1 (2 3) 4))
((2 3) next-to 4 in (1 (2 3) 4))


; second query
(?x next-to ?y in (2 1 3 1))

; result
(2 next-to 1 in (2 1 3 1))
(3 next-to 1 in (2 1 3 1))


;;; The next-to rule would be better written as "before", as that is
;;; what the logic actually represents. The rules, as stated, always
;;; match ?x before ?y and never ?y before ?x. Perhaps a better way
;;; of writing the rule would be something like:

(rule (?x next-to ?y in (?x ?y . ?u)))
(rule (?x next-to ?y in (?y ?x . ?u)))
(rule (?x next-to ?y in (?v . ?z))
      (?x next-to ?y in ?z))
