	const_def 2 ; object constants
	const ROUTE110_SWIMMER_GUY
	const ROUTE110_LASS1
	const ROUTE110_MONICA
	const ROUTE110_POKEFAN_M
	const ROUTE110_SUPER_NERD

Route110_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .MonicaCallback

.MonicaCallback:
	clearevent EVENT_BATTLE_TOWER_OUTSIDE_SAILOR
	checkcode VAR_WEEKDAY
	ifequal MONDAY, .MonicaAppears
	disappear ROUTE110_MONICA
	return

.MonicaAppears:
	appear ROUTE110_MONICA
	return


TrainerSwimmermSimon:
	trainer SWIMMERM, SIMON, EVENT_BEAT_SWIMMERM_SIMON, SwimmermSimonSeenText, SwimmermSimonBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermSimonAfterBattleText
	waitbutton
	closetext
	end

Route110Lass1Script:
	jumptextfaceplayer Route110Lass1Text

Route110PokefanMScript:
	special Mobile_DummyReturnFalse
	iftrue .mobile
	jumptextfaceplayer Route110PokefanMText

.mobile
	jumptextfaceplayer Route110PokefanMText_Mobile



MonicaScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_SHARP_BEAK_FROM_MONICA
	iftrue .Monday
	checkcode VAR_WEEKDAY
	ifnotequal MONDAY, .NotMonday
	checkevent EVENT_MET_MONICA_OF_MONDAY
	iftrue .MetMonica
	writetext MeetMonicaText
	buttonsound
	setevent EVENT_MET_MONICA_OF_MONDAY
.MetMonica:
	writetext MonicaGivesGiftText
	buttonsound
	verbosegiveitem SHARP_BEAK
	iffalse .done
	setevent EVENT_GOT_SHARP_BEAK_FROM_MONICA
	writetext MonicaGaveGiftText
	waitbutton
	closetext
	end

.Monday:
	writetext MonicaMondayText
	waitbutton
.done:
	closetext
	end

.NotMonday:
	writetext MonicaNotMondayText
	waitbutton
	closetext
	end

Route110Sign:
	jumptext Route110SignText
	

TrainerEngineerRicardo:
	trainer ENGINEER, RICARDO, EVENT_BEAT_ENGINEER_RICARDO, EngineerRicardoSeenText, EngineerRicardoBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext EngineerRicardoAfterText
	waitbutton
	closetext
	end
	



Route110HiddenHyperPotion:
	hiddenitem HYPER_POTION, EVENT_ROUTE_40_HIDDEN_HYPER_POTION

MovementData_0x1a621c:
	step RIGHT
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step_end

MovementData_0x1a6224:
	step UP
	step UP
	step UP
	step UP
	step UP
	step_end

MovementData_0x1a622a:
	step UP
	step UP
	step UP
	step UP
	step_end
	

EngineerRicardoSeenText:
	text "The air here is"
	line "buzzing with"
	cont "energy!"
	done

EngineerRicardoBeatenText:
	text "I'm zapped!"
	done

EngineerRicardoAfterText:
	text "The sting of cold"
	line "air reminds me of"
	para "the sting of an"
	line "electric shock."
	done

SwimmermSimonSeenText:
	text "I wish the water"
	line "was warmer here."
	done

SwimmermSimonBeatenText:
	text "OK! Uncle! I give!"
	done

SwimmermSimonAfterBattleText:
	text "Constantly moving"
	line "helps keep body"
	cont "temperature up."
	done

Route110Lass1Text:
	text "Have you ever"
	line "looked for #MON"
	cont "in snowy grass?"
	done

Route110PokefanMText:
	text "There's a strange"
	line "lady who lives in"
	para "that house on the"
	line "water."
	done

Route110PokefanMText_Mobile:
	text "Hm! Look at all"
	line "those serious-"
	cont "looking trainers"
	cont "streaming in."

	para "What? What?"
	done



MeetMonicaText:
	text "MONICA: Glad to"
	line "meet you. I'm"

	para "MONICA of Monday."
	done

MonicaGivesGiftText:
	text "As a token of our"
	line "friendship, I have"
	cont "a gift for you!"
	done

MonicaGaveGiftText:
	text "MONICA: It's an"
	line "item that raises"

	para "the power of fly-"
	line "ing-type moves."

	para "You should equip a"
	line "bird #MON with"
	cont "that item."
	done

MonicaMondayText:
	text "MONICA: My broth-"
	line "ers and sisters"

	para "are all over the"
	line "place."

	para "See if you could"
	line "find them all!"
	done

MonicaNotMondayText:
	text "MONICA: I don't"
	line "think today is"
	cont "Monday. How sad…"
	done

Route110SignText:
	text "ROUTE 110"

	para "ALLOY CITY -"
	line "BLUE FOREST"
	done

Route110_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  6, 13, ROUTE_109_ROUTE_110_GATE, 3
	warp_event  7, 13, ROUTE_109_ROUTE_110_GATE, 4
	warp_event  9,  5, ROUTE_110_SANDSTORM_HOUSE, 1

	db 0 ; coord events

	db 2 ; bg events
	bg_event 10,  6, BGEVENT_READ, Route110Sign
	bg_event 33, 13, BGEVENT_ITEM, Route110HiddenHyperPotion

	db 5 ; object events
	object_event 22,  9, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 4, TrainerSwimmermSimon, -1
	object_event 37, 11, SPRITE_LASS, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route110Lass1Script, -1
	object_event 45,  6, SPRITE_LASS, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MonicaScript, EVENT_ROUTE_40_MONICA_OF_MONDAY
	object_event 40,  4, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route110PokefanMScript, -1
	object_event 40,  8, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_RIGHT, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 4, TrainerEngineerRicardo, -1
