	const_def 2 ; object constants
	const MAHOGANYREDGYARADOSSPEECHHOUSE_BLACK_BELT

SanskritCoinCaseSpeechHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks


SanskritCoinCaseSpeechHouseBlackBeltScript:
	faceplayer
	opentext
	checkevent EVENT_GOLDENROD_UNDERGROUND_COIN_CASE
	iftrue .GotCoinCase
	writetext SanskritCoinCaseSpeechHouseBlackBeltText_Question
	yesorno
	iffalse .Refused
	writetext SanskritCoinCaseSpeechHouseBlackBeltText_Yes
	buttonsound
	verbosegiveitem COIN_CASE
	writetext SanskritCoinCaseSpeechHouseBlackBeltText_GiveCoinCase
	waitbutton
	closetext
	setevent EVENT_GOLDENROD_UNDERGROUND_COIN_CASE
	end

.Refused:
	writetext SanskritCoinCaseSpeechHouseBlackBeltText_No
	waitbutton
	closetext
	end

.GotCoinCase:
	writetext SanskritCoinCaseSpeechHouseBlackBeltText_After
	waitbutton
	closetext
	end


SanskritCoinCaseSpeechHouseBlackBeltText_Question:
	text "SANSKRIT TOWN"
	line "hasn't had any"
	cont "true venues for"
	cont "entertainment."
	
	para "That is, until the"
	line "GAME CORNER opened"
	cont "near here."
	
	para "I've spent way too"
	line "much time there."

	para "Here! You should"
	line "take this from me!"
	done

SanskritCoinCaseSpeechHouseBlackBeltText_Yes:
	text "Great! Maybe you"
	line "will be more"
	para "responsible than"
	line "me!"
	done

SanskritCoinCaseSpeechHouseBlackBeltText_GiveCoinCase:
	text "The GAME CORNER"
	line "is tons of fun!"
	para "But be careful,"
	line "and don't let it"
	para "become too much"
	line "fun."
	done

SanskritCoinCaseSpeechHouseBlackBeltText_No:
	text "Oh. I guess I"
	line "should work on my"
	para "own self-restraint"
	line "instead…"
	done

SanskritCoinCaseSpeechHouseBlackBeltText_After:
	text "Ah, a burden has"
	line "been lifted from"
	cont "me."
	done


SanskritCoinCaseSpeechHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, SANSKRIT_TOWN, 2
	warp_event  5,  7, SANSKRIT_TOWN, 2

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  8,  3, SPRITE_GENTLEMAN, SPRITEMOVEDATA_WALK_UP_DOWN, 2, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SanskritCoinCaseSpeechHouseBlackBeltScript, -1
