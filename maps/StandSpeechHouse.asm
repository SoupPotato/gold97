	const_def 2 ; object constants
	const STANDSPEECHHOUSE_YOUNGSTER

StandSpeechHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

StandSpeechHouseYoungsterScript:
	faceplayer
	opentext
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .BillsBrotherRocketsGone
	writetext StandSpeechHouseYoungsterText
	waitbutton
	closetext
	end
	
.BillsBrotherRocketsGone
	writetext StandSpeechHouseYoungsterAllGoodText
	waitbutton
	closetext
	end
	

StandSpeechHouseYoungsterText:
	text "The house next"
	line "door is really"
	cont "suspicious."
	para "That seems to be"
	line "where all of these"
	para "TEAM ROCKET"
	line "members are coming"
	cont "and going from."
	done

StandSpeechHouseYoungsterAllGoodText:
	text "STAND CITY is no"
	line "place for crime."
	para "Good riddance to"
	line "TEAM ROCKET!"
	done

StandSpeechHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, STAND_CITY, 4
	warp_event  5,  7, STAND_CITY, 4

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  2,  3, SPRITE_SUPER_NERD, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, StandSpeechHouseYoungsterScript, -1
