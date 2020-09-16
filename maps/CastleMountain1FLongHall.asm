CastleMountain1FLongHall_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .UnblockStairs
	
.UnblockStairs:
	checkevent EVENT_UNBLOCK_STAIRS_ROOM
	iffalse .Done
	changeblock $1E, $2, $46
.Done:
	return


CastleMountain1FLongHall_MapEvents:
	db 0, 0 ; filler

	db 9 ; warp events
	warp_event 30,  9, CASTLE_MOUNTAIN_1F, 7
	warp_event 31,  9, CASTLE_MOUNTAIN_1F, 8
	warp_event 52,  9, CASTLE_MOUNTAIN_1F_DANCE_HALL, 3
	warp_event 53,  9, CASTLE_MOUNTAIN_1F_DANCE_HALL, 4
	warp_event  8,  9, CASTLE_MOUNTAIN_1F_DINING_HALL, 3
	warp_event  9,  9, CASTLE_MOUNTAIN_1F_DINING_HALL, 4
	warp_event 30,  1, CASTLE_MOUNTAIN_1F_STAIRS, 1
	warp_event 31,  1, CASTLE_MOUNTAIN_1F_STAIRS, 2
	warp_event  8,  1, CASTLE_MOUNTAIN_1F_CAVE, 1

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
