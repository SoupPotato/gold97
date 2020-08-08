	const_def 1 ; object constants
	const NEWECRUTEAKGATESOUTH_OFFICER
	const NEWECRUTEAKGATESOUTH_ROCKER

Route105Route106Gate_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Route105Route106GateOfficerScript:
	jumptextfaceplayer Route105Route106GateOfficerText
	
Route105Route106GateRockerScript:
	jumptextfaceplayer Route105Route106GateRockerText

Route105Route106GateOfficerText:
	text "JADE FOREST is"
	line "a mysterious area."
	para "Be sure to treat"
	line "it with respect."
	done

Route105Route106GateRockerText:
	text "I like going for"
	line "peaceful walks in"
	cont "JADE FOREST."
	para "It's a lot less"
	line "scary in there"
	para "once you know your"
	line "way around."
	done

Route105Route106Gate_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  4,  0, ROUTE_105, 1
	warp_event  5,  0, ROUTE_105, 2
	warp_event  4,  7, ROUTE_106, 1
	warp_event  5,  7, ROUTE_106, 2

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  0,  4, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route105Route106GateOfficerScript, -1
	object_event  6,  3, SPRITE_ROCKER, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route105Route106GateRockerScript, -1
	
