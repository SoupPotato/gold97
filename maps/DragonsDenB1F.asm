	const_def 2 ; object constants
	const DRAGONSDENB1F_POKE_BALL1
	const DRAGONSDENB1F_COOLTRAINER_M
	const DRAGONSDENB1F_COOLTRAINER_F
	const DRAGONSDENB1F_TWIN1
	const DRAGONSDENB1F_TWIN2
	const DRAGONSDENB1F_POKE_BALL2
	const DRAGONSDENB1F_POKE_BALL3
	const DRAGONSDENB1F_GENTLEMAN

DragonsDenB1F_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_DRAGONSDENB1F_NOTHING
	scene_script .DummyScene1 ; SCENE_DRAGONSDENB1F_CLAIR_GIVES_TM

	db 0 ; callbacks

.DummyScene0:
	end

.DummyScene1:
	end


	;giveitem TM_DRAGONBREATH
	;setevent EVENT_GOT_TM24_DRAGONBREATH


TrainerCooltrainermDarin:
	trainer COOLTRAINERM, DARIN, EVENT_BEAT_COOLTRAINERM_DARIN, CooltrainermDarinSeenText, CooltrainermDarinBeatenText, 0, .Script

.Script:
	checkevent EVENT_BEAT_COOLTRAINERF_CARA
	iftrue .DarinCheck2
	opentext
	writetext CooltrainermDarinAfterBattleTextNotDone
	waitbutton
	closetext
	end

.DarinCheck2
	checkevent EVENT_BEAT_INSTRUCTOR_RAND
	iftrue .DarinCheck3
	opentext
	writetext CooltrainermDarinAfterBattleTextNotDone
	waitbutton
	closetext
	end
	
.DarinCheck3
	checkevent EVENT_BEAT_TWINS_LEA_AND_PIA
	iftrue .DarinOrbCheck
	opentext
	writetext CooltrainermDarinAfterBattleTextNotDone
	waitbutton
	closetext
	end
	
.DarinOrbCheck
	checkevent EVENT_FOUND_MACHINE_PART_IN_CERULEAN_GYM
	iffalse .DarinGetDragonOrb
	opentext
	writetext CooltrainermDarinAfterBattleText
	waitbutton
	closetext
	end

.DarinGetDragonOrb
	jump DragonOrbGetScript
	end

TrainerInstructorRand:
	trainer INSTRUCTOR, RAND, EVENT_BEAT_INSTRUCTOR_RAND, InstructorRandSeenText, InstructorRandBeatenText, 0, .Script

.Script:
	checkevent EVENT_BEAT_COOLTRAINERF_CARA
	iftrue .RandCheck2
	opentext
	writetext InstructorRandAfterBattleTextNotDone
	waitbutton
	closetext
	end

.RandCheck2
	checkevent EVENT_BEAT_COOLTRAINERM_DARIN
	iftrue .RandCheck3
	opentext
	writetext InstructorRandAfterBattleTextNotDone
	waitbutton
	closetext
	end
	
.RandCheck3
	checkevent EVENT_BEAT_TWINS_LEA_AND_PIA
	iftrue .RandOrbCheck
	opentext
	writetext InstructorRandAfterBattleTextNotDone
	waitbutton
	closetext
	end
	
.RandOrbCheck
	checkevent EVENT_FOUND_MACHINE_PART_IN_CERULEAN_GYM
	iffalse .RandGetDragonOrb
	opentext
	writetext InstructorRandAfterBattleText
	waitbutton
	closetext
	end

.RandGetDragonOrb
	jump DragonOrbGetScript
	end

TrainerCooltrainerfCara:
	trainer COOLTRAINERF, CARA, EVENT_BEAT_COOLTRAINERF_CARA, CooltrainerfCaraSeenText, CooltrainerfCaraBeatenText, 0, .Script


.Script:
	checkevent EVENT_BEAT_INSTRUCTOR_RAND
	iftrue .CaraCheck2
	opentext
	writetext CooltrainerfCaraAfterBattleTextNotDone
	waitbutton
	closetext
	end

.CaraCheck2
	checkevent EVENT_BEAT_INSTRUCTOR_RAND
	iftrue .CaraCheck3
	opentext
	writetext CooltrainerfCaraAfterBattleTextNotDone
	waitbutton
	closetext
	end
	
.CaraCheck3
	checkevent EVENT_BEAT_TWINS_LEA_AND_PIA
	iftrue .CaraOrbCheck
	opentext
	writetext CooltrainerfCaraAfterBattleTextNotDone
	waitbutton
	closetext
	end
	
