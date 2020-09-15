CastleMountain1FCave_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks


CastleMountain1FCave_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  8, 17, CASTLE_MOUNTAIN_1F_LONG_HALL, 9
	warp_event 15,  5, CASTLE_MOUNTAIN_2F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
