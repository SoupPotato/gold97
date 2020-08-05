	const_def 2 ; object constants
	const ROUTE31VIOLETGATE_OFFICER
	const ROUTE31VIOLETGATE_COOLTRAINER_F
	const ROUTE31VIOLETGATE_YOUNGSTER

Route110PagotaGate_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Route110PagotaGateOfficerScript:
	jumptextfaceplayer Route110PagotaGateOfficerText

Route110PagotaGateCooltrainerFScript:
	jumptextfaceplayer Route110PagotaGateCooltrainerFText
	
Route110PagotaGateYoungsterScript:
	jumptextfaceplayer Route110PagotaGateYoungsterText

Route110PagotaGateYoungsterText:
	text "Through this gate"
	line "is OLD CITY!"
	done

Route110PagotaGateOfficerText:
	text "Hi there!"
	line "Did you get to"
	para "see OLD CITY's"
	line "5 FLOOR TOWER?"
	done

Route110PagotaGateCooltrainerFText:
	text "I came too far"
	line "out. I'd better"
	cont "phone home!"
	done

Route110PagotaGate_MapEvents:
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
	object_event  7,  2, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route110PagotaGateYoungsterScript, -1
	object_event  0,  4, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route110PagotaGateOfficerScript, -1
	object_event  2,  6, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route110PagotaGateCooltrainerFScript, -1
