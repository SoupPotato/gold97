	const_def 2 ; object constants
	const CERULEAN_CITY_TEACHER
	const CERULEAN_CITY_FISHING_GURU

CeruleanCity_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint

.FlyPoint:
	setflag ENGINE_FLYPOINT_CERULEAN
	return

CeruleanCityPokecenterSign:
	jumpstd pokecentersign
	
CeruleanCitySign:
	jumptext CeruleanCitySignText

CeruleanCityHiddenBerserkGene:
	hiddenitem BERSERK_GENE, EVENT_FOUND_BERSERK_GENE_IN_CERULEAN_CITY
	
CeruleanCityTeacherScript:
	jumptextfaceplayer CeruleanCityTeacherText
	
CeruleanCityFishingGuruScript:
	jumptextfaceplayer CeruleanCityFishingGuruText
	
CeruleanCityFishingGuruText:
	text "If nothing else,"
	line "this town is great"
	cont "for fishing!"
	done
	
CeruleanCityTeacherText:
	text "And just as soon"
	line "as you get to this"
	para "town, you can pass"
	line "through it."
	para "There's really not"
	line "much here, but I"
	para "hope you at least"
	line "find it charming."
	done
	
CeruleanCitySignText:
	text "NAGO VILLAGE -"
	para "A quiet seaside"
	line "settlement."
	done

CeruleanCity_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  5,  4, CERULEAN_POKECENTER_1F, 1
	warp_event 10, 15, CERULEAN_POLICE_STATION, 1
	warp_event  5, 21, VERMILION_MAGNET_TRAIN_SPEECH_HOUSE, 1

	db 0 ; coord events

	db 3 ; bg events
	bg_event  6,  4, BGEVENT_READ, CeruleanCityPokecenterSign
	bg_event  9,  2, BGEVENT_ITEM, CeruleanCityHiddenBerserkGene
	bg_event  7, 11, BGEVENT_READ, CeruleanCitySign

	db 2 ; object events
	object_event  7,  9, SPRITE_TEACHER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CeruleanCityTeacherScript, -1
	object_event 17, 20, SPRITE_FISHING_GURU, SPRITEMOVEDATA_STANDING_RIGHT, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CeruleanCityFishingGuruScript, -1
