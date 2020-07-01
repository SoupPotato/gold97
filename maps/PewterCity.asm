	const_def 2 ; object constants
	const PEWTERCITY_FRUIT_TREE1
	const PEWTERCITY_FRUIT_TREE2
	const PEWTERCITY_FISHER
	const PEWTERCITY_LASS
	const PEWTERCITY_TEACHER
	const PEWTERCITY_ROCKER

PewterCity_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint

.FlyPoint:
	setflag ENGINE_FLYPOINT_PEWTER
	return

PewterCityPokecenterSign:
	jumpstd pokecentersign

PewterCityMartSign:
	jumpstd martsign

PewterCitySign:
	jumptext PewterCitySignText
	
UrumaCavernSign:
	jumptext UrumaCavernSignText

PewterCityFruitTree1:
	fruittree FRUITTREE_PEWTER_CITY_1

PewterCityFruitTree2:
	fruittree FRUITTREE_PEWTER_CITY_2
	
PewterCityFisherScript:
	jumptextfaceplayer PewterCityFisherText	

PewterCityLassScript:
	jumptextfaceplayer PewterCityLassText
	
PewterCityTeacherScript:
	jumptextfaceplayer PewterCityTeacherText

PewterCityRockerScript:
	jumptextfaceplayer PewterCityRockerText
	
PewterCityFisherText:
	text "It's cold over in"
	line "URUMA CAVERN."
	para "Be prepared for"
	line "that if you go"
	cont "exploring."
	done
	
PewterCityLassText:
	text "You've been to"
	line "NORTH ISLAND?"
	para "Wow, that's so far"
	line "from here."
	done
	
PewterCityTeacherText:
	text "You look like"
	line "you're ready to go"
	para "anywhere with"
	line "#MON."
	done
	
PewterCityRockerText:
	text "The climate isn't"
	line "as tropical here"
	cont "as RYUKYU CITY,"
	para "so we don't get as"
	line "many tourists."
	done
	
PewterCitySignText:
	text "YORON CITY"
	para "The rocky mountain"
	line "town."
	done
	
UrumaCavernSignText:
	text "URUMA CAVERN"
	line "ENTRANCE"
	done

PewterCity_MapEvents:
	db 0, 0 ; filler

	db 6 ; warp events
	warp_event  7,  6, CERULEAN_MART, 1
	warp_event 25, 18, PEWTER_POKECENTER_1F, 1
	warp_event  7, 25, PEWTER_NIDORAN_SPEECH_HOUSE, 1
	warp_event 21, 13, PEWTER_SNOOZE_SPEECH_HOUSE, 1
	warp_event 17, 23, PEWTER_GYM, 1
	warp_event 15,  5, MOUNT_MORTAR_2F_INSIDE, 8

	db 0 ; coord events

	db 4 ; bg events
	bg_event 26, 18, BGEVENT_READ, PewterCityPokecenterSign
	bg_event  8,  6, BGEVENT_READ, PewterCityMartSign
	bg_event 28, 18, BGEVENT_READ, PewterCitySign
	bg_event 18,  7, BGEVENT_READ, UrumaCavernSign

	db 6 ; object events
	object_event 18, 12, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PewterCityFruitTree1, -1
	object_event 16, 13, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PewterCityFruitTree2, -1
	object_event 12, 19, SPRITE_FISHER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PewterCityFisherScript, -1
	object_event 25, 23, SPRITE_LASS, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PewterCityLassScript, -1
	object_event 12,  8, SPRITE_TEACHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PewterCityTeacherScript, -1
	object_event 14, 27, SPRITE_ROCKER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PewterCityRockerScript, -1
