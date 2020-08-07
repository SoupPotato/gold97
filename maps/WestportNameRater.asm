	const_def 2 ; object constants
	const WestportNameRater_NAME_RATER

WestportNameRater_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

WestportNameRater:
	faceplayer
	opentext
	special NameRater
	waitbutton
	closetext
	end



WestportNameRaterRadio:
	jumpstd radio2

INCLUDE "data/text/unused_sweet_honey.asm"

WestportNameRater_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, WESTPORT_CITY, 4
	warp_event  5,  7, WESTPORT_CITY, 4

	db 0 ; coord events

	db 1 ; bg events
	bg_event  4,  1, BGEVENT_READ, WestportNameRaterRadio

	db 1 ; object events
	object_event  7,  3, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_LEFT, 2, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WestportNameRater, -1
