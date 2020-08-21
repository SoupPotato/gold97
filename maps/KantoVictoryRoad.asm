	const_def 2 ; object constants
	const VICTORYROAD_POKE_BALL1_NEW
	const VICTORYROAD_POKE_BALL2_NEW
	const VICTORYROAD_POKE_BALL3_NEW
	const VICTORYROAD_POKE_BALL4_NEW
	const VICTORYROAD_POKE_BALL5_NEW
	const KVR_COOLTRM1
	const KVR_COOLTRM2
	const KVR_COOLTRM3
	const KVR_COOLTRF1
	const KVR_COOLTRF2
	const KVR_COOLTRF3

KantoVictoryRoad_MapScripts:
	db 0 ; scene scripts
	
	db 0 ; callbacks


KantoVictoryRoadTMEarthquake:
	itemball PROTEIN

KantoVictoryRoadMaxRevive:
	itemball REVIVE

KantoVictoryRoadFullRestore:
	itemball HYPER_POTION

KantoVictoryRoadFullHeal:
	itemball FULL_HEAL

KantoVictoryRoadHPUp:
	itemball HP_UP

KantoVictoryRoadHiddenMaxPotion:
	hiddenitem MAX_POTION, EVENT_VICTORY_ROAD_HIDDEN_MAX_POTION_NEW

KantoVictoryRoadHiddenFullHeal:
	hiddenitem FULL_HEAL, EVENT_VICTORY_ROAD_HIDDEN_FULL_HEAL_NEW


;----------------------------------------------------------

TrainerKVR1:
	trainer COOLTRAINERM, GAVEN, EVENT_BEAT_KVR_TRAINER1, CTGavenSeenText, CTGavenBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CTGavenAfterBattleText
	waitbutton
	closetext
	end

TrainerKVR2:
	trainer COOLTRAINERM, EVERITT, EVENT_BEAT_KVR_TRAINER2, CTEverittSeenText, CTEverittBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CTEverittAfterBattleText
	waitbutton
	closetext
	end
	
TrainerKVR3:
	trainer COOLTRAINERM, CHESTER, EVENT_BEAT_KVR_TRAINER3, CTChesterSeenText, CTChesterBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CTChesterAfterBattleText
	waitbutton
	closetext
	end
	
TrainerKVR4:
	trainer COOLTRAINERF, BETH, EVENT_BEAT_KVR_TRAINER4, CTBethSeenText, CTBethBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CTBethAfterBattleText
	waitbutton
	closetext
	end

TrainerKVR5:
	trainer COOLTRAINERF, KENZIE, EVENT_BEAT_KVR_TRAINER5, CTKenzieSeenText, CTKenzieBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CTKenzieAfterBattleText
	waitbutton
	closetext
	end

TrainerKVR6:
	trainer COOLTRAINERF, ALLY, EVENT_BEAT_KVR_TRAINER6, CTAllySeenText, CTAllyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CTAllyAfterBattleText
	waitbutton
	closetext
	end

;----------------------------------------------------------

CTGavenSeenText:
	text "If you're gunning"
	line "for the top, then"
	cont "you'll have to"
	cont "make it through"
	cont "me first!"
	done

CTGavenBeatenText:
	text "Incredible!"
	done

CTGavenAfterBattleText:
	text "Even if this"
	line "cave isn't desig-"
	cont "nated as the real"
	cont "VICTORY ROAD any-"
	cont "more, you'll"
	cont "still need to"
	cont "make it through"
	cont "here if you want"
	cont "to see the"
	cont "#MON LEAGUE!"
	done

CTEverittSeenText:
	text "Hiyah!"
	
	para "I've trained in"
	line "this cavern for"
	cont "a year now!"
	
	para "I'll make you"
	line "my last foe"
	cont "before I take"
	cont "it all to the"
	cont "INDIGO PLATEAU!"
	done

CTEverittBeatenText:
	text "Huh? What did"
	line "you say?"
	done

CTEverittAfterBattleText:
	text "You mean to tell"
	line "me the #MON"
	cont "LEAGUE up and"
	cont "moved?"
	
	para "And I'll have to"
	line "go get 8 new"
	cont "BADGEs!?"
	
	para "Haha! Hahahahah!"
	done


