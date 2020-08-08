	const_def 2 ; object constants
	const CELADONGAMECORNER_CLERK
	const CELADONGAMECORNER_RECEPTIONIST
	const CELADONGAMECORNER_POKEFAN_M
	const CELADONGAMECORNER_TEACHER
	const CELADONGAMECORNER_FISHING_GURU
	const CELADONGAMECORNER_FISHER1
	const CELADONGAMECORNER_FISHER2
	const CELADONGAMECORNER_GYM_GUY
	const CELADONGAMECORNER_GRAMPS
	const CELADONGAMECORNER_N64_ROCKER

KantoGameCorner_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

KantoGameCornerClerkScript:
	jumpstd gamecornercoinvendor

KantoGameCornerReceptionistScript:
	jumptextfaceplayer KantoGameCornerReceptionistText

KantoGameCornerPokefanMScript:
	faceplayer
	opentext
	writetext KantoGameCornerPokefanMText
	waitbutton
	closetext
	turnobject CELADONGAMECORNER_POKEFAN_M, RIGHT
	end

KantoGameCornerTeacherScript:
	faceplayer
	opentext
	writetext KantoGameCornerTeacherText
	waitbutton
	closetext
	turnobject CELADONGAMECORNER_TEACHER, RIGHT
	end

KantoGameCornerFishingGuruScript:
	faceplayer
	opentext
	writetext KantoGameCornerFishingGuruText
	waitbutton
	closetext
	turnobject CELADONGAMECORNER_FISHING_GURU, RIGHT
	end

KantoGameCornerFisherScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_COINS_FROM_GAMBLER_AT_CELADON
	iftrue .GotCoins
	writetext KantoGameCornerFisherText1
	buttonsound
	checkitem COIN_CASE
	iffalse .NoCoinCase
	checkcoins MAX_COINS - 1
	ifequal HAVE_MORE, .FullCoinCase
	stringtotext .coinname, MEM_BUFFER_1
	scall .GiveCoins
	givecoins 18
	setevent EVENT_GOT_COINS_FROM_GAMBLER_AT_CELADON
.GotCoins:
	writetext KantoGameCornerFisherText2
	waitbutton
	closetext
	turnobject LAST_TALKED, LEFT
	end

.GiveCoins:
	jumpstd receiveitem
	end

.coinname
	db "COIN@"

.NoCoinCase:
	writetext KantoGameCornerFisherNoCoinCaseText
	waitbutton
	closetext
	turnobject LAST_TALKED, LEFT
	end

.FullCoinCase:
	writetext KantoGameCornerFisherFullCoinCaseText
	waitbutton
	closetext
	turnobject LAST_TALKED, LEFT
	end

CeladonGymGuyScript:
	jumptextfaceplayer CeladonGymGuyText

KantoGameCornerGrampsScript:
	faceplayer
	opentext
	writetext KantoGameCornerGrampsText
	waitbutton
	closetext
	turnobject CELADONGAMECORNER_GRAMPS, LEFT
	end

KantoGameCornerPoster1Script:
	jumptext KantoGameCornerPoster1Text

KantoGameCornerPoster2Script:
	jumptext KantoGameCornerPoster2Text

KantoGameCornerLuckySlotMachineScript:
	random 6
	ifequal 0, KantoGameCornerSlotMachineScript
	refreshscreen
	writebyte FALSE
	special SlotMachine
	closetext
	end

KantoGameCornerSlotMachineScript:
	refreshscreen
	writebyte TRUE
	special SlotMachine
	closetext
	end

KantoGameCornerCardFlipScript:
	refreshscreen
	special CardFlip
	closetext
	end

KantoGameCornerLighterScript:
	jumptext KantoGameCornerLighterText

KantoGameCornerSodaCanScript:
	opentext
	writetext KantoGameCornerSodaCanText
	waitbutton
	special CardFlip
	closetext
	end
	
KantoGameCornerPokefanMScript2:
	faceplayer
	opentext
	writetext KantoGameCornerPokefanMText2
	waitbutton
	closetext
	turnobject CELADONGAMECORNER_FISHER1, LEFT
	end

KantoGameCornerN64RockerScript:
	faceplayer
	opentext
	writetext SendN64RockerOffText
	waitbutton
	closetext
	checkcode VAR_FACING
	ifequal DOWN, GameCornerN64RockerDownScript
	jump GameCornerN64RockerLeftScript
	end
	
