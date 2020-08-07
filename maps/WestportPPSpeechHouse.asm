	const_def 2 ; object constants
	const GOLDENRODPPSPEECHHOUSE_FISHER
	const GOLDENRODPPSPEECHHOUSE_LASS

WestportPPSpeechHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

WestportPPSpeechHouseFisherScript:
	jumptextfaceplayer WestportPPSpeechHouseFisherText

WestportPPSpeechHouseLassScript:
	jumptextfaceplayer WestportPPSpeechHouseLassText

WestportPPSpeechHouseBookshelf2:
	jumpstd difficultbookshelf

WestportPPSpeechHouseBookshelf1:
	jumpstd magazinebookshelf

WestportPPSpeechHouseRadio:
	jumpstd radio2

WestportPPSpeechHouseFisherText:
	text "Once while I was"
	line "battling, my"

	para "#MON couldn't"
	line "make any moves."

	para "The POWER POINTS,"
	line "or PP, of its"

	para "moves were all"
	line "gone."
	done

WestportPPSpeechHouseLassText:
	text "Sometimes, a"
	line "healthy #MON"

	para "may be unable to"
	line "use its moves."

	para "If that happens,"
	line "heal it at a #-"
	cont "MON CENTER or use"
	cont "an item."
	done

WestportPPSpeechHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, WESTPORT_CITY, 13
	warp_event  5,  7, WESTPORT_CITY, 13

	db 0 ; coord events

	db 3 ; bg events
	bg_event  4,  1, BGEVENT_READ, WestportPPSpeechHouseBookshelf1
	bg_event  5,  1, BGEVENT_READ, WestportPPSpeechHouseBookshelf2
	bg_event  6,  1, BGEVENT_READ, WestportPPSpeechHouseRadio

	db 2 ; object events
	object_event  3,  4, SPRITE_POKEFAN_M, SPRITEMOVEDATA_WANDER, 0, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, WestportPPSpeechHouseFisherScript, -1
	object_event  1,  3, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WestportPPSpeechHouseLassScript, -1
