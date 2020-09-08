KikaiCaldera2F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks


KikaiCaldera2F_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  5, 15, KIKAI_VILLAGE, 6
	warp_event 15, 13, KIKAI_VILLAGE, 7
	warp_event  3,  3, KIKAI_CALDERA_1F, 2
	warp_event 17,  3, KIKAI_CALDERA_3F, 2

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
