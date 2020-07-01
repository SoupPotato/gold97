	const_def 2 ; object constants
	const PEWTER_GYM_N64_LASS
	const PEWTER_GYM_YOUNGSTER
	const PEWTER_GYM_COOLTRAINER_F
	const PEWTER_GYM_POKEFAN_F
	const PEWTER_GYM_FISHER

PewterGym_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

PewterGymN64LassScript:
	faceplayer
	opentext
	writetext SendN64LassOffText
	waitbutton
	closetext
	checkcode VAR_FACING
	ifequal RIGHT, PewterGymN64LassRightScript
	jump PewterGymN64LassUpScript
	end
	
PewterGymN64LassRightScript:
	applymovement PEWTER_GYM_N64_LASS, PewterGymN64LassRightMovement
	playsound SFX_EXIT_BUILDING
	disappear PEWTER_GYM_N64_LASS
	setevent EVENT_GOLDENROD_DEPT_STORE_B1F_LAYOUT_3
	clearevent EVENT_GOLDENROD_UNDERGROUND_WAREHOUSE_BLOCKED_OFF
	waitsfx
	end
	
PewterGymN64LassUpScript:
	applymovement PEWTER_GYM_N64_LASS, PewterGymN64LassUpMovement
	playsound SFX_EXIT_BUILDING
	disappear PEWTER_GYM_N64_LASS
	setevent EVENT_GOLDENROD_DEPT_STORE_B1F_LAYOUT_3
	clearevent EVENT_GOLDENROD_UNDERGROUND_WAREHOUSE_BLOCKED_OFF
	waitsfx
	end
	
PewterGymYoungsterScript:
	jumptextfaceplayer PewterGymYoungsterText
	
PewterGymCooltrainerfScript:
	jumptextfaceplayer PewterGymCooltrainerfText
	
PewterGymPokefanfScript:
	jumptextfaceplayer PewterGymPokefanfText
	
PewterGymFisherScript:
	jumptextfaceplayer PewterGymFisherText
	
PewterGymN64LassRightMovement:
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end
	
PewterGymN64LassUpMovement:
	step LEFT
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end
	
PewterGymYoungsterText:
	text "I think WILL is"
	line "the coolest member"
	cont "of the ELITE FOUR."
	para "It's not even"
	line "close!"
	done
	
PewterGymCooltrainerfText:
	text "It's definitely"
	line "MISTY who is the"
	cont "coolest!"
	para "She has so much"
	line "style!"
	done
	
PewterGymPokefanfText:
	text "I hear that some"
	line "kids took down"
	cont "TEAM ROCKET!"
	para "That sounds un-"
	line "believeable to"
	cont "me, honestly."
	done

PewterGymFisherText:
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
	line "in WEST CITY who"
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
	
PewterGym_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, PEWTER_CITY, 5
	warp_event  3,  7, PEWTER_CITY, 5

	db 0 ; coord events

	db 0 ; bg events


	db 5 ; object events
	object_event  5,  1, SPRITE_LASS, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, PewterGymN64LassScript, EVENT_GOLDENROD_DEPT_STORE_B1F_LAYOUT_3
	object_event  3,  3, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, PewterGymYoungsterScript, -1
	object_event  0,  3, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, PewterGymCooltrainerfScript, -1
	object_event  6,  5, SPRITE_POKEFAN_F, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, PewterGymPokefanfScript, -1
	object_event  7,  3, SPRITE_FISHER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, PewterGymFisherScript, -1
