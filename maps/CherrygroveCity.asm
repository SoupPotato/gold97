	const_def 2 ; object constants
	const CHERRYGROVE_CITY_LASS
	const CHERRYGROVE_CITY_ROCKER
	const CHERRYGROVE_CITY_JANINE

CherrygroveCity_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint

.FlyPoint:
	setflag ENGINE_FLYPOINT_CHERRYGROVE
	return

CherryGroveLassCoordScript:
	turnobject PLAYER, RIGHT
	turnobject CHERRYGROVE_CITY_LASS, LEFT
	opentext
	writetext GoTrainerText
	waitbutton
	closetext
	setscene SCENE_CHERRYGROVECITY_NOTHING
	end

CherrygroveCityLassScript:
	faceplayer
	opentext
	writetext GoTrainerText
	waitbutton
	closetext
	setscene SCENE_CHERRYGROVECITY_NOTHING
	end
	
CherrygroveCityPokecenterSign:
	jumpstd pokecentersign
	
CherrygroveCityMartSign:
	jumpstd martsign
	
CherrygroveCitySign:
	jumptext CherrygroveCitySignText
	
CherrygroveCitySign2:
	jumptext CherrygroveCitySign2Text
	
CherrygroveCityRockerScript:
	jumptextfaceplayer CherrygroveCityRockerText
	
CherrygroveCityJanineScript:
	jumptextfaceplayer CherrygroveCityJanineText
	
CherrygroveCityJanineText:
	text "My older brother"
	line "challenged the"
	cont "LEAGUE once."
	para "He couldn't de-"
	line "feat them."
	done
	
CherrygroveCityRockerText:
	text "As imposing as"
	line "MT.FUJI is, this"
	para "town at the base"
	line "of the mountain"
	cont "is really scenic."
	done
	
CherrygroveCitySign2Text:
	text "PRINCE CITY"
	line "TRAINER HOUSE"
	done
	
CherrygroveCitySignText:
	text "PRINCE CITY"
	para "The base camp for"
	line "LEAGUE Challengers"
	done
	
GoTrainerText:
	text "Trainer!"
	para "You are here"
	line "because you have"
	para "committed to"
	line "climbing MT.FUJI!"
	para "Gather your best"
	line "team of #MON"
	para "and all of your"
	line "strength!"
	para "Ascend the water-"
	line "fall and begin"
	cont "your climb!"
	para "The LEAGUE awaits!"
	done

CherrygroveCity_MapEvents:
	db 0, 0 ; filler

	db 9 ; warp events
	warp_event 10, 25, UNDERGROUND_PATH, 3
	warp_event 11, 25, UNDERGROUND_PATH, 3
	warp_event  5, 22, CHERRYGROVE_POKECENTER_1F, 1
	warp_event 11, 22, CHERRYGROVE_MART, 1
	warp_event  9,  1, VICTORY_ROAD, 1
	warp_event  3, 17, CIANWOOD_BLISSEY_SPEECH_HOUSE, 1
	warp_event 15, 19, CIANWOOD_PHARMACY, 1
	warp_event 14, 15, ROUTE_16_FUCHSIA_SPEECH_HOUSE, 1
	warp_event 15, 15, ROUTE_16_FUCHSIA_SPEECH_HOUSE, 2

	db 1 ; coord events
	coord_event  8, 16, SCENE_CHERRYGROVECITY_MEET_RIVAL, CherryGroveLassCoordScript

	db 4 ; bg events
	bg_event  6, 22, BGEVENT_READ, CherrygroveCityPokecenterSign
	bg_event 12, 22, BGEVENT_READ, CherrygroveCityMartSign
	bg_event 10, 16, BGEVENT_READ, CherrygroveCitySign
	bg_event 16, 16, BGEVENT_READ, CherrygroveCitySign2

	db 3 ; object events
	object_event  9, 16, SPRITE_LASS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CherrygroveCityLassScript, -1
	object_event 12, 19, SPRITE_ROCKER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CherrygroveCityRockerScript, -1
	object_event  4, 19, SPRITE_JANINE, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CherrygroveCityJanineScript, -1
