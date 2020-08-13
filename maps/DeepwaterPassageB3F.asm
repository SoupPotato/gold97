	const_def 2 ; object constants
	const ICE_PATH_NEW_PRYCE
	const ICE_PATH_NEW_ITEMBALL_1
	const ICE_PATH_NEW_ITEMBALL_2
	const ICE_PATH_NEW_ITEMBALL_3
	const ICE_PATH_NEW_ITEMBALL_4

DeepwaterPassageB3F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	
DeepwaterPassageB3FMaxRevive:
	itemball MAX_REVIVE

DeepwaterPassageB3FRareCandy:
	itemball RARE_CANDY

DeepwaterPassageB3FMaxEther:
	itemball MAX_ETHER
	
DeepwaterPassageB3FTMSwagger:
	itemball TM_SWAGGER

DeepwaterPassageB3FPryceScript:
	faceplayer
	opentext
	writetext PryceGreetingText
	waitbutton
	closetext
	checkcode VAR_FACING
	ifequal RIGHT, .PryceWalksAroundPlayer
	applymovement ICE_PATH_NEW_PRYCE, PryceLeavesMovement
	disappear ICE_PATH_NEW_PRYCE
	setevent EVENT_HERDED_FARFETCHD
	clearevent EVENT_FOUGHT_BELMITT
	end
	
.PryceWalksAroundPlayer:
	applymovement ICE_PATH_NEW_PRYCE, PryceLeavesMovementAlt
	disappear ICE_PATH_NEW_PRYCE
	setevent EVENT_HERDED_FARFETCHD
	clearevent EVENT_FOUGHT_BELMITT
	end

PryceGreetingText:
	text "Ah, hello."
	
	para "It's not often"
	line "that I get any"
	cont "visitors here."
	
	para "My name is PRYCE."
	
	para "I am the GYM"
	line "LEADER in BLUE"
	cont "FOREST."
	
	para "This CAVE is where"
	line "I come to train"
	cont "and discipline"
	cont "myself."
	
	para "…"
	
	para "A challenge?"
	
	para "It will have to"
	line "wait."
	
	para "I have family that"
	line "live up on NORTH"
	cont "ISLAND."
	
	para "I have already"
	line "informed them that"
	cont "I would be coming"
	cont "to visit."

	para "Family is very"
	line "important."

	para "If you insist on a"
	line "battle, come visit"
	cont "my family home in"
	cont "NORTH ISLAND."

	para "I will then return"
	line "to the GYM once I"
	cont "have completed my"
	cont "visit."
	done

PryceLeavesMovement:
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step_end
	
PryceLeavesMovementAlt:
	step DOWN
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step_end

DeepwaterPassageB3F_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  3, 33, DEEPWATER_PASSAGE_B2F, 3

	db 0 ; coord events

	db 0 ; bg events

	db 5 ; object events
	object_event 26, 31, SPRITE_PRYCE, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, DeepwaterPassageB3FPryceScript, EVENT_HERDED_FARFETCHD
	object_event  5, 14, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, DeepwaterPassageB3FTMSwagger, EVENT_OLIVINE_LIGHTHOUSE_5F_TM_SWAGGER
	object_event 14, 14, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, DeepwaterPassageB3FMaxEther, EVENT_ROUTE_43_MAX_ETHER
	object_event 18, 16, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, DeepwaterPassageB3FMaxRevive, EVENT_ROUTE_44_MAX_REVIVE
	object_event 16, 20, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, DeepwaterPassageB3FRareCandy, EVENT_OLIVINE_LIGHTHOUSE_5F_RARE_CANDY

