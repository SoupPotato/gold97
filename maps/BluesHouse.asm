	const_def 2 ; object constants

BluesHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

BluesHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, KANTO_REGION, 19
	warp_event  5,  7, KANTO_REGION, 19

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