GameCornerN64RockerDownScript:
	applymovement CELADONGAMECORNER_N64_ROCKER, GameCornerN64RockerDownMovement
	playsound SFX_EXIT_BUILDING
	disappear CELADONGAMECORNER_N64_ROCKER
	setevent EVENT_GOLDENROD_DEPT_STORE_B1F_LAYOUT_1
	clearevent EVENT_GOLDENROD_DEPT_STORE_B1F_LAYOUT_2
	clearevent EVENT_GOLDENROD_DEPT_STORE_B1F_LAYOUT_3
	waitsfx
	end
	
GameCornerN64RockerLeftScript:
	applymovement CELADONGAMECORNER_N64_ROCKER, GameCornerN64RockerLeftMovement
	playsound SFX_EXIT_BUILDING
	disappear CELADONGAMECORNER_N64_ROCKER
	setevent EVENT_GOLDENROD_DEPT_STORE_B1F_LAYOUT_1
	clearevent EVENT_GOLDENROD_DEPT_STORE_B1F_LAYOUT_2
	clearevent EVENT_GOLDENROD_DEPT_STORE_B1F_LAYOUT_3
	waitsfx
	end
	
GameCornerN64RockerLeftMovement:
	step UP
	step UP
	step LEFT
	step LEFT
	step DOWN
	step DOWN
	step_end
	
	
GameCornerN64RockerDownMovement:	
	step RIGHT
	step UP
	step UP
	step LEFT
	step LEFT
	step LEFT
	step DOWN
	step DOWN
	step_end

SendN64RockerOffText:
	text "I like games, but"
	line "I'm kind of tired"
	para "of games of"
	line "chance."
	para "I'd like to play"
	line "a good video game"
	cont "or something."
	para "Huh?"
	para "There's a place"
	line "near WESTPORT CITY"
	para "that I should"
	line "check out?"
	para "Alright, I'll give"
	line "it a go, thanks!"
	done

KantoGameCornerReceptionistText:
	text "Welcome!"

	para "You may exchange"
	line "your coins for"

	para "fabulous prizes"
	line "next door."
	done

KantoGameCornerPokefanMText:
	text "The slot machines"
	line "are all state of"
	cont "the art."
	done

KantoGameCornerTeacherText:
	text "It's this machine"
	line "I want."

	para "It cleaned me out"
	line "yesterday, so it"

	para "should pay out"
	line "today."
	done

KantoGameCornerFishingGuruText:
	text "I think this slot"
	line "machine will pay"
	cont "out…"

	para "The odds vary"
	line "among machines."
	done

KantoGameCornerFisherText1:
	text "Gahahaha!"

	para "The coins just"
	line "keep popping out!"

	para "Hm? What, kid? You"
	line "want to play?"

	para "I'll share my luck"
	line "with you!"
	done

KantoGameCornerFisherText2:
	text "Gahahaha!"

	para "It makes me feel"
	line "good to do nice"

	para "things for other"
	line "people!"
	done

KantoGameCornerFisherNoCoinCaseText:
	text "Hey, you don't"
	line "have a COIN CASE."

	para "How am I supposed"
	line "to give you any"
	cont "coins, kid?"
	done

KantoGameCornerFisherFullCoinCaseText:
	text "Hey, your COIN"
	line "CASE is full, kid."

	para "You must be riding"
	line "a winning streak"
	cont "too."
	done

CeladonGymGuyText:
	text "Are you playing"
	line "the slots too?"

	para "I'm trying to get"
	line "enough coins for a"
	cont "prize #MON."

	para "But I don't have"
	line "enough coins yet…"
	done

KantoGameCornerPokefanMText2:
	text "Hmmm… The odds are"
	line "surely better for"

	para "PIKACHU's line,"
	line "but… What to do?"
	done
	
KantoGameCornerGrampsText:
	text "My daddy takes me"
	line "here sometimes."
	para "I'm not old enough"
	line "to play, though."
	done

KantoGameCornerPoster1Text:
	text "Hey!"

	para "Underneath this"
	line "poster…"

	para "There's nothing!"
	done

KantoGameCornerPoster2Text:
	text "Hey!"

	para "Underneath this"
	line "poster…"

	para "There's nothing!"
	done

KantoGameCornerLighterText:
	text "There's a lighter"
	line "here."
	done

KantoGameCornerSodaCanText:
	text "A can of soda…"

	para "Someone must be"
	line "coming back…"

	para "Huh? It's empty!"
	done

