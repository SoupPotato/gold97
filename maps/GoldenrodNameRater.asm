	const_def 2 ; object constants
	const GOLDENRODNAMERATER_NAME_RATER

GoldenrodNameRater_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

GoldenrodNameRater:
	faceplayer
	opentext
	special NameRater
	waitbutton
	closetext
	end



GoldenrodNameRaterRadio:
	jumpstd radio2

INCLUDE "data/text/unused_sweet_honey.asm"

GoldenrodNameRater_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, GOLDENROD_CITY, 4
	warp_event  5,  7, GOLDENROD_CITY, 4

	db 0 ; coord events

	db 1 ; bg events
	bg_event  4,  1, BGEVENT_READ, GoldenrodNameRaterRadio

	db 1 ; object events
	object_event  7,  3, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_LEFT, 2, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodNameRater, -1
