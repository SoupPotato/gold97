	const_def 2 ; object constants
	const ILEXFORESTAZALEAGATE_OFFICER

Route115KantoGate_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Route115KantoGateOfficerScript:
	jumptextfaceplayer Route115KantoGateOfficerText

Route115KantoGateOfficerText:
	text "ROUTE 115 is a hot"
	line "spot for really"
	cont "tough trainers."
	para "But I'm sure you'd"
	line "be able to take"
	cont "them!"
	done


Route115KantoGate_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  0,  7, ROUTE_115, 1
	warp_event  1,  7, ROUTE_115, 1
	warp_event  8,  7, KANTO_REGION, 10
	warp_event  9,  7, KANTO_REGION, 10

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  5,  2, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route115KantoGateOfficerScript, -1
