SeafoamIslandsB1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

SeafoamIslandsB1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  9, 23, SEAFOAM_ISLANDS_1F, 3
	warp_event 29, 21, SEAFOAM_ISLANDS_1F, 4
	warp_event 27, 31, SEAFOAM_ISLANDS_1F, 5

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
