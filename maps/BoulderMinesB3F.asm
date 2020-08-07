	const_def 2 ; object constants
	const ROCKTUNNELB1F_POKE_BALL1
	const ROCKTUNNELB1F_POKE_BALL2
	const ROCKTUNNELB1F_POKE_BALL3

BoulderMinesB3F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

BoulderMinesB3FIron:
	itemball IRON

BoulderMinesB3FPPUp:
	itemball PP_UP

BoulderMinesB3FRevive:
	itemball REVIVE

BoulderMinesB3FHiddenMaxPotion:
	hiddenitem SUPER_POTION, EVENT_ROCK_TUNNEL_B1F_HIDDEN_MAX_POTION

BoulderMinesB3F_MapEvents:
	db 0, 0 ; filler

	db 6 ; warp events
	warp_event  3,  3, BOULDER_MINES_B4F, 1
	warp_event 15,  5, BOULDER_MINES_B2F, 4
	warp_event 35,  5, BOULDER_MINES_B2F, 5
	warp_event  3, 15, BOULDER_MINES_B2F, 6
	warp_event 11, 13, BOULDER_MINES_B4F, 3
	warp_event 27, 13, BOULDER_MINES_B2F, 7

	db 0 ; coord events

	db 1 ; bg events
	bg_event  2,  2, BGEVENT_ITEM, BoulderMinesB3FHiddenMaxPotion

	db 3 ; object events
	object_event 10, 15, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, BoulderMinesB3FIron, EVENT_ROCK_TUNNEL_B1F_IRON
	object_event 14,  7, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, BoulderMinesB3FPPUp, EVENT_ROCK_TUNNEL_B1F_PP_UP
	object_event 34,  2, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, BoulderMinesB3FRevive, EVENT_ROCK_TUNNEL_B1F_REVIVE
