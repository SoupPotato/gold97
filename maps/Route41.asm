	const_def 2 ; object constants
	const ROUTE41_SWIMMER_GUY1
	const ROUTE41_SWIMMER_GIRL1

Route41_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Route41WhirlIslandSign:
	jumptext Route41WhirlIslandSignText

TrainerSwimmerfKaylee:
	trainer SWIMMERF, KAYLEE, EVENT_BEAT_SWIMMERF_KAYLEE, SwimmerfKayleeSeenText, SwimmerfKayleeBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerfKayleeAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmermMathew:
	trainer SWIMMERM, MATHEW, EVENT_BEAT_SWIMMERM_MATHEW, SwimmermMathewSeenText, SwimmermMathewBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermMathewAfterBattleText
	waitbutton
	closetext
	end

Route41Rock:
; unused
	jumpstd smashrock

Route41HiddenMaxEther:
	hiddenitem MAX_ETHER, EVENT_ROUTE_41_HIDDEN_MAX_ETHER

Route41WhirlIslandSignText:
	text "WHIRL ISLAND"
	line "ENTRANCE"
	done

SwimmerfKayleeSeenText:
	text "I bet you're only"
	line "riding on a"
	para "#MON because"
	line "you can't handle"
	cont "the cold water!"
	done

SwimmerfKayleeBeatenText:
	text "Is that how you do"
	line "it?"
	done

SwimmerfKayleeAfterBattleText:
	text "It honestly might"
	line "be dangerous to"
	para "stay in this water"
	line "for too long."
	done
	
SwimmermMathewSeenText:
	text "Brr!"
	para "The cold water"
	line "builds character!"
	done

SwimmermMathewBeatenText:
	text "Ooh, you've got"
	line "great endurance!"
	done

SwimmermMathewAfterBattleText:
	text "I can't swim any"
	line "farther north."
	para "The waters get too"
	line "dangerous."
	done


Route41_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  1, 20, WHIRL_ISLAND_NW, 1
	warp_event  5, 31, WHIRL_ISLAND_NE, 1
	warp_event  8, 51, ROUTE_29_ROUTE_46_GATE, 1
	warp_event  9, 51, ROUTE_29_ROUTE_46_GATE, 2

	db 0 ; coord events

	db 2 ; bg events
	bg_event  4, 33, BGEVENT_ITEM, Route41HiddenMaxEther
	bg_event  7, 33, BGEVENT_READ, Route41WhirlIslandSign


	db 2 ; object events
	object_event  8, 43, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerSwimmermMathew, -1
	object_event 13, 11, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerSwimmerfKaylee, -1

