SeafoamIslands1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

SeafoamIslands1F_MapEvents:
	db 0, 0 ; filler

	db 5 ; warp events
	warp_event 4, 15, KANTO_REGION, 37
	warp_event 26, 15, KANTO_REGION, 38
	warp_event 5, 5, SEAFOAM_ISLANDS_B1F, 1
	warp_event 25, 3, SEAFOAM_ISLANDS_B1F, 2
	warp_event 23, 13, SEAFOAM_ISLANDS_B1F, 3

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
