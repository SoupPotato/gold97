	const_def 2 ; object constants
	const ICE_PATH_NEW_PRYCE
	const ICE_PATH_NEW_ITEMBALL_1
	const ICE_PATH_NEW_ITEMBALL_2
	const ICE_PATH_NEW_ITEMBALL_3
	const ICE_PATH_NEW_ITEMBALL_4

IcePathNew_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	
IcePathNewMaxRevive:
	itemball MAX_REVIVE

IcePathNewRareCandy:
	itemball RARE_CANDY

IcePathNewMaxEther:
	itemball MAX_ETHER
	
IcePathNewTMSwagger:
	itemball TM_SWAGGER

IcePathNewPryceScript:
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
	clearevent EVENT_FOUGHT_BIPETAL
	end
	
.PryceWalksAroundPlayer:
	applymovement ICE_PATH_NEW_PRYCE, PryceLeavesMovementAlt
	disappear ICE_PATH_NEW_PRYCE
	setevent EVENT_HERDED_FARFETCHD
	clearevent EVENT_FOUGHT_BIPETAL
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
	para "But often I like"
	line "to get away from"
	para "my GYM and come"
	line "train deep in"
	cont "this cave."
	para "Live among the"
	line "ICE #MON in"
	para "order to truly"
	line "understand them."
	para "…"
	para "I also understand"
	line "if you would like"
	para "me to resume my"
	line "post at my GYM."
	para "I will do that"
	line "in due time."
	para "I have family that"
	line "live up on NORTH"
	cont "ISLAND."
	para "I have already"
	line "informed them that"
	para "I would be coming"
	line "to visit."
	para "I will not back"
	line "out on that"
	cont "promise."
	para "I hope you"
	line "understand."
	para "…"
	para "I can sense that"
	line "you possess a"
	para "great deal of"
	line "respect for"
	cont "#MON."
	para "I admire that."
	para "Please, when you"
	line "get a chance, come"
	para "visit me and my"
	line "family on NORTH"
	cont "ISLAND."
	para "I will return to"
	line "the GYM once I"
	para "have completed my"
	line "visit."
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

IcePathNew_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  3, 33, ICE_PATH_1F, 3

	db 0 ; coord events

	db 0 ; bg events

	db 5 ; object events
	object_event 26, 31, SPRITE_PRYCE, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, IcePathNewPryceScript, EVENT_HERDED_FARFETCHD
	object_event  5, 14, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, IcePathNewTMSwagger, EVENT_OLIVINE_LIGHTHOUSE_5F_TM_SWAGGER
	object_event 14, 14, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, IcePathNewMaxEther, EVENT_ROUTE_43_MAX_ETHER
	object_event 18, 16, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, IcePathNewMaxRevive, EVENT_ROUTE_44_MAX_REVIVE
	object_event 16, 20, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, IcePathNewRareCandy, EVENT_OLIVINE_LIGHTHOUSE_5F_RARE_CANDY

