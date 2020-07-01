	const_def 2 ; object constants
	const ROUTE19FUCHSIAGATE_OFFICER

Route19FuchsiaGate_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Route19FuchsiaGateOfficerScript:
	jumptextfaceplayer Route19FuchsiaGateOfficerText


Route19FuchsiaGateOfficerText:
	text "RYUKYU CITY is"
	line "probably the most"
	para "popular tourist"
	line "attraction on the"
	cont "ISLANDS."
	done

Route19FuchsiaGate_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  0,  7, SAFFRON_CITY, 3
	warp_event  1,  7, SAFFRON_CITY, 3
	warp_event  8,  7, ROUTE_25, 1
	warp_event  9,  7, ROUTE_25, 1

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  5,  2, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route19FuchsiaGateOfficerScript, -1
