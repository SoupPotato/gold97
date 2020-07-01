	const_def 2 ; object constants


Route14_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Route14_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  9,  7, VICTORY_ROAD_GATE, 1
	warp_event 11,  7, OLIVINE_PORT, 1

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
