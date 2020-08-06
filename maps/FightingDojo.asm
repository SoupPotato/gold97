	const_def 2 ; object constants
	const FIGHTINGDOJO_BLACK_BELT
	const FIGHTINGDOJO_POKE_BALL
	const FIGHTINGDOJO_BLACK_BELT2
	const FIGHTINGDOJO_BLACK_BELT3
	const FIGHTINGDOJO_BLACK_BELT4
	const FIGHTINGDOJO_BLACK_BELT5

FightingDojo_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

;FightingDojoBlackBelt:
;	jumptextfaceplayer FightingDojoBlackBeltText

FightingDojoBlackBelt:
	faceplayer
	checkevent EVENT_BEAT_BLACKBELT_YOSHI
	iftrue .CheckNext1
	faceplayer
	opentext
	writetext Text_GoBeatBlackbelts
	waitbutton
	closetext
	end
	
.CheckNext1
	checkevent EVENT_BEAT_BLACKBELT_LAO
	iftrue .CheckNext2
	faceplayer
	opentext
	writetext Text_GoBeatBlackbelts
	waitbutton
	closetext
	end
	
.CheckNext2
	checkevent EVENT_BEAT_BLACKBELT_NOB
	iftrue .CheckNext3
	faceplayer
	opentext
	writetext Text_GoBeatBlackbelts
	waitbutton
	closetext
	end
	
.CheckNext3
	checkevent EVENT_BEAT_BLACKBELT_LUNG
	iftrue .BeatAllBlackbelts
	faceplayer
	opentext
	writetext Text_GoBeatBlackbelts
	waitbutton
	closetext
	end
	
.BeatAllBlackbelts
	checkevent EVENT_GOT_TYROGUE_FROM_KIYO
	iftrue .GotTyrogueDojo
	opentext
	writetext Text_BeatEm
	buttonsound
	waitsfx
	checkcode VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .NoRoomTyrogue
	writetext UnknownText_0x7e3551
	playsound SFX_CAUGHT_MON
	waitsfx
	givepoke TYROGUE, 10
	setevent EVENT_GOT_TYROGUE_FROM_KIYO
	writetext Text_FocusBandDescription
	waitbutton
	closetext
	end

.GotTyrogueDojo:
	opentext
	writetext Text_GoodJob
	waitbutton
	closetext
	end
.NoRoomTyrogue:
	writetext UnknownText_0x7e3df1
	waitbutton
	closetext
	end


FightingDojoSign1:
	jumptext FightingDojoSign1Text

FightingDojoSign2:
	jumptext FightingDojoSign2Text

FightingDojoFocusBand:
	itemball FOCUS_BAND
TrainerBlackbeltYoshi:
	trainer BLACKBELT_T, YOSHI, EVENT_BEAT_BLACKBELT_YOSHI, BlackbeltYoshiSeenText, BlackbeltYoshiBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BlackbeltYoshiAfterText
	waitbutton
	closetext
	end

TrainerBlackbeltLao:
	trainer BLACKBELT_T, LAO, EVENT_BEAT_BLACKBELT_LAO, BlackbeltLaoSeenText, BlackbeltLaoBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BlackbeltLaoAfterText
	waitbutton
	closetext
	end

TrainerBlackbeltNob:
	trainer BLACKBELT_T, NOB, EVENT_BEAT_BLACKBELT_NOB, BlackbeltNobSeenText, BlackbeltNobBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BlackbeltNobAfterText
	waitbutton
	closetext
	end

TrainerBlackbeltLung:
	trainer BLACKBELT_T, LUNG, EVENT_BEAT_BLACKBELT_LUNG, BlackbeltLungSeenText, BlackbeltLungBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BlackbeltLungAfterText
	waitbutton
	closetext
	end
	
UnknownText_0x7e3551:
	text "<PLAYER> received"
	line "TYROGUE."
	done
	
UnknownText_0x7e3df1:
	text "You have no room"
	line "in your party!"
	done
	
Text_FocusBandDescription:
	text "TYROGUE can evolve"
	line "into one of three"
	para "different FIGHTING"
	line "#MON!"
	para "A trainer like you"
	line "should have no"
	cont "issue raising it!"
	done
	
Text_GoodJob:
	text "WAHA! You should"
	line "train in our DOJO,"
	cont "kid!"
	done
	
Text_BeatEm:
	text "Wow, kid!"
	para "That was an"
	line "impressive show!"
	para "You've earned"
	line "this!"
	done

Text_GoBeatBlackbelts:
	text "Hey kid!"
	para "If you can defeat"
	line "my students, I'll"
	para "reward you with"
	line "a prize!"
	done

FightingDojoBlackBeltText:
	text "Hello!"

	para "KARATE KING, the"
	line "FIGHTING DOJO's"

	para "master, is in a"
	line "cave in JOHTO for"
	cont "training."
	done

FightingDojoSign1Text:
	text "What goes around"
	line "comes around!"
	done

FightingDojoSign2Text:
	text "Enemies on every"
	line "side!"
	done

BlackbeltYoshiSeenText:
	text "My #MON and I"
	line "are bound togeth-"
	cont "er by friendship."

	para "Our bond will"
	line "never be broken!"
	done

BlackbeltYoshiBeatenText:
	text "This isn't real!"
	done

BlackbeltYoshiAfterText:
	text "You seem to have a"
	line "strong bond with"
	cont "your #MON too!"
	done

BlackbeltLaoSeenText:
	text "We martial artists"
	line "fear nothing!"
	done

BlackbeltLaoBeatenText:
	text "That's shocking!"
	done

BlackbeltLaoAfterText:
	text "Fighting #MON"
	line "are afraid of psy-"
	cont "chics…"
	done

BlackbeltNobSeenText:
	text "Words are useless."
	line "Let your fists do"
	cont "the talking!"
	done

BlackbeltNobBeatenText:
	text "…"
	done

BlackbeltNobAfterText:
	text "I lost! "
	line "I'm speechless!"
	done

BlackbeltLungSeenText:
	text "My raging fists"
	line "will shatter your"
	cont "#MON!"
	done

BlackbeltLungBeatenText:
	text "I got shattered!"
	done

BlackbeltLungAfterText:
	text "My #MON lost…"
	line "My… my pride is"
	cont "shattered…"
	done

FightingDojo_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  5, 11, ALLOY_CITY, 11
	warp_event  6, 11, ALLOY_CITY, 4

	db 0 ; coord events

	db 2 ; bg events
	bg_event  5,  0, BGEVENT_READ, FightingDojoSign1
	bg_event  6,  0, BGEVENT_READ, FightingDojoSign2

	db 6 ; object events
	object_event  5,  3, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, FightingDojoBlackBelt, -1
	object_event  4,  1, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, FightingDojoFocusBand, EVENT_PICKED_UP_FOCUS_BAND
	object_event  4,  7, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 2, TrainerBlackbeltYoshi, -1
	object_event  7,  8, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 2, TrainerBlackbeltLao, -1
	object_event  7,  6, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 2, TrainerBlackbeltNob, -1
	object_event  4,  5, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 2, TrainerBlackbeltLung, -1
