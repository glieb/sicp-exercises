;;; Ben's database, for reference

; (meeting accounting (Monday 9am))
; (meeting administration (Monday 10am))
; (meeting computer (Wednesday 3pm))
; (meeting administration (Friday 1pm)
; (meeting whole-company (Wednesday 4pm))

;;; Solutions

; a
(meeting ?division (Friday ?time))

; b
(rule (meeting-time ?person ?day-and-time)
      (or (meeting whole-company ?day-and-time)
          (and (job ?person (?division . ?rest))
               (meeting ?division ?day-and-time))))

; c
(meeting-time (Hacker Alyssa P) ?day-and-time)
