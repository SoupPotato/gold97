DragonsDen1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

DragonsDen1F_MapEvents:
	db 0, 0 ; filler

	db 8 ; warp events
	warp_event  5, 33, BLACKTHORN_CITY, 8
	warp_event  3, 31, DRAGONS_DEN_1F, 3
	warp_event  5, 21, DRAGONS_DEN_1F, 2
	warp_event  3, 23, ICE_PATH_B3F, 1
	warp_event  3, 11, ICE_PATH_B3F, 4
	warp_event  3, 13, DRAGONS_DEN_1F, 7
	warp_event  3,  3, DRAGONS_DEN_1F, 6
	warp_event  7,  3, CINNABAR_ISLAND, 2  


	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
