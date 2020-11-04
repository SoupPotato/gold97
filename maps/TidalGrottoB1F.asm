	const_def 2 ; object constants
	const TidalGrottoB1F_POKE_BALL1
	const TidalGrottoB1F_POKE_BALL2
	const TidalGrottoB1F_POKE_BALL3
	const TidalGrottoB1F_POKE_BALL4

TidalGrottoB1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	
TidalGrottoB1FMaxRevive:
	itemball MAX_REVIVE

TidalGrottoB1FUltraBall:
	itemball ULTRA_BALL
	
TidalGrottoB1FRareCandy:
	itemball RARE_CANDY
	
TidalGrottoB1FWaterStone:
	itemball WATER_STONE

TidalGrottoB1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  3, 31, TIDAL_GROTTO_1F, 1
	warp_event 29, 25, TIDAL_GROTTO_1F, 2
	warp_event  7, 27, AMPARE_CAVERN_B1F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 4 ; object events
	object_event 10, 14, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, TidalGrottoB1FMaxRevive, EVENT_TIDAL_GROTTO_B1F_MAX_REVIVE
	object_event 19, 29, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, TidalGrottoB1FUltraBall, EVENT_TIDAL_GROTTO_B1F_ULTRA_BALL
	object_event 20,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, TidalGrottoB1FRareCandy, EVENT_TIDAL_GROTTO_B1F_RARE_CANDY
	object_event 14,  4, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, TidalGrottoB1FWaterStone, EVENT_TIDAL_GROTTO_B1F_WATER_STONE
