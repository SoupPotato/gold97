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
	
WhirlWarp37_23to9_31:
	playsound SFX_BUBBLEBEAM
	turnobject PLAYER, LEFT
	pause 3
	turnobject PLAYER, UP
	pause 3
	turnobject PLAYER, RIGHT
	pause 3
	turnobject PLAYER, DOWN
	pause 3
	turnobject PLAYER, LEFT
	pause 3
	turnobject PLAYER, UP
	pause 3
	turnobject PLAYER, RIGHT
	pause 3
	turnobject PLAYER, DOWN
	pause 3
	special FadeOutPalettes
	warpfacing DOWN, TIDAL_GROTTO_B1F, 9, 31
	end
	
WhirlWarp33_25to23_13:
	playsound SFX_BUBBLEBEAM
	turnobject PLAYER, LEFT
	pause 3
	turnobject PLAYER, UP
	pause 3
	turnobject PLAYER, RIGHT
	pause 3
	turnobject PLAYER, DOWN
	pause 3
	turnobject PLAYER, LEFT
	pause 3
	turnobject PLAYER, UP
	pause 3
	turnobject PLAYER, RIGHT
	pause 3
	turnobject PLAYER, DOWN
	pause 3
	special FadeOutPalettes
	warpfacing DOWN, TIDAL_GROTTO_B1F, 23, 13
	end
	
WhirlWarp33_9to31_28:
	playsound SFX_BUBBLEBEAM
	turnobject PLAYER, LEFT
	pause 3
	turnobject PLAYER, UP
	pause 3
	turnobject PLAYER, RIGHT
	pause 3
	turnobject PLAYER, DOWN
	pause 3
	turnobject PLAYER, LEFT
	pause 3
	turnobject PLAYER, UP
	pause 3
	turnobject PLAYER, RIGHT
	pause 3
	turnobject PLAYER, DOWN
	pause 3
	special FadeOutPalettes
	warpfacing DOWN, TIDAL_GROTTO_B1F, 31, 28
	end
	
WhirlWarp27_5to31_7:
	playsound SFX_BUBBLEBEAM
	turnobject PLAYER, LEFT
	pause 3
	turnobject PLAYER, UP
	pause 3
	turnobject PLAYER, RIGHT
	pause 3
	turnobject PLAYER, DOWN
	pause 3
	turnobject PLAYER, LEFT
	pause 3
	turnobject PLAYER, UP
	pause 3
	turnobject PLAYER, RIGHT
	pause 3
	turnobject PLAYER, DOWN
	pause 3
	special FadeOutPalettes
	warpfacing DOWN, TIDAL_GROTTO_B1F, 31, 7
	end
	
WhirlWarp5_5to25_6:
	playsound SFX_BUBBLEBEAM
	turnobject PLAYER, LEFT
	pause 3
	turnobject PLAYER, UP
	pause 3
	turnobject PLAYER, RIGHT
	pause 3
	turnobject PLAYER, DOWN
	pause 3
	turnobject PLAYER, LEFT
	pause 3
	turnobject PLAYER, UP
	pause 3
	turnobject PLAYER, RIGHT
	pause 3
	turnobject PLAYER, DOWN
	pause 3
	special FadeOutPalettes
	warpfacing DOWN, TIDAL_GROTTO_B1F, 25, 6
	end
	
WhirlWarp14_16to25_29:
	playsound SFX_BUBBLEBEAM
	turnobject PLAYER, LEFT
	pause 3
	turnobject PLAYER, UP
	pause 3
	turnobject PLAYER, RIGHT
	pause 3
	turnobject PLAYER, DOWN
	pause 3
	turnobject PLAYER, LEFT
	pause 3
	turnobject PLAYER, UP
	pause 3
	turnobject PLAYER, RIGHT
	pause 3
	turnobject PLAYER, DOWN
	pause 3
	special FadeOutPalettes
	warpfacing DOWN, TIDAL_GROTTO_B1F, 25, 29
	end
	
WhirlWarp11_9to15_24:
	playsound SFX_BUBBLEBEAM
	turnobject PLAYER, LEFT
	pause 3
	turnobject PLAYER, UP
	pause 3
	turnobject PLAYER, RIGHT
	pause 3
	turnobject PLAYER, DOWN
	pause 3
	turnobject PLAYER, LEFT
	pause 3
	turnobject PLAYER, UP
	pause 3
	turnobject PLAYER, RIGHT
	pause 3
	turnobject PLAYER, DOWN
	pause 3
	special FadeOutPalettes
	warpfacing DOWN, TIDAL_GROTTO_B1F, 15, 24
	end

TidalGrottoB1F_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  3, 31, TIDAL_GROTTO_1F, 1
	warp_event 29, 25, TIDAL_GROTTO_1F, 2

	db 7 ; coord events
	coord_event 37, 23, 0, WhirlWarp37_23to9_31
	coord_event 33, 25, 0, WhirlWarp33_25to23_13
	coord_event 33,  9, 0, WhirlWarp33_9to31_28
	coord_event 27,  5, 0, WhirlWarp27_5to31_7
	coord_event  5,  5, 0, WhirlWarp5_5to25_6
	coord_event 14, 16, 0, WhirlWarp14_16to25_29
	coord_event 11,  9, 0, WhirlWarp11_9to15_24

	db 4 ; object events
	object_event 10, 14, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, TidalGrottoB1FMaxRevive, EVENT_TIDAL_GROTTO_B1F_MAX_REVIVE
	object_event 19, 29, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, TidalGrottoB1FUltraBall, EVENT_TIDAL_GROTTO_B1F_ULTRA_BALL
	object_event 20,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, TidalGrottoB1FRareCandy, EVENT_TIDAL_GROTTO_B1F_RARE_CANDY
	object_event 14,  4, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, TidalGrottoB1FWaterStone, EVENT_TIDAL_GROTTO_B1F_WATER_STONE
