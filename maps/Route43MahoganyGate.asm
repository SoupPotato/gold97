	const_def 2 ; object constants
	const ROUTE43MAHOGANYGATE_OFFICER
	const ROUTE43MAHOGANYGATE_LASS

Route43MahoganyGate_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Route43MahoganyGateOfficer:
	faceplayer
	opentext
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .RocketsCleared
	writetext Route43MahoganyGateOfficerText
	waitbutton
	closetext
	end

.RocketsCleared:
	writetext Route43MahoganyGateOfficerRocketsClearedText
	waitbutton
	closetext
	end

Route43MahoganyGateLass:
	jumptextfaceplayer Route43MahoganyGateLassText

Route43MahoganyGateOfficerText:
	text "I hear there are"
	line "some sketchy"
	para "business dealings"
	line "going on behind"
	para "the scenes for the"
	line "GAME CORNER."
	done

Route43MahoganyGateOfficerRocketsClearedText:
	text "I heard the GAME"
	line "CORNER is under"
	para "new management"
	line "these days."
	done

Route43MahoganyGateLassText:
	text "I have a friend up"
	line "in HONTO TOWN."
	para "This new BOARDWALK"
	line "makes it so much"
	para "easier for us to"
	line "visit."
	done

Route43MahoganyGate_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  4,  0, ROUTE_43, 1
	warp_event  5,  0, ROUTE_43, 2
	warp_event  4,  7, ECRUTEAK_CITY, 9
	warp_event  5,  7, ECRUTEAK_CITY, 10

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  0,  4, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route43MahoganyGateOfficer, -1
	object_event  3,  5, SPRITE_LASS, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route43MahoganyGateLass, -1
