	const_def 2 ; object constants
	const ILEXFOREST_ROCKER
	const ILEXFOREST_POKE_BALL1
	;const ILEXFOREST_KURT
	const ILEXFOREST_LASS
	const ILEXFOREST_YOUNGSTER2
	const ILEXFOREST_POKE_BALL2
	const ILEXFOREST_POKE_BALL3
	const ILEXFOREST_POKE_BALL4
	const ILEXFOREST_HIKER
	const ILEXFOREST_FIREBREATHER
	const ILEXFOREST_COOLTRAINERF
	const ROUTE42_FRUIT_TREE1
	const ROUTE42_FRUIT_TREE2
	const ROUTE42_FRUIT_TREE3

IlexForest_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks


IlexForestHeadbuttGuyScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_TM02_HEADBUTT
	iftrue .AlreadyGotHeadbutt
	writetext Text_HeadbuttIntro
	buttonsound
	verbosegiveitem TM_HEADBUTT
	iffalse .BagFull
	setevent EVENT_GOT_TM02_HEADBUTT
.AlreadyGotHeadbutt:
	writetext Text_HeadbuttOutro
	waitbutton
.BagFull:
	closetext
	end

TrainerBugCatcherWayne:
	trainer BUG_CATCHER, WAYNE, EVENT_BEAT_BUG_CATCHER_WAYNE, BugCatcherWayneSeenText, BugCatcherWayneBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BugCatcherWayneAfterBattleText
	waitbutton
	closetext
	end
	
TrainerHikerLeonard:
	trainer HIKER, LEONARD, EVENT_BEAT_HIKER_LEONARD, HikerLeonardSeenText, HikerLeonardBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext HikerLeonardAfterBattleText
	waitbutton
	closetext
	end
	

TrainerFirebreatherBill:
	trainer FIREBREATHER, BILL, EVENT_BEAT_FIREBREATHER_BILL, FirebreatherBillSeenText, FirebreatherBillBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FirebreatherBillAfterBattleText
	waitbutton
	closetext
	end
	

TrainerCooltrainerfGwen:
	trainer COOLTRAINERF, GWEN, EVENT_BEAT_COOLTRAINERF_GWEN, CooltrainerfGwenSeenText, CooltrainerfGwenBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainerfGwenAfterBattleText
	waitbutton
	closetext
	end

IlexForestLassScript:
	jumptextfaceplayer Text_IlexForestLass

IlexForestRevive:
	itemball REVIVE

IlexForestXAttack:
	itemball X_ATTACK

IlexForestAntidote:
	itemball ANTIDOTE

IlexForestEther:
	itemball ETHER

IlexForestHiddenEther:
	hiddenitem ETHER, EVENT_ILEX_FOREST_HIDDEN_ETHER

IlexForestHiddenSuperPotion:
	hiddenitem SUPER_POTION, EVENT_ILEX_FOREST_HIDDEN_SUPER_POTION

IlexForestHiddenFullHeal:
	hiddenitem FULL_HEAL, EVENT_ILEX_FOREST_HIDDEN_FULL_HEAL

IlexForestBoulder:
; unused
	jumpstd strengthboulder

IlexForestSignpost:
	jumptext IlexForestSignpostText

IlexForestSignpost2:
	jumptext IlexForestSignpost2Text
	

Route42FruitTree1:
	fruittree FRUITTREE_ROUTE_42_1

Route42FruitTree2:
	fruittree FRUITTREE_ROUTE_42_2

Route42FruitTree3:
	fruittree FRUITTREE_ROUTE_42_3

Text_HeadbuttIntro:
	text "What am I doing?"

	para "I'm shaking trees"
	line "using HEADBUTT."

	para "It's fun. Here,"
	line "you try it too!"
	done

Text_HeadbuttOutro:
	text "Rattle trees with"
	line "HEADBUTT. Some-"
	cont "times, sleeping"
	cont "#MON fall out."
	done

Text_IlexForestLass:
	text "There are a lot"
	line "of #MON in the"
	para "FOREST with moves"
	line "that can inflict"
	cont "status conditions."
	para "It's a good idea"
	line "to stock up on"
	cont "items."
	done

