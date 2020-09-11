	const_def 2
	const DAITOHOUSE_GEOFFREY
	const DAITOHOUSE_GNOTE

DaitoGardenerGeoffHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks


GeoffInsideScript:
	faceplayer
	checkevent EVENT_GOT_BERRY_JUICE_FROM_GEOFF
	iftrue gotjuiceoutside
	opentext
	writetext GeoffInsideMeetText
	buttonsound
	verbosegiveitem BERRY_JUICE
	iffalse NoRoomGeoff
	setevent EVENT_GOT_BERRY_JUICE_FROM_GEOFF
gotjuiceoutside:
	opentext
	writetext WantFactText
	yesorno
	iffalse EndConvo
	random 5
	jump GeoffJumptable
EndConvo:
	writetext AhOkText
	waitbutton
NoRoomGeoff:
	closetext
	end
	
GeoffJumptable:
	ifequal 0, papayas
	ifequal 1, coconuts
	ifequal 2, mangoes
	ifequal 3, bananas
	ifequal 4, pineapples
	
papayas:
	writetext PapayaText
	waitbutton
	jump NoRoomGeoff
	
	
WantFactText:
	text "Want to hear"
	line "about some of"
	cont "the tropical"
	cont "fruits I've"
	cont "been growing?"
	done
	
AhOkText:
	text "Ah alright,"
	line "maybe another"
	cont "time then."
	done
	
PapayaText:
	text "Papayas are one"
	line "of the easiest"
	cont "tropical fruit"
	cont "to grow, all"
	cont "you really need"
	cont "to do is throw"
	cont "the seeds in"
	cont "your yard and"
	cont "watch them all"
	cont "spring up!"
	
	para "The things take"
	line "so well that"
	cont "they're almost"
	cont "like a weed!"
	
	para "The male plants"
	line "won't produce"
	cont "any fruit, feel"
	cont "free to just"
	cont "chop them down."
	done
	
coconuts:
	writetext CoconutText
	waitbutton
	jump NoRoomGeoff
	
CoconutText:
	text "People usually"
	line "think of a"
	cont "coconut as a"
	cont "hairy, brown"
	cont "sphere."
	
	para "Actually, they"
	line "only look like"
	cont "that after their"
	cont "dense, fibrous"
	cont "husk is removed."
	
	para "The best way to"
	line "husk a coconut is"
	cont "with the nail"
	cont "removing part"
	cont "of a hammer, by"
	cont "making slats in"
	cont "the husk then"
	cont "prying it back"
	cont "in parts!"
	
	para "Try this trick"
	line "if you ever"
	cont "end up stranded"
	cont "on an island"
	cont "with a carpenter."
	done
	
mangoes:
	writetext MangoText
	waitbutton
	jump NoRoomGeoff
	
MangoText:
	text "Mangoes take a"
	line "few months to"
	cont "fully mature on"
	cont "the tree."
	
	para "And the trees"
	line "themselves can"
	cont "take years to"
	cont "get large enough"
	cont "to produce a"
	cont "single mango."
	
	para "Some cultures eat"
	line "mangoes unripe."
	
	para "They're painfully"
	line "hard to bite"
	cont "into, and very"
	cont "ascorbic."
	
	para "I eat them like"
	line "that anyway"
	cont "because I'm"
	cont "impatient!"
	done
	
	
bananas:
	writetext BananaText
	waitbutton
	jump NoRoomGeoff
	
BananaText:
	text "Bananas are one"
	line "of the most"
	cont "recognizable of"
	cont "all the fruits."
	
	para "But did you know"
	line "all the bananas"
	cont "you see at the"
	cont "supermarket are"
	cont "genetically the"
	cont "same?"
	
	para "Commercial banana"
	line "crops have no"
	cont "seeds due to"
	cont "domestication so"
	cont "they have to be"
	cont "stem-propagated."
	
	para "This means all"
	line "banana plants are"
	cont "practically the"
	cont "same in a crop."
	
	para "This backfired"
	line "once when a"
	cont "blight made an"
	cont "entire cultivar"
	cont "of banana go"
	cont "extinct, and"
	cont "growers had"
	cont "to switch to"
	cont "one that was"
	cont "immune!"
	done
	
	
	
pineapples:
	writetext PineappleText
	waitbutton
	jump NoRoomGeoff

PineappleText:
	text "Similar to the"
	line "banana, most"
	cont "pineapples are"
	cont "exactly the"
	cont "same because of"
	cont "how they're"
	cont "propagated!"
	
	para "Try this at"
	line "home if you live"
	cont "somewhere warm"
	cont "enough:"
	
	para "Keep the top"
	line "spines of your"
	cont "pineapple from"
	cont "the store, and"
	cont "plant it right"
	cont "back into the"
	cont "ground."
	
	para "Water it and"
	line "take good care"
	cont "and you'll soon"
	cont "find it growing"
	cont "again, and it'll"
	cont "even sprout a"
	cont "new pineapple!"

	para "Repeat this"
	line "process for an"
	cont "endless supply of"
	cont "free pineapples."
	done

GeoffInsideMeetText:
	text "Hey I remember"
	line "you from ROUTE"
	cont "104, you've"
	cont "come a long way"
	cont "to get to my"
	cont "summer home!"
	
	para "This is where"
	line "I come to spend"
	cont "some comfy rest &"
	cont "relaxation time"
	cont "away from the"
	cont "rough desert."
	
	para "Since you took"
	line "the time to come"
	cont "all the way out"
	cont "here to see me,"
	cont "this drink's on"
	cont "the house!"
	done


GeoffOutNote:
	jumptext GeoffOutNoteText
	
GeoffOutNoteText:
	text "Out getting some"
	line "supplies, be back"
	cont "in the afternoon"
	cont "- GEOFFREY"
	done

DaitoGardenerGeoffHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, DAITO_RANCH, 3
	warp_event  5,  7, DAITO_RANCH, 3

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event 7,  4, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN,0, 0, -1, NITE, PAL_NPC_BROWN , OBJECTTYPE_SCRIPT, 0, GeoffInsideScript, -1
	object_event  5,  4, SPRITE_PAPER, 0, 0, 0, -1, MORN, PAL_OW_SILVER, OBJECTTYPE_SCRIPT, 0, GeoffOutNote, -1
