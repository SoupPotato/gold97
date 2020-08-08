	const_def 2 ; object constants
	const DIGLETTSCAVE_POKEFAN_M
	const DIGLETTSCAVE_POKEMANIAC
	const DIGLETTSCAVE_ITEM_1

EndonCave1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks


EndonCave1FTMDynamicpunch:
	itemball TM_DYNAMICPUNCH

EndonCave1FHiddenMaxRevive:
	hiddenitem MAX_REVIVE, EVENT_DIGLETTS_CAVE_HIDDEN_MAX_REVIVE


Route2NuggetHouseFisherScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_NUGGET_FROM_GUY
	iftrue .GotNugget
	writetext Route2NuggetHouseFisherText
	buttonsound
	verbosegiveitem NUGGET
	iffalse .NoRoom
	setevent EVENT_GOT_NUGGET_FROM_GUY
.GotNugget:
	writetext Route2NuggetHouseFisherText_GotNugget
	waitbutton
.NoRoom:
	closetext
	end

Route2NuggetHouseBookshelf:
; unused
	jumpstd difficultbookshelf
	
TrainerPokemaniacCalvin:
	trainer POKEMANIAC, CALVIN, EVENT_BEAT_POKEMANIAC_CALVIN, PokemaniacCalvinSeenText, PokemaniacCalvinBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokemaniacCalvinAfterBattleText
	waitbutton
	closetext
	end

Route2NuggetHouseFisherText:
	text "Hello!"
	para "I may not look it,"
	line "but I'm fabulously"
	cont "wealthy."
	
	para "But alas! Wealth"
	line "does bore me."
	
	para "So I spend my time"
	line "wandering in"
	para "search of anything"
	line "that can amuse me."
	
	para "Right now, I've"
	line "decided to explore"
	cont "caves!"
	
	para "Caves are"
	line "fascinating!"
	
	para "It's so easy to"
	line "get lost in them!"
	
	para "Around every turn"
	line "is a new surprise!"
	
	para "Oh, and thank you"
	line "for listening!"
	
	para "Here, take this!"
	done

Route2NuggetHouseFisherText_GotNugget:
	text "That's a NUGGET."

	para "It's worth a lot"
	line "of money."
	
	para "It's actually not"
	line "taken from my"
	cont "saved wealth!"
	
	para "I found it in this"
	line "cave!"
	
	para "Ahahahahah!"
	done
	
PokemaniacCalvinSeenText:
	text "I spend all my"
	line "time in this cave,"
	cont "rasing my #MON."
	para "I wish to battle"
	line "with you."
	done
	
PokemaniacCalvinBeatenText:
	text "…sigh… I must"
	line "train some more…"
	done

PokemaniacCalvinAfterBattleText:
	text "Have you ever been"
	line "to SANSKRIT TOWN?"
	para "It's a mysterious"
	line "place."
	done

EndonCave1F_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  6, 15, ROUTE_117, 1
	warp_event 56, 15, ROUTE_117, 2
	warp_event 25,  5, ENDON_CAVE_B1F, 1
	warp_event 51, 11, ENDON_CAVE_B1F, 2

	db 0 ; coord events

	db 1 ; bg events
	bg_event  7, 10, BGEVENT_ITEM, EndonCave1FHiddenMaxRevive

	db 3 ; object events
	object_event 16,  7, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route2NuggetHouseFisherScript, -1
	object_event 14, 12, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerPokemaniacCalvin, -1
	object_event  4,  4, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, EndonCave1FTMDynamicpunch, EVENT_ROUTE_45_REVIVE

