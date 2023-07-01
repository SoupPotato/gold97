	db TURBAN ; 204

	db  80,  90, 150,  30,  80,  65
	;   hp  atk  def  spd  sat  sdf

	db WATER, POISON ; type
	db 60 ; catch rate
	db 203 ; base exp
	db PEARL, BIG_PEARL ; items
	db GENDER_F50 ; gender ratio
	db 100 ; unknown 1
	db 20 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/turban/front.dimensions"
	db 0, 0, 0, 0 ; padding
	db GROWTH_SLOW ; growth rate
	dn EGG_WATER_3, EGG_MINERAL ; egg groups

	; tm/hm learnset
	tmhm HEADBUTT, CURSE, ROLLOUT, TOXIC, ROCK_SMASH, HIDDEN_POWER, BLIZZARD, HYPER_BEAM, ICY_WIND, PROTECT, RAIN_DANCE, ENDURE, DRAGONBREATH, RETURN, MEGAPHONE, DIG, MUD_SLAP, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, SLUDGE_BOMB, SWIFT, DEFENSE_CURL, REST, ATTRACT, THIEF, SURF, STRENGTH, FLASH, WHIRLPOOL, WATERFALL, ICE_BEAM
	; end
