TropicalIsland_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TropicalIsland_MapEvents:
	db 0, 0 ; filler

	db 6 ; warp events
	warp_event 41, 37, TROPICAL_ISLAND_JUNGLE, 1
	warp_event 42, 37, TROPICAL_ISLAND_JUNGLE, 2
	warp_event 45, 21, TROPICAL_ISLAND_JUNGLE, 3
	warp_event 45, 22, TROPICAL_ISLAND_JUNGLE, 4
	warp_event 28, 43, TROPICAL_ISLAND_JUNGLE, 5
	warp_event 28, 44, TROPICAL_ISLAND_JUNGLE, 6

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
	