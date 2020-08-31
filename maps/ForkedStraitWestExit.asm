ForkedStraitWestExit_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

ForkedStraitWestExit_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 19, 10,  FORKED_STRAIT_GATE, 5
	warp_event 19, 11,  FORKED_STRAIT_GATE, 6

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
	