.CaraOrbCheck
	checkevent EVENT_FOUND_MACHINE_PART_IN_CERULEAN_GYM
	iffalse .CaraGetDragonOrb
	opentext
	writetext CooltrainerfCaraAfterBattleText
	waitbutton
	closetext
	end
	
.CaraGetDragonOrb
	jump DragonOrbGetScript
	end

TrainerTwinsLeaandpia1:
	trainer TWINS, LEAANDPIA1, EVENT_BEAT_TWINS_LEA_AND_PIA, TwinsLeaandpia1SeenText, TwinsLeaandpia1BeatenText, 0, .Script

.Script:
	checkevent EVENT_BEAT_COOLTRAINERF_CARA
	iftrue .Twin1Check2
	opentext
	writetext TwinsLeaandpia1AfterBattleTextNotDone
	waitbutton
	closetext
	end

.Twin1Check2
	checkevent EVENT_BEAT_COOLTRAINERM_DARIN
	iftrue .Twin1Check3
	opentext
	writetext TwinsLeaandpia1AfterBattleTextNotDone
	waitbutton
	closetext
	end
	
.Twin1Check3
	checkevent EVENT_BEAT_INSTRUCTOR_RAND
	iftrue .Twin1OrbCheck
	opentext
	writetext TwinsLeaandpia1AfterBattleTextNotDone
	waitbutton
	closetext
	end
	
.Twin1OrbCheck
	checkevent EVENT_FOUND_MACHINE_PART_IN_CERULEAN_GYM
	iffalse .Twin1GetDragonOrb
	opentext
	writetext TwinsLeaandpia1AfterBattleText
	waitbutton
	closetext
	end

.Twin1GetDragonOrb
	jump DragonOrbGetScript
	end

TrainerTwinsLeaandpia2:
	trainer TWINS, LEAANDPIA1, EVENT_BEAT_TWINS_LEA_AND_PIA, TwinsLeaandpia2SeenText, TwinsLeaandpia2BeatenText, 0, .Script

.Script:
	checkevent EVENT_BEAT_COOLTRAINERF_CARA
	iftrue .Twin2Check2
	opentext
	writetext TwinsLeaandpia2AfterBattleTextNotDone
	waitbutton
	closetext
	end

.Twin2Check2
	checkevent EVENT_BEAT_COOLTRAINERM_DARIN
	iftrue .Twin2Check3
	opentext
	writetext TwinsLeaandpia2AfterBattleTextNotDone
	waitbutton
	closetext
	end
	
.Twin2Check3
	checkevent EVENT_BEAT_INSTRUCTOR_RAND
	iftrue .Twin2OrbCheck
	opentext
	writetext TwinsLeaandpia2AfterBattleTextNotDone
	waitbutton
	closetext
	end
	
.Twin2OrbCheck
	checkevent EVENT_FOUND_MACHINE_PART_IN_CERULEAN_GYM
	iffalse .Twin2GetDragonOrb
	opentext
	writetext TwinsLeaandpia2AfterBattleText
	waitbutton
	closetext
	end
	
.Twin2GetDragonOrb
	jump DragonOrbGetScript
	end

DragonsDenB1FDragonFangScript:
	itemball DRAGON_FANG



DragonShrineSignpost:
	jumptext DragonShrineSignpostText

DragonsDenB1FCalcium:
	itemball TM_DRAGONBREATH

DragonsDenB1FMaxElixer:
	itemball MAX_ELIXER

DragonsDenB1FHiddenRevive:
	hiddenitem REVIVE, EVENT_DRAGONS_DEN_B1F_HIDDEN_REVIVE

DragonsDenB1FHiddenMaxPotion:
	hiddenitem MAX_POTION, EVENT_DRAGONS_DEN_B1F_HIDDEN_MAX_POTION

DragonsDenB1FHiddenMaxElixer:
	hiddenitem MAX_ELIXER, EVENT_DRAGONS_DEN_B1F_HIDDEN_MAX_ELIXER

DragonOrbGetScript:
	opentext
	writetext HeresTheOrb
	waitbutton
	verbosegiveitem MACHINE_PART
	setevent EVENT_FOUND_MACHINE_PART_IN_CERULEAN_GYM
;	writetext HeresTheOrb2
;	waitbutton
	closetext
	end
	
