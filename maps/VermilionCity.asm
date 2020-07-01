	const_def 2 ; object constants
	const VERMILION_CITY_BUG_CATCHER
	const VERMILION_CITY_LASS
	const VERMILION_GRAMPS

VermilionCity_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint

.FlyPoint:
	setflag ENGINE_FLYPOINT_VERMILION
	return

AmamiTownPokecenterSign:
	jumpstd pokecentersign

AmamiTownMartSign:
	jumpstd martsign
	
AmamiPoolSign:
	jumptext AmamiPoolText
	
AmamiTownSign:
	jumptext AmamiTownSignText
	
VermilionCityBugCatcherScript:
	jumptextfaceplayer VermilionCityBugCatcherText
	
VermilionCityLassScript:
	faceplayer
	opentext
	checkevent EVENT_FAST_SHIP_CABINS_SE_SSE_GENTLEMAN
	iffalse .FirstTimeLass
	writetext VermilionCityLassText2
	waitbutton
	closetext
	end
	
.FirstTimeLass
	writetext VermilionCityLassText1
	waitbutton
	closetext
	end
	
VermilionCityGrampsScript:
	jumptextfaceplayer VermilionCityGrampsText
	
VermilionCityGrampsText:
	text "I've lived on this"
	line "island my whole"
	cont "life."
	para "I wouldn't have"
	line "had it any other"
	cont "way."
	done
	
VermilionCityLassText1:
	text "This is your first"
	line "visit to AMAMI"
	cont "TOWN, right?"
	para "Welcome!"
	done
	
VermilionCityLassText2:
	text "We get a lot of"
	line "visitors here."
	para "Tourism is a very"
	line "important industry"
	cont "in this area."
	done

VermilionCityBugCatcherText:
	text "I've never been to"
	line "the mainland."
	para "One day, I want to"
	line "ride on a FAST"
	cont "SHIP!"
	done

AmamiTownSignText:
	text "AMAMI TOWN"
	para "A destination for"
	line "adventurers!"
	done
	
AmamiPoolText:
	text "AMAMI TOWN"
	line "COMMUNITY POOL"
	done
	
VermilionCity_MapEvents:
	db 0, 0 ; filler

	db 9 ; warp events
	warp_event  4,  2, VERMILION_PORT_PASSAGE, 1
	warp_event  4,  3, VERMILION_PORT_PASSAGE, 2
	warp_event 17,  4, VERMILION_POKECENTER_1F, 1
	warp_event 35, 15, VIRIDIAN_POKECENTER_1F, 1
	warp_event 24,  5, VERMILION_GYM, 1
	warp_event 25,  5, VERMILION_GYM, 2
	warp_event 23, 10, VERMILION_MART, 1
	warp_event 31,  5, ROUTE_12_SUPER_ROD_HOUSE, 1
	warp_event 31, 13, VERMILION_DIGLETTS_CAVE_SPEECH_HOUSE, 1

	db 0 ; coord events

	db 4 ; bg events
	bg_event 12,  4, BGEVENT_READ, AmamiTownSign
	bg_event 28,  5, BGEVENT_READ, AmamiPoolSign
	bg_event 18,  4, BGEVENT_READ, AmamiTownPokecenterSign
	bg_event 24, 10, BGEVENT_READ, AmamiTownMartSign

	db 3 ; object events
	object_event  8,  7, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VermilionCityBugCatcherScript, -1
	object_event 15, 11, SPRITE_LASS, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VermilionCityLassScript, -1
	object_event 27,  8, SPRITE_GRAMPS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VermilionCityGrampsScript, -1
