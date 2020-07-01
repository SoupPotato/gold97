	db CHARMANDER ; 004

	db  39,  52,  43,  65,  60,  50
	;   hp  atk  def  spd  sat  sdf

	db FIRE, FIRE ; type
	db 45 ; catch rate
	db 65 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F12_5 ; gender ratio
	db 100 ; unknown 1
	db 20 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/charmander/front.dimensions"
	db 0, 0, 0, 0 ; padding
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_MONSTER, EGG_DRAGON ; egg groups

	; tm/hm learnset
	tmhm ATTRACT, CURSE, CUT, DEFENSE_CURL, DIG, DOUBLE_TEAM, DRAGONBREATH, DYNAMICPUNCH, ENDURE, FIRE_BLAST, FIRE_PUNCH, FLAMETHROWER, FRUSTRATION, FURY_CUTTER, HEADBUTT, HIDDEN_POWER, IRON_TAIL, MUD_SLAP, PROTECT, REST, RETURN, ROCK_SMASH, SLEEP_TALK, SNORE, STRENGTH, SUNNY_DAY, SWAGGER, SWIFT, TOXIC
	; end
