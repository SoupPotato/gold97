	const_def 2 ; object constants
	const ROUTE41_SWIMMER_GUY1
	const ROUTE41_SWIMMER_GIRL1

Route111_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Route111WhirlIslandSign:
	jumptext Route111WhirlIslandSignText

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
	
TrainerSwimmermGeorge:
	trainer SWIMMERM, GEORGE, EVENT_BEAT_SWIMMERM_GEORGE, SwimmermGeorgeSeenText, SwimmermGeorgeBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermGeorgeAfterBattleText
	waitbutton
	closetext
	end
	
TrainerSwimmerfKara:
	trainer SWIMMERF, KARA, EVENT_BEAT_SWIMMERF_KARA, SwimmerfKaraSeenText, SwimmerfKaraBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerfKaraAfterBattleText
	waitbutton
	closetext
	end

Route111Rock:
; unused
	jumpstd smashrock

Route111HiddenMaxEther:
	hiddenitem MAX_ETHER, EVENT_ROUTE_41_HIDDEN_MAX_ETHER

Route111WhirlIslandSignText:
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
	
SwimmermGeorgeSeenText:
	text "I'm a bit tired."
	line "If I win, lend me"
	cont "your #MON."
	done

SwimmermGeorgeBeatenText:
	text "Pant, pant…"
	done

SwimmermGeorgeAfterBattleText:
	text "It's so far to"
	line "NORTH ISLAND."

	para "But it's no easy"
	line "return trip to"
	cont "BLUE FOREST"
	cont "either."

	para "What should I do?"
	done

SwimmerfKaraSeenText:
	text "If you need to"
	line "rest, just tread"
	cont "water."

	para "You'll get your"
	line "wind back, so you"

	para "can keep on going"
	line "strong."
	done

SwimmerfKaraBeatenText:
	text "Oh! You have more"
	line "energy than I do."
	done

SwimmerfKaraAfterBattleText:
	text "I heard roars from"
	line "deep inside the"
	cont "ISLANDS."
	done

Route111_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  5, 31, WHIRL_ISLAND_1F, 1
	warp_event  8, 51, ROUTE_111_BLUE_FOREST_GATE, 1
	warp_event  9, 51, ROUTE_111_BLUE_FOREST_GATE, 2

	db 0 ; coord events

	db 2 ; bg events
	bg_event  4, 33, BGEVENT_ITEM, Route111HiddenMaxEther
	bg_event  7, 33, BGEVENT_READ, Route111WhirlIslandSign


	db 4 ; object events
	object_event 12, 17, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerSwimmermMathew, -1
	object_event 12,  8, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerSwimmerfKaylee, -1
	object_event 11, 26, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 4, TrainerSwimmermGeorge, -1
	object_event 10, 42, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerSwimmerfKara, -1

