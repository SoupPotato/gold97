	const_def 2
	const KIKAIV_BRUNO
	const KIKAIV_BLACKBELT
	const KIKAIV_ELDER
	const KIKAIV_ITEMBALL
	const KIKAIV_ROCK1
	const KIKAIV_ROCK2

KikaiVillage_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint

.FlyPoint:
	setflag ENGINE_FLYPOINT_LAVENDER
	return

KikaiPokecenterSign:
	jumpstd pokecentersign

KikaiMartSign:
	jumpstd martsign

KikaiSummitRock:
	jumpstd smashrock
	
KikaiSummitRock2:
	jumpstd smashrock

KikaiBlackBeltScript:
	jumptextfaceplayer KikaiBlackBeltText
	
KikaiGrampsScript:
	jumptextfaceplayer KikaiGrampsText
	
KikaiItemball:
	itemball FIRE_TAIL
	
MovementData_BrunoRockSmash:
	rock_smash 10
	step_end	

KikaiBrunoScript:
	checkevent EVENT_BRUNO_SMASHED_ROCK
	iftrue .skipsmashing
	opentext
	writetext BrunoHooHahSmashText
	waitbutton
	closetext
	special WaitSFX
	playsound SFX_STRENGTH
	earthquake 84
	applymovement KIKAIV_ROCK1, MovementData_BrunoRockSmash
	disappear KIKAIV_ROCK1
	setevent EVENT_BRUNO_SMASHED_ROCK
.skipsmashing:
	faceplayer
	checkevent EVENT_BRUNO_BATTLE_DONE
	iftrue .afterbruno
	opentext
	writetext BrunoPrebattleText
	waitbutton
	winlosstext BrunoWinText, 0
	loadtrainer BRUNO, BRUNO1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BRUNO_BATTLE_DONE
.afterbruno:
	opentext
	writetext BrunoAfterBattletext
	waitbutton
	closetext
	end
	
BrunoHooHahSmashText:
	text "…"
	
	para "HOO HAH!"
	done
	
BrunoPrebattleText:
	text "I am BRUNO of the"
	line "former ELITE FOUR."

	para "I always train to"
	line "the extreme be-"
	cont "cause I believe in"
	cont "our potential."

	para "That is how we"
	line "became strong."

	para "Can you withstand"
	line "our power?"

	para "Hm? I see no fear"
	line "in you. You look"

	para "determined. Per-"
	line "fect for battle!"

	para "You will bow down"
	line "to our overwhelm-"
	cont "ing power!"

	para "Hoo hah!"
	done

BrunoWinText:
	text "Why? How could we"
	line "lose?"
	done
	
BrunoAfterBattletext:
	text "Having lost, I"
	line "have no right to"
	cont "say anything…"

	para "Go forth and face"
	line "whatever challen-"
	cont "ges you may find."
	done

KikaiBlackBeltText:
	text "This village is"
	line "a popular place"
	cont "for practicioners"
	cont "of the martial"
	cont "arts!"
	done

KikaiGrampsText:
	text "The CALDERA is a"
	line "training ground"
	cont "for martial"
	cont "artists, be ready"
	cont "for a fight if"
	cont "you enter!"
	done

KikaiSign:
	jumptext KikaiSignText
	
CalderaSign:
	jumptext CalderaSignText
	
KikaiSignText:
	text "KIKAI VILLAGE"
	line "The firey hot"
	cont "fighters town!"
	done

CalderaSignText:
	text "KIKAI CALDERA"
	line "Be wary of lava."
	done

KikaiVillage_MapEvents:
	db 0, 0 ; filler

	db 8 ; warp events
	warp_event 15, 22, KIKAI_POKECENTER_1F, 1
	warp_event  3, 18, KIKAI_MART, 1
	warp_event 14, 17, KIKAI_HOUSE_1, 1
	warp_event  7, 23, KIKAI_HOUSE_2, 1
	warp_event  9, 15, KIKAI_CALDERA_1F, 1
	warp_event  7, 11, KIKAI_CALDERA_2F, 1
	warp_event 13, 11, KIKAI_CALDERA_2F, 2
	warp_event  9,  9, KIKAI_CALDERA_3F, 1

	db 0 ; coord events

	db 4 ; bg events
	bg_event 12, 24, BGEVENT_READ, KikaiSign
	bg_event  8, 16, BGEVENT_READ, CalderaSign
	bg_event 16, 22, BGEVENT_READ, KikaiPokecenterSign
	bg_event  4, 18, BGEVENT_READ, KikaiMartSign

	db 6 ; object events
	object_event 11,  4, SPRITE_BRUNO, SPRITEMOVEDATA_STANDING_RIGHT, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KikaiBrunoScript, -1
	object_event  7, 20, SPRITE_BLACK_BELT, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KikaiBlackBeltScript, -1
	object_event 11, 16, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KikaiGrampsScript, -1
	object_event 14,  7, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, KikaiItemball, EVENT_KIKAI_SUMMIT_ITEMBALL
	object_event 12,  4, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KikaiSummitRock2, EVENT_BRUNO_SMASHED_ROCK
	object_event 11,  5, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KikaiSummitRock, EVENT_KIKAI_SUMMIT_OTHER_ROCK
