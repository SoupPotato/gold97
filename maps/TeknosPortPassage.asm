	const_def 2 ; object constants

TeknosPortPassage_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks


	
TeknosPortPassage_MapEvents:
	db 0, 0 ; filler

	db 5 ; warp events
	warp_event 13, 14, TEKNOS_CITY, 1
	warp_event 14, 14, TEKNOS_CITY, 2
	warp_event 14, 16, TEKNOS_PORT_PASSAGE, 4
	warp_event 3, 2, TEKNOS_PORT_PASSAGE, 3
	warp_event 3, 14, TEKNOS_PORT, 1

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events	
