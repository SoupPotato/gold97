	const_def 2 ; object constants
	const ROUTE15FUCHSIAGATE_OFFICER
	const ROUTE15FUCHSIAGATE_FISHINGURU

Route15FuchsiaGate_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Route15FuchsiaGateOfficerScript:
	jumptextfaceplayer Route15FuchsiaGateOfficerText
	
Route15FuchsiaGateFishScript:
	jumptextfaceplayer Route15FuchsiaGateFishText

Route15FuchsiaGateFishText:
	text "I think I'll head"
	line "to the shore to do"
	cont "some fishing."
	done

Route15FuchsiaGateOfficerText:
	text "You're working on"
	line "a #DEX? That's"

	para "really something."
	line "Don't give up!"
	done

Route15FuchsiaGate_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  4,  0, CIANWOOD_CITY, 10
	warp_event  5,  0, CIANWOOD_CITY, 11
	warp_event  4,  7, ROUTE_7, 1
	warp_event  5,  7, ROUTE_7, 2

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  0,  4, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route15FuchsiaGateOfficerScript, -1
	object_event  6,  5, SPRITE_FISHING_GURU, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route15FuchsiaGateFishScript, -1
