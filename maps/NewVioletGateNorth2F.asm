	const_def 2 ; object constants
	const NEWVIOLETGATENORTH2F_FISHER

NewVioletGateNorth2F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

	
NewVioletGateNorth2FFisherScript:
	faceplayer
	opentext
	checkflag ENGINE_HIVEBADGE
	iftrue .DocksOpen
	writetext DocksClosedText
	waitbutton
	closetext
	end
	
.DocksOpen
	writetext NewVioletGateNorth2FFisherText
	waitbutton
	closetext
	end

NewVioletGateNorth2FFisherText:
	text "The WEST CITY dock"
	line "has resumed taking"
	para "ferries out to"
	line "TEKU CITY."
	para "You should check"
	line "it out if you get"
	cont "a chance."
	done
	
DocksClosedText:
	text "WEST CITY has a"
	line "dock where ferries"
	para "can depart for"
	line "TEKU CITY, but"
	para "it's closed right"
	line "now."
	done
	
	
NewVioletGateNorth2FSign:
	jumptext NewVioletGateNorth2FSignText
	
NewVioletGateNorth2FSignText:
	text "<PLAY_G> peeked"
	line "through the"
	cont "telescope!"
	para "I see a small"
	line "desert town north"
	cont "of here!"
	done

NewVioletGateNorth2FSign2:
	jumptext NewVioletGateNorth2FSign2Text
	
NewVioletGateNorth2FSign2Text:
	text "<PLAY_G> peeked"
	line "through the"
	cont "telescope!"
	para "Is that the WEST"
	line "CITY RADIO TOWER?"
	done
	
NewVioletGateNorth2F_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  5,  0, NEW_VIOLET_GATE_NORTH, 5

	db 0 ; coord events

	db 2 ; bg events
	bg_event 1,  0, BGEVENT_READ, NewVioletGateNorth2FSign
	bg_event 3,  0, BGEVENT_READ, NewVioletGateNorth2FSign2

	db 1 ; object events
	object_event  3,  3, SPRITE_FISHER, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, NewVioletGateNorth2FFisherScript, -1
	