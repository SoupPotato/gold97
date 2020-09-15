CastleMountainB1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks


CastleMountainB1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event 25,  3, CASTLE_MOUNTAIN_1F_STAIRS, 5
	warp_event  4, 27, CASTLE_MOUNTAIN_3FB, 0
	warp_event 15,  7, CASTLE_MOUNTAIN_3FB, 0

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
