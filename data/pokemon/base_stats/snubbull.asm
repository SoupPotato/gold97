	db SNUBBULL ; 209

	db  90, 120,  75,  45,  60,  60
	;   hp  atk  def  spd  sat  sdf

	db PSYCHIC, PSYCHIC ; type
	db 75 ; catch rate
	db 178 ; base exp
	db PINK_BOW, POLKADOT_BOW ; items
	db GENDER_F75 ; gender ratio
	db 100 ; unknown 1
	db 20 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/snubbull/front.dimensions"
	db 0, 0, 0, 0 ; padding
	db GROWTH_FAST ; growth rate
	dn EGG_GROUND, EGG_FAIRY ; egg groups

	; tm/hm learnset
	tmhm DYNAMICPUNCH, HEADBUTT, CURSE, ROAR, TOXIC, ZAP_CANNON, ROCK_SMASH, HIDDEN_POWER, SUNNY_DAY, PAY_DAY, HYPER_BEAM, PROTECT, RAIN_DANCE, ENDURE, THUNDER, RETURN, MEGAPHONE, SHADOW_BALL, MUD_SLAP, DOUBLE_TEAM, ICE_PUNCH, SWAGGER, SLEEP_TALK, SLUDGE_BOMB, DEFENSE_CURL, THUNDERPUNCH, ROCK_HEAD, REST, ATTRACT, THIEF, FIRE_PUNCH, STRENGTH, THUNDERBOLT, PSYCHIC_M
	
	; end
