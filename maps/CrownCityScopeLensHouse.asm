	const_def 2 ; object constants
	const CIANWOOD_BLISSEY_SPEECH_HOUSE_GRANNY

CrownCityScopeLensHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	
CrownCityScopeLensHouseGrannyScript:
	faceplayer
	opentext
	checkevent EVENT_SWITCH_10
	iftrue .alreadygavescopelens
	writetext CrownCityScopeLensHouseGrannyText1
	waitbutton
	verbosegiveitem SCOPE_LENS
	iffalse .Done
	setevent EVENT_SWITCH_10
	jump .alreadygavescopelens
	end
	
.alreadygavescopelens
	writetext CrownCityScopeLensHouseGrannyText2
	waitbutton
	closetext
	end
	
.Done
	closetext
	end
	
CrownCityScopeLensHouseGrannyText1:
	text "I was a LEAGUE"
	line "challenger back in"
	cont "my day."
	para "You know what the"
	line "secret is?"
	para "Strategy. It's"
	line "knowing how to use"
	cont "items."
	para "Here, I've got a"
	line "good one for you."
	done
	
CrownCityScopeLensHouseGrannyText2:
	text "SCOPE LENS makes"
	line "your #MON more"
	para "likely to land"
	line "critical hits."
	para "They won't know"
	line "what hit them!"
	done

CrownCityScopeLensHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, CROWN_CITY, 6
	warp_event  5,  7, CROWN_CITY, 6

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  7,  3, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CrownCityScopeLensHouseGrannyScript, -1
