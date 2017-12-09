;;; Database for reference

(son Adam Cain)
(son Cain Enoch)
(son Enoch Irad)
(son Irad Mehujael)
(son Mehujael Methushael)
(son Methushael Lamech)
(wife Lamech Ada)
(son Ada Jabal)
(son Ada Jubal)


;;; Rules

(rule (grandson ?s ?g)
      (and (son ?s ?f)
           (son ?f ?g)))

(rule (son ?s ?m)
      (and (son ?s ?w)
           (wife ?w ?m)))


;;; May decide to test these rules in Q-Eval later, but they are
;;; fairly straightforward.
