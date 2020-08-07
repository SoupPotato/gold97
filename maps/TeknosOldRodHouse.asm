	const_def 2 ; object constants
	const ECRUTEAKBLISSEYSPEECHHOUSE_FISHER

TeknosOldRodHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks


BlisseySpeechHouseRadio:
	jumpstd radio2
	

Route32Pokecenter1FFishingGuruScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_OLD_ROD
	iftrue .GotOldRod
	writetext Route32Pokecenter1FFishingGuruText_Question
	yesorno
	iffalse .Refused
	writetext Route32Pokecenter1FFishingGuruText_Yes
	buttonsound
	verbosegiveitem OLD_ROD
	writetext Route32Pokecenter1FFishingGuruText_GiveOldRod
	waitbutton
	closetext
	setevent EVENT_GOT_OLD_ROD
	end

.Refused:
	writetext Route32Pokecenter1FFishingGuruText_No
	waitbutton
	closetext
	end

.GotOldRod:
	writetext Route32Pokecenter1FFishingGuruText_After
	waitbutton
	closetext
	end


Route32Pokecenter1FFishingGuruText_Question:
	text "The river on"
	line "ROUTE 119 is a"
	para "popular fishing"
	line "spot."
	
	para "You want to fish?"

	para "Would you like one"
	line "of my RODS?"
	done

Route32Pokecenter1FFishingGuruText_Yes:
	text "Heh, that's good"
	line "to hear."

	para "Now you're an"
	line "angler too!"
	done

Route32Pokecenter1FFishingGuruText_GiveOldRod:
	text "Fishing is great!"

	para "If there's water,"
	line "be it the sea or a"

	para "stream, try out"
	line "your ROD."
	done

Route32Pokecenter1FFishingGuruText_No:
	text "Oh. That's rather"
	line "disappointing…"
	done

Route32Pokecenter1FFishingGuruText_After:
	text "Yo, kid. How are"
	line "they biting?"
	done

TeknosOldRodHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, TEKNOS_CITY, 4
	warp_event  5,  7, TEKNOS_CITY, 4

	db 0 ; coord events

	db 1 ; bg events
	bg_event  4,  1, BGEVENT_READ, BlisseySpeechHouseRadio

	db 1 ; object events
	object_event  7,  3, SPRITE_FISHING_GURU, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route32Pokecenter1FFishingGuruScript, -1
