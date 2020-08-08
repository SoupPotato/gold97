	const_def 2 ; object constants
	const BLUESHOUSE_DAISY
	const KANTOHOUSE_2_POKEFANM

KantoHouse2_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

DaisyScript:
	faceplayer
	opentext
	checkcode VAR_HOUR
	ifequal 15, .ThreePM
	writetext DaisyHelloText
	waitbutton
	closetext
	end

.ThreePM:
	checkflag ENGINE_DAISYS_GROOMING
	iftrue .AlreadyGroomedMon
	writetext DaisyOfferGroomingText
	yesorno
	iffalse .Refused
	writetext DaisyWhichMonText
	waitbutton
	special DaisysGrooming
	ifequal $0, .Refused
	ifequal $1, .CantGroomEgg
	setflag ENGINE_DAISYS_GROOMING
	writetext DaisyAlrightText
	waitbutton
	closetext
	special FadeOutPalettes
	playmusic MUSIC_HEAL
	pause 60
	special FadeInPalettes
	special RestartMapMusic
	opentext
	writetext GroomedMonLooksContentText
	special PlayCurMonCry
	buttonsound
	writetext DaisyAllDoneText
	waitbutton
	closetext
	end

.AlreadyGroomedMon:
	writetext DaisyAlreadyGroomedText
	waitbutton
	closetext
	end

.Refused:
	writetext DaisyRefusedText
	waitbutton
	closetext
	end

.CantGroomEgg:
	writetext DaisyCantGroomEggText
	waitbutton
	closetext
	end
	
KantoHouse2PokefanMScript:
	jumptextfaceplayer KantoHouse2PokefanMText

KantoHouse2PokefanMText:
	text "Well, hi there!"
	para "We just love"
	line "having visitors."
	para "My wife can talk"
	line "anyone's ear off"
	cont "over some tea."
	done

DaisyHelloText:
	text "Oh, hello, dearie."
	para "I love meeting new"
	line "people."
	para "Maybe stop by one"
	line "afternoon and we"
	cont "can have some tea."
	done

DaisyOfferGroomingText:
	text "Hello! Oh, good"
	line "timing. I'm about"
	cont "to have some tea."

	para "Would you like to"
	line "join me?"

	para "Oh, your #MON"
	line "are a bit dirty."

	para "Would you like me"
	line "to groom one?"
	done

DaisyWhichMonText:
	text "Which one should"
	line "I groom?"
	done

DaisyAlrightText:
	text "OK, I'll get it"
	line "looking nice in no"
	cont "time."
	done

GroomedMonLooksContentText:
	text_ram wStringBuffer3
	text " looks"
	line "content."
	done

DaisyAllDoneText:
	text "There you go!"
	line "All done."

	para "See? Doesn't it"
	line "look nice?"

	para "It's such a cute"
	line "#MON."
	done

DaisyAlreadyGroomedText:
	text "I always have tea"
	line "around this time."
	para "Feel free to join"
	line "me."
	done

DaisyRefusedText:
	text "You don't want to"
	line "have one groomed?"

	para "OK, we'll just"
	line "have tea."
	done

DaisyCantGroomEggText:
	text "Oh, sorry."
	para "I honestly can't"
	line "groom an EGG."
	done

KantoHouse2_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, KANTO_REGION, 25
	warp_event  5,  7, KANTO_REGION, 25

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  1,  5, SPRITE_POKEFAN_F, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DaisyScript, -1
	object_event  7,  3, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KantoHouse2PokefanMScript, -1
