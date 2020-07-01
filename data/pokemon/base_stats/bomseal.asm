	db BOMSEAL ; 184

	db 100,  50,  75,  72,  72,  75
	;   hp  atk  def  spd  sat  sdf

	db FIRE, WATER ; type
	db 75 ; catch rate
	db 153 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F25 ; gender ratio
	db 100 ; unknown 1
	db 20 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/bomseal/front.dimensions"
	db 0, 0, 0, 0 ; padding
	db GROWTH_FAST ; growth rate
	dn EGG_GROUND, EGG_WATER_1 ; egg groups

	; tm/hm learnset
	tmhm SURF, HIDDEN_POWER, SUNNY_DAY, TOXIC, FRUSTRATION, IRON_TAIL, RETURN, DOUBLE_TEAM, SWAGGER, FIRE_BLAST, ATTRACT, REST, DEFENSE_CURL, SWIFT, RAIN_DANCE, WATERFALL
	; end
