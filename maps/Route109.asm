	const_def 2 ; object constants
	const ROUTE39_BEAUTY
	const ROUTE39_POKEFAN_M
	const ROUTE39_POKEFAN_F1
	const ROUTE39_PSYCHIC_NORMAN
	const ROUTE39_FRUIT_TREE
	const ROUTE39_POKEFAN_F2
	const ROUTE39_STANDING_YOUNGSTER
	const ROUTE39_BUENA2

Route109_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	
TrainerSailorHarry:
	trainer SAILOR, HARRY, EVENT_BEAT_SAILOR_HARRY, SailorHarrySeenText, SailorHarryBeatenText, 0, .Script

.Script
	endifjustbattled
	opentext
	writetext SailorHarryAfterBattleText
	waitbutton
	closetext
	end

TrainerSchoolboyChad1:
	trainer SCHOOLBOY, CHAD1, EVENT_BEAT_SCHOOLBOY_CHAD, SchoolboyChad1SeenText, SchoolboyChad1BeatenText, 0, .Script

.Script
	endifjustbattled
	opentext
	writetext SchoolboyChad1AfterBattleText
	waitbutton
	closetext
	end


TrainerPokefanmDerek:
	trainer POKEFANM, DEREK1, EVENT_BEAT_POKEFANM_DEREK, PokefanmDerekSeenText, PokefanmDerekBeatenText, 0, .Script

.Script
	endifjustbattled
	opentext
	writetext PokefanMDerekText_NotBragging
	waitbutton
	closetext
	end

TrainerPokefanfRuth:
	trainer POKEFANF, RUTH, EVENT_BEAT_POKEFANF_RUTH, PokefanfRuthSeenText, PokefanfRuthBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokefanfRuthAfterBattleText
	waitbutton
	closetext
	end


TrainerBeautyValerie:
	trainer BEAUTY, VALERIE, EVENT_BEAT_BEAUTY_VALERIE, BeautyValerieSeenText, BeautyValerieBeatenText, 0, .Script

.Script
	endifjustbattled
	opentext
	writetext BeautyValerieAfterBattleText
	waitbutton
	closetext
	end


TrainerPsychicNorman:
	trainer PSYCHIC_T, NORMAN, EVENT_BEAT_PSYCHIC_NORMAN, PsychicNormanSeenText, PsychicNormanBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PsychicNormanAfterBattleText
	waitbutton
	closetext
	end

TrainerPokefanfJaime:
	faceplayer
	opentext
	checktime NITE
	iffalse .NotNight
	checkevent EVENT_BEAT_POKEFANF_JAIME
	iftrue .Beaten
	writetext PokefanfJaimeSeenText
	waitbutton
	closetext
	winlosstext PokefanfJaimeBeatenText, 0
	loadtrainer POKEFANF, JAIME
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_POKEFANF_JAIME
	closetext
	end

.Beaten:
	writetext PokefanfJaimeAfterBattleText
	waitbutton
	closetext
	end

.NotNight:
	writetext PokefanfJaimeHopeItGetsDarkText
	waitbutton
	closetext
	end

MoomooFarmSign:
	jumptext MoomooFarmSignText

Route109TrainerTips:
	jumptext Route109TrainerTipsText

Route109FruitTree:
	fruittree FRUITTREE_ROUTE_39

Route109HiddenNugget:
	hiddenitem NUGGET, EVENT_ROUTE_39_HIDDEN_NUGGET

Route109ChixText:
	text "CHIX: Mooo!"
	done

PokefanmDerekSeenText:
	text "This is a good"
	line "time to brag about"
	cont "my PIKACHU!"
	done

PokefanmDerekBeatenText:
	text "I had no time to"
	line "show off PIKACHU…"
	done

PokefanMDerekText_NotBragging:
	text "I'm not listening"
	line "to your bragging!"

	para "We # FANS have"
	line "a policy of not"

	para "listening to other"
	line "people brag!"
	done

PokefanfRuthSeenText:
	text "Such darling"
	line "#MON."

	para "Let's show our"
	line "#MON together"
	cont "at the same time."
	done

PokefanfRuthBeatenText:
	text "I don't mind"
	line "losing."
	done

PokefanfRuthAfterBattleText:
	text "Do you know about"
	line "baby #MON?"

	para "They're all so"
	line "adorable!"
	done

