KantoMuseum1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

KantoMuseum1F_MapEvents:
	db 0, 0 ; filler

	db 5 ; warp events
	warp_event 10,  7, KANTO_REGION, 39
	warp_event 11,  7, KANTO_REGION, 39
	warp_event 16,  7, KANTO_REGION, 40
	warp_event 17,  7, KANTO_REGION, 40
	warp_event  7,  7, KANTO_MUSEUM_2F,1

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
