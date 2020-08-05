	const_def 2 ; object constants
	const CIANWOODCITY_STANDING_YOUNGSTER
	const CIANWOODCITY_POKEFAN_M
	const CIANWOODCITY_LASS
	const CIANWOODCITY_ROCK1
	const CIANWOODCITY_ROCK3
	const CIANWOODCITY_POKEFAN_F
	const CIANWOODCITY_BALL


CianwoodCity_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_CIANWOODCITY_NOTHING
	scene_script .DummyScene1 ; SCENE_CIANWOODCITY_SUICUNE_AND_EUSINE

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint


.DummyScene0:
	end

.DummyScene1:
	end

.FlyPoint:
	setflag ENGINE_FLYPOINT_CIANWOOD
	setevent EVENT_CINNABAR_ROCKS_CLEARED
	return


CianwoodCityChucksWife:
	jumptextfaceplayer ChucksWifeFlySpeechText

CianwoodCityYoungster:
	jumptextfaceplayer CianwoodCityYoungsterText

CianwoodCityPokefanM:
	jumptextfaceplayer CianwoodCityPokefanMText

CianwoodCityLass:
	jumptextfaceplayer CianwoodCityLassText

CianwoodCityUnusedScript:
; unreferenced
	jumptextfaceplayer CianwoodCityUnusedText

CianwoodCitySign:
	jumptext CianwoodCitySignText
	
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

CianwoodCityRock:
	jumpstd smashrock

CianwoodCityHiddenRevive:
	hiddenitem REVIVE, EVENT_CIANWOOD_CITY_HIDDEN_REVIVE

CianwoodCityHiddenMaxEther:
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

CianwoodCityYoungsterText:
	text "Have you ever been"
	line "to BLUE FOREST?"
	para "It's cold and"
	line "snowy over there."
	para "I couldn't live"
	line "there!"
	para "The cold is not"
	line "for me."
	done

CianwoodCityPokefanMText:
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

CianwoodCityLassText:
	text "This city doesn't"
	line "have a GYM."
	para "I don't think it"
	line "needs one, though."
	done

CianwoodCityUnusedText:
; unused
	text "There are several"
	line "islands between"
	cont "here and OLIVINE."

	para "A mythical sea"
	line "creature supposed-"
	cont "ly lives there."
	done


CianwoodCitySignText:
	text "SOUTH POINT"
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

CianwoodCity_MapEvents:
	db 0, 0 ; filler

	db 10 ; warp events
	warp_event 18, 13, ICE_PATH_B2F_BLACKTHORN_SIDE, 1
	warp_event 33, 16, CIANWOOD_POKECENTER_1F, 1
	warp_event 19, 24, PEWTER_MART, 1
	warp_event 33, 25, CIANWOOD_PHOTO_STUDIO, 1
	warp_event 35, 11, ROUTE_7_SAFFRON_GATE, 1
	warp_event 26, 12, POKE_SEERS_HOUSE, 1
	warp_event 30,  5, ROUTE_5_SAFFRON_GATE, 3
	warp_event 31,  5, ROUTE_5_SAFFRON_GATE, 4
	warp_event 30, 31, ROUTE_15_FUCHSIA_GATE, 1
	warp_event 31, 31, ROUTE_15_FUCHSIA_GATE, 2

	db 0 ; coord events

	db 7 ; bg events
	bg_event 28, 20, BGEVENT_READ, CianwoodCitySign
	bg_event 23, 33, BGEVENT_ITEM, CianwoodHiddenWaterStone
	bg_event 34, 16, BGEVENT_READ, CianwoodPokecenterSign
	bg_event 20, 24, BGEVENT_READ, CianwoodPharmacySign
	bg_event 16, 24, BGEVENT_READ, CianwoodPhotoStudioSign
	bg_event 30, 16, BGEVENT_READ, CianwoodPokeSeerSign
	bg_event 35, 27, BGEVENT_ITEM, CianwoodCityHiddenRevive

	db 7 ; object events
	object_event 27, 15, SPRITE_FISHING_GURU, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CianwoodCityYoungster, -1
	object_event 16, 29, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_DOWN, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CianwoodCityPokefanM, -1
	object_event 27, 22, SPRITE_ROCKER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CianwoodCityLass, -1
	object_event 19, 19, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CianwoodCityRock, -1
	object_event 17, 18, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CianwoodCityRock, -1
	object_event 15, 29, SPRITE_LASS, SPRITEMOVEDATA_STANDING_DOWN, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CianwoodCityChucksWife, -1
	object_event 7,  26, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, CianwoodCityHiddenMaxEther, EVENT_CIANWOOD_CITY_HIDDEN_MAX_ETHER
