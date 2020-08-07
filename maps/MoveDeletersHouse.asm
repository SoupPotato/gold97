	const_def 2 ; object constants
	const MOVEDELETERSHOUSE_SUPER_NERD

MoveDeletersHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

MoveDeleter:
	faceplayer
	opentext
	special MoveDeletion
	waitbutton
	closetext
	end

MoveDeletersHouseBookshelf:
	jumpstd difficultbookshelf

MoveDeletersHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, BLUE_FOREST, 6
	warp_event  5,  7, BLUE_FOREST, 6

	db 0 ; coord events

	db 2 ; bg events
	bg_event  0,  0, BGEVENT_READ, MoveDeletersHouseBookshelf
	bg_event  1,  0, BGEVENT_READ, MoveDeletersHouseBookshelf

	db 1 ; object events
	object_event  7,  4, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MoveDeleter, -1
