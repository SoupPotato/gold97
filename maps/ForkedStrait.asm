ForkedStrait_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

ForkedStrait_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  9, 41,  FORKED_STRAIT_GATE, 1
	warp_event 10, 41,  FORKED_STRAIT_GATE, 2
	warp_event  8, 41,  FORKED_STRAIT_GATE, 1
	warp_event 11, 41,  FORKED_STRAIT_GATE, 2

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
	