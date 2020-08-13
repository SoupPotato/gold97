	const_def 2 ; object constants
	const ROUTE38_STANDING_YOUNGSTER1
	const ROUTE38_LASS
	const ROUTE38_STANDING_YOUNGSTER2
	const ROUTE38_SAILOR
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
	trainer LASS, DANA1, EVENT_BEAT_LASS_DANA, LassDana1SeenText, LassDana1BeatenText, 0, .Script

.Script
	writecode VAR_CALLERID, PHONE_LASS_DANA
	endifjustbattled
	opentext
	checkflag ENGINE_DANA
	iftrue .DanaRematch
	checkflag ENGINE_DANA_HAS_THUNDERSTONE
	iftrue .TryGiveThunderstone
	checkcellnum PHONE_LASS_DANA
	iftrue .NumberAccepted
	checkevent EVENT_DANA_ASKED_FOR_PHONE_NUMBER
	iftrue .SecondTimeAsking
	writetext UnknownText_0x1a20ec
	buttonsound
	setevent EVENT_DANA_ASKED_FOR_PHONE_NUMBER
	scall .AskNumber1F
	jump .AskForPhoneNumber

.SecondTimeAsking:
	scall .AskNumber2F
.AskForPhoneNumber:
	askforphonenumber PHONE_LASS_DANA
	ifequal PHONE_CONTACTS_FULL, .PhoneFull
	ifequal PHONE_CONTACT_REFUSED, .DeclinedPhoneNumber
	trainertotext LASS, DANA1, MEM_BUFFER_0
	scall .RegisteredPhoneNumber
	jump .NumberAccepted

.DanaRematch:
	scall .Rematch
	winlosstext LassDana1BeatenText, 0
	copybytetovar wDanaFightCount
	ifequal 4, .Fight4
	ifequal 3, .Fight3
	ifequal 2, .Fight2
	ifequal 1, .Fight1
	ifequal 0, .LoadFight0
.Fight4:
	checkevent EVENT_FAST_SHIP_CABINS_SE_SSE_GENTLEMAN
	iftrue .LoadFight4
.Fight3:
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .LoadFight3
.Fight2:
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .LoadFight2
.Fight1:
	checkevent EVENT_BEAT_CHUCK
	iftrue .LoadFight1
.LoadFight0:
	loadtrainer LASS, DANA1
	startbattle
	reloadmapafterbattle
	loadvar wDanaFightCount, 1
	clearflag ENGINE_DANA
	end

.LoadFight1:
	loadtrainer LASS, DANA2
	startbattle
	reloadmapafterbattle
	loadvar wDanaFightCount, 2
	clearflag ENGINE_DANA
	end

.LoadFight2:
	loadtrainer LASS, DANA3
	startbattle
	reloadmapafterbattle
	loadvar wDanaFightCount, 3
	clearflag ENGINE_DANA
	end

.LoadFight3:
	loadtrainer LASS, DANA4
	startbattle
	reloadmapafterbattle
	loadvar wDanaFightCount, 4
	clearflag ENGINE_DANA
	end

.LoadFight4:
	loadtrainer LASS, DANA5
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_DANA
	end

.TryGiveThunderstone:
	scall .Gift
	verbosegiveitem THUNDERSTONE
	iffalse .NoRoomForThunderstone
	clearflag ENGINE_DANA_HAS_THUNDERSTONE
	setevent EVENT_DANA_GAVE_THUNDERSTONE
	jump .NumberAccepted

.NoRoomForThunderstone:
	jump .PackFull

.AskNumber1F:
	jumpstd asknumber1f
	end

.AskNumber2F:
	jumpstd asknumber2f
	end

.RegisteredPhoneNumber:
	jumpstd registerednumberf
	end

.NumberAccepted:
	jumpstd numberacceptedf
	end

.DeclinedPhoneNumber:
	jumpstd numberdeclinedf
	end

.PhoneFull:
	jumpstd phonefullf
	end

.Rematch:
	jumpstd rematchf
	end

.Gift:
	jumpstd giftf
	end

.PackFull:
	jumpstd packfullf
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
	fruittree FRUITTREE_ROUTE_38

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
