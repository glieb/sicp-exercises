(rule (division ?person ?division)
      (job ?person (?division . ?rest)))

(rule (big-shot ?person)
      (and (division ?person ?division)
           (not (and (supervisor ?person ?anyone)
                     (division ?anyone ?division)))))
