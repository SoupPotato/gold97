CastleMountain1FDiningHall_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks


CastleMountain1FDiningHall_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event 14,  8, CASTLE_MOUNTAIN_1F, 5
	warp_event 14,  9, CASTLE_MOUNTAIN_1F, 6
	warp_event  8,  1, CASTLE_MOUNTAIN_1F_LONG_HALL, 5
	warp_event  9,  1, CASTLE_MOUNTAIN_1F_LONG_HALL, 6

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
