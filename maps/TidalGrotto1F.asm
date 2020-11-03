	const_def 2 ; object constants

TidalGrotto1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks


TidalGrotto1F_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  3,  2, ROUTE_109, 1
	warp_event 19, 25, AMPARE_CAVERN_B1F, 2

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
