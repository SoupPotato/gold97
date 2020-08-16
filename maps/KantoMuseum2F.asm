KantoMuseum2F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

KantoMuseum2F_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  7,  7, KANTO_MUSEUM_1F, 5

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
