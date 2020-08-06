	const_def 2 ; object constants
	const OLIVINETIMSHOUSE_TIM

AlloyTimsHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Tim:
	faceplayer
	opentext
	trade NPC_TRADE_TIM
	waitbutton
	closetext
	end

TimsHouseBookshelf:
	jumpstd magazinebookshelf

AlloyTimsHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, ALLOY_CITY, 3
	warp_event  5,  7, ALLOY_CITY, 3

	db 0 ; coord events

	db 2 ; bg events
	bg_event  0,  1, BGEVENT_READ, TimsHouseBookshelf
	bg_event  1,  1, BGEVENT_READ, TimsHouseBookshelf

	db 1 ; object events
	object_event  2,  3, SPRITE_POKEFAN_M, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Tim, -1
