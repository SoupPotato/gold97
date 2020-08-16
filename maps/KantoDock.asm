KantoDock_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

KantoDock_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event 14,  0, KANTO_REGION, 44

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
