	db BOMSHEAL ; 184

	db 65,  102,  67,  77,  112,  77
	;   hp  atk  def  spd  sat  sdf

	db FIRE, WATER ; type
	db 75 ; catch rate
	db 175 ; base exp
	db NO_ITEM, WATER_TAIL ; items
	db GENDER_F50 ; gender ratio
	db 100 ; unknown 1
	db 20 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/bomsheal/front.dimensions"
	db 0, 0, 0, 0 ; padding
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_GROUND, EGG_WATER_1 ; egg groups

	; tm/hm learnset
	tmhm SURF, WHIRLPOOL, HIDDEN_POWER, SUNNY_DAY, TOXIC, IRON_TAIL, RETURN, MEGAPHONE, DOUBLE_TEAM, SWAGGER, FIRE_BLAST, ATTRACT, REST, DEFENSE_CURL, SWIFT, RAIN_DANCE, WATERFALL
	; end
