CastleMountain3FA_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks


CastleMountain3FA_MapEvents:
	db 0, 0 ; filler

	db 19 ; warp events
	warp_event 11, 56, CASTLE_MOUNTAIN_2F, 4
	warp_event 11, 69, CASTLE_MOUNTAIN_3FA, 3
	
	warp_event 11, 49, CASTLE_MOUNTAIN_3FA, 2
	warp_event 11, 36, CASTLE_MOUNTAIN_3FA, 5
	
	warp_event 11, 16, CASTLE_MOUNTAIN_3FA, 4
	warp_event 11, 29, CASTLE_MOUNTAIN_3FA, 7
	
	warp_event 11,  9, CASTLE_MOUNTAIN_3FA, 6
	
	;drop holes
	warp_event  2,  7, CASTLE_MOUNTAIN_3FA, 10  ;8
	warp_event  3,  7, CASTLE_MOUNTAIN_3FA, 11 ;9
	warp_event  2, 22, CASTLE_MOUNTAIN_3FA, 0 ;10
	warp_event  3, 22, CASTLE_MOUNTAIN_3FA, 0  ; 11
	warp_event  2, 23, CASTLE_MOUNTAIN_3FA, 14 ; 12
	warp_event  3, 23, CASTLE_MOUNTAIN_3FA, 15 ; 13
	warp_event  2, 44, CASTLE_MOUNTAIN_3FA, 0 ; 14
	warp_event  3, 44, CASTLE_MOUNTAIN_3FA, 0 ; 15
	warp_event  2, 45, CASTLE_MOUNTAIN_3FA, 18 ; 16
	warp_event  3, 45, CASTLE_MOUNTAIN_3FA, 19 ; 17
	warp_event  4, 57, CASTLE_MOUNTAIN_3FA, 0 ; 18
	warp_event  5, 57, CASTLE_MOUNTAIN_3FA, 0  ; 19

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
