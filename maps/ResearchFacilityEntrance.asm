	const_def 2 ; object constants
	const BLACKTHORN_GYM_2F_ITEMBALL_1
	const BLACKTHORN_GYM_2F_ITEMBALL_2
	const BLACKTHORN_GYM_2F_ITEMBALL_3

ResearchFacilityEntrance_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

ResearchFacilityEntranceMysteryberry:
	itemball MYSTERYBERRY

ResearchFacilityEntranceNugget:
	itemball NUGGET

ResearchFacilityEntranceBerserkGene:
	itemball BERSERK_GENE

ResearchFacilityEntrance_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event 16, 16, ISEN_STRAIT, 2
	warp_event 17, 16, ISEN_STRAIT, 2
	warp_event  3,  0, RESEARCH_FACILITY_BACK_ROOM, 1
	warp_event  4,  0, RESEARCH_FACILITY_BACK_ROOM, 2

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  5,  8, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, ResearchFacilityEntranceMysteryberry, EVENT_PICKED_UP_MYSTERYBERRY_FROM_OMANYTE_ITEM_ROOM
	object_event 28,  1, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, ResearchFacilityEntranceNugget, EVENT_PICKED_UP_MYSTIC_WATER_FROM_OMANYTE_ITEM_ROOM
	object_event 33, 10, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, ResearchFacilityEntranceBerserkGene, EVENT_PICKED_UP_STARDUST_FROM_OMANYTE_ITEM_ROOM
