DeepwaterPassage1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

DeepwaterPassage1F_MapEvents:
	db 0, 0 ; filler

	db 8 ; warp events
	warp_event  4, 33, BLUE_FOREST, 8
	warp_event  3, 31, DEEPWATER_PASSAGE_1F, 3
	warp_event  5, 21, DEEPWATER_PASSAGE_1F, 2
	warp_event  3, 23, DEEPWATER_PASSAGE_B1F, 1
	warp_event  3, 11, DEEPWATER_PASSAGE_B1F, 4
	warp_event  3, 13, DEEPWATER_PASSAGE_1F, 7
	warp_event  3,  3, DEEPWATER_PASSAGE_1F, 6
	warp_event  6,  3, FROSTPOINT_TOWN, 2  


	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
