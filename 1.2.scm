;;; 5 + 4 + (2 - (3 - (6 + 4/5)))
;;; /
;;; 3(6 - 2)(2 - 7)

(/ (+ 5 4 (- 2 (- 3 (+ 4 (/ 4 5)))))
   (* 3 (- 6 2) (- 2 7)))

;Value: -16/75
