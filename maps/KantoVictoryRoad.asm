	const_def 2 ; object constants
	const VICTORYROAD_POKE_BALL1_NEW
	const VICTORYROAD_POKE_BALL2_NEW
	const VICTORYROAD_POKE_BALL3_NEW
	const VICTORYROAD_POKE_BALL4_NEW
	const VICTORYROAD_POKE_BALL5_NEW

KantoVictoryRoad_MapScripts:
	db 0 ; scene scripts
	
	db 0 ; callbacks


KantoVictoryRoadTMEarthquake:
	itemball TM_EARTHQUAKE

KantoVictoryRoadMaxRevive:
	itemball MAX_REVIVE

KantoVictoryRoadFullRestore:
	itemball FULL_RESTORE

KantoVictoryRoadFullHeal:
	itemball FULL_HEAL

KantoVictoryRoadHPUp:
	itemball HP_UP

KantoVictoryRoadHiddenMaxPotion:
	hiddenitem MAX_POTION, EVENT_VICTORY_ROAD_HIDDEN_MAX_POTION_NEW

KantoVictoryRoadHiddenFullHeal:
	hiddenitem FULL_HEAL, EVENT_VICTORY_ROAD_HIDDEN_FULL_HEAL_NEW


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

	db 5 ; object events
	object_event  3, 28, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, KantoVictoryRoadTMEarthquake, EVENT_VICTORY_ROAD_TM_EARTHQUAKE_NEW
	object_event 12, 48, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, KantoVictoryRoadMaxRevive, EVENT_VICTORY_ROAD_MAX_REVIVE_NEW
	object_event 18, 29, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, KantoVictoryRoadFullRestore, EVENT_VICTORY_ROAD_FULL_RESTORE_NEW
	object_event 15, 48, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, KantoVictoryRoadFullHeal, EVENT_VICTORY_ROAD_FULL_HEAL_NEW
	object_event  7, 38, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, KantoVictoryRoadHPUp, EVENT_VICTORY_ROAD_HP_UP_NEW
