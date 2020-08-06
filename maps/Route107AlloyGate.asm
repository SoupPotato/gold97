	const_def 1 ; object constants
	const NEWOLIVINEGATEWEST_OFFICER

Route107AlloyGate_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Route107AlloyGateOfficerScript:
	jumptextfaceplayer Route107AlloyGateOfficerText

Route107AlloyGateOfficerText:
	text "Be careful if you"
	line "intend to cross"
	para "the ocean to get"
	line "to SUGAR TOWN."
	para "The waters are"
	line "rough. You'll need"
	cont "a #MON's help."
	done


Route107AlloyGate_MapEvents:
	db 0, 0 ; filler

	db 5 ; warp events
	warp_event  4,  0, ROUTE_107, 1
	warp_event  5,  0, ROUTE_107, 2
	warp_event  4,  7, ALLOY_CITY, 10
	warp_event  5,  7, ALLOY_CITY, 12
	warp_event  1,  0, ROUTE_107_ALLOY_GATE_2F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  0,  4, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route107AlloyGateOfficerScript, -1
	
