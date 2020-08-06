	const_def 2 ; object constants
	const ROUTE21_SWIMMER_GIRL
	const ROUTE21_SWIMMER_GUY
	const ROUTE21_FISHER
	const ROUTE21_FISHER2
	const ROUTE21_SWIMMER_GUY2
	const ROUTE21_SWIMMER_GIRL2

Route107_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TrainerSwimmermSeth:
	trainer SWIMMERM, SETH, EVENT_BEAT_SWIMMERM_SETH, SwimmermSethSeenText, SwimmermSethBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermSethAfterBattleText
	waitbutton
	closetext
	end
	
TrainerSwimmermBerke:
	trainer SWIMMERM, BERKE, EVENT_BEAT_SWIMMERM_BERKE, SwimmermBerkeSeenText, SwimmermBerkeBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermBerkeAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmerfNikki:
	trainer SWIMMERF, NIKKI, EVENT_BEAT_SWIMMERF_NIKKI, SwimmerfNikkiSeenText, SwimmerfNikkiBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerfNikkiAfterBattleText
	waitbutton
	closetext
	end
	
TrainerFisherHenry:
	trainer FISHER, HENRY, EVENT_BEAT_FISHER_HENRY, FisherHenrySeenText, FisherHenryBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FisherHenryAfterText
	waitbutton
	closetext
	end
	
TrainerSwimmerfSusie:
	trainer SWIMMERF, SUSIE, EVENT_BEAT_SWIMMERF_SUSIE, SwimmerfSusieSeenText, SwimmerfSusieBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerfSusieAfterBattleText
	waitbutton
	closetext
	end

TrainerFisherArnold:
	trainer FISHER, ARNOLD, EVENT_BEAT_FISHER_ARNOLD, FisherArnoldSeenText, FisherArnoldBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FisherArnoldAfterBattleText
	waitbutton
	closetext
	end

SwimmermSethSeenText:
	text "Land ho! Gotta"
	line "keep going!"
	done

SwimmermSethBeatenText:
	text "Glug…"
	done

SwimmermSethAfterBattleText:
	text "One day I'd like"
	line "to train with the"
	para "DRAGON MASTER in"
	line "SUGAR TOWN."
	done

SwimmerfNikkiSeenText:
	text "If I win, you have"
	line "to help me with my"
	cont "suntan lotion!"
	done

SwimmerfNikkiBeatenText:
	text "I'm worried about"
	line "sunburn…"
	done

SwimmerfNikkiAfterBattleText:
	text "I have to watch"
	line "out for blemishes"
	cont "caused by the sun."
	done

FisherArnoldSeenText:
	text "I'm bored of"
	line "fishing."
	
	para "Let's battle!"
	done

FisherArnoldBeatenText:
	text "Utter failure…"
	done

FisherArnoldAfterBattleText:
	text "I'll just go back"
	line "to fishing…"
	done
	
SwimmermBerkeSeenText:
	text "C-cold?..."
	line "M-me?"

	para "N-not a chance!"
	done

SwimmermBerkeBeatenText:
	text "N-nope..."
	line "N-not c-cold!"
	done

SwimmermBerkeAfterBattleText:
	text "..."

	para "..."

	para "..."
	
	para "O-ok, s-so Im a"
	line "bit ch-chilly..."
	done
	
FisherHenrySeenText:
	text "My #MON?"
	line "Freshly caught!"
	done

FisherHenryBeatenText:
	text "SPLASH?"
	done

FisherHenryAfterText:
	text "Freshly caught"
	line "#MON are no"

	para "match for properly"
	line "raised ones."
	done
	
SwimmerfSusieSeenText:
	text "You look so ele-"
	line "gant, riding your"
	cont "#MON."
	done

SwimmerfSusieBeatenText:
	text "I'm crushed…"
	done

SwimmerfSusieAfterBattleText:
	text "Wasn't there a hit"
	line "song about a boy"
	cont "riding a LAPRAS?"
	done

Route107_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  8, 49, ROUTE_107_ALLOY_GATE, 1
	warp_event  9, 49, ROUTE_107_ALLOY_GATE, 2

	db 0 ; coord events

	db 0 ; bg events

	db 6 ; object events
	object_event 10, 31, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerSwimmerfNikki, -1
	object_event  9, 39, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerSwimmermSeth, -1
	object_event 12, 26, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, TrainerFisherArnold, -1
	object_event  6,  9, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, TrainerFisherHenry, -1
	object_event  5, 13, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerSwimmermBerke, -1
	object_event 11,  5, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerSwimmerfSusie, -1
