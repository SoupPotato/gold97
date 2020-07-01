	const_def 2 ; object constants
	const ROUTE29ROUTE46GATE_OFFICER
	const ROUTE29ROUTE46GATE_YOUNGSTER

Route29Route46Gate_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Route29Route46GateOfficerScript:
	jumptextfaceplayer Route29Route46GateOfficerText

Route29Route46GateYoungsterScript:
	jumptextfaceplayer Route29Route46GateYoungsterText

Route29Route46GateOfficerText:
	text "NIHON's known for"
	line "having rough north"
	cont "waters."
	para "The area around"
	line "the aptly named"
	para "WHIRL ISLAND is"
	line "probably the best"
	cont "example."
	para "Don't go north"
	line "unprepared!"
	done

Route29Route46GateYoungsterText:
	text "I hear rare"
	line "#MON appear in"
	cont "WHIRL ISLAND."
	done

Route29Route46Gate_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  4,  0, ROUTE_41, 3
	warp_event  5,  0, ROUTE_41, 4
	warp_event  4,  7, BLACKTHORN_CITY, 9
	warp_event  5,  7, BLACKTHORN_CITY, 10

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  0,  4, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route29Route46GateOfficerScript, -1
	object_event  6,  4, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route29Route46GateYoungsterScript, -1
