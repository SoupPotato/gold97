	const_def 2 ; object constants

TekuPortPassage_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks


	
TekuPortPassage_MapEvents:
	db 0, 0 ; filler

	db 5 ; warp events
	warp_event 13, 14, ECRUTEAK_CITY, 1
	warp_event 14, 14, ECRUTEAK_CITY, 2
	warp_event 14, 16, TEKU_PORT_PASSAGE, 4
	warp_event 3, 2, TEKU_PORT_PASSAGE, 3
	warp_event 3, 14, TEKU_PORT, 1

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events	
