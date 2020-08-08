	const_def 2 ; object constants
	const ROUTE43MAHOGANYGATE_OFFICER
	const ROUTE43MAHOGANYGATE_LASS

BoardwalkTeknosGate_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

BoardwalkTeknosGateOfficer:
	faceplayer
	opentext
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .RocketsCleared
	writetext BoardwalkTeknosGateOfficerText
	waitbutton
	closetext
	end

.RocketsCleared:
	writetext BoardwalkTeknosGateOfficerRocketsClearedText
	waitbutton
	closetext
	end

BoardwalkTeknosGateLass:
	jumptextfaceplayer BoardwalkTeknosGateLassText

BoardwalkTeknosGateOfficerText:
	text "I hear there are"
	line "some sketchy"
	para "business dealings"
	line "going on behind"
	para "the scenes for the"
	line "GAME CORNER."
	done

BoardwalkTeknosGateOfficerRocketsClearedText:
	text "I heard the GAME"
	line "CORNER is under"
	para "new management"
	line "these days."
	done

BoardwalkTeknosGateLassText:
	text "I have a friend up"
	line "in SANSKRIT TOWN."
	para "This new BOARDWALK"
	line "makes it so much"
	para "easier for us to"
	line "visit."
	done

BoardwalkTeknosGate_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  4,  0, BOARDWALK, 1
	warp_event  5,  0, BOARDWALK, 2
	warp_event  4,  7, TEKNOS_CITY, 9
	warp_event  5,  7, TEKNOS_CITY, 10

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  0,  4, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BoardwalkTeknosGateOfficer, -1
	object_event  3,  5, SPRITE_LASS, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BoardwalkTeknosGateLass, -1
