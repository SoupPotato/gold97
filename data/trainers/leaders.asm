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
	db OKERA
	db CLAIR
	db LORELEI
	db AGATHA
	db KOGA
	db GIOVANNI_E4
	db CHAMPION
; fallthrough
KantoGymLeaders:
	db LT_SURGE
	db RED
	db BLUE
	db POKEMON_PROF
	db -1
