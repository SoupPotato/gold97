	db WOLFAN ; 246

	db 70,  60,  50,  55,  70,  60
	;   hp  atk  def  spd  sat  sdf

	db ICE, ICE ; type
	db 170 ; catch rate
	db 75 ; base exp
	db ICE_BERRY, NEVERMELTICE ; items
	db GENDER_F50 ; gender ratio
	db 100 ; unknown 1
	db 20 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/wolfan/front.dimensions"
	db 0, 0, 0, 0 ; padding
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_GROUND, EGG_MONSTER ; egg groups

	; tm/hm learnset
	tmhm DYNAMICPUNCH, HEADBUTT, CURSE, ROLLOUT, ROAR, TOXIC, ROCK_SMASH, HIDDEN_POWER, PAY_DAY, BLIZZARD, ICY_WIND, PROTECT, RAIN_DANCE, ENDURE, IRON_TAIL, RETURN, MEGAPHONE, DIG, MUD_SLAP, DOUBLE_TEAM, ICE_PUNCH, SWAGGER, SLEEP_TALK, SWIFT, DEFENSE_CURL, THUNDERPUNCH, REST, ATTRACT, THIEF, FURY_CUTTER, CUT, STRENGTH, FLASH, ICE_BEAM
	; end
