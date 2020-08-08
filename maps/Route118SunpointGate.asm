	const_def 2 ; object constants
	const ROUTE7SAFFRONGATE_OFFICER

Route118SunpointGate_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Route7SaffronGuardScript:
	jumptextfaceplayer Route7SaffronGuardSeriousText

Route7SaffronGuardSeriousText:
	text "Have you ever"
	line "wondered why this"
	para "city is called"
	line "SUNPOINT?"
	para "It's because of"
	line "shipping routes of"
	para "countries north of"
	line "NIHON."
	para "When they come to"
	line "do business with"
	para "us, this city is"
	line "the sunniest part"
	cont "of their travels."	
	done

Route118SunpointGate_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  0,  7, SUNPOINT_CITY, 5
	warp_event  1,  7, SUNPOINT_CITY, 5
	warp_event  8,  7, ROUTE_118, 1
	warp_event  9,  7, ROUTE_118, 1

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  5,  2, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route7SaffronGuardScript, -1
