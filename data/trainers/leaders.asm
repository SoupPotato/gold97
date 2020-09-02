; These lists determine the battle music and victory music, and whether to
; award HAPPINESS_GYMBATTLE for winning.

; Note: CHAMPION and RED are unused for battle music checks, since they are
; accounted for prior to the list check.

GymLeaders:
	db FALKNER
	db WHITNEY
	db BUGSY
	db MORTY
	db PRYCE
	db JASMINE
	db CHUCK
	db CLAIR
	db WILL
	db BRUNO
	db KAREN
	db KOGA
	db CHAMPION
; fallthrough
KantoGymLeaders:
	db MISTY
	db LT_SURGE
	db ERIKA
	db JANINE
	db BLAINE
	db RED
	db -1
