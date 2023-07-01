	db BELLRUN ; 214

	db  80,  95,  40, 110,  40,  75
	;   hp  atk  def  spd  sat  sdf

	db DARK, DARK ; type
	db 90 ; catch rate
	db 148 ; base exp
	db GOLD_BERRY, BLACKGLASSES ; items
	db GENDER_F100 ; gender ratio
	db 100 ; unknown 1
	db 20 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/bellrun/front.dimensions"
	db 0, 0, 0, 0 ; padding
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_GROUND, EGG_GROUND ; egg groups

	; tm/hm learnset
	tmhm HEADBUTT, CURSE, ROAR, TOXIC, PSYCH_UP, HIDDEN_POWER, SUNNY_DAY, PAY_DAY, HYPER_BEAM, ICY_WIND, PROTECT, RAIN_DANCE, ENDURE, IRON_TAIL, RETURN, MEGAPHONE, SHADOW_BALL, MUD_SLAP, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, SWIFT, REST, ATTRACT, THIEF, FURY_CUTTER, CUT, FLASH, THUNDERBOLT
	; end
