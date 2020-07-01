	const_def 2 ; object constants
	const GOLDENRODPPSPEECHHOUSE_FISHER
	const GOLDENRODPPSPEECHHOUSE_LASS

GoldenrodPPSpeechHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

GoldenrodPPSpeechHouseFisherScript:
	jumptextfaceplayer GoldenrodPPSpeechHouseFisherText

GoldenrodPPSpeechHouseLassScript:
	jumptextfaceplayer GoldenrodPPSpeechHouseLassText

GoldenrodPPSpeechHouseBookshelf2:
	jumpstd difficultbookshelf

GoldenrodPPSpeechHouseBookshelf1:
	jumpstd magazinebookshelf

GoldenrodPPSpeechHouseRadio:
	jumpstd radio2

GoldenrodPPSpeechHouseFisherText:
	text "Once while I was"
	line "battling, my"

	para "#MON couldn't"
	line "make any moves."

	para "The POWER POINTS,"
	line "or PP, of its"

	para "moves were all"
	line "gone."
	done

GoldenrodPPSpeechHouseLassText:
	text "Sometimes, a"
	line "healthy #MON"

	para "may be unable to"
	line "use its moves."

	para "If that happens,"
	line "heal it at a #-"
	cont "MON CENTER or use"
	cont "an item."
	done

GoldenrodPPSpeechHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, GOLDENROD_CITY, 13
	warp_event  5,  7, GOLDENROD_CITY, 13

	db 0 ; coord events

	db 3 ; bg events
	bg_event  4,  1, BGEVENT_READ, GoldenrodPPSpeechHouseBookshelf1
	bg_event  5,  1, BGEVENT_READ, GoldenrodPPSpeechHouseBookshelf2
	bg_event  6,  1, BGEVENT_READ, GoldenrodPPSpeechHouseRadio

	db 2 ; object events
	object_event  3,  4, SPRITE_POKEFAN_M, SPRITEMOVEDATA_WANDER, 0, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, GoldenrodPPSpeechHouseFisherScript, -1
	object_event  1,  3, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodPPSpeechHouseLassScript, -1
