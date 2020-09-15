CastleMountain1FDanceHall_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks


CastleMountain1FDanceHall_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  1,  8, CASTLE_MOUNTAIN_1F, 3
	warp_event  1,  9, CASTLE_MOUNTAIN_1F, 4
	warp_event  6,  1, CASTLE_MOUNTAIN_1F_LONG_HALL, 3
	warp_event  7,  1, CASTLE_MOUNTAIN_1F_LONG_HALL, 4

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
