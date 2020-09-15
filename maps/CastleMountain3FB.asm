CastleMountain3FB_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks


CastleMountain3FB_MapEvents:
	db 0, 0 ; filler

	db 10 ; warp events
	warp_event 11, 56, CASTLE_MOUNTAIN_2F, 6
	warp_event 11, 69, CASTLE_MOUNTAIN_3FB, 3
	
	warp_event 11, 49, CASTLE_MOUNTAIN_3FB, 2
	warp_event 11, 36, CASTLE_MOUNTAIN_3FB, 5
	
	warp_event 11, 16, CASTLE_MOUNTAIN_3FB, 4
	warp_event 11, 29, CASTLE_MOUNTAIN_3FB, 7
	
	warp_event 11,  9, CASTLE_MOUNTAIN_3FB, 6
	
	warp_event 10,  4, CASTLE_MOUNTAIN_B1F, 2
	warp_event  9,  4, CASTLE_MOUNTAIN_B1F, 2
	warp_event  9,  3, CASTLE_MOUNTAIN_B1F, 3

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
