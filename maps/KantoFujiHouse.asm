KantoFujiHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

KantoFujiHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 4, 7, KANTO_REGION, 43
	warp_event 5, 7, KANTO_REGION, 43

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
