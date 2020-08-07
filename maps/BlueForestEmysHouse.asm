	const_def 2 ; object constants
	const BLACKTHORNEMYSHOUSE_EMY

BlueForestEmysHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Emy:
	faceplayer
	opentext
	trade NPC_TRADE_EMY
	waitbutton
	closetext
	end

EmysHouseBookshelf:
	jumpstd magazinebookshelf

BlueForestEmysHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, BLUE_FOREST, 3
	warp_event  5,  7, BLUE_FOREST, 3

	db 0 ; coord events

	db 2 ; bg events
	bg_event  0,  0, BGEVENT_READ, EmysHouseBookshelf
	bg_event  1,  0, BGEVENT_READ, EmysHouseBookshelf

	db 1 ; object events
	object_event  4,  4, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Emy, -1
