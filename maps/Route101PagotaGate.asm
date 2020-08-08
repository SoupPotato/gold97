	const_def 2 ; object constants
	const ROUTE31VIOLETGATE_OFFICER
	const ROUTE31VIOLETGATE_COOLTRAINER_F
	const ROUTE31VIOLETGATE_YOUNGSTER

Route101PagotaGate_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Route101PagotaGateOfficerScript:
	jumptextfaceplayer Route101PagotaGateOfficerText

Route101PagotaGateCooltrainerFScript:
	jumptextfaceplayer Route101PagotaGateCooltrainerFText
	
Route101PagotaGateYoungsterScript:
	jumptextfaceplayer Route101PagotaGateYoungsterText

Route101PagotaGateYoungsterText:
	text "Through this gate"
	line "is PAGOTA CITY!"
	done

Route101PagotaGateOfficerText:
	text "Hi there!"
	line "Did you get to"
	para "see PAGOTA CITY's"
	line "BRASS TOWER?"
	done

Route101PagotaGateCooltrainerFText:
	text "I came too far"
	line "out. I'd better"
	cont "phone home!"
	done

Route101PagotaGate_MapEvents:
	db 0, 0 ; filler

	db 5 ; warp events
	warp_event  4,  0, PAGOTA_CITY, 9
	warp_event  5,  0, PAGOTA_CITY, 8
	warp_event  4,  7, ROUTE_101, 5
	warp_event  5,  7, ROUTE_101, 6
	warp_event  1,  0, ROUTE_101_PAGOTA_GATE_2F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  7,  2, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route101PagotaGateYoungsterScript, -1
	object_event  0,  4, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route101PagotaGateOfficerScript, -1
	object_event  2,  6, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route101PagotaGateCooltrainerFScript, -1
