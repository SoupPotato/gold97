	const_def 2 ; object constants
	const ROUTE12_FISHER3
	const ROUTE12_FISHER4
	const ROUTE12_POKE_BALL1
	const ROUTE12_POKE_BALL2
	const ROUTE12_POKEMANIAC

UrasoeTrail_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks


TrainerPokemaniacShane:
	trainer POKEMANIAC, SHANE, EVENT_BEAT_POKEMANIAC_SHANE, PokemaniacShaneSeenText, PokemaniacShaneBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokemaniacShaneAfterBattleText
	waitbutton
	closetext
	end


TrainerFisherStephen:
	trainer FISHER, STEPHEN, EVENT_BEAT_FISHER_STEPHEN, FisherStephenSeenText, FisherStephenBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FisherStephenAfterBattleText
	waitbutton
	closetext
	end

TrainerFisherBarney:
	trainer FISHER, BARNEY, EVENT_BEAT_FISHER_BARNEY, FisherBarneySeenText, FisherBarneyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FisherBarneyAfterBattleText
	waitbutton
	closetext
	end

UrasoeTrailSign:
	jumptext UrasoeTrailSignText

FishingSpotSign:
	jumptext FishingSpotSignText

UrasoeTrailCalcium:
	itemball CALCIUM

UrasoeTrailNugget:
	itemball NUGGET

UrasoeTrailHiddenElixer:
	hiddenitem ELIXER, EVENT_ROUTE_12_HIDDEN_ELIXER


FisherStephenSeenText:
	text "I feel so content,"
	line "fishing while lis-"
	cont "tening to some"
	cont "tunes on my radio."
	done

FisherStephenBeatenText:
	text "My stupid radio"
	line "distracted me!"
	done

FisherStephenAfterBattleText:
	text "Have you ever met"
	line "any of the radio"
	cont "hosts?"
	para "I wonder if"
	line "they're as cool"
	cont "as they sound."
	done

FisherBarneySeenText:
	text "Nothing beats a"
	line "day of fishing!"
	done

FisherBarneyBeatenText:
	text "Oof!"
	done

FisherBarneyAfterBattleText:
	text "Rumors going"
	line "around say that"
	para "YORON POINT on"
	line "the other side of"
	para "the STRAIT is a"
	line "better spot for"
	cont "fishing."
	para "That's a bunch of"
	line "nonsense."
	para "This side is"
	line "clearly better!"
	done


PokemaniacShaneSeenText:
	text "What does rarity"
	line "mean to you?"
	done

PokemaniacShaneBeatenText:
	text "I should have used"
	line "my MOON STONE…"
	done

PokemaniacShaneAfterBattleText:
	text "You're working on"
	line "a #DEX?"

	para "Wow, you must know"
	line "some pretty rare"
	cont "#MON!"

	para "May I please see"
	line "it. Please?"
	done

UrasoeTrailSignText:
	text "URASOE TRAIL"

	para "RYUKYU CITY -"
	line "YORON CITY"
	done

FishingSpotSignText:
	text "NANJO FOREST"
	line "ENTRANCE"
	done

UrasoeTrail_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  8,  5, URASOE_PARK_URASOE_TRAIL_GATE, 3
	warp_event  9,  5, URASOE_PARK_URASOE_TRAIL_GATE, 4
	warp_event 13, 26, NANJO_FOREST, 1
	warp_event 13, 27, NANJO_FOREST, 2

	db 0 ; coord events

	db 3 ; bg events
	bg_event  7,  7, BGEVENT_READ, UrasoeTrailSign
	bg_event 11, 25, BGEVENT_READ, FishingSpotSign
	bg_event  6,  4, BGEVENT_ITEM, UrasoeTrailHiddenElixer

	db 5 ; object events
	object_event  6, 21, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 0, TrainerFisherStephen, -1
	object_event  4, 14, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 0, TrainerFisherBarney, -1
	object_event  5,  4, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, UrasoeTrailCalcium, EVENT_ROUTE_12_CALCIUM
	object_event  5, 43, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, UrasoeTrailNugget, EVENT_ROUTE_12_NUGGET
	object_event 10,  9, SPRITE_SUPER_NERD, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerPokemaniacShane, -1
