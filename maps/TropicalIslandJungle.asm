TropicalIslandJungle_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TropicalIslandJungle_MapEvents:
	db 0, 0 ; filler

	db 6 ; warp events
	warp_event 13, 38, TROPICAL_ISLAND, 1
	warp_event 14, 38, TROPICAL_ISLAND, 2
	warp_event 26,  5, TROPICAL_ISLAND, 3
	warp_event 26,  6, TROPICAL_ISLAND, 4
	warp_event  3, 27, TROPICAL_ISLAND, 5
	warp_event  3, 28, TROPICAL_ISLAND, 6

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
	