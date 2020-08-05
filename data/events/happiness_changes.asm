HappinessChanges:
; entries correspond to HAPPINESS_* constants
; change if happiness < 100, change if happiness < 200, change otherwise
	db  +9,  +7,  +6 ; Gained a level
	db  +9,  +7,  +6 ; Vitamin
	db  +5,  +5,  +4 ; X Item
	db  +7,  +6,  +5 ; Battled a Gym Leader
	db  +5,  +5,  +4 ; Learned a move
	db  -5,  -5,  -5 ; Lost to an enemy
	db  -9,  -9, -14 ; Fainted due to poison
	db  -9,  -9, -14 ; Lost to a much stronger enemy
	db  +5,  +5,  +5 ; Haircut (Y1)
	db  +7,  +7,  +5 ; Haircut (Y2)
	db  +9,  +9,  +6 ; Haircut (Y3)
	db  +5,  +5,  +5 ; Haircut (O1)
	db  +7,  +7,  +5 ; Haircut (O2)
	db +14, +14,  +8 ; Haircut (O3)
	db  -9,  -9, -14 ; Used Heal Powder or Energypowder (bitter)
	db -14, -14, -19 ; Used Energy Root (bitter)
	db -19, -19, -24 ; Used Revival Herb (bitter)
	db  +7,  +7,  +5 ; Grooming
	db +14, +10,  +8 ; Gained a level in the place where it was caught