KantoGameCorner_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  9, 13, KANTO_REGION, 6
	warp_event 10, 13, KANTO_REGION, 6
	warp_event  8, 13, KANTO_REGION, 6
	warp_event 11, 13, KANTO_REGION, 6


	db 0 ; coord events

	db 38 ; bg events
	bg_event  1,  4, BGEVENT_READ, KantoGameCornerCardFlipScript
	bg_event  1,  5, BGEVENT_READ, KantoGameCornerCardFlipScript
	bg_event  1,  6, BGEVENT_READ, KantoGameCornerCardFlipScript
	bg_event  1,  7, BGEVENT_READ, KantoGameCornerCardFlipScript
	bg_event  1,  8, BGEVENT_READ, KantoGameCornerCardFlipScript
	bg_event  2,  0, BGEVENT_LEFT, KantoGameCornerCardFlipScript
	bg_event  6,  4, BGEVENT_READ, KantoGameCornerCardFlipScript
	bg_event  6,  5, BGEVENT_READ, KantoGameCornerCardFlipScript
	bg_event  6,  6, BGEVENT_READ, KantoGameCornerCardFlipScript
	bg_event  6,  7, BGEVENT_READ, KantoGameCornerSodaCanScript
	bg_event  6,  8, BGEVENT_READ, KantoGameCornerCardFlipScript
	bg_event  0,  0, BGEVENT_RIGHT, KantoGameCornerCardFlipScript
	bg_event  7,  4, BGEVENT_READ, KantoGameCornerLuckySlotMachineScript
	bg_event  7,  5, BGEVENT_READ, KantoGameCornerLuckySlotMachineScript
	bg_event  7,  6, BGEVENT_READ, KantoGameCornerLuckySlotMachineScript
	bg_event  7,  7, BGEVENT_READ, KantoGameCornerLuckySlotMachineScript
	bg_event  7,  8, BGEVENT_READ, KantoGameCornerSlotMachineScript
	bg_event  1,  0, BGEVENT_LEFT, KantoGameCornerLuckySlotMachineScript
	bg_event 12,  4, BGEVENT_READ, KantoGameCornerLuckySlotMachineScript
	bg_event 12,  5, BGEVENT_READ, KantoGameCornerLuckySlotMachineScript
	bg_event 12,  6, BGEVENT_READ, KantoGameCornerLuckySlotMachineScript
	bg_event 12,  7, BGEVENT_READ, KantoGameCornerLuckySlotMachineScript
	bg_event 12,  8, BGEVENT_READ, KantoGameCornerLuckySlotMachineScript
	bg_event  5,  0, BGEVENT_RIGHT, KantoGameCornerLuckySlotMachineScript
	bg_event 13,  4, BGEVENT_READ, KantoGameCornerLuckySlotMachineScript
	bg_event 13,  5, BGEVENT_READ, KantoGameCornerLuckySlotMachineScript
	bg_event 13,  6, BGEVENT_READ, KantoGameCornerLuckySlotMachineScript
	bg_event 13,  7, BGEVENT_READ, KantoGameCornerLuckySlotMachineScript
	bg_event 13,  8, BGEVENT_READ, KantoGameCornerLuckySlotMachineScript
	bg_event  6,  0, BGEVENT_LEFT, KantoGameCornerLuckySlotMachineScript
	bg_event 18,  4, BGEVENT_READ, KantoGameCornerLuckySlotMachineScript
	bg_event 18,  5, BGEVENT_READ, KantoGameCornerLuckySlotMachineScript
	bg_event 18,  6, BGEVENT_READ, KantoGameCornerLighterScript
	bg_event 18,  7, BGEVENT_READ, KantoGameCornerLuckySlotMachineScript
	bg_event 18,  8, BGEVENT_READ, KantoGameCornerLuckySlotMachineScript
	bg_event  7,  0, BGEVENT_RIGHT, KantoGameCornerLuckySlotMachineScript
	bg_event  4,  0, BGEVENT_READ, KantoGameCornerPoster1Script
	bg_event  3,  0, BGEVENT_READ, KantoGameCornerPoster2Script

	db 10 ; object events
	object_event  4,  1, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, KantoGameCornerClerkScript, -1
	object_event  3,  1, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, KantoGameCornerReceptionistScript, -1
	object_event 17,  8, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, KantoGameCornerPokefanMScript, -1
	object_event 11,  8, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, KantoGameCornerTeacherScript, -1
	object_event 11,  6, SPRITE_JANINE, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, KantoGameCornerFishingGuruScript, -1
	object_event  2,  6, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, KantoGameCornerPokefanMScript2, -1
	object_event 14,  6, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, KantoGameCornerFisherScript, -1
	object_event  5,  8, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CeladonGymGuyScript, -1
	object_event  2,  7, SPRITE_TWIN, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, KantoGameCornerGrampsScript, -1
	object_event 13, 13, SPRITE_ROCKER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, KantoGameCornerN64RockerScript, EVENT_GOLDENROD_DEPT_STORE_B1F_LAYOUT_1
