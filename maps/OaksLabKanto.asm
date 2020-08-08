	const_def 2 ; object constants

OaksLabKanto_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

OaksLabKantoBookshelf:
	jumpstd difficultbookshelf

OaksLabKantoPoster1:
	jumptext OaksLabKantoPoster1Text

OaksLabKantoPoster2:
	jumptext OaksLabKantoPoster2Text
	
OaksLabKantoPC:
	jumptext OaksLabKantoPCText

OaksLabKantoPoster1Text:
	text "Press START to"
	line "open the MENU."
	done

OaksLabKantoPoster2Text:
	text "The SAVE option is"
	line "on the MENU."

	para "Use it in a timely"
	line "manner."
	done

OaksLabKantoPCText:
	text "It isn't turned"
	line "on…"
	done

OaksLabKanto_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  3,  7, KANTO_REGION, 17
	warp_event  4,  7, KANTO_REGION, 18

	db 0 ; coord events

	db 7 ; bg events
	bg_event  0,  5, BGEVENT_READ, OaksLabKantoBookshelf
	bg_event  1,  5, BGEVENT_READ, OaksLabKantoBookshelf
	bg_event  7,  5, BGEVENT_READ, OaksLabKantoBookshelf
	bg_event  6,  5, BGEVENT_READ, OaksLabKantoBookshelf
	bg_event  2,  0, BGEVENT_READ, OaksLabKantoPoster1
	bg_event  4,  0, BGEVENT_READ, OaksLabKantoPoster2
	bg_event  0,  1, BGEVENT_READ, OaksLabKantoPC

	db 0 ; object events
