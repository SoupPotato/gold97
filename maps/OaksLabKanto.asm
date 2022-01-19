	const_def 2 ; object constants
	const OAKS_KANTO_LAB_AIDE1
	const OAKS_KANTO_LAB_AIDE2

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

KantoAide1:
	jumptextfaceplayer KantoAide1Text
	
KantoAide1Text:
	text "When PROF.OAK up"
	line "and moved base to"
	cont "SILENT TOWN, we"
	cont "had to stay back"
	cont "to pack up the"
	cont "old lab."
	
	para "I suppose it's a"
	line "lot easier to"
	cont "study #MON"
	cont "out in the"
	cont "countryside as"
	cont "opposed to urban"
	cont "KANTO."
	done

KantoAide2:
	checkevent EVENT_GIVEN_BALL_FROM_AIDE
	iftrue AideGivenLevelBall
	faceplayer
	opentext
	writetext AideGivingLevelBallText
	buttonsound
	verbosegiveitem LEVEL_BALL
	iffalse .noroom
	setevent EVENT_GIVEN_BALL_FROM_AIDE
	writetext AideGivenLevelBallText
.noroom
	waitbutton
	closetext
	end
	
AideGivenLevelBall:
	jumptextfaceplayer AideGivenLevelBallText

AideGivingLevelBallText:
	text "PROF.OAK ordered"
	line "a whole bunch of"
	cont "custom # BALLS"
	cont "for his research."
	
	para "I keep finding"
	line "them while"
	cont "sweeping up."
	
	para "Here, you can"
	line "probably make"
	cont "better use of"
	cont "one of these."
	done

AideGivenLevelBallText:
	text "He told me that"
	line "a lot of these"
	cont "BALLS were made"
	cont "by none other"
	cont "than the famous"
	cont "KURT from PAGOTA"
	cont "CITY!"
	
	para "Use it wisely!"
	done


OaksLabKanto_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  3,  7, KANTO_REGION, 18
	warp_event  4,  7, KANTO_REGION, 19

	db 0 ; coord events

	db 7 ; bg events
	bg_event  0,  5, BGEVENT_READ, OaksLabKantoBookshelf
	bg_event  1,  5, BGEVENT_READ, OaksLabKantoBookshelf
	bg_event  7,  5, BGEVENT_READ, OaksLabKantoBookshelf
	bg_event  6,  5, BGEVENT_READ, OaksLabKantoBookshelf
	bg_event  2,  0, BGEVENT_READ, OaksLabKantoPoster1
	bg_event  4,  0, BGEVENT_READ, OaksLabKantoPoster2
	bg_event  0,  1, BGEVENT_READ, OaksLabKantoPC

	db 2 ; object events
	object_event  2,  3, SPRITE_SCIENTIST, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, KantoAide1, -1
	object_event  5,  2, SPRITE_SCIENTIST, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, KantoAide2, -1
