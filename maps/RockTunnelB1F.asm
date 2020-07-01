	const_def 2 ; object constants
	const ROCKTUNNELB1F_POKE_BALL1
	const ROCKTUNNELB1F_POKE_BALL2
	const ROCKTUNNELB1F_POKE_BALL3

RockTunnelB1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

RockTunnelB1FIron:
	itemball IRON

RockTunnelB1FPPUp:
	itemball PP_UP

RockTunnelB1FRevive:
	itemball REVIVE

RockTunnelB1FHiddenMaxPotion:
	hiddenitem SUPER_POTION, EVENT_ROCK_TUNNEL_B1F_HIDDEN_MAX_POTION

RockTunnelB1F_MapEvents:
	db 0, 0 ; filler

	db 6 ; warp events
	warp_event  3,  3, MOUNT_MOON, 1
	warp_event 15,  5, ROCK_TUNNEL_1F, 4
	warp_event 35,  5, ROCK_TUNNEL_1F, 5
	warp_event  3, 15, ROCK_TUNNEL_1F, 6
	warp_event 11, 13, MOUNT_MOON, 3
	warp_event 27, 13, ROCK_TUNNEL_1F, 7

	db 0 ; coord events

	db 1 ; bg events
	bg_event  2,  2, BGEVENT_ITEM, RockTunnelB1FHiddenMaxPotion

	db 3 ; object events
	object_event 10, 15, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, RockTunnelB1FIron, EVENT_ROCK_TUNNEL_B1F_IRON
	object_event 14,  7, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, RockTunnelB1FPPUp, EVENT_ROCK_TUNNEL_B1F_PP_UP
	object_event 34,  2, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, RockTunnelB1FRevive, EVENT_ROCK_TUNNEL_B1F_REVIVE
