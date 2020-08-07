	const_def 2 ; object constants
	const MOUNT_MOON_ITEMBALL
	const MOUNT_MOON_ITEMBALL_2
	const MOUNT_MOON_ITEMBALL_3

BoulderMinesB4F_MapScripts:
	db 2 ; scene scripts
	scene_script .RivalEncounter ; SCENE_DEFAULT
	scene_script .DummyScene ; SCENE_FINISHED

	db 0 ; callbacks

.RivalEncounter:
	end

.DummyScene:
	end
	


BoulderMinesB4FDomeFossil:
	itemball SILVER_WING
	
BoulderMinesB4FTMGigaDrain:
	itemball TM_GIGA_DRAIN

UnionCave1FAwakening:
	itemball HM_STRENGTH

BoulderMinesB4F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  5,  3, BOULDER_MINES_B3F, 1
	warp_event 19, 11, BOULDER_MINES_B5F, 1
	warp_event 19, 15, BOULDER_MINES_B3F, 5

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event 24,  9, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, UnionCave1FAwakening, EVENT_UNION_CAVE_1F_AWAKENING
	object_event 18, 18, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, BoulderMinesB4FTMGigaDrain, EVENT_ROUTE_44_ULTRA_BALL
	object_event  4, 18, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, BoulderMinesB4FDomeFossil, EVENT_ROUTE_44_MAX_REPEL
