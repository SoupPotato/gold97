	const_def 2 ; object constants
	const PrycesFamilyHouse_POKEFAN_F
	const PrycesFamilyHouse_TWIN
	const PrycesFamilyHouse_PRYCE

PrycesFamilyHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

PrycesFamilyHousePokefanFScript:
	faceplayer
	opentext
	checkevent EVENT_HERDED_FARFETCHD
	iffalse .PryceVisitsSoonG
	checkevent EVENT_FOUGHT_BELMITT
	iffalse .PryceIsVisitingG
	checkflag ENGINE_GLACIERBADGE
	iffalse .GoBeatPryce
	checkevent EVENT_GOT_HM06_WHIRLPOOL
	iftrue .AlreadyGotWhirlpool
	writetext HereIsWhirlpool
	waitbutton
	verbosegiveitem HM_WHIRLPOOL
	setevent EVENT_GOT_HM06_WHIRLPOOL
	writetext NowYouHaveWhirlpool
	waitbutton
	closetext
	end
	
.AlreadyGotWhirlpool
	writetext PryceVisitingIsMyFavoriteG
	waitbutton
	closetext
	end
	
.PryceVisitsSoonG
	writetext PryceIsComingToVisitG
	waitbutton
	closetext
	end
	
.PryceIsVisitingG
	writetext PryceIsHereG
	waitbutton
	closetext
	end
	
.GoBeatPryce
	writetext GoBeatHimPryce
	waitbutton
	closetext
	end

PrycesFamilyHouseTwinScript:
	faceplayer
	opentext
	checkevent EVENT_HERDED_FARFETCHD
	iffalse .PryceVisitsSoon
	checkevent EVENT_FOUGHT_BELMITT
	iffalse .PryceIsVisiting
	writetext PryceVisitingIsMyFavorite
	waitbutton
	closetext
	end
	
.PryceVisitsSoon
	writetext PryceIsComingToVisit
	waitbutton
	closetext
	end
	
.PryceIsVisiting
	writetext PryceIsHere
	waitbutton
	closetext
	end
	
PrycesFamilyHousePryceScript:
	faceplayer
	opentext
	writetext PrycesFamilyHousePryceText
	waitbutton
	closetext
	checkcode VAR_FACING
	ifequal UP, .PryceWalksAroundPlayer2
	applymovement PrycesFamilyHouse_PRYCE, PryceLeavesMovement2
	playsound SFX_EXIT_BUILDING
	disappear PrycesFamilyHouse_PRYCE
	setevent EVENT_FOUGHT_BELMITT
	clearevent EVENT_PRYCE_IN_GYM
	waitsfx
	end

.PryceWalksAroundPlayer2
	applymovement PrycesFamilyHouse_PRYCE, PryceLeavesMovement2Alt
	playsound SFX_EXIT_BUILDING
	disappear PrycesFamilyHouse_PRYCE
	setevent EVENT_FOUGHT_BELMITT
	clearevent EVENT_PRYCE_IN_GYM
	waitsfx
	end
	
PryceLeavesMovement2Alt:
	step RIGHT
	step DOWN
	step DOWN
	step LEFT
	step LEFT
	step LEFT
	step DOWN
	step_end
	
PryceLeavesMovement2:
	step DOWN
	step DOWN
	step LEFT
	step LEFT
	step DOWN
	step_end

PrycesFamilyHouseBookshelf:
	jumpstd picturebookshelf
	
HereIsWhirlpool:
	text "Ah, I can see"
	line "that you have"
	para "received the"
	line "GLACIERBADGE from"
	cont "my husband."
	para "Here, I have"
	line "something that"
	para "will be of use to"
	line "you."
	done
	
NowYouHaveWhirlpool:
	text "That HM teaches"
	line "WHIRLPOOL."
	para "It is very useful"
	line "for traversing the"
	para "rough waters of"
	line "northern NIHON."
	done
	
PryceVisitingIsMyFavoriteG:
	text "I always respect"
	line "the dedication"
	para "PRYCE has for his"
	line "responsibilities."
	done
	
PryceIsComingToVisitG:
	text "PRYCE, my husband,"
	line "is the GYM LEADER"
	cont "in BLUE FOREST."
	para "He has to travel"
	line "there frequently"
	cont "to battle."
	para "He also spends a"
	line "lot of time"
	para "training in the"
	line "DEEPWATER PASSAGE."
	para "But he always"
	line "makes time to"
	cont "come home."
	para "He should be here"
	line "soon."
	done
	
PryceIsHereG:
	text "It's always nice"
	line "to have PRYCE at"
	cont "home."
	done
	
GoBeatHimPryce:
	text "I see that PRYCE"
	line "is awaiting your"
	cont "challenge."
	para "Defeat him, then"
	line "come see me."
	para "I'll have a gift"
	line "for you."
	done

PryceVisitingIsMyFavorite:
	text "It's my favorite"
	line "when grandpa comes"
	cont "to visit."
	done
	
PryceIsComingToVisit:
	text "Grandpa should be"
	line "coming to visit"
	cont "soon!"
	done
	
PryceIsHere:
	text "Yay! Grandpa is"
	line "here!"
	done
	
PrycesFamilyHousePryceText:
	text "Glad you could"
	line "visit."
	para "Any trainer that"
	line "can make it to"
	para "my training site"
	line "is a trainer I"
	cont "respect."
	para "What is your name,"
	line "by the way?"
	para "<PLAY_G>?"
	para "Well, <PLAY_G>,"
	line "as I promised, I"
	para "will get back to"
	line "my GYM."
	para "I expect you to be"
	line "a worthy opponent."
	done

PrycesFamilyHousePokefanFText:
	text "LAVENDER is a"
	line "tiny, quiet town"

	para "at the foot of the"
	line "mountains."

	para "It's gotten a bit"
	line "busier since the"

	para "RADIO TOWER was"
	line "built."
	done

PrycesFamilyHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, FROSTPOINT_TOWN, 4
	warp_event  5,  7, FROSTPOINT_TOWN, 4

	db 0 ; coord events

	db 2 ; bg events
	bg_event  0,  0, BGEVENT_READ, PrycesFamilyHouseBookshelf
	bg_event  0,  0, BGEVENT_READ, PrycesFamilyHouseBookshelf

	db 3 ; object events
	object_event  1,  2, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, PrycesFamilyHousePokefanFScript, -1
	object_event  5,  2, SPRITE_TWIN, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, PrycesFamilyHouseTwinScript, -1
	object_event  7,  4, SPRITE_PRYCE, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, PrycesFamilyHousePryceScript, EVENT_FOUGHT_BELMITT
