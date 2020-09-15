CastleMountain1FStairs_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks


CastleMountain1FStairs_MapEvents:
	db 0, 0 ; filler

	db 5 ; warp events
	warp_event  8, 15, CASTLE_MOUNTAIN_1F_LONG_HALL, 7
	warp_event  9, 15, CASTLE_MOUNTAIN_1F_LONG_HALL, 8
	warp_event  8,  0, CASTLE_MOUNTAIN_2F, 2
	warp_event  9,  0, CASTLE_MOUNTAIN_2F, 3
	warp_event  3,  9, CASTLE_MOUNTAIN_B1F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
