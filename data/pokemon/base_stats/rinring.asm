	db RINRING ; 213

	db  45,  55,  30,  70,  40,  50
	;   hp  atk  def  spd  sat  sdf

	db DARK, DARK ; type
	db 255 ; catch rate
	db 69 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F100 ; gender ratio
	db 100 ; unknown 1
	db 20 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/rinring/front.dimensions"
	db 0, 0, 0, 0 ; padding
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_GROUND, EGG_GROUND ; egg groups

	; tm/hm learnset
	tmhm MUD_SLAP, HEADBUTT, ROAR, HIDDEN_POWER, SNORE, HYPER_BEAM, PROTECT, ENDURE, RETURN, FRUSTRATION, DOUBLE_TEAM, SWIFT, ATTRACT, REST, THIEF, SHADOW_BALL, CUT, STRENGTH, TOXIC, SWAGGER
	; end
