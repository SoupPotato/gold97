	const_def 1 ; object constants
	const NEWVIOLETGATENORTH_OFFICER
	const NEWVIOLETGATENORTH_YOUNGSTER

Route102WestPortGate_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Route102WestPortGateOfficerScript:
	jumptextfaceplayer Route102WestPortGateOfficerText

Route102WestPortGateOfficerText:
	text "WEST CITY is a"
	line "quickly growing"
	para "metropolis that"
	line "has many resources"
	cont "for trainers."
	done
	
Route102WestPortGateYoungsterScript:
	jumptextfaceplayer Route102WestPortGateYoungsterText

Route102WestPortGateYoungsterText:
	text "Whew!"
	para "The WEST CITY"
	line "DEPT. STORE has an"
	para "underground level"
	line "that's full of"
	cont "tough trainers!"
	done


Route102WestPortGate_MapEvents:
	db 0, 0 ; filler

	db 5 ; warp events
	warp_event  0,  7, GOLDENROD_CITY, 3
	warp_event  1,  7, GOLDENROD_CITY, 3
	warp_event  8,  7, ROUTE_36, 1
	warp_event  9,  7, ROUTE_36, 1
	warp_event  1,  0, NEW_VIOLET_GATE_NORTH_2F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  5,  2, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route102WestPortGateOfficerScript, -1
	object_event  0,  1, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route102WestPortGateYoungsterScript, -1

	
