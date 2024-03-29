	const_def 2 ; object constants
	const ROUTE2GATE_SCIENTIST
	const ROUTE2GATE_ROCKET1
	const ROUTE2GATE_ROCKET2

Route116Gate_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	
Route116GateRocket1Script:
	opentext
	writetext Route116GateRocket1Text
	waitbutton
	closetext
	end
	
Route116GateRocket2Script:
	opentext
	writetext Route116GateRocket2Text
	waitbutton
	closetext
	end

Route116GateScientistScript:
	faceplayer
	opentext
	checkevent EVENT_RIVAL_BURNED_TOWER
	iftrue .NoAzaleaRockets
	writetext Route116GateScientistText
	waitbutton
	closetext
	end

.NoAzaleaRockets:
	writetext Route116GateScientistTextNoRockets
	waitbutton
	closetext
	end

Route116GateAideScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_EVERSTONE_FROM_ELM
	iftrue .AlreadyGotEverstone
	writetext AideGivesEverstoneText1
	buttonsound
	verbosegiveitem EVERSTONE
	iffalse .NoRoomForEverstone
	writetext AideGivesEverstoneText2
	waitbutton
	setevent EVENT_GOT_EVERSTONE_FROM_ELM
	closetext
	end

.NoRoomForEverstone:
	writetext AideGivesEverstoneText3
	waitbutton
	closetext
	end
	
.AlreadyGotEverstone
	writetext AideGivesEverstoneText2
	buttonsound
	closetext
	end

AideGivesEverstoneText1:
	text "Hi there,"
	line "<PLAY_G>!"
	
	para "Remember me?"
	
	para "I'm one of PROF."
	line "OAK's AIDES."
	
	para "OAK forgot to give"
	line "you this before he"
	cont "left."
	done

AideGivesEverstoneText2:
	text "That EVERSTONE can"
	line "prevent it's hold"
	cont "-er from evolving!"
	
	para "It's a handy stone"
	line "when you don't a"
	cont "certain #MON"
	cont "to evolve."
	done

AideGivesEverstoneText3:
	text "Oh dear…"

	para "You have no room"
	cont "for this!"
	done
	
Route116GateRocket1Text:
	text "Fufufufu…"
	para "Our SLOWPOKE team"
	line "should be back"
	para "with the next"
	line "batch of TAILS"
	cont "soon…"
	done
	
Route116GateRocket2Text:
	text "Hehehehe…"
	para "No one will even"
	line "notice the TAILS"
	para "missing from those"
	line "SLOWPOKE until"
	cont "it's too late…"
	done

Route116GateScientistText:
	text "These men look"
	line "like members of"
	cont "TEAM ROCKET."
	para "Could they really"
	line "be?"
	para "I wish they'd stop"
	line "blocking the gate,"
	para "but they kind of"
	line "scare me…"
	done
	
Route116GateScientistTextNoRockets:
	text "Past here is a"
	line "winding maze of"
	para "trees and a tough"
	line "cave to traverse."
	para "Make sure you're"
	line "prepared!"
	done

Route116Gate_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  4,  0, ROUTE_116, 1
	warp_event  5,  0, ROUTE_116, 2
	warp_event  4,  7, BIRDON_TOWN, 7
	warp_event  5,  7, BIRDON_TOWN, 8

	db 0 ; coord events

	db 0 ; bg events

	db 4 ; object events
	object_event  0,  4, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 2, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route116GateScientistScript, -1
	object_event  4,  1, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route116GateRocket1Script, EVENT_RIVAL_BURNED_TOWER
	object_event  5,  1, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route116GateRocket2Script, EVENT_RIVAL_BURNED_TOWER
	object_event  3,  1, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route116GateAideScript, EVENT_BIRDON_AIDE_HIDDEN