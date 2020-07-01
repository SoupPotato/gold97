	const_def 2 ; object constants

ManiasHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks



ManiasHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, CIANWOOD_CITY, 1
	warp_event  3,  7, CIANWOOD_CITY, 1

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
