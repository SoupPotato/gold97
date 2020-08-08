	const_def 2 ; object constants
	const CIANWOODCITY_STANDING_YOUNGSTER
	const CIANWOODCITY_POKEFAN_M
	const CIANWOODCITY_LASS
	const CIANWOODCITY_ROCK1
	const CIANWOODCITY_ROCK3
	const CIANWOODCITY_POKEFAN_F
	const CIANWOODCITY_BALL


SunpointCity_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint

.FlyPoint:
	setflag ENGINE_FLYPOINT_CIANWOOD
	setevent EVENT_CINNABAR_ROCKS_CLEARED
	return


SunpointCityChucksWife:
	jumptextfaceplayer ChucksWifeFlySpeechText

SunpointCityYoungster:
	jumptextfaceplayer SunpointCityYoungsterText

SunpointCityPokefanM:
	jumptextfaceplayer SunpointCityPokefanMText

SunpointCityLass:
	jumptextfaceplayer SunpointCityLassText

SunpointCityUnusedScript:
; unreferenced
	jumptextfaceplayer SunpointCityUnusedText

SunpointCitySign:
	jumptext SunpointCitySignText
	
CianwoodHiddenWaterStone:
	hiddenitem WATER_STONE, EVENT_SOUTH_POINT_HIDDEN_WATER_STONE

CianwoodPharmacySign:
	jumpstd martsign

CianwoodPhotoStudioSign:
	jumptext CianwoodPhotoStudioSignText

CianwoodPokeSeerSign:
	jumptext CianwoodPokeSeerSignText

CianwoodPokecenterSign:
	;giveitem HM_ROCK_SMASH
	;setflag ENGINE_STORMBADGE
	jumpstd pokecentersign

SunpointCityRock:
	jumpstd smashrock

SunpointCityHiddenRevive:
	hiddenitem REVIVE, EVENT_CIANWOOD_CITY_HIDDEN_REVIVE

SunpointCityHiddenMaxEther:
	itemball MAX_ETHER

ChucksWifeFlySpeechText:
	text "The climate on"
	line "this side of NIHON"
	para "is considerably"
	line "warmer than the"
	cont "rest of it."
	done

ChucksWifeChubbyText:
	text "My husband lost to"
	line "you, so he needs"
	cont "to train harder."

	para "That's good, since"
	line "he was getting a"
	cont "little chubby."
	done

SunpointCityYoungsterText:
	text "Have you ever been"
	line "to BLUE FOREST?"
	para "It's cold and"
	line "snowy over there."
	para "I couldn't live"
	line "there!"
	para "The cold is not"
	line "for me."
	done

SunpointCityPokefanMText:
	text "Rare #MON are"
	line "said to live in"
	cont "the MOUNTAIN CAVE."
	para "It's hard to get"
	line "into the cave"
	para "because rocks from"
	line "it often fall down"
	para "and block the"
	line "entrance."
	done

SunpointCityLassText:
	text "This city doesn't"
	line "have a GYM."
	para "I don't think it"
	line "needs one, though."
	done

SunpointCityUnusedText:
; unused
	text "There are several"
	line "islands between"
	cont "here and OLIVINE."

	para "A mythical sea"
	line "creature supposed-"
	cont "ly lives there."
	done


SunpointCitySignText:
	text "SUNPOINT"
	para "NIHON's link for"
	line "international"
	cont "trade."
	done

CianwoodGymSignText:
	text "CIANWOOD CITY"
	line "#MON GYM"

	para "LEADER: CHUCK"

	para "His Roaring Fists"
	line "Do the Talking"
	done

CianwoodPharmacySignText:
	text "500 Years of"
	line "Tradition"

	para "CIANWOOD CITY"
	line "PHARMACY"

	para "We Await Your"
	line "Medicinal Queries"
	done

CianwoodPhotoStudioSignText:
	text "TRAINER TIPS"
	para "Certain HM moves"
	line "require BADGEs to"
	para "use outside of"
	line "battle!"
	para "The moves can"
	line "still be used in"
	cont "battle, though."
	done

CianwoodPokeSeerSignText:
	text "NOTICE:"
	para "Dangerous rocks"
	line "frequently fall"
	para "from the MOUNTAIN"
	line "CAVE."
	para "Use proper caution"
	line "if approaching."
	done

SunpointCity_MapEvents:
	db 0, 0 ; filler

	db 10 ; warp events
	warp_event 18, 13, MAGMA_SHAFT_1F, 1
	warp_event 33, 16, SUNPOINT_POKECENTER_1F, 1
	warp_event 19, 24, YORON_MART, 1
	warp_event 33, 25, SUNPOINT_PHOTO_STUDIO, 1
	warp_event 35, 11, ROUTE_118_SUNPOINT_GATE, 1
	warp_event 26, 12, POKE_SEERS_HOUSE, 1
	warp_event 30,  5, SUNPOINT_DOCKS_SUNPOINT_GATE, 3
	warp_event 31,  5, SUNPOINT_DOCKS_SUNPOINT_GATE, 4
	warp_event 30, 31, ROUTE_119_SUNPOINT_GATE, 1
	warp_event 31, 31, ROUTE_119_SUNPOINT_GATE, 2

	db 0 ; coord events

	db 7 ; bg events
	bg_event 28, 20, BGEVENT_READ, SunpointCitySign
	bg_event 23, 33, BGEVENT_ITEM, CianwoodHiddenWaterStone
	bg_event 34, 16, BGEVENT_READ, CianwoodPokecenterSign
	bg_event 20, 24, BGEVENT_READ, CianwoodPharmacySign
	bg_event 16, 24, BGEVENT_READ, CianwoodPhotoStudioSign
	bg_event 30, 16, BGEVENT_READ, CianwoodPokeSeerSign
	bg_event 35, 27, BGEVENT_ITEM, SunpointCityHiddenRevive

	db 7 ; object events
	object_event 27, 15, SPRITE_FISHING_GURU, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, SunpointCityYoungster, -1
	object_event 16, 29, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_DOWN, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SunpointCityPokefanM, -1
	object_event 27, 22, SPRITE_ROCKER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SunpointCityLass, -1
	object_event 19, 19, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SunpointCityRock, -1
	object_event 17, 18, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SunpointCityRock, -1
	object_event 15, 29, SPRITE_LASS, SPRITEMOVEDATA_STANDING_DOWN, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SunpointCityChucksWife, -1
	object_event 7,  26, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SunpointCityHiddenMaxEther, EVENT_CIANWOOD_CITY_HIDDEN_MAX_ETHER
