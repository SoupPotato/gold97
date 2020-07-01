	const_def 2 ; object constants
	const BLACKTHORN_GYM_2F_ITEMBALL_1
	const BLACKTHORN_GYM_2F_ITEMBALL_2
	const BLACKTHORN_GYM_2F_ITEMBALL_3

BlackthornGym2F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

BlackthornGym2FMysteryberry:
	itemball MYSTERYBERRY

BlackthornGym2FNugget:
	itemball NUGGET

BlackthornGym2FBerserkGene:
	itemball BERSERK_GENE

BlackthornGym2F_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event 16, 16, ROUTE_20, 2
	warp_event 17, 16, ROUTE_20, 2
	warp_event  3,  0, BLACKTHORN_GYM_1F, 1
	warp_event  4,  0, BLACKTHORN_GYM_1F, 2

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  5,  8, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, BlackthornGym2FMysteryberry, EVENT_PICKED_UP_MYSTERYBERRY_FROM_OMANYTE_ITEM_ROOM
	object_event 28,  1, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, BlackthornGym2FNugget, EVENT_PICKED_UP_MYSTIC_WATER_FROM_OMANYTE_ITEM_ROOM
	object_event 33, 10, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, BlackthornGym2FBerserkGene, EVENT_PICKED_UP_STARDUST_FROM_OMANYTE_ITEM_ROOM
