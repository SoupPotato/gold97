	const_def 2 ; object constants
	const ROUTE5SAFFRONGATE_OFFICER

SunPointDocksSunPointGate_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks


SunPointDocksSunPointGateOfficerScript:
	faceplayer
	opentext
	checkevent EVENT_ROUTE_5_6_POKEFAN_M_BLOCKS_UNDERGROUND_PATH
	iftrue .NoMoreBadBoat
	writetext SunPointDocksSunPointGateOfficerRocketsText
	waitbutton
	closetext
	end

.NoMoreBadBoat:
	writetext SunPointDocksSunPointGateOfficerGoodText
	waitbutton
	closetext
	end

SunPointDocksSunPointGateOfficerRocketsText:
	text "There's something"
	line "strange going on"
	cont "out at the DOCKS."
	para "Mysterious figures"
	line "have been bringing"
	para "lots of covered"
	line "shipments through"
	cont "this gate."
	para "They don't seem to"
	line "be breaking any"
	para "laws, so I guess"
	line "it's none of my"
	cont "business…"
	para "But they make me"
	line "uneasy…"
	done

SunPointDocksSunPointGateOfficerGoodText:
	text "SUNPOINT DOCKS"
	line "are always busy"
	cont "and lively."
	para "It's a great place"
	line "to people-watch."
	done

SunPointDocksSunPointGate_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  4,  0, SUNPOINT_DOCKS, 1
	warp_event  5,  0, SUNPOINT_DOCKS, 2
	warp_event  4,  7, SUNPOINT_CITY, 7
	warp_event  5,  7, SUNPOINT_CITY, 8

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  0,  4, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SunPointDocksSunPointGateOfficerScript, -1
