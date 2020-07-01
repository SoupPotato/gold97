	const_def 2 ; object constants
	const ROUTE38ECRUTEAKGATE_OFFICER

Route38EcruteakGate_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Route38EcruteakGateOfficerScript:
	jumptextfaceplayer Route38EcruteakGateOfficerText

Route38EcruteakGateOfficerText:
	text "Where did you say"
	line "you're from?"

	para "SILENT TOWN?"

	para "PROF.OAK moved"
	line "over there, right?"

	para "You've come a long"
	line "way to get here."
	done

Route38EcruteakGate_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  4,  7, ROUTE_39, 3
	warp_event  5,  7, ROUTE_39, 4
	warp_event  4,  0, ROUTE_40, 1
	warp_event  5,  0, ROUTE_40, 2

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  0,  4, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route38EcruteakGateOfficerScript, -1
