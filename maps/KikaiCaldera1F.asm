	const_def 2
	const KIKAICALDERA_BB1
	const KIKAICALDERA_BB2
	const KIKAICALDERA_BB3
	const KIKAICALDERA_ITEMBALL1
	const KIKAICALDERA_ITEMBALL2

KikaiCaldera1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TrainerBBIzo:
	trainer BLACKBELT_T, IZO, EVENT_BEAT_BLACKBELT_IZO, IzoSeenText, IzoBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext IzoAfterBattleText
	waitbutton
	closetext
	end

IzoSeenText:
	text "Hiyah! Feel my"
	line "burning hot"
	cont "fighting spirit!"
	done

IzoBeatenText:
	text "Hooah!"
	done
	
IzoAfterBattleText:
	text "I can't tell what"
	line "is hotter, this"
	cont "volcano or my"
	cont "burning passion!"
	done

TrainerBBKenji:
	trainer BLACKBELT_T, KENJI, EVENT_BEAT_BLACKBELT_KENJI_KIKAI_CALDERA, KenjiSeenText, KenjiBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext KenjiAfterBattleText
	waitbutton
	closetext
	end
	
KenjiSeenText:
	text "Welcome to the"
	line "CALDERA Kitchen!"
	
	para "Now face the heat!"
	done
	
KenjiBeatenText:
	text "I can smell what"
	line "you're cookin'!"
	done
	
KenjiAfterBattleText:
	text "Those who can't"
	line "stand the heat"
	cont "shouldn't be here!"
	done
	
	
TrainerBBTaro:
	trainer BLACKBELT_T, TARO, EVENT_BEAT_BLACKBELT_TARO, TaroSeenText, TaroBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext TaroAfterBattleText
	waitbutton
	closetext
	end

TaroSeenText:
	text "My fists flow"
	line "faster than the"
	cont "river of sweat"
	cont "from my efforts!"
	done
	
TaroBeatenText:
	text "Maybe it's time"
	line "to hit the sauna."
	done
	
TaroAfterBattleText:
	text "Fighters began to"
	line "train in the"
	cont "CALDERA because"
	cont "the intense heat"
	cont "builds their"
	cont "cardiac strength!"
	done

KikaiCaldera1FItemball1:
	itemball PROTEIN
	
KikaiCaldera1FItemball2:
	itemball FIRE_STONE


KikaiCaldera1F_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 17, 19, KIKAI_VILLAGE, 5
	warp_event  5,  3, KIKAI_CALDERA_2F, 3

	db 0 ; coord events

	db 0 ; bg events

	db 5 ; object events
	object_event 19, 15, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 2, TrainerBBIzo, -1
	object_event 25,  9, SPRITE_BLACK_BELT, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerBBKenji, -1
	object_event 14,  6, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 2, TrainerBBTaro, -1
	object_event  0, 10, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, KikaiCaldera1FItemball1, EVENT_KIKAI_CALDERA_1F_PROTEIN
	object_event  9,  4, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, KikaiCaldera1FItemball2, EVENT_KIKAI_CALDERA_1F_FIRE_STONE
	
