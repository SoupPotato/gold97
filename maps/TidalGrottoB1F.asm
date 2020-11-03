	const_def 2 ; object constants

TidalGrottoB1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TidalGrottoB1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  2, 31, AMPARE_CAVERN_B1F, 3
	warp_event  3, 21, AMPARE_CAVERN_1F, 2
	warp_event 29,  5, AMPARE_CAVERN_B1F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