IlexForestSignpostText:
	text "NIHON FOREST is"
	line "so overgrown with"

	para "trees that you"
	line "can't see the sky."

	para "Please watch out"
	line "for items that may"
	cont "have been dropped."
	done
	
IlexForestSignpost2Text:
	text "Exit to the right"
	line "for ROUTE 106"
	done

BugCatcherWayneSeenText:
	text "Don't sneak up on"
	line "me like that!"

	para "You frightened a"
	line "#MON away!"
	done

BugCatcherWayneBeatenText:
	text "I hadn't seen that"
	line "#MON before…"
	done

BugCatcherWayneAfterBattleText:
	text "A #MON I've"
	line "never seen before"

	para "fell out of the"
	line "tree when I used"
	cont "HEADBUTT."

	para "I ought to use"
	line "HEADBUTT in other"
	cont "places too."
	done


HikerLeonardSeenText:
	text "I'm walking"
	line "through this"
	para "FOREST until I see"
	line "every #MON that"
	cont "lives here!"
	done

HikerLeonardBeatenText:
	text "I should stick to"
	line "hiking!"
	done

HikerLeonardAfterBattleText:
	text "The FOREST has"
	line "many species of"
	para "#MON that don't"
	line "appear anywhere"
	cont "else."
	done


FirebreatherBillSeenText:
	text "Nothing in this"
	line "FOREST can handle"
	cont "my FIRE #MON!"
	done

FirebreatherBillBeatenText:
	text "Yeowch!"
	done

FirebreatherBillAfterBattleText:
	text "I gotta be careful"
	line "not to set the"
	cont "trees on fire."
	done
	

CooltrainerfGwenSeenText:
	text "I'm not lost!"
	para "And even if I was,"
	line "my team is ready"
	cont "for any TRAINER!"
	done

CooltrainerfGwenBeatenText:
	text "It's important to"
	line "be prepared."
	done

CooltrainerfGwenAfterBattleText:
	text "I definitely know"
	line "where I'm going!"
	done

IlexForest_MapEvents:
	db 0, 0 ; filler

	db 8 ; warp events
	warp_event  0, 26, ROUTE_31, 3
	warp_event  0, 27, ROUTE_31, 4
	warp_event 49, 26, ROUTE_31, 5
	warp_event 49, 27, ROUTE_31, 6
	warp_event  4, 56, ROUTE_16, 4
	warp_event  4, 57, ROUTE_16, 5
	warp_event  4,  4, CERULEAN_GYM, 1
	warp_event  5,  4, CERULEAN_GYM, 2
	
	db 0 ; coord events

	db 5 ; bg events
	bg_event 27, 41, BGEVENT_READ, IlexForestSignpost
	bg_event 32,  6, BGEVENT_ITEM, IlexForestHiddenEther
	bg_event 13, 55, BGEVENT_ITEM, IlexForestHiddenSuperPotion
	bg_event 30, 53, BGEVENT_ITEM, IlexForestHiddenFullHeal
	bg_event 39, 29, BGEVENT_READ, IlexForestSignpost2

	db 13 ; object events
	object_event 19,  8, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, IlexForestHeadbuttGuyScript, -1
	object_event 23, 55, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, IlexForestRevive, EVENT_ILEX_FOREST_REVIVE
	;object_event 12, 29, SPRITE_KURT, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_ILEX_FOREST_KURT
	object_event 17, 23, SPRITE_LASS, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, IlexForestLassScript, -1
	object_event 34, 40, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 0, TrainerBugCatcherWayne, -1
	object_event 31, 11, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, IlexForestXAttack, EVENT_ILEX_FOREST_X_ATTACK
	object_event 31, 15, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, IlexForestAntidote, EVENT_ILEX_FOREST_ANTIDOTE
	object_event 42,  7, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, IlexForestEther, EVENT_ILEX_FOREST_ETHER
	object_event 27, 35, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 4, TrainerHikerLeonard, -1
	object_event 43, 51, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 4, TrainerFirebreatherBill, -1
	object_event 19, 46, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_SPINRANDOM_FAST, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 4, TrainerCooltrainerfGwen, -1
	object_event 13, 49, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route42FruitTree1, -1
	object_event 12, 51, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route42FruitTree2, -1
	object_event 15, 51, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route42FruitTree3, -1

