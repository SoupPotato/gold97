	const_def 2
	const CMC_BOULDER1
	const CMC_BOULDER2
	const CMC_BOULDER3
	const CMC_BOULDER4
	const CMC_BOULDER5
	const CMC_BOULDER6
	const CMC_ITEMBALL

CastleMountain1FCave_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

CastleMountainCaveBoulder6:
CastleMountainCaveBoulder5:
CastleMountainCaveBoulder4:
CastleMountainCaveBoulder3:
CastleMountainCaveBoulder2:
CastleMountainCaveBoulder1:
	jumpstd strengthboulder

CM1FCaveItemball:
	itemball LINKING_CORD

CastleMountain1FCave_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  8, 17, CASTLE_MOUNTAIN_1F_LONG_HALL, 9
	warp_event 15,  5, CASTLE_MOUNTAIN_2F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 7 ; object events
	object_event 15, 13, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CastleMountainCaveBoulder1, -1
	object_event 20, 12, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CastleMountainCaveBoulder2, -1
	object_event 15, 10, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CastleMountainCaveBoulder3, -1
	object_event 17, 10, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CastleMountainCaveBoulder4, -1
	object_event 12, 15, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CastleMountainCaveBoulder5, -1
	object_event  8, 12, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CastleMountainCaveBoulder6, -1
	object_event  4,  2, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, CM1FCaveItemball, EVENT_CM_CAVE_ITEMBALL
