	const_def 2 ; object constants
	const SAFFRON_POKEFAN_M
	const SAFFRON_TEACHER
	const SAFFRON_TWIN
	const SAFFRON_BUG_CATCHER
	const SAFFRON_LASS
	const SAFFRON_COOLTRAINER_M
	const SAFFRON_SWIMMER_GUY
	const SAFFRON_SWIMMER_GIRL

RyukyuCity_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint

.FlyPoint:
	setflag ENGINE_FLYPOINT_SAFFRON
	return

RyukyuCityPokecenterSign:
	jumpstd pokecentersign

RyukyuCityMartSign:
	jumpstd martsign
	
RyukyuCitySign:
	jumptext RyukyuCitySignText
	
SaffronPokefanMScript:
	jumptextfaceplayer SaffronPokefanMText
	
SaffronTeacherScript:
	jumptextfaceplayer SaffronTeacherText
	
SaffronTwinScript:
	jumptextfaceplayer SaffronTwinText
	
SaffronBugCatcherScript:
	jumptextfaceplayer SaffronBugCatcherText
	
SaffronLassScript:
	jumptextfaceplayer SaffronLassText
	
SaffronCooltrainerMScript:
	jumptextfaceplayer SaffronCooltrainerMText
	
SaffronSwimmerGuyScript:
	jumptextfaceplayer SaffronSwimmerGuyText
	
SaffronSwimmerGirlScript:
	jumptextfaceplayer SaffronSwimmerGirlText

	
FireStarterTest:
	clearevent EVENT_GOT_CRUIZE_FROM_ELM
	clearevent EVENT_GOT_CHIKORITA_FROM_ELM
	setevent EVENT_GOT_FLAMBEAR_FROM_ELM
	jumptext FireStarterTestText
	
WaterStarterTest:
	setevent EVENT_GOT_CRUIZE_FROM_ELM
	clearevent EVENT_GOT_CHIKORITA_FROM_ELM
	clearevent EVENT_GOT_FLAMBEAR_FROM_ELM
	jumptext WaterStarterTestText
	
	
GrassStarterTest:
	clearevent EVENT_GOT_CRUIZE_FROM_ELM
	setevent EVENT_GOT_CHIKORITA_FROM_ELM
	clearevent EVENT_GOT_FLAMBEAR_FROM_ELM
	jumptext GrassStarterTestText
	
GrassStarterTestText:
	text "grass"
	done

WaterStarterTestText:
	text "water"
	done
	
FireStarterTestText:
	text "fire"
	done
	
RyukyuCitySignText:
	text "RYUKYU CITY -"
	para "The SOUTHWEST"
	line "ISLANDS' shining"
	cont "gem."
	done

SaffronTeacherText:
	text "Now now, children."
	para "Don't just run off"
	line "into the ocean!"
	done
	
SaffronPokefanMText:
	text "The weather is"
	line "perfect here, if a"
	cont "bit humid."
	done
	
SaffronBugCatcherText:
	text "I wanna go"
	line "swimming!"
	done
	
SaffronTwinText:
	text "Let's get some"
	line "ice cream!"
	done
	
SaffronCooltrainerMText:
	text "I think I'll go"
	line "out on a boat"
	cont "today."
	done
	
SaffronLassText:
	text "Many of the people"
	line "you see in this"
	para "city don't live"
	line "here."
	done
	
SaffronSwimmerGuyText:
	text "I come here on"
	line "vacation whenever"
	cont "I get the chance!"
	done
	
SaffronSwimmerGirlText:
	text "There's nowhere"
	line "better to relax"
	cont "than right here!"
	done

RyukyuCity_MapEvents:
	db 0, 0 ; filler

	db 10 ; warp events
	warp_event 29, 26, RYUKYU_MART, 1
	warp_event 11,  4, RYUKYU_POKECENTER_1F, 1
	warp_event 33, 11, RYUKYU_CITY_MERIDIAN_PATH_GATE, 1
	warp_event 22, 31, RYUKYU_URASOE_GATE, 1
	warp_event 23, 31, RYUKYU_URASOE_GATE, 2
	warp_event 23,  7, MR_PSYCHICS_HOUSE, 1
	warp_event 28, 18, RYUKYU_TRADE_SPEECH_HOUSE, 1
	warp_event 27,  8, RYUKYU_ABORETUM, 1
	warp_event 28,  8, RYUKYU_ABORETUM, 2
	warp_event 14, 23, RYUKYU_FAKE_GYM, 1


	db 0 ; coord events

	db 6 ; bg events
	bg_event 12,  4, BGEVENT_READ, RyukyuCityPokecenterSign
	bg_event 30, 26, BGEVENT_READ, RyukyuCityMartSign
	bg_event 22, 12, BGEVENT_READ, RyukyuCitySign
	bg_event 16, 22, BGEVENT_READ, FireStarterTest
	bg_event 16, 21, BGEVENT_READ, WaterStarterTest
	bg_event 15, 22, BGEVENT_READ, GrassStarterTest

	db 8 ; object events
	object_event 26, 12, SPRITE_POKEFAN_M, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SaffronPokefanMScript, -1
	object_event 11, 12, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SaffronTeacherScript, -1
	object_event 11, 13, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, SaffronTwinScript, -1
	object_event 11, 11, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SaffronBugCatcherScript, -1
	object_event 20, 25, SPRITE_LASS, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SaffronLassScript, -1
	object_event  9, 19, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, SaffronCooltrainerMScript, -1
	object_event  5, 20, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, SaffronSwimmerGuyScript, -1
	object_event  6, 10, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, SaffronSwimmerGirlScript, -1
