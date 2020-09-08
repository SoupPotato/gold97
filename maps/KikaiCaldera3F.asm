KikaiCaldera3F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks


KikaiCaldera3F_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  5,  7, KIKAI_VILLAGE, 8
	warp_event  5,  1, KIKAI_CALDERA_2F, 4

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