PokefanMDerekPikachuIsItText:
	text "PIKACHU is it!"
	line "Don't you agree?"
	done

PsychicNormanSeenText:
	text "Let me see what"
	line "your #MON are"
	cont "capable of."
	done

PsychicNormanBeatenText:
	text "Ooh, your #MON"
	line "have potential."
	done

PsychicNormanAfterBattleText:
	text "You know how #-"
	line "MON have different"
	cont "abilities?"

	para "People are like"
	line "that too. Every-"
	cont "one has different"
	cont "potential."
	done

PokefanfJaimeHopeItGetsDarkText:
	text "Ufufufu… I hope it"
	line "gets dark soon."
	done

PokefanfJaimeSeenText:
	text "You came at just"
	line "the right time."

	para "Let's battle."
	done

PokefanfJaimeBeatenText:
	text "Oh, how disap-"
	line "pointing…"
	done

PokefanfJaimeAfterBattleText:
	text "I met my PONYTA at"
	line "night, right here"
	cont "on ROUTE 109."

	para "I'm not sure why,"
	line "but it seems to"

	para "like it when I"
	line "train here."

	para "It seems to become"
	line "friendlier by"

	para "training here than"
	line "anywhere else."
	done


BeautyValerieSeenText:
	text "Hi! Aren't you a"
	line "cute trainer!"

	para "May I see your"
	line "#MON?"
	done

BeautyValerieBeatenText:
	text "I'm glad I got to"
	line "see your #MON!"
	done

BeautyValerieAfterBattleText:
	text "When I see #-"
	line "MON, it seems to"
	cont "soothe my nerves."
	done
	
SailorHarrySeenText:
	text "I've been over-"
	line "seas, so I know"

	para "about all sorts of"
	line "#MON!"
	done

SailorHarryBeatenText:
	text "Your skill is"
	line "world class!"
	done

SailorHarryAfterBattleText:
	text "All kinds of peo-"
	line "ple around the"

	para "world live happily"
	line "with #MON."
	done

SchoolboyChad1SeenText:
	text "Let me try some-"
	line "thing I learned"
	cont "today."
	done

SchoolboyChad1BeatenText:
	text "I didn't study"
	line "enough, I guess."
	done

SchoolboyChad1AfterBattleText:
	text "I have to take so"
	line "many tests, I"

	para "don't have much"
	line "time for #MON."

	para "So when I do get"
	line "to play, I really"
	cont "concentrate."
	done	

Route109SignText:
	text "ROUTE 39"

	para "OLIVINE CITY -"
	line "ECRUTEAK CITY"
	done

MoomooFarmSignText:
	text "Heal Your #MON!"
	line "#MON CENTER"
	done

Route109TrainerTipsText:
	text "TRAINER TIPS"

	para "Use HEADBUTT on"
	line "trees to shake"
	cont "#MON out."

	para "Different kinds of"
	line "#MON drop out"
	cont "of trees."

	para "Use HEADBUTT on"
	line "any tree you see!"
	done

Route109_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event 15, 13, AMPARE_CAVERN_1F, 1
	warp_event 13, 28, ROUTE_109_POKECENTER_1F, 1
	warp_event  8,  5, ROUTE_109_ROUTE_110_GATE, 1
	warp_event  9,  5, ROUTE_109_ROUTE_110_GATE, 2

	db 0 ; coord events

	db 3 ; bg events
	bg_event  4, 56, BGEVENT_READ, Route109TrainerTips
	bg_event 14, 28, BGEVENT_READ, MoomooFarmSign
	bg_event  4, 35, BGEVENT_ITEM, Route109HiddenNugget

	db 8 ; object events
	object_event 12, 56, SPRITE_BUENA, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerBeautyValerie, -1
	object_event 10, 46, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 2, TrainerPokefanmDerek, -1
	object_event  6, 22, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 2, TrainerPokefanfRuth, -1
	object_event  5, 31, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerPsychicNorman, -1
	object_event 10, 23, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route109FruitTree, -1
	object_event  5, 63, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, TrainerPokefanfJaime, -1
	object_event  6, 84, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerSchoolboyChad1, -1
	object_event  8,  7, SPRITE_SAILOR, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerSailorHarry, -1
