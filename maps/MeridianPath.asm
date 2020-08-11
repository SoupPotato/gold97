	const_def 2 ; object constants
	const ROUTE25_YOUNGSTER1
	const ROUTE25_LASS1
	const ROUTE25_YOUNGSTER2
	const ROUTE25_LASS2
	const ROUTE25_YOUNGSTER3
	const ROUTE25_LASS3
	const ROUTE25_SUPER_NERD
	const ROUTE25_COOLTRAINER_M2
	const ROUTE25_POKE_BALL

MeridianPath_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks


TrainerLassEllen:
	trainer LASS, ELLEN, EVENT_BEAT_LASS_ELLEN, LassEllenSeenText, LassEllenBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext LassEllenAfterBattleText
	waitbutton
	closetext
	end

TrainerSchoolboyJoe:
	trainer SCHOOLBOY, JOE, EVENT_BEAT_SCHOOLBOY_JOE, SchoolboyJoeSeenText, SchoolboyJoeBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SchoolboyJoeAfterBattleText
	waitbutton
	closetext
	end

TrainerLassLaura:
	trainer LASS, LAURA, EVENT_BEAT_LASS_LAURA, LassLauraSeenText, LassLauraBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext LassLauraAfterBattleText
	waitbutton
	closetext
	end

TrainerCamperLloyd:
	trainer CAMPER, LLOYD, EVENT_BEAT_CAMPER_LLOYD, CamperLloydSeenText, CamperLloydBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CamperLloydAfterBattleText
	waitbutton
	closetext
	end

TrainerLassShannon:
	trainer LASS, SHANNON, EVENT_BEAT_LASS_SHANNON, LassShannonSeenText, LassShannonBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext LassShannonAfterBattleText
	waitbutton
	closetext
	end

TrainerSupernerdPat:
	trainer SUPER_NERD, PAT, EVENT_BEAT_SUPER_NERD_PAT, SupernerdPatSeenText, SupernerdPatBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SupernerdPatAfterBattleText
	waitbutton
	closetext
	end

TrainerCooltrainermKevin:
	trainer COOLTRAINERM, KEVIN, EVENT_BEAT_COOLTRAINERM_KEVIN, CooltrainermKevinSeenText, CooltrainermKevinBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainermKevinAfterBattleText
	waitbutton
	closetext
	end


MeridianPathProtein:
	itemball PROTEIN

MeridianPathHiddenPotion:
	hiddenitem POTION, EVENT_ROUTE_25_HIDDEN_POTION
	
MeridianPathSign:
	jumptext MeridianPathSignText
	
MeridianPathSignText:
	text "MERIDIAN PATH"
	para "NAGO VILLAGE -"
	line "RYUKYU CITY"
	done


LassEllenSeenText:
	text "You ever climbed"
	line "the CHARRED"
	cont "SUMMIT?"
	done

LassEllenBeatenText:
	text "How could I lose?"
	done

LassEllenAfterBattleText:
	text "The view is very"
	line "pretty up there."
	done

SchoolboyJoeSeenText:
	text "You've traveled"
	line "all of JADE?"
	para "That's cool."
	para "But do you stand"
	line "a chance against"
	cont "a trainer like me?"
	done

SchoolboyJoeBeatenText:
	text "Ow! Stomped flat!"
	done

SchoolboyJoeAfterBattleText:
	text "Looks like you had"
	line "plenty of time to"
	para "raise your #MON"
	line "while traveling."
	done

LassLauraSeenText:
	text "You look like"
	line "you're far from"
	cont "home."
	done

LassLauraBeatenText:
	text "I'm out!"
	done

LassLauraAfterBattleText:
	text "Where are you"
	line "from?"
	para "SILENT TOWN?"
	para "I've never been"
	line "there."
	done

CamperLloydSeenText:
	text "Going to CHARRED"
	line "SUMMIT?"
	done

CamperLloydBeatenText:
	text "Whoa! Too much."
	done

CamperLloydAfterBattleText:
	text "Legend says that a"
	line "rare #MON"
	cont "roosts here."
	para "But I've climbed"
	line "to the top and"
	para "never seen any-"
	line "thing."
	done

LassShannonSeenText:
	text "Let me tell you,"
	line "I'm a tough"
	cont "trainer!"
	done

LassShannonBeatenText:
	text "You're kidding."
	done

LassShannonAfterBattleText:
	text "I did my best."
	line "But you did"
	cont "better, I guess."
	done

SupernerdPatSeenText:
	text "Mufufufu…"

	para "Battle me."
	done

SupernerdPatBeatenText:
	text "You weren't"
	line "supposed to win."
	done

SupernerdPatAfterBattleText:
	text "There's a lady"
	line "in NAGO VILLAGE"
	para "who has like a"
	line "million CHARMANDER"
	cont "in her house."
	para "I worry that it'll"
	line "catch fire."
	done


CooltrainermKevinSeenText:
	text "You want to"
	line "battle, right?"
	para "Right."
	done

CooltrainermKevinBeatenText:
	text "I've never had a"
	line "battle this good!"
	done

CooltrainermKevinAfterBattleText:
	text "That was a great"
	line "battle!"

	para "You and your #-"
	line "MON are truly out-"
	cont "standing!"
	done


MeridianPath_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  4, 47, RYUKYU_CITY_MERIDIAN_PATH_GATE, 4

	db 0 ; coord events

	db 2 ; bg events
	bg_event  4, 14, BGEVENT_ITEM, MeridianPathHiddenPotion
	bg_event 11,  5, BGEVENT_READ, MeridianPathSign

	db 8 ; object events
	object_event  9,  7, SPRITE_LASS, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerLassEllen, -1
	object_event  8, 47, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerSchoolboyJoe, -1
	object_event 13, 44, SPRITE_LASS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerLassLaura, -1
	object_event 14, 22, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 2, TrainerCamperLloyd, -1
	object_event  8, 18, SPRITE_LASS, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerLassShannon, -1
	object_event  6, 37, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerSupernerdPat, -1
	object_event 13, 11, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 4, TrainerCooltrainermKevin, -1
	object_event  7, 43, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, MeridianPathProtein, EVENT_ROUTE_25_PROTEIN
