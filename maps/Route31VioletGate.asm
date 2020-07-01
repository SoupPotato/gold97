	const_def 2 ; object constants
	const ROUTE31VIOLETGATE_OFFICER
	const ROUTE31VIOLETGATE_COOLTRAINER_F
	const ROUTE31VIOLETGATE_YOUNGSTER

Route31VioletGate_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Route31VioletGateOfficerScript:
	jumptextfaceplayer Route31VioletGateOfficerText

Route31VioletGateCooltrainerFScript:
	jumptextfaceplayer Route31VioletGateCooltrainerFText
	
Route31VioletGateYoungsterScript:
	jumptextfaceplayer Route31VioletGateYoungsterText

Route31VioletGateYoungsterText:
	text "Through this gate"
	line "is OLD CITY!"
	done

Route31VioletGateOfficerText:
	text "Hi there!"
	line "Did you get to"
	para "see OLD CITY's"
	line "5 FLOOR TOWER?"
	done

Route31VioletGateCooltrainerFText:
	text "I came too far"
	line "out. I'd better"
	cont "phone home!"
	done

Route31VioletGate_MapEvents:
	db 0, 0 ; filler

	db 5 ; warp events
	warp_event  4,  0, OLD_CITY, 9
	warp_event  5,  0, OLD_CITY, 8
	warp_event  4,  7, ROUTE_29, 5
	warp_event  5,  7, ROUTE_29, 6
	warp_event  1,  0, ROUTE_31_VIOLET_GATE_2F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  7,  2, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route31VioletGateYoungsterScript, -1
	object_event  0,  4, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route31VioletGateOfficerScript, -1
	object_event  2,  6, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route31VioletGateCooltrainerFScript, -1
