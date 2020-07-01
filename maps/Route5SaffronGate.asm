	const_def 2 ; object constants
	const ROUTE5SAFFRONGATE_OFFICER

Route5SaffronGate_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks


Route5SaffronGateOfficerScript:
	faceplayer
	opentext
	checkevent EVENT_ROUTE_5_6_POKEFAN_M_BLOCKS_UNDERGROUND_PATH
	iftrue .NoMoreBadBoat
	writetext Route5SaffronGateOfficerRocketsText
	waitbutton
	closetext
	end

.NoMoreBadBoat:
	writetext Route5SaffronGateOfficerGoodText
	waitbutton
	closetext
	end

Route5SaffronGateOfficerRocketsText:
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

Route5SaffronGateOfficerGoodText:
	text "SOUTH POINT DOCKS"
	line "are always busy"
	cont "and lively."
	para "It's a great place"
	line "to people-watch."
	done

Route5SaffronGate_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  4,  0, ROUTE_5, 2
	warp_event  5,  0, ROUTE_5, 3
	warp_event  4,  7, CIANWOOD_CITY, 8
	warp_event  5,  7, CIANWOOD_CITY, 9

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  0,  4, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route5SaffronGateOfficerScript, -1