HeresTheOrb:
	text "At last, you"
	line "figured out who"
	para "has the DRAGON"
	line "ORB."
	para "Take this, and"
	line "bring it to CLAIR."
	done
	
HeresTheOrb2:
	text "got orb"
	done

DragonShrineSignpostText:
	text "DRAGON SHRINE"

	para "A shrine honoring"
	line "the dragon #MON"

	para "said to have lived"
	line "in DRAGON'S DEN."
	done

CooltrainermDarinSeenText:
	text "You! Do you have"
	line "what it takes to"
	para "train the powerful"
	line "DRAGON #MON?"
	done

CooltrainermDarinBeatenText:
	text "S-strong!"
	done

CooltrainermDarinAfterBattleText:
	text "I trust you will"
	line "find these grounds"
	para "a great place to"
	line "train."
	done

CooltrainermDarinAfterBattleTextNotDone:
	text "DRAGON ORB?"
	para "It is not me who"
	line "is holding it."
	done

CooltrainerfCaraSeenText:
	text "Did CLAIR give you"
	line "permission to be"
	cont "in here?"
	done

CooltrainerfCaraBeatenText:
	text "Oh yikes, I lost!"
	done

CooltrainerfCaraAfterBattleTextNotDone:
	text "Nope, I'm not the"
	line "holder of the ORB."
	para "Try again!"
	done

CooltrainerfCaraAfterBattleText:
	text "Raising DRAGONs is"
	line "more rewarding"
	para "than other types,"
	line "I think."
	done


InstructorRandSeenText:
	text "Have you learned"
	line "enough about"
	para "mystical DRAGON"
	line "#MON in order"
	para "to respect them"
	line "properly?"
	done

InstructorRandBeatenText:
	text "Oh yikes, I lost!"
	done

InstructorRandAfterBattleText:
	text "The history of"
	line "people training"
	para "DRAGON #MON is"
	line "long and storied."
	para "But some suspect"
	line "it began here."
	done

InstructorRandAfterBattleTextNotDone:
	text "The ORB? Not here."
	line "Try someone else."
	done

TwinsLeaandpia1SeenText:
	text "It's a stranger we"
	line "don't know."
	done

TwinsLeaandpia1BeatenText:
	text "Ouchies."
	done

TwinsLeaandpia1AfterBattleText:
	text "Have you ever"
	line "battled LANCE?"
	para "He is the only"
	line "DRAGON TRAINER"
	para "considered CLAIR's"
	line "superior."
	done
	
TwinsLeaandpia1AfterBattleTextNotDone:
	text "A DRAGON ORB?"
	line "Nope, not here!"
	done

TwinsLeaandpia2SeenText:
	text "Who are you?"
	done

TwinsLeaandpia2BeatenText:
	text "Meanie."
	done

TwinsLeaandpia2AfterBattleTextNotDone:
	text "DRAGON ORB? I"
	line "don't have it!"
	done

TwinsLeaandpia2AfterBattleText:
	text "Me and my sister"
	line "are going to rival"
	para "CLAIR and LANCE"
	line "someday!"
	done

DragonsDenB1F_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  9, 31, PALLET_TOWN, 5
	warp_event  3, 25, DRAGON_SHRINE, 1

	db 0 ; coord events

	db 4 ; bg events
	bg_event  3, 27, BGEVENT_READ, DragonShrineSignpost
	bg_event 33, 29, BGEVENT_ITEM, DragonsDenB1FHiddenRevive
	bg_event  6,  4, BGEVENT_ITEM, DragonsDenB1FHiddenMaxPotion
	bg_event 28, 16, BGEVENT_ITEM, DragonsDenB1FHiddenMaxElixer

	db 8 ; object events
	object_event 33, 15, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, DragonsDenB1FDragonFangScript, EVENT_DRAGONS_DEN_B1F_DRAGON_FANG
	object_event 23,  7, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 4, TrainerCooltrainermDarin, -1
	object_event 16,  2, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerCooltrainerfCara, -1
	object_event  2, 12, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerTwinsLeaandpia1, -1
	object_event  2, 13, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerTwinsLeaandpia2, -1
	object_event 19, 13, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, DragonsDenB1FCalcium, EVENT_DRAGONS_DEN_B1F_CALCIUM
	object_event 26, 31, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, DragonsDenB1FMaxElixer, EVENT_DRAGONS_DEN_B1F_MAX_ELIXER
	object_event 24, 25, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 4, TrainerInstructorRand, -1
