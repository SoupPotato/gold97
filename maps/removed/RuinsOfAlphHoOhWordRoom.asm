RuinsOfAlphHoOhWordRoom_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

RuinsOfAlphHoOhWordRoom_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event 17, 21, RUINS_OF_ALPH_INNER_CHAMBER, 2

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
