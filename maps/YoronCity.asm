	const_def 2 ; object constants
	const PEWTERCITY_FRUIT_TREE1
	const PEWTERCITY_FRUIT_TREE2
	const PEWTERCITY_FISHER
	const PEWTERCITY_LASS
	const PEWTERCITY_TEACHER
	const PEWTERCITY_ROCKER

YoronCity_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint

.FlyPoint:
	setflag ENGINE_FLYPOINT_PEWTER
	return

YoronCityPokecenterSign:
	jumpstd pokecentersign

YoronCityMartSign:
	jumpstd martsign

YoronCitySign:
	jumptext YoronCitySignText
	
UrumaCavernSign:
	jumptext UrumaCavernSignText

YoronCityFruitTree1:
	fruittree FRUITTREE_PEWTER_CITY_1

YoronCityFruitTree2:
	fruittree FRUITTREE_PEWTER_CITY_2
	
YoronCityFisherScript:
	jumptextfaceplayer YoronCityFisherText	

YoronCityLassScript:
	jumptextfaceplayer YoronCityLassText
	
YoronCityTeacherScript:
	jumptextfaceplayer YoronCityTeacherText

YoronCityRockerScript:
	jumptextfaceplayer YoronCityRockerText
	
YoronCityFisherText:
	text "It's cold over in"
	line "URUMA CAVERN."
	para "Be prepared for"
	line "that if you go"
	cont "exploring."
	done
	
YoronCityLassText:
	text "You've been to"
	line "NORTH ISLAND?"
	para "Wow, that's so far"
	line "from here."
	done
	
YoronCityTeacherText:
	text "You look like"
	line "you're ready to go"
	para "anywhere with"
	line "#MON."
	done
	
YoronCityRockerText:
	text "The climate isn't"
	line "as tropical here"
	cont "as RYUKYU CITY,"
	para "so we don't get as"
	line "many tourists."
	done
	
YoronCitySignText:
	text "YORON CITY"
	para "The rocky mountain"
	line "town."
	done
	
UrumaCavernSignText:
	text "URUMA CAVERN"
	line "ENTRANCE"
	done

YoronCity_MapEvents:
	db 0, 0 ; filler

	db 6 ; warp events
	warp_event  7,  6, NAGO_MART, 1
	warp_event 25, 18, YORON_POKECENTER_1F, 1
	warp_event  7, 25, YORON_PARTS_SHOP, 1
	warp_event 21, 13, YORON_SNOOZE_SPEECH_HOUSE, 1
	warp_event 17, 23, YORON_SOCIAL_HOUSE, 1
	warp_event 15,  5, ICED_CAVERN_1F, 8

	db 0 ; coord events

	db 4 ; bg events
	bg_event 26, 18, BGEVENT_READ, YoronCityPokecenterSign
	bg_event  8,  6, BGEVENT_READ, YoronCityMartSign
	bg_event 28, 18, BGEVENT_READ, YoronCitySign
	bg_event 18,  7, BGEVENT_READ, UrumaCavernSign

	db 6 ; object events
	object_event 18, 12, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, YoronCityFruitTree1, -1
	object_event 16, 13, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, YoronCityFruitTree2, -1
	object_event 12, 19, SPRITE_FISHER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, YoronCityFisherScript, -1
	object_event 25, 23, SPRITE_LASS, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, YoronCityLassScript, -1
	object_event 12,  8, SPRITE_TEACHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, YoronCityTeacherScript, -1
	object_event 14, 27, SPRITE_ROCKER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, YoronCityRockerScript, -1
