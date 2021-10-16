	const_def 2 ; object constants
	const PEWTER_GYM_N64_LASS
	const PEWTER_GYM_YOUNGSTER
	const PEWTER_GYM_COOLTRAINER_F
	const PEWTER_GYM_POKEFAN_F
	const PEWTER_GYM_FISHER

KumeSocialHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

KumeSocialHouseN64LassScript:
	faceplayer
	opentext
	writetext SendN64LassOffText
	waitbutton
	closetext
	checkcode VAR_FACING
	ifequal RIGHT, KumeSocialHouseN64LassRightScript
	jump KumeSocialHouseN64LassUpScript
	end
	
KumeSocialHouseN64LassRightScript:
	applymovement PEWTER_GYM_N64_LASS, KumeSocialHouseN64LassRightMovement
	playsound SFX_EXIT_BUILDING
	disappear PEWTER_GYM_N64_LASS
	setevent EVENT_KUME_N64_LASS_AT_SOCIAL_HOUSE
	clearevent EVENT_KUME_LASS_AT_N64_HOUSE
	waitsfx
	end
	
KumeSocialHouseN64LassUpScript:
	applymovement PEWTER_GYM_N64_LASS, KumeSocialHouseN64LassUpMovement
	playsound SFX_EXIT_BUILDING
	disappear PEWTER_GYM_N64_LASS
	setevent EVENT_KUME_N64_LASS_AT_SOCIAL_HOUSE
	clearevent EVENT_KUME_LASS_AT_N64_HOUSE
	waitsfx
	end
	
KumeSocialHouseYoungsterScript:
	jumptextfaceplayer KumeSocialHouseYoungsterText
	
KumeSocialHouseCooltrainerfScript:
	jumptextfaceplayer KumeSocialHouseCooltrainerfText
	
KumeSocialHousePokefanfScript:
	jumptextfaceplayer KumeSocialHousePokefanfText
	
KumeSocialHouseFisherScript:
	jumptextfaceplayer KumeSocialHouseFisherText
	
KumeSocialHouseN64LassRightMovement:
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end
	
KumeSocialHouseN64LassUpMovement:
	step LEFT
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end
	
KumeSocialHouseYoungsterText:
	text "I think KOGA is"
	line "the coolest member"
	cont "of the ELITE FOUR."
	para "It's not even"
	line "close!"
	done
	
KumeSocialHouseCooltrainerfText:
	text "It's definitely"
	line "LORELEI who is"
	cont "the coolest!"
	para "She has so much"
	line "style!"
	done
	
KumeSocialHousePokefanfText:
	text "I hear that some"
	line "kids took down"
	cont "TEAM ROCKET!"
	para "That sounds un-"
	line "believeable to"
	cont "me, honestly."
	done

KumeSocialHouseFisherText:
	text "This place is"
	line "where people come"
	para "to socialize and"
	line "gossip around"
	cont "here."
	para "I just prefer"
	line "listening."
	done
	
SendN64LassOffText:
	text "I haven't been to"
	line "the mainland in"
	cont "a while."
	para "It'd be good to"
	line "make a trip."
	para "I have a friend"
	line "in WESTPORT who"
	cont "I'd like to see."
	para "It'd be fun for"
	line "us to just meet"
	para "up and play video"
	line "games and chat."
	para "Hm?"
	para "You know of a"
	line "place for us to"
	cont "do just that?"
	para "Well, I guess"
	line "there's never been"
	para "a better time for"
	line "me to make a trip."
	para "I'm gonna start"
	line "making plans!"
	para "Thanks!"
	done
	
KumeSocialHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, KUME_CITY, 5
	warp_event  3,  7, KUME_CITY, 5

	db 0 ; coord events

	db 0 ; bg events


	db 5 ; object events
	object_event  5,  1, SPRITE_LASS, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KumeSocialHouseN64LassScript, EVENT_KUME_N64_LASS_AT_SOCIAL_HOUSE
	object_event  3,  3, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KumeSocialHouseYoungsterScript, -1
	object_event  0,  3, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KumeSocialHouseCooltrainerfScript, -1
	object_event  6,  5, SPRITE_POKEFAN_F, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KumeSocialHousePokefanfScript, -1
	object_event  7,  3, SPRITE_FISHER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KumeSocialHouseFisherScript, -1
