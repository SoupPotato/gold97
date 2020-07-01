	const_def 2 ; object constants
	const ROUTE8SAFFRONGATE_OFFICER

Route8SaffronGate_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Route8SaffronGateOfficerScript:
	jumptextfaceplayer Route8SaffronGateOfficerText

Route8SaffronGateOfficerText:
	text "Have you been to"
	line "WEST CITY?"

	para "There's a tall"
	line "RADIO TOWER there."
	done

Route8SaffronGate_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  4,  0, ROUTE_10_SOUTH, 3
	warp_event  5,  0, ROUTE_10_SOUTH, 4
	warp_event  4,  7, ROUTE_12, 1
	warp_event  5,  7, ROUTE_12, 2

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  0,  4, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route8SaffronGateOfficerScript, -1
