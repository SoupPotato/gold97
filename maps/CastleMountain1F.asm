CastleMountain1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks


CastleMountain1F_MapEvents:
	db 0, 0 ; filler

	db 8 ; warp events
	warp_event 14, 23, IE_TOWN, 6
	warp_event 15, 23, IE_TOWN, 7
	warp_event 28,  8, CASTLE_MOUNTAIN_1F_DANCE_HALL, 1
	warp_event 28,  9, CASTLE_MOUNTAIN_1F_DANCE_HALL, 2
	warp_event  1,  8, CASTLE_MOUNTAIN_1F_DINING_HALL, 1
	warp_event  1,  9, CASTLE_MOUNTAIN_1F_DINING_HALL, 2
	warp_event 14,  1, CASTLE_MOUNTAIN_1F_LONG_HALL, 1
	warp_event 15,  1, CASTLE_MOUNTAIN_1F_LONG_HALL, 2

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
