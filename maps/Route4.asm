	const_def 2 ; object constants
	const ROUTE4_YOUNGSTER
	const ROUTE4_LASS1
	const ROUTE4_LASS2
	const ROUTE4_POKE_BALL
	const HONTO_ROUTE_TRAINER
	const HONTO_ROUTE_MON
	const ROUTE4_FRUIT_TREE

Route4_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	
HontoTownRouteCooltrainermScript:
	end
HontoTownRouteMonsterScript:
	end
	
Route11FruitTree:
	fruittree FRUITTREE_ROUTE_11

TrainerBirdKeeperHank:
	trainer BIRD_KEEPER, HANK, EVENT_BEAT_BIRD_KEEPER_HANK, BirdKeeperHankSeenText, BirdKeeperHankBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BirdKeeperHankAfterBattleText
	waitbutton
	closetext
	end

TrainerPicnickerHope:
	trainer PICNICKER, HOPE, EVENT_BEAT_PICNICKER_HOPE, PicnickerHopeSeenText, PicnickerHopeBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PicnickerHopeAfterBattleText
	waitbutton
	closetext
	end

TrainerPicnickerSharon:
	trainer PICNICKER, SHARON, EVENT_BEAT_PICNICKER_SHARON, PicnickerSharonSeenText, PicnickerSharonBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PicnickerSharonAfterBattleText
	waitbutton
	closetext
	end
	

TrainerSwimmermRandall:
	trainer SWIMMERM, RANDALL, EVENT_BEAT_SWIMMERM_RANDALL, SwimmermRandallSeenText, SwimmermRandallBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermRandallAfterBattleText
	waitbutton
	closetext
	end
	

MtMoonSquareSign:
	jumptext MtMoonSquareSignText

Route4HPUp:
	itemball HP_UP

Route4HiddenUltraBall:
	hiddenitem ULTRA_BALL, EVENT_ROUTE_4_HIDDEN_ULTRA_BALL

BirdKeeperHankSeenText:
	text "I'm raising my"
	line "#MON. Want to"
	cont "battle with me?"
	done

BirdKeeperHankBeatenText:
	text "Ack! I lost that"
	line "one…"
	done

BirdKeeperHankAfterBattleText:
	text "If you have a"
	line "specific #MON"

	para "that you want to"
	line "raise, put it out"

	para "first, then switch"
	line "it right away."

	para "That's how to do"
	line "it."
	done

PicnickerHopeSeenText:
	text "I have a feeling"
	line "that I can win."

	para "Let's see if I'm"
	line "right!"
	done

PicnickerHopeBeatenText:
	text "Aww, you are too"
	line "strong."
	done

PicnickerHopeAfterBattleText:
	text "I hear that some"
	line "#MON have baby"
	para "forms that hatch"
	line "from EGGs."

	para "But where does one"
	line "get #MON EGGs?"
	done

PicnickerSharonSeenText:
	text "Um…"
	line "I…"
	para "Battle me?"
	done

PicnickerSharonBeatenText:
	text "…"
	done

PicnickerSharonAfterBattleText:
	text "……I came here to"
	line "look for CLEFAIRY,"
	para "but I haven't"
	line "found any."
	done
	

	
SwimmermRandallSeenText:
	text "Hey, you're young"
	line "and fit!"

	para "Don't ride your"
	line "#MON! Swim!"
	done

SwimmermRandallBeatenText:
	text "Uh-oh. I lost…"
	done

SwimmermRandallAfterBattleText:
	text "Swimming exercises"
	line "your entire body."
	cont "It's healthy."
	done

MtMoonSquareSignText:
	text "ROUTE 118"
	para "SOUTH POINT -"
	line "HONTO TOWN"
	done

Route4_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  4, 11, ROUTE_7_SAFFRON_GATE, 4

	db 0 ; coord events

	db 2 ; bg events
	bg_event  6, 10, BGEVENT_READ, MtMoonSquareSign
	bg_event 16,  4, BGEVENT_ITEM, Route4HiddenUltraBall

	db 8 ; object events
	object_event 64,  8, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerBirdKeeperHank, -1
	object_event  8, 12, SPRITE_LASS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 2, TrainerPicnickerHope, -1
	object_event 11,  9, SPRITE_LASS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 4, TrainerPicnickerSharon, -1
	object_event  6,  4, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route4HPUp, EVENT_ROUTE_4_HP_UP
	object_event 72,  4, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, HontoTownRouteCooltrainermScript, -1
	object_event 72,  5, SPRITE_MONSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, HontoTownRouteMonsterScript, -1
	object_event 16,  6, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route11FruitTree, -1
	object_event 45, 10, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerSwimmermRandall, -1