CTChesterSeenText:
	text "Hmph! If some kid"
	line "from the boonies"
	cont "of PALLET TOWN"
	cont "can become the"
	cont "LEAGUE CHAMPION"
	cont "and a GYM LEADER"
	cont "then a superior"
	cont "urbanite such as"
	cont "myself should"
	cont "have no issue!"
	done

CTChesterBeatenText:
	text "P-pardon?"
	done

CTChesterAfterBattleText:
	text "Oh? And where are"
	line "YOU from exactly?"
	
	para "…"
	
	para "SILENT TOWN?"
	line "Never even heard"
	cont "of it!"
	done

CTBethSeenText:
	text "INDIGO PLATEAU…"
	
	para "This place used to"
	line "be the pinnacle"
	cont "of achievement"
	cont "for all #MON"
	cont "trainers…"
	
	para "Prove to me that"
	line "you deserve to"
	cont "be here!"
	done

CTBethBeatenText:
	text "Point taken…"
	done

CTBethAfterBattleText:
	text "This used to be"
	line "the site of the"
	cont "#MON LEAGUE,"
	cont "full stop."
	
	para "Now it's just a"
	line "stepping stone"
	cont "on a larger"
	cont "journey since"
	cont "they've taken it"
	cont "nationwide!"
	done

CTKenzieSeenText:
	text "RED? To be honest,"
	line "I'm more of a"
	cont "fan of BLUE!"
	done

CTKenzieBeatenText:
	text "Smell ya later!"
	done

CTKenzieAfterBattleText:
	text "I mean come on!"
	line "RED dosen't have"
	cont "half the charisma"
	cont "BLUE did as a"
	cont "CHAMPION!"
	
	para "He never even"
	line "says anything!"
	cont "What's up with"
	cont "that!"
	done

CTAllySeenText:
	text "I've got 7 of"
	line "NIHON's BADGEs"
	cont "so far! You look"
	cont "like a tough"
	cont "opponent to"
	cont "cut my teeth on!"
	done

CTAllyBeatenText:
	text "You do too?"
	done

CTAllyAfterBattleText:
	text "Well of course you"
	line "would have 7"
	cont "BADGEs, why else"
	cont "would you be here"
	cont "braving the caves!"
	done

KantoVictoryRoad_MapEvents:
	db 0, 0 ; filler

	db 10 ; warp events
	warp_event  8, 67, KANTO_REGION, 30 ; entrance
	warp_event  1, 49, KANTO_VICTORY_ROAD, 3
	warp_event  1, 35, KANTO_VICTORY_ROAD, 2
	warp_event 13, 31, KANTO_VICTORY_ROAD, 5
	warp_event 13, 17, KANTO_VICTORY_ROAD, 4
	warp_event 17, 33, KANTO_VICTORY_ROAD, 7
	warp_event 17, 19, KANTO_VICTORY_ROAD, 6
	warp_event  0, 11, KANTO_VICTORY_ROAD, 9
	warp_event  0, 27, KANTO_VICTORY_ROAD, 8
	warp_event 13,  5, KANTO_REGION, 33 ; exit

	db 0 ; coord events

	db 2 ; bg events
	bg_event  3, 29, BGEVENT_ITEM, KantoVictoryRoadHiddenMaxPotion
	bg_event  3, 65, BGEVENT_ITEM, KantoVictoryRoadHiddenFullHeal

	db 11 ; object events
	object_event  3, 28, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, KantoVictoryRoadTMEarthquake, EVENT_VICTORY_ROAD_TM_EARTHQUAKE_NEW
	object_event 12, 48, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, KantoVictoryRoadMaxRevive, EVENT_VICTORY_ROAD_MAX_REVIVE_NEW
	object_event 18, 29, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, KantoVictoryRoadFullRestore, EVENT_VICTORY_ROAD_FULL_RESTORE_NEW
	object_event 15, 48, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, KantoVictoryRoadFullHeal, EVENT_VICTORY_ROAD_FULL_HEAL_NEW
	object_event  7, 38, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, KantoVictoryRoadHPUp, EVENT_VICTORY_ROAD_HP_UP_NEW
	object_event  5, 65, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerKVR1, -1
	object_event 14,  9, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerKVR2, -1
	object_event 10, 35, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerKVR3, -1
	object_event  4, 50, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerKVR4, -1
	object_event 12, 28, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerKVR5, -1
	object_event  1, 19, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerKVR6, -1
