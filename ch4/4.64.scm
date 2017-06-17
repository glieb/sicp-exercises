;;; Rule for reference

(rule (outranked-by ?staff-person ?boss)
      (or (supervisor ?staff-person ?boss)
          (and (outranked-by ?middle-manager ?boss)
               (supervisor ?staff-person ?middle-manager))))

;;; Query for reference

(outranked-by (Bitdiddle Ben) ?who)

;;; Explanation

;;; The evaluator first checks to see if there are any outranked-by assertions
;;; in the database that will simply satisfy this rule. Unfortunately, there
;;; are none.

;;; The unifier will then determine that the query unifies with the conclusion
;;; of the outranked-by rule. 

(outranked-by ?staff-person ?boss)

;;; In attempting to unify the rule with the query, the variable ?staff-person
;;; is bound to the datum (Bitdiddle Ben), and the variable ?boss with the variable
;;; ?who. We now have a new frame containing those two bindings, relative to which
;;; we can evaluate the body of the rule.

(or (supervisor ?staff-person ?boss)
    (and (outranked-by ?middle-manager ?boss)
         (supervisor ?staff-person ?middle-manager)))

;;; The first part of the or query returns a frame where ?boss is bound to the datum
;;; (Warbucks Oliver), but the evaluator continues to evaluate the and query that
;;; follows the first query. The and query begins by evaluating its first
;;; constituent query.

(outranked-by ?middle-manager ?boss)

;;; The evaluator again checks for outranked-by assertions in the database. Again,
;;; it doesn't find any. However, it will still find that the query matches the
;;; conclusion of the rule, so it will again evaluate the rule body, this time with
;;; ?staff-person bound to the ?middle-manager from the preceding rule body query.

(or (supervisor ?staff-person ?boss)
    (and (outranked-by ?middle-manager ?boss)
         (supervisor ?staff-person ?middle-manager)))

;;; The evaluator will find even more supervisors in the first part of the query
;;; this time around than before, because anyone who is listed in the database as
;;; supervising anyone will sastisfy the pattern matcher, rather than just the one
;;; employee listed as supervising Ben Bitdiddle. However, the second part of the or
;;; continues to evaluate as normal, and the first part of the query continues to
;;; expand to the full rule body of outranked-by.

;;; This second return to the original rule body with no new bindings is final
;;; proof that the evaluator will never finish evaulating this query.

;;; The reason why this rule will tend to fall into infinite loops is predictably
;;; due to the one change made to it from the original: the reordering of the and
;;; query at the end. The rule should look something like this.

(rule (outranked-by ?staff-person ?boss)
      (or (supervisor ?staff-person ?boss)
          (and (supervisor ?staff-person ?middle-manager)
               (outranked-by ?middle-manager ?boss))))

;;; With the query written this way, the evaluator will never recursively try to
;;; evaluate outranked-by without a binding for ?middle-manager. If the evaluator
;;; fails to find a binding for ?middle-manager, it will fail before it reaches that
;;; point. 

(outranked-by ?middle-manager ?boss)

;;; Becomes a much more meaningful query when ?middle-manager contains a binding,
;;; and it is trivial to see how it reduces to either finding a binding for ?boss
;;; or resulting in failure.
