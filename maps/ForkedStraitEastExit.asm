ForkedStraitEastExit_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

ForkedStraitEastExit_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  6, 10,  FORKED_STRAIT_GATE, 3
	warp_event  6, 11,  FORKED_STRAIT_GATE, 4

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
	