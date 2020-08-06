	const_def 2 ; object constants
	const OLIVINEGOODRODHOUSE_FISHING_GURU

AlloyGoodRodHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

GoodRodGuru:
	faceplayer
	opentext
	checkevent EVENT_GOT_GOOD_ROD
	iftrue .AlreadyGotItem
	writetext OfferGoodRodText
	yesorno
	iffalse .DontWantIt
	writetext GiveGoodRodText
	buttonsound
	verbosegiveitem GOOD_ROD
	writetext GaveGoodRodText
	waitbutton
	closetext
	setevent EVENT_GOT_GOOD_ROD
	end

.DontWantIt:
	writetext DontWantGoodRodText
	waitbutton
	closetext
	end

.AlreadyGotItem:
	writetext HaveGoodRodText
	waitbutton
	closetext
	end

GoodRodHouseBookshelf:
; unused
	jumpstd picturebookshelf

OfferGoodRodText:
	text "The canal that"
	line "runs through the"
	para "city is a popular"
	line "fishing spot."
	para "Wouldn't you like"
	line "to take up a ROD"
	cont "and fish in it?"
	done

GiveGoodRodText:
	text "Ah, hahah!"
	line "We have ourselves"
	cont "a new angler!"
	done

GaveGoodRodText:
	text "Fish aren't found"
	line "in the sea alone."

	para "They go wherever"
	line "there is water."
	done

DontWantGoodRodText:
	text "Whaaat? You don't"
	line "like to fish!?"
	cont "Incomprehensible!"
	done

HaveGoodRodText:
	text "How are things?"
	line "Land the big one?"
	done

AlloyGoodRodHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, ALLOY_CITY, 6
	warp_event  5,  7, ALLOY_CITY, 6

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  2,  3, SPRITE_FISHING_GURU, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, GoodRodGuru, -1
