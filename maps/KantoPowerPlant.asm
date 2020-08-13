KantoPowerPlant_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

KantoPowerPlant_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  4, 35, KANTO_REGION, 36
	warp_event  0, 10, KANTO_REGION, 36
	warp_event  5, 35, KANTO_REGION, 36

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
