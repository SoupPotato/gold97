	const_def 2 ; object constants
	const ROUTE2GATE_SCIENTIST
	const ROUTE2GATE_ROCKET1
	const ROUTE2GATE_ROCKET2

Route2Gate_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	
Route2GateRocket1Script:
	opentext
	writetext Route2GateRocket1Text
	waitbutton
	closetext
	end
	
Route2GateRocket2Script:
	opentext
	writetext Route2GateRocket2Text
	waitbutton
	closetext
	end

Route2GateScientistScript:
	faceplayer
	opentext
	checkevent EVENT_RIVAL_BURNED_TOWER
	iftrue .NoAzaleaRockets
	writetext Route2GateScientistText
	waitbutton
	closetext
	end

.NoAzaleaRockets:
	writetext Route2GateScientistTextNoRockets
	waitbutton
	closetext
	end
	
Route2GateRocket1Text:
	text "Fufufufu…"
	para "Our SLOWPOKE team"
	line "should be back"
	para "with the next"
	line "batch of TAILs"
	cont "soon…"
	done
	
Route2GateRocket2Text:
	text "Hehehehe…"
	para "No one will even"
	line "notice the TAILs"
	para "missing from those"
	line "SLOWPOKE until"
	cont "it's too late…"
	done

Route2GateScientistText:
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
	
Route2GateScientistTextNoRockets:
	text "Past here is a"
	line "winding maze of"
	para "trees and a tough"
	line "cave to traverse."
	para "Make sure you're"
	line "prepared!"
	done

Route2Gate_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  4,  0, ROUTE_2, 1
	warp_event  5,  0, ROUTE_2, 2
	warp_event  4,  7, AZALEA_TOWN, 7
	warp_event  5,  7, AZALEA_TOWN, 8

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  0,  4, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 2, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route2GateScientistScript, -1
	object_event  4,  1, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route2GateRocket1Script, EVENT_RIVAL_BURNED_TOWER
	object_event  5,  1, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route2GateRocket2Script, EVENT_RIVAL_BURNED_TOWER
	