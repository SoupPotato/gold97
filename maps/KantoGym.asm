	const_def 2 ; object constants
	const CELADONGYM_ERIKA
	const CELADONGYM_COOLTRAINERM1
	const CELADONGYM_COOLTRAINERM2
	const CELADONGYM_COOLTRAINERF1
	const CELADONGYM_COOLTRAINERF2
	const CELADONGYM_RED_DUMMY
	const CELADONGYM_GYM_GUY

KantoGym_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

KantoGymErikaScript:
	faceplayer
	opentext
	checkflag ENGINE_RISINGBADGE
	iftrue .FightDone
	writetext ErikaBeforeBattleText
	waitbutton
	closetext
	winlosstext ErikaBeatenText, 0
	loadtrainer ERIKA, ERIKA1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_ERIKA
	opentext
	writetext PlayerReceivedRainbowBadgeText
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_RISINGBADGE
.FightDone:
	writetext ErikaAfterBattleText
	waitbutton
	closetext
	end

KantoGymStatue:
	checkflag ENGINE_RISINGBADGE
	iftrue .Beaten
	jumpstd gymstatue1
.Beaten:
	trainertotext ERIKA, ERIKA1, MEM_BUFFER_1
	jumpstd gymstatue2


TrainerCooltrainermPaul:
	trainer COOLTRAINERM, PAUL, EVENT_BEAT_COOLTRAINERM_PAUL, CooltrainermPaulSeenText, CooltrainermPaulBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainermPaulAfterBattleText
	waitbutton
	closetext
	end
	

TrainerCooltrainermMike:
	trainer COOLTRAINERM, MIKE, EVENT_BEAT_COOLTRAINERM_MIKE, CooltrainermMikeSeenText, CooltrainermMikeBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainermMikeAfterBattleText
	waitbutton
	closetext
	end
	
TrainerCooltrainerfLola:
	trainer COOLTRAINERF, LOLA, EVENT_BEAT_COOLTRAINERF_LOLA, CooltrainerfLolaSeenText, CooltrainerfLolaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainerfLolaAfterBattleText
	waitbutton
	closetext
	end
	

TrainerCooltrainerfFran:
	trainer COOLTRAINERF, FRAN, EVENT_BEAT_COOLTRAINERF_FRAN, CooltrainerfFranSeenText, CooltrainerfFranBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainerfFranAfterBattleText
	waitbutton
	closetext
	end
	
RedEntersGymScene:
	checkevent EVENT_BEAT_COOLTRAINERF_FRAN
	iftrue .CheckGymTrainer2
	end
	
.CheckGymTrainer2
	checkevent EVENT_BEAT_COOLTRAINERF_LOLA
	iftrue .CheckGymTrainer3
	end
	
.CheckGymTrainer3
	checkevent EVENT_BEAT_COOLTRAINERM_MIKE
	iftrue .CheckGymTrainer4
	end
	
.CheckGymTrainer4
	checkevent EVENT_BEAT_COOLTRAINERM_PAUL
	iftrue .ItsRedTime
	end
	
.ItsRedTime
	playsound SFX_EXIT_BUILDING
	moveobject CELADONGYM_RED_DUMMY, 4, 17
	appear CELADONGYM_RED_DUMMY
	applymovement CELADONGYM_RED_DUMMY, RedDummyDummyMovement
	pause 20
	applymovement CELADONGYM_RED_DUMMY, RedDummyWalksToSpotRight
	disappear CELADONGYM_RED_DUMMY
	appear CELADONGYM_ERIKA
	setscene SCENE_RED_IS_HERE
	clearevent EVENT_GOT_SHUCKIE
	end
	
	
RedEntersGymScene2:
	checkevent EVENT_BEAT_COOLTRAINERF_FRAN
	iftrue .CheckGymTrainer22
	end
	
.CheckGymTrainer22
	checkevent EVENT_BEAT_COOLTRAINERF_LOLA
	iftrue .CheckGymTrainer32
	end
	
.CheckGymTrainer32
	checkevent EVENT_BEAT_COOLTRAINERM_MIKE
	iftrue .CheckGymTrainer42
	end
	
.CheckGymTrainer42
	checkevent EVENT_BEAT_COOLTRAINERM_PAUL
	iftrue .ItsRedTime2
	end
	
.ItsRedTime2
	playsound SFX_EXIT_BUILDING
	moveobject CELADONGYM_RED_DUMMY, 5, 17
	appear CELADONGYM_RED_DUMMY
	applymovement CELADONGYM_RED_DUMMY, RedDummyDummyMovement
	pause 20
	applymovement CELADONGYM_RED_DUMMY, RedDummyWalksToSpotLeft
	disappear CELADONGYM_RED_DUMMY
	appear CELADONGYM_ERIKA
	setscene SCENE_RED_IS_HERE
	clearevent EVENT_GOT_SHUCKIE
	end
	

