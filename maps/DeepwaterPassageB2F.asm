	const_def 2 ; object constants
	const ICEPATH1F_POKE_BALL1
	const ICEPATH1F_POKE_BALL2
	const ICEPATH1F_POKE_BALL3

DeepwaterPassageB2F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

DeepwaterPassageB2FHMWaterfall:
	itemball HM_WATERFALL

DeepwaterPassageB2FPPUp:
	itemball PP_UP

DeepwaterPassageB2FProtein:
	itemball PROTEIN

DeepwaterPassageB2F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event 11, 69, DEEPWATER_PASSAGE_B1F, 2
	warp_event  5,  7, DEEPWATER_PASSAGE_B1F, 3
	warp_event 14, 40, DEEPWATER_PASSAGE_B3F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  0, 71, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, DeepwaterPassageB2FHMWaterfall, EVENT_GOT_HM07_WATERFALL
	object_event  4, 45, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, DeepwaterPassageB2FPPUp, EVENT_ICE_PATH_1F_PP_UP
	object_event 13,  7, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, DeepwaterPassageB2FProtein, EVENT_ICE_PATH_1F_PROTEIN
