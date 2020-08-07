	const_def 2 ; object constants
	const WHIRLISLANDB1F_POKE_BALL1
	const WHIRLISLANDB1F_POKE_BALL2
	const WHIRLISLANDB1F_POKE_BALL3
	const WHIRLISLANDB1F_POKE_BALL4
	const WHIRLISLANDB1F_POKE_BALL5
	const WHIRLISLANDB1F_BOULDER

WhirlIslandB1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

WhirlIslandB1FFullRestore:
	itemball FULL_RESTORE

WhirlIslandB1FCarbos:
	itemball CARBOS

WhirlIslandB1FCalcium:
	itemball CALCIUM

WhirlIslandB1FNugget:
	itemball NUGGET

WhirlIslandB1FEscapeRope:
	itemball ESCAPE_ROPE

WhirlIslandB1FBoulder:
	jumpstd strengthboulder

WhirlIslandB1FHiddenRareCandy:
	hiddenitem RARE_CANDY, EVENT_WHIRL_ISLAND_B1F_HIDDEN_RARE_CANDY

WhirlIslandB1FHiddenUltraBall:
	hiddenitem ULTRA_BALL, EVENT_WHIRL_ISLAND_B1F_HIDDEN_ULTRA_BALL

WhirlIslandB1FHiddenFullRestore:
	hiddenitem FULL_RESTORE, EVENT_WHIRL_ISLAND_B1F_HIDDEN_FULL_RESTORE

WhirlIslandB1F_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event 19,  3, WHIRL_ISLAND_1F, 2
	warp_event 33,  3, WHIRL_ISLAND_1F, 3
	warp_event 15, 25, WHIRL_ISLAND_B2F, 1
	warp_event 33, 33, WHIRL_ISLAND_B2F, 2

	db 0 ; coord events

	db 3 ; bg events
	bg_event  6, 10, BGEVENT_ITEM, WhirlIslandB1FHiddenRareCandy
	bg_event 33, 30, BGEVENT_ITEM, WhirlIslandB1FHiddenUltraBall
	bg_event 30, 13, BGEVENT_ITEM, WhirlIslandB1FHiddenFullRestore

	db 6 ; object events
	object_event 23,  4, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, WhirlIslandB1FFullRestore, EVENT_WHIRL_ISLAND_B1F_FULL_RESTORE
	object_event  8,  2, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, WhirlIslandB1FCarbos, EVENT_WHIRL_ISLAND_B1F_CARBOS
	object_event 20,  6, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, WhirlIslandB1FCalcium, EVENT_WHIRL_ISLAND_B1F_CALCIUM
	object_event 16, 27, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, WhirlIslandB1FNugget, EVENT_WHIRL_ISLAND_B1F_NUGGET
	object_event 33, 31, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, WhirlIslandB1FEscapeRope, EVENT_WHIRL_ISLAND_B1F_ESCAPE_ROPE
	object_event 25,  4, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WhirlIslandB1FBoulder, -1