KantoGymGuyScript2:
	faceplayer
	checkevent EVENT_GOT_SHUCKIE
	iftrue .KantoGymGuyRedNotHereScript2
	checkevent EVENT_BEAT_ERIKA
	iftrue .KantoGymGuyWinScript2
	opentext
	writetext KantoGymGuyText2
	waitbutton
	closetext
	end
	
.KantoGymGuyRedNotHereScript2
	opentext
	writetext KantoGymGuyRedNotHereText2
	waitbutton
	closetext
	end

.KantoGymGuyWinScript2:
	opentext
	writetext KantoGymGuyWinText2
	waitbutton
	closetext
	end
	
RedDummyDummyMovement:
	step_end
	
RedDummyWalksToSpotRight:
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step_end
	
RedDummyWalksToSpotLeft:
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step LEFT
	step UP
	step UP
	step UP
	step_end
	
KantoGymGuyWinText2:
	text "What an incredible"
	line "battle!"
	para "How many badges do"
	line "you have now?"
	para "You might be ready"
	line "for the LEAGUE."
	done
	
KantoGymGuyText2:
	text "Go get him, champ-"
	line "in-the-making!"
	done
	
KantoGymGuyRedNotHereText2:
	text "Hey, champ-in-the-"
	line "making!"
	para "You know who RED"
	line "is, right?"
	para "He's not only a"
	line "GYM LEADER, but"
	para "he's also beaten"
	line "the LEAGUE."
	para "He's one tough"
	line "guy, but he's not"
	cont "much for words."
	para "He's also not here"
	line "right now."
	para "I'm sure he'll be"
	line "back soon. Why"
	para "don't you battle"
	line "the TRAINERS here"
	para "while we wait for"
	line "his return?"
	done
	
CooltrainerfFranSeenText:
	text "I can't allow a"
	line "nameless trainer"
	cont "to defeat me!"
	done

CooltrainerfFranBeatenText:
	text "Awww… I lost…"
	done

CooltrainerfFranAfterBattleText:
	text "Huh. You might"
	line "have what it takes"
	cont "to beat RED."
	done

CooltrainerfLolaSeenText:
	text "What type of"
	line "#MON do we use?"
	para "Why, all of them,"
	line "like any good"
	cont "trainer should."
	done

CooltrainerfLolaBeatenText:
	text "Way to go!"
	done

CooltrainerfLolaAfterBattleText:
	text "A balanced party"
	line "is key to victory."
	done


CooltrainermMikeSeenText:
	text "My chance of"
	line "losing? Not even"
	cont "one percent!"
	done

CooltrainermMikeBeatenText:
	text "That's odd."
	done

CooltrainermMikeAfterBattleText:
	text "I know my short-"
	line "comings now."

	para "Thanks for showing"
	line "me!"
	done

CooltrainermPaulSeenText:
	text "Facing RED will"
	line "surely be your"
	cont "toughest battle."
	para "But I can be a"
	line "close second!"
	done

CooltrainermPaulBeatenText:
	text "My #MON lost?"
	done

CooltrainermPaulAfterBattleText:
	text "You almost ready"
	line "to take on the"
	cont "LEAGUE?"
	done

ErikaBeforeBattleText:
	text "…"
	done

ErikaBeatenText:
	text "…"
	done

PlayerReceivedRainbowBadgeText:
	text "<PLAYER> received"
	line "RISINGBADGE."
	done

ErikaExplainTMText:
	text "…"
	done

ErikaAfterBattleText:
	text "…"
	done


KantoGym_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4, 17, KANTO_REGION, 8
	warp_event  5, 17, KANTO_REGION, 15

	db 2 ; coord events
	coord_event  5, 13, SCENE_DEFAULT, RedEntersGymScene
	coord_event  4, 13, SCENE_DEFAULT, RedEntersGymScene2

	db 2 ; bg events
	bg_event  3, 15, BGEVENT_READ, KantoGymStatue
	bg_event  6, 15, BGEVENT_READ, KantoGymStatue

	db 7 ; object events
	object_event  4,  7, SPRITE_RED, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, KantoGymErikaScript, EVENT_GOT_SHUCKIE
	object_event  4,  1, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 2, TrainerCooltrainermPaul, -1
	object_event  9,  6, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 2, TrainerCooltrainermMike, -1
	object_event  5,  1, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 2, TrainerCooltrainerfLola, -1
	object_event  0,  6, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 2, TrainerCooltrainerfFran, -1
	object_event -5, -5, SPRITE_RED, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, KantoGymErikaScript, -1
	object_event  7, 15, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, KantoGymGuyScript2, -1
