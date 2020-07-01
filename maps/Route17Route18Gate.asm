	const_def 2 ; object constants
	const ROUTE17ROUTE18GATE_OFFICER
	const ROUTE17ROUTE18GATE_BUG_CATCHER

Route17Route18Gate_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks


Route17Route18GateOfficerScript:
	jumptextfaceplayer Route17Route18GateOfficerText

Route17Route18GateBugCatcherScript:
	jumptextfaceplayer Route17Route18GateBugCatcherText
	
Route17Route18GateBugCatcherText:
	text "The wild #MON"
	line "on the ISLANDS are"
	cont "very strong."
	para "Much more tough"
	line "than the mainland,"
	cont "I think."
	done

Route17Route18GateOfficerText:
	text "I've heard that"
	line "ISEN STRAIT holds"
	para "hidden remnants of"
	line "secret experiments"
	para "into creating a"
	line "manmade #MON."
	para "What could that"
	line "mean?"
	done


Route17Route18Gate_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  0,  7, ROUTE_20, 1
	warp_event  1,  7, ROUTE_20, 1
	warp_event  8,  7, ROUTE_10_NORTH, 1
	warp_event  9,  7, ROUTE_10_NORTH, 1

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  5,  2, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route17Route18GateOfficerScript, -1
	object_event  1,  2, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route17Route18GateBugCatcherScript, -1
