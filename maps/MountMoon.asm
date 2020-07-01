	const_def 2 ; object constants
	const MOUNT_MOON_ITEMBALL
	const MOUNT_MOON_ITEMBALL_2
	const MOUNT_MOON_ITEMBALL_3

MountMoon_MapScripts:
	db 2 ; scene scripts
	scene_script .RivalEncounter ; SCENE_DEFAULT
	scene_script .DummyScene ; SCENE_FINISHED

	db 0 ; callbacks

.RivalEncounter:
	end

.DummyScene:
	end
	


MountMoonDomeFossil:
	itemball SILVER_WING
	
MountMoonTMGigaDrain:
	itemball TM_GIGA_DRAIN

UnionCave1FAwakening:
	itemball HM_STRENGTH

MountMoon_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  3,  1, ROCK_TUNNEL_B1F, 1
	warp_event 17,  9, UNION_CAVE_B2F, 1
	warp_event 17, 13, ROCK_TUNNEL_B1F, 5

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event 22, 7, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, UnionCave1FAwakening, EVENT_UNION_CAVE_1F_AWAKENING
	object_event 16, 16, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, MountMoonTMGigaDrain, EVENT_ROUTE_44_ULTRA_BALL
	object_event  2, 16, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, MountMoonDomeFossil, EVENT_ROUTE_44_MAX_REPEL
