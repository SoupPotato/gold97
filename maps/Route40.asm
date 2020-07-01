	const_def 2 ; object constants
	const ROUTE40_SWIMMER_GUY
	const ROUTE40_LASS1
	const ROUTE40_MONICA
	const ROUTE40_POKEFAN_M
	const ROUTE40_SUPER_NERD

Route40_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .MonicaCallback

.MonicaCallback:
	clearevent EVENT_BATTLE_TOWER_OUTSIDE_SAILOR
	checkcode VAR_WEEKDAY
	ifequal MONDAY, .MonicaAppears
	disappear ROUTE40_MONICA
	return

.MonicaAppears:
	appear ROUTE40_MONICA
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

Route40Lass1Script:
	jumptextfaceplayer Route40Lass1Text

Route40PokefanMScript:
	special Mobile_DummyReturnFalse
	iftrue .mobile
	jumptextfaceplayer Route40PokefanMText

.mobile
	jumptextfaceplayer Route40PokefanMText_Mobile



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

Route40Sign:
	jumptext Route40SignText
	

TrainerEngineerRicardo:
	trainer ENGINEER, RICARDO, EVENT_BEAT_ENGINEER_RICARDO, EngineerRicardoSeenText, EngineerRicardoBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext EngineerRicardoAfterText
	waitbutton
	closetext
	end
	



Route40HiddenHyperPotion:
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

Route40Lass1Text:
	text "Have you ever"
	line "looked for #MON"
	cont "in snowy grass?"
	done

Route40PokefanMText:
	text "There's a strange"
	line "lady who lives in"
	para "that house on the"
	line "water."
	done

Route40PokefanMText_Mobile:
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

Route40SignText:
	text "ROUTE 110"

	para "NUTYPE CITY -"
	line "BLUE FOREST"
	done

Route40_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  6, 13, ROUTE_38_ECRUTEAK_GATE, 3
	warp_event  7, 13, ROUTE_38_ECRUTEAK_GATE, 4
	warp_event  9,  5, ROUTE_27_SANDSTORM_HOUSE, 1

	db 0 ; coord events

	db 2 ; bg events
	bg_event 10,  6, BGEVENT_READ, Route40Sign
	bg_event 33, 13, BGEVENT_ITEM, Route40HiddenHyperPotion

	db 5 ; object events
	object_event 22,  9, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 4, TrainerSwimmermSimon, -1
	object_event 37, 11, SPRITE_LASS, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route40Lass1Script, -1
	object_event 45,  6, SPRITE_LASS, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MonicaScript, EVENT_ROUTE_40_MONICA_OF_MONDAY
	object_event 40,  4, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route40PokefanMScript, -1
	object_event 40,  8, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_RIGHT, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 4, TrainerEngineerRicardo, -1
