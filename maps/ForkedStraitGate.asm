ForkedStraitGate_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

ForkedStraitGate_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event 10,  0,  FORKED_STRAIT, 1
	warp_event 11,  0,  FORKED_STRAIT, 2
	warp_event 21, 10,  FORKED_STRAIT_EAST_EXIT, 1
	warp_event 21, 11,  FORKED_STRAIT_EAST_EXIT, 2

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
	