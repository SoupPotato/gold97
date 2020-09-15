CastleMountain2F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks


CastleMountain2F_MapEvents:
	db 0, 0 ; filler

	db 7 ; warp events
	warp_event  5, 13, CASTLE_MOUNTAIN_1F_CAVE, 2
	warp_event 14, 19, CASTLE_MOUNTAIN_1F_STAIRS, 3
	warp_event 15, 19, CASTLE_MOUNTAIN_1F_STAIRS, 4
	warp_event  6,  1, CASTLE_MOUNTAIN_3FA, 1
	warp_event  7,  1, CASTLE_MOUNTAIN_3FA, 1
	warp_event 22,  1, CASTLE_MOUNTAIN_3FB, 1
	warp_event 23,  1, CASTLE_MOUNTAIN_3FB, 1

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
