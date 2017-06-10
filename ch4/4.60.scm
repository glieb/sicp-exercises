;;; The duplicates occur because the rule for lives-near is not
;;; very sophisticated, and has no reason in its simple code
;;; to exclude logical duplicates. Both of each pair of duplicates
;;; satisfy the rule as it is expressed.

;;; If there is some non-arbitrary way that the names can be
;;; organized, we can add some directionality to the query with
;;; the lisp-value special form. For example, imagining there is
;;; some measuring procedure that fits our criteria, we can define
;;; a new rule.

(rule (prior ?person-1 ?person-2)
      (lisp-value some-measuring-procedure ?person-1 ?person-2))

;;; As long as the measuring procedure always returns true for
;;; one combination of person-1 and person-2, and never both, we
;;; can use it as part of our rule and remove any possibility of
;;; duplicates as such.

(rule (unique-lives-near ?person-1 ?person-2)
      (and (lives-near ?person-1 ?person-2)
           (prior ?person-1 ?person-2)))

;;; The problem of applying some-measuring-procedure to two copies
;;; of the same name is removed, as the first part of the and
;;; expression filters out any name duplicates as part of its
;;; application of lives-near.

;;; However, this new rule is vastly inferior to its simpler
;;; counterpart for the majority of applications, as a large number
;;; of results for simple queries such as

(unique-lives-near ?person (Hacker Alyssa P))

;;; will be ommitted. 
