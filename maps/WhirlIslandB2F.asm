	const_def 2 ; object constants
	const WHIRLISLANDB2F_POKE_BALL1
	const WHIRLISLANDB2F_POKE_BALL2
	const WHIRLISLANDB2F_POKE_BALL3
	const WHIRLISLANDB2F_POKE_BALL4

WhirlIslandB2F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

WhirlIslandB2FFullRestore:
	itemball FULL_RESTORE

WhirlIslandB2FMaxRevive:
	itemball MAX_REVIVE

WhirlIslandB2FMaxElixer:
	itemball MAX_ELIXER
	
WhirlIslandB2FTMSludgeBomb:
	itemball TM_SLUDGE_BOMB

WhirlIslandB2F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event 15,  3, WHIRL_ISLAND_B1F, 3
	warp_event 37, 11, WHIRL_ISLAND_B1F, 4
	warp_event 11, 21, WHIRL_ISLAND_B2F_CAVE, 1

	db 0 ; coord events

	db 0 ; bg events

	db 4 ; object events
	object_event 33, 13, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, WhirlIslandB2FFullRestore, EVENT_WHIRL_ISLAND_B2F_FULL_RESTORE
	object_event  6, 32, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, WhirlIslandB2FMaxRevive, EVENT_WHIRL_ISLAND_B2F_MAX_REVIVE
	object_event  7,  2, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, WhirlIslandB2FMaxElixer, EVENT_WHIRL_ISLAND_B2F_MAX_ELIXER
	object_event 35, 28, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, WhirlIslandB2FTMSludgeBomb, EVENT_GOT_TM36_SLUDGE_BOMB
