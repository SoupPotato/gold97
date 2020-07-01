	const_def 1 ; object constants
	const NEWVIOLETGATENORTH_OFFICER
	const NEWVIOLETGATENORTH_YOUNGSTER

NewVioletGateNorth_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

NewVioletGateNorthOfficerScript:
	jumptextfaceplayer NewVioletGateNorthOfficerText

NewVioletGateNorthOfficerText:
	text "WEST CITY is a"
	line "quickly growing"
	para "metropolis that"
	line "has many resources"
	cont "for trainers."
	done
	
NewVioletGateNorthYoungsterScript:
	jumptextfaceplayer NewVioletGateNorthYoungsterText

NewVioletGateNorthYoungsterText:
	text "Whew!"
	para "The WEST CITY"
	line "DEPT. STORE has an"
	para "underground level"
	line "that's full of"
	cont "tough trainers!"
	done


NewVioletGateNorth_MapEvents:
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
	object_event  5,  2, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, NewVioletGateNorthOfficerScript, -1
	object_event  0,  1, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, NewVioletGateNorthYoungsterScript, -1

	
