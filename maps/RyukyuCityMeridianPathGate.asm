	const_def 2 ; object constants
	const ROUTE19FUCHSIAGATE_OFFICER

RyukyuCityMeridianPathGate_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

RyukyuCityMeridianPathGateOfficerScript:
	jumptextfaceplayer RyukyuCityMeridianPathGateOfficerText


RyukyuCityMeridianPathGateOfficerText:
	text "RYUKYU CITY is"
	line "probably the most"
	para "popular tourist"
	line "attraction on the"
	cont "ISLANDS."
	done

RyukyuCityMeridianPathGate_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  0,  7, RYUKYU_CITY, 3
	warp_event  1,  7, RYUKYU_CITY, 3
	warp_event  8,  7, MERIDIAN_PATH, 1
	warp_event  9,  7, MERIDIAN_PATH, 1

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  5,  2, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, RyukyuCityMeridianPathGateOfficerScript, -1
