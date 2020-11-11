	const_def 2 ; object constants
	const ROUTE38_LASS
	const ROUTE38_YOUNGSTER
	const ROUTE38_FRUIT_TREE
	const ROUTE38_BUENA2

Route108_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TrainerBirdKeeperToby:
	trainer BIRD_KEEPER, TOBY, EVENT_BEAT_BIRD_KEEPER_TOBY, BirdKeeperTobySeenText, BirdKeeperTobyBeatenText, 0, .Script

.Script
	endifjustbattled
	opentext
	writetext BirdKeeperTobyAfterBattleText
	waitbutton
	closetext
	end

TrainerLassDana1:
	trainer LASS, DANA, EVENT_BEAT_LASS_DANA, LassDana1SeenText, LassDana1BeatenText, 0, .Script

.Script
	endifjustbattled
	opentext
	writetext UnknownText_0x1a20ec
	waitbutton
	closetext
	end

TrainerBeautyOlivia:
	trainer BEAUTY, OLIVIA, EVENT_BEAT_BEAUTY_OLIVIA, BeautyOliviaSeenText, BeautyOliviaBeatenText, 0, .Script

.Script
	endifjustbattled
	opentext
	writetext BeautyOliviaAfterBattleText
	waitbutton
	closetext
	end

Route108Sign:
	jumptext Route108SignText

Route108TrainerTips:
	jumptext Route108TrainerTipsText

Route108FruitTree:
	fruittree FRUITTREE_ROUTE_108

BirdKeeperTobySeenText:
	text "Fly high into the"
	line "sky, my beloved"
	cont "bird #MON!"
	done

BirdKeeperTobyBeatenText:
	text "I feel like just"
	line "flying away now."
	done

BirdKeeperTobyAfterBattleText:
	text "I plan to train in"
	line "ALLOY CITY at"
	cont "the FIGHTING DOJO."
	para "FLYING #MON are"
	line "strong against"
	cont "FIGHTING TYPE."
	para "…Is that an"
	line "unfair advantage?"
	done

LassDana1SeenText:
	text "You seem to be"
	line "good at #MON."

	para "If you are, how"
	line "about giving me"
	cont "some advice?"
	done

LassDana1BeatenText:
	text "I see. So you can"
	line "battle that way."
	done

UnknownText_0x1a20ec:
	text "I know something"
	line "good!"

	para "MOOMOO MILK is"
	line "a nutritious drink"
	cont "for #MON!"
	para "You can buy it"
	line "over in STAND"
	cont "CITY."
	done

BeautyOliviaSeenText:
	text "Don't you think my"
	line "#MON and I are"
	cont "beautiful?"
	done

BeautyOliviaBeatenText:
	text "I keep my #MON"
	line "prim and proper."
	done

BeautyOliviaAfterBattleText:
	text "Have you ever had"
	line "your #MON's"
	para "hair cut in"
	line "WESTPORT CITY?"
	done

Route108SignText:
	text "ROUTE 108"

	para "ALLOY CITY -"
	line "BLUE FOREST"
	done

Route108TrainerTipsText:
	text "TRAINER TIPS"

	para "If a #MON is"
	line "trying to evolve,"
	cont "you can stop it."

	para "Press the B But-"
	line "ton during evolu-"
	cont "tion."

	para "That startles the"
	line "#MON and stops"
	cont "its evolution."
	done

Route108_MapEvents:
	db 0, 0 ; filler

	db 0 ; warp events

	db 0 ; coord events

	db 2 ; bg events
	bg_event  6,  4, BGEVENT_READ, Route108Sign
	bg_event 18,  4, BGEVENT_READ, Route108TrainerTips

	db 4 ; object events
	object_event  8,  7, SPRITE_LASS, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerLassDana1, -1
	object_event 13, 13, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerBirdKeeperToby, -1
	object_event 28,  5, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route108FruitTree, -1
	object_event 23,  5, SPRITE_BUENA, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerBeautyOlivia, -1
