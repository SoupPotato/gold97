CastleMountain1F_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .UnblockLongHall
	
.UnblockLongHall:
	checkevent EVENT_DANCE_HALL_ROCKETS_ESCAPED
	iffalse .Done
	changeblock $E, $2, $46
.Done:
	return

HiddenDebris5:
	hiddenitem BRICK_PIECE, EVENT_CM_HIDDENITEM5
	
HiddenDebris6:
	hiddenitem BRICK_PIECE, EVENT_CM_HIDDENITEM6
	
HiddenDebris7:
	hiddenitem STAR_PIECE, EVENT_CM_HIDDENITEM7
	
HiddenDebris8:
	hiddenitem BRICK_PIECE, EVENT_CM_HIDDENITEM8


CastleMountain1F_MapEvents:
	db 0, 0 ; filler

	db 8 ; warp events
	warp_event 14, 23, IE_TOWN, 6
	warp_event 15, 23, IE_TOWN, 7
	warp_event 28,  8, CASTLE_MOUNTAIN_1F_DANCE_HALL, 1
	warp_event 28,  9, CASTLE_MOUNTAIN_1F_DANCE_HALL, 2
	warp_event  1,  8, CASTLE_MOUNTAIN_1F_DINING_HALL, 1
	warp_event  1,  9, CASTLE_MOUNTAIN_1F_DINING_HALL, 2
	warp_event 14,  1, CASTLE_MOUNTAIN_1F_LONG_HALL, 1
	warp_event 15,  1, CASTLE_MOUNTAIN_1F_LONG_HALL, 2

	db 0 ; coord events

	db 4 ; bg events
	bg_event 19,  7, BGEVENT_ITEM, HiddenDebris5
	bg_event 22, 14, BGEVENT_ITEM, HiddenDebris6
	bg_event  9, 21, BGEVENT_ITEM, HiddenDebris7
	bg_event  8,  4, BGEVENT_ITEM, HiddenDebris8

	db 0 ; object events
