	const_def 2 ; object constants
	const ELMSLAB_ELM
	const ELMSLAB_ELMS_AIDE
	const ELMSLAB_POKE_BALL1
	const ELMSLAB_POKE_BALL2
	const ELMSLAB_POKE_BALL3
	const ELMSLAB_BLUE
	const ELMSLAB_SILVER

OaksLab_MapScripts:
	db 6 ; scene scripts
	scene_script .MeetElm ; SCENE_DEFAULT
	scene_script .DummyScene1 ; SCENE_ELMSLAB_CANT_LEAVE
	scene_script .DummyScene2 ; SCENE_ELMSLAB_NOTHING
	scene_script .DummyScene3 ; SCENE_ELMSLAB_MEET_OFFICER
	scene_script .DummyScene4 ; SCENE_ELMSLAB_UNUSED
	scene_script .DummyScene5 ; SCENE_ELMSLAB_AIDE_GIVES_POTION

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .MoveElmCallback

.MeetElm:
	priorityjump .WalkUpToElm
	end

.DummyScene1:
	end

.DummyScene2:
	end

.DummyScene3:
	end

.DummyScene4:
	end

.DummyScene5:
	end

.MoveElmCallback:
	checkscene
	iftrue .Skip ; not SCENE_DEFAULT
	moveobject ELMSLAB_ELM, 4, 2
.Skip:
	return

.WalkUpToElm:
	applymovement PLAYER, OaksLab_WalkUpToElmMovement
	showemote EMOTE_SHOCK, ELMSLAB_ELM, 15
	opentext
	writetext ElmText_Intro
	waitbutton
	closetext
	showemote EMOTE_SHOCK, ELMSLAB_SILVER, 15
	opentext
	writetext Text_OakIsOld
	waitbutton
	closetext
	pause 15
	opentext
	writetext Text_OakSpeech
	waitbutton
	closetext
	showemote EMOTE_SHOCK, ELMSLAB_SILVER, 15
	opentext
	writetext Text_Interesting
	waitbutton
	closetext
	showemote EMOTE_SHOCK, ELMSLAB_BLUE, 15
	opentext
	writetext BlueText_Pokedex
	waitbutton
	closetext
	applymovement ELMSLAB_BLUE, BlueGivesDex1
	pause 10
	applymovement ELMSLAB_BLUE, BlueGivesDex2
	pause 5
	opentext
;	buttonsound
;	waitsfx
	writetext Lab_GetDexText
	playsound SFX_ITEM
	waitsfx
	setflag ENGINE_POKEDEX
	pause 15
	waitbutton
	closetext
	applymovement ELMSLAB_BLUE, BlueGivesDex3
	opentext
	writetext Text_OakDream
	waitbutton
	closetext
	applymovement ELMSLAB_SILVER, MoveHeadLeft
	opentext
	writetext Text_RivalGenerous
	waitbutton
	closetext
	applymovement ELMSLAB_SILVER, MoveHeadUp
	setscene SCENE_ELMSLAB_CANT_LEAVE
	end

OaksLabSilverScript:
	jumptextfaceplayer Text_Best
	
OaksLabBlueScript:
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .BlueAfterEliteFour
	faceplayer
	opentext
	writetext ElmText_Accepted
	waitbutton
	closetext
	end
	
.BlueAfterEliteFour
	faceplayer
	opentext
	writetext ElmText_Accepted2
	waitbutton
	closetext
	end

ProfElmScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_SS_TICKET_FROM_ELM
	iftrue ElmCheckMasterBall
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue ElmGiveTicketScript
ElmCheckMasterBall:
	checkevent EVENT_GOT_MASTER_BALL_FROM_ELM
	iftrue ElmCheckEverstone
	checkflag ENGINE_RISINGBADGE
	iftrue ElmGiveMasterBallScript
ElmCheckEverstone:
	checkevent EVENT_GOT_EVERSTONE_FROM_ELM
	iftrue ElmScript_CallYou
	checkevent EVENT_TOLD_ELM_ABOUT_TOGEPI_OVER_THE_PHONE
	iffalse ElmCheckTogepiEgg
	waitbutton
	closetext
	end

ElmCheckTogepiEgg:
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue ElmAfterLeagueInPerson
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue ElmAfterRadioTowerInPerson
	checkevent EVENT_RIVAL_BURNED_TOWER
	iftrue ElmRocketsReturnedScript
	checkevent EVENT_GOT_TOGEPI_EGG_FROM_ELMS_AIDE ; why are we checking it again?
	iftrue ElmWaitingEggHatchScript ; gonna make this about league challenge
	checkevent EVENT_GOT_A_POKEMON_FROM_OAK
	iftrue ElmDescribesMrPokemonScript
	writetext ElmText_LetYourMonBattleIt
	waitbutton
	closetext
	end

LabTryToLeaveScript:
	turnobject ELMSLAB_ELM, DOWN
	opentext
	writetext LabWhereGoingText
	waitbutton
	closetext
	applymovement PLAYER, OaksLab_CantLeaveMovement
	end
	
ElmWaitingEggHatchScript:
	writetext ElmWaitingEggHatchText
	waitbutton
	closetext
	end
	
ElmRocketsReturnedScript:
	writetext ElmRocketsReturnedText
	waitbutton
	closetext
	end
	
ElmAfterRadioTowerInPerson:
	writetext ElmYoureBasicallyAHeroText
	waitbutton
	closetext
	end
	
ElmAfterLeagueInPerson:
	writetext ElmAfterLeagueInPersonText
	waitbutton
	closetext
	end

FlambearPokeBallScript:
	checkevent EVENT_GOT_A_POKEMON_FROM_OAK
	iftrue LookAtElmPokeBallScript
	turnobject ELMSLAB_ELM, DOWN
	refreshscreen
	pokepic FLAMBEAR
	cry FLAMBEAR
	waitbutton
	closepokepic
	opentext
	writetext TakeFlambearText
	yesorno
	iffalse DidntChooseStarterScript
	disappear ELMSLAB_POKE_BALL1
	setevent EVENT_GOT_FLAMBEAR_FROM_ELM
	writetext ChoseStarterText
	buttonsound
	waitsfx
	pokenamemem FLAMBEAR, MEM_BUFFER_0
	writetext ReceivedStarterText
	playsound SFX_CAUGHT_MON
	waitsfx
	buttonsound
	givepoke FLAMBEAR, 5, BERRY
	closetext
	applymovement ELMSLAB_SILVER, SilverGetCruiseMovement
	opentext
	writetext Text_SilverTakeThisOne
	waitbutton
	closetext
	disappear ELMSLAB_POKE_BALL2
	opentext
	writetext Text_SilverGetCruise
	playsound SFX_CAUGHT_MON
	waitsfx
	buttonsound
	closetext
	setevent EVENT_CRUIZE_POKEBALL_IN_ELMS_LAB
	setevent EVENT_PLAYERS_HOUSE_1F_NEIGHBOR
	clearevent EVENT_PLAYERS_NEIGHBORS_HOUSE_NEIGHBOR
	jump ElmDirectionsScript

CruisePokeBallScript:
	checkevent EVENT_GOT_A_POKEMON_FROM_OAK
	iftrue LookAtElmPokeBallScript
	turnobject ELMSLAB_ELM, DOWN
	refreshscreen
	pokepic CRUIZE
	cry CRUIZE
	waitbutton
	closepokepic
	opentext
	writetext TakeCruiseText
	yesorno
	iffalse DidntChooseStarterScript
	disappear ELMSLAB_POKE_BALL2
	setevent EVENT_GOT_CRUIZE_FROM_ELM
	writetext ChoseStarterText
	buttonsound
	waitsfx
	pokenamemem CRUIZE, MEM_BUFFER_0
	writetext ReceivedStarterText
	playsound SFX_CAUGHT_MON
	waitsfx
	buttonsound
	givepoke CRUIZE, 5, BERRY
	closetext
	applymovement ELMSLAB_SILVER, SilverGetCHIKORITAMovement
	opentext
	writetext Text_SilverTakeThisOne
	waitbutton
	closetext
	disappear ELMSLAB_POKE_BALL3
	opentext
	writetext Text_SilverGetCHIKORITA
	playsound SFX_CAUGHT_MON
	waitsfx
	buttonsound
	closetext
	setevent EVENT_CHIKORITA_POKEBALL_IN_ELMS_LAB
	setevent EVENT_PLAYERS_HOUSE_1F_NEIGHBOR
	clearevent EVENT_PLAYERS_NEIGHBORS_HOUSE_NEIGHBOR
	jump ElmDirectionsScript

CHIKORITAPokeBallScript:
	checkevent EVENT_GOT_A_POKEMON_FROM_OAK
	iftrue LookAtElmPokeBallScript
	turnobject ELMSLAB_ELM, DOWN
	refreshscreen
	pokepic CHIKORITA
	cry CHIKORITA
	waitbutton
	closepokepic
	opentext
	writetext TakeCHIKORITAText
	yesorno
	iffalse DidntChooseStarterScript
	disappear ELMSLAB_POKE_BALL3
	setevent EVENT_GOT_CHIKORITA_FROM_ELM
	writetext ChoseStarterText
	buttonsound
	waitsfx
	pokenamemem CHIKORITA, MEM_BUFFER_0
	writetext ReceivedStarterText
	playsound SFX_CAUGHT_MON
	waitsfx
	buttonsound
	givepoke CHIKORITA, 5, BERRY
	closetext
	applymovement ELMSLAB_SILVER, SilverGetFlambearMovement
	opentext
	writetext Text_SilverTakeThisOne
	waitbutton
	closetext
	disappear ELMSLAB_POKE_BALL1
	opentext
	writetext Text_SilverGetFlambear
	playsound SFX_CAUGHT_MON
	waitsfx
	buttonsound
	closetext
	setevent EVENT_FLAMBEAR_POKEBALL_IN_ELMS_LAB
	setevent EVENT_PLAYERS_HOUSE_1F_NEIGHBOR
	clearevent EVENT_PLAYERS_NEIGHBORS_HOUSE_NEIGHBOR
	jump ElmDirectionsScript

DidntChooseStarterScript:
	writetext DidntChooseStarterText
	waitbutton
	closetext
	end

ElmDirectionsScript:
	applymovement ELMSLAB_ELM, ElmToTable
	turnobject PLAYER, UP
	opentext
	writetext ElmDirectionsText1
	waitbutton
	closetext
	addcellnum PHONE_ELM
	opentext
	writetext GotElmsNumberText
	playsound SFX_REGISTER_PHONE_NUMBER
	waitsfx
	waitbutton
	closetext
	opentext
	writetext ElmDirectionsText3
	waitbutton
	closetext
	applymovement ELMSLAB_ELM, ElmBackFromTable
	setevent EVENT_GOT_A_POKEMON_FROM_OAK
	setevent EVENT_RIVAL_CHERRYGROVE_CITY
	setscene SCENE_ELMSLAB_AIDE_GIVES_POTION
	setmapscene SILENT_TOWN, SCENE_NEW_BARK_NOTHING
	setmapscene OAKS_LAB_ENTRANCE, SCENE_ELM_ENTRANCE_BATTLE
	setevent EVENT_SILVER_IN_ELMS_LAB
	clearevent EVENT_DAISY_ELM_ENTRANCE
	end

ElmDescribesMrPokemonScript:
	writetext ElmDescribesMrPokemonText
	waitbutton
	closetext
	end

LookAtElmPokeBallScript:
	opentext
	writetext ElmPokeBallText
	waitbutton
	closetext
	end



ElmGiveEverstoneScript:
	writetext ElmGiveEverstoneText1
	buttonsound
	verbosegiveitem EVERSTONE
	iffalse ElmScript_NoRoomForEverstone
	writetext ElmGiveEverstoneText2
	waitbutton
	closetext
	setevent EVENT_GOT_EVERSTONE_FROM_ELM
	end

ElmScript_CallYou:
	writetext ElmText_CallYou
	waitbutton
ElmScript_NoRoomForEverstone:
	closetext
	end

ElmGiveMasterBallScript:
	writetext ElmGiveMasterBallText1
	buttonsound
	verbosegiveitem MASTER_BALL
	iffalse .notdone
	setevent EVENT_GOT_MASTER_BALL_FROM_ELM
	writetext ElmGiveMasterBallText2
	waitbutton
.notdone
	closetext
	end

ElmGiveTicketScript:
	writetext ElmGiveTicketText1
	buttonsound
	verbosegiveitem S_S_TICKET
	setevent EVENT_GOT_SS_TICKET_FROM_ELM
	writetext ElmGiveTicketText2
	waitbutton
	closetext
	end

ElmJumpBackScript1:
	closetext
	checkcode VAR_FACING
	ifequal DOWN, ElmJumpDownScript
	ifequal UP, ElmJumpUpScript
	ifequal LEFT, ElmJumpLeftScript
	ifequal RIGHT, ElmJumpRightScript
	end

ElmJumpBackScript2:
	closetext
	checkcode VAR_FACING
	ifequal DOWN, ElmJumpUpScript
	ifequal UP, ElmJumpDownScript
	ifequal LEFT, ElmJumpRightScript
	ifequal RIGHT, ElmJumpLeftScript
	end

ElmJumpUpScript:
	applymovement ELMSLAB_ELM, ElmJumpUpMovement
	opentext
	end

ElmJumpDownScript:
	applymovement ELMSLAB_ELM, ElmJumpDownMovement
	opentext
	end

ElmJumpLeftScript:
	applymovement ELMSLAB_ELM, ElmJumpLeftMovement
	opentext
	end

ElmJumpRightScript:
	applymovement ELMSLAB_ELM, ElmJumpRightMovement
	opentext
	end

ElmsAideScript:
	faceplayer
	opentext
	writetext AideText_AlwaysBusy
	waitbutton
	closetext
	end

OaksLabTrashcan:
	jumptext OaksLabTrashcanText


OaksLabBookshelf:
	jumpstd difficultbookshelf
	
ElmBackFromTable:
	step LEFT
	step LEFT
	step DOWN
;	turn_head DOWN
	step_end

MoveHeadLeft:
	turn_head LEFT
	step_end
	
MoveHeadUp:
	turn_head UP
	step_end
	
ElmToTable:
	step UP
	step RIGHT
	step RIGHT
	turn_head DOWN
	step_end
	
SilverGetCruiseMovement:
	step RIGHT
	step RIGHT
	step UP
	step UP
	step_end
	
SilverGetFlambearMovement:
	step RIGHT
	step UP
	step UP
	step_end
	
SilverGetCHIKORITAMovement:
	step RIGHT
	step RIGHT
	step RIGHT
	step UP
	step UP
	step_end

OaksLab_WalkUpToElmMovement:
	step UP
	step UP
	step_end

OaksLab_CantLeaveMovement:
	step UP
	step_end

MeetCopScript2_StepLeft:
	step LEFT
	step_end

MeetCopScript_WalkUp:
	step UP
	step UP
	step UP
	step UP
	turn_head RIGHT
	step_end

OfficerLeavesMovement:
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end

AideWalksRight1:
	step DOWN
	step LEFT
	step LEFT
	step LEFT
	turn_head LEFT
	step_end

AideWalksRight2:
	step DOWN
	step LEFT
	step LEFT
	turn_head LEFT
	step_end

AideWalksLeft1:
	step UP
	step RIGHT
	step RIGHT
	step RIGHT
	turn_head DOWN
	step_end

AideWalksLeft2:
	step UP
	step RIGHT
	step RIGHT
	turn_head DOWN
	step_end

ElmJumpUpMovement:
	fix_facing
	big_step UP
	remove_fixed_facing
	step_end

ElmJumpDownMovement:
	fix_facing
	big_step DOWN
	remove_fixed_facing
	step_end

ElmJumpLeftMovement:
	fix_facing
	big_step LEFT
	remove_fixed_facing
	step_end

ElmJumpRightMovement:
	fix_facing
	big_step RIGHT
	remove_fixed_facing
	step_end

OaksLab_ElmToDefaultPositionMovement1:
	step UP
	step_end

OaksLab_ElmToDefaultPositionMovement2:
	step RIGHT
	step RIGHT
	step UP
	turn_head DOWN
	step_end

AfterFlambearMovement:
	step LEFT
	step UP
	turn_head UP
	step_end

AfterCruiseMovement:
	step LEFT
	step LEFT
	step UP
	turn_head UP
	step_end

AfterCHIKORITAMovement:
	step LEFT
	step LEFT
	step LEFT
	step UP
	turn_head UP
	step_end
	
BlueGivesDex1:
	step RIGHT
	step RIGHT
	step DOWN
	step_end
	
BlueGivesDex2:
	step LEFT
	turn_head DOWN
	step_end
	
BlueGivesDex3:
	step UP
	step LEFT
	turn_head DOWN
	step_end
	
ElmText_Accepted2:
	text "How are things"
	line "now that you've"
	cont "beat the LEAGUE?"
	para "I hope they're"
	line "going well."
	para "Have you seen"
	line "<RIVAL> lately?"
	para "I know he's out"
	line "training with his"
	cont "#MON."
	para "I think he's"
	line "learned how to"
	para "work together with"
	line "them as a team."
	done
	
Text_SilverTakeThisOne:
	text "This #MON looks"
	line "strong!"
	
	para "I will take this"
	line "one."
	done
	
Text_SilverGetCruise:
	text "<RIVAL> received"
	line "CRUIZE!"
	done
	
Text_SilverGetFlambear:
	text "<RIVAL> received"
	line "FLAMBEAR!"
	done
	
Text_SilverGetCHIKORITA:
	text "<RIVAL> received"
	line "CHIKORITA!"
	done
		
Text_Best:
	text "My #MON is"
	line "gonna be the best"
	cont "one!"
	done

Lab_GetDexText:
	text "<PLAYER> received"
	line "#DEX!"
	done
	
ElmText_Intro:
	text "OAK: <PLAY_G>!"
	line "There you are!"

	done
	
Text_OakIsOld:
	text "<RIVAL>: I can't"
	line "believe this old"
	para "geezer is PROF."
	line "OAK…"
	done
	
Text_OakSpeech:
	text "OAK: Haha!"
	
	para "Indeed young man,"
	line "but I'm not that"
	cont "old yet!"
	
	para "I have called you"
	line "both here for an"
	cont "important task..."

	para "Since I was a "
	line "young boy, I have"
	cont "dreamed of having"
	cont "a complete guide"
	cont "on every species"
	cont "of #MON."
	
	para "However..."
	para "More and more are"
	line "being discovered"
	cont "every day!"
	
	para "But my age is"
	line "catching on me..."
	
	para "So!"
	
	para "I would like you"
	line "two to carry out"
	cont "my research."
	done

Text_Interesting:
	text "<RIVAL>: Wow!"

	para "You want us to"
	line "find and catch a"
	cont "bunch of #MON"
	cont "for you!?"
	
	para "As many as we"
	line "want?"
	done
	
BlueText_Pokedex:
	text "BLUE: That's"
	line "right!"
	
	para "It won't be easy"
	line "however."
	
	para "I tried to com"
	line "-plete the #DEX"
	cont "once..."
	
	para "But I got too"
	line "arrogant…"
	
	para "I focused too much"
	line "being the best"
	cont "trainer, I lost"
	cont "sight of my goal."
	
	para "So I help Gramps"
	line "with his research"
	cont "now."
	
	para "Here! Take this"
	line "#DEX!"

	para "It automatically"
	line "records data on"
	para "#MON you've"
	line "seen or caught!"
	done
	
Text_OakDream:
	text "OAK: Now all you"
	line "need is a partner"
	cont "#MON for your"
	cont "journey."
	
	para "There are three"
	line "#BALLs on the"
	cont "table."
	
	para "Both of you can"
	line "choose one to be"
	cont "your companion!"	
	done
	
Text_RivalGenerous:
	text "<RIVAL>: You"
	line "can choose first"
	cont "<PLAY_G>..."
	
	para "I want some time"
	line "to decide."
	done

ElmText_Accepted:
	text "Thanks, <PLAY_G>!"

	para "I appreciate you"
	line "helping out my"
	cont "grandpa."
	done

ElmText_GotAnEmail:
	text "Oh, hey! I got an"
	line "e-mail!"

	para "<……><……><……>"
	line "Hm… Uh-huh…"

	para "Okay…"
	done

ElmText_MissionFromMrPokemon:
	text "Hey, listen."

	para "I have an acquain-"
	line "tance called MR."
	cont "#MON."

	para "He keeps finding"
	line "weird things and"

	para "raving about his"
	line "discoveries."

	para "Anyway, I just got"
	line "an e-mail from him"

	para "saying that this"
	line "time it's real."

	para "It is intriguing,"
	line "but we're busy"

	para "with our #MON"
	line "research…"

	para "Wait!"

	para "I know!"

	para "<PLAY_G>, can you"
	line "go in our place?"
	done

ElmText_ChooseAPokemon:
	text "I want you to"
	line "raise one of the"

	para "#MON contained"
	line "in these BALLS."

	para "You'll be that"
	line "#MON's first"
	cont "partner, <PLAY_G>!"

	para "Go on. Pick one!"
	done

ElmText_LetYourMonBattleIt:
	text "If a wild #MON"
	line "appears, let your"
	cont "#MON battle it!"
	done

LabWhereGoingText:
	text "OAK: Wait! Where"
	line "are you going?"
	done

TakeFlambearText:
	text "OAK: You'll take"
	line "FLAMBEAR, the"
	cont "fire #MON?"
	done

TakeCruiseText:
	text "OAK: Do you want"
	line "CRUIZE, the"
	cont "water #MON?"
	done

TakeCHIKORITAText:
	text "OAK: So, you like"
	line "CHIKORITA, the"
	cont "grass #MON?"
	done

DidntChooseStarterText:
	text "OAK: Think it over"
	line "carefully."

	para "Your partner is"
	line "important."
	done

ChoseStarterText:
	text "OAK: I think"
	line "that's a great"
	cont "#MON too!"
	done

ReceivedStarterText:
	text "<PLAYER> received"
	line "@"
	text_ram wStringBuffer3
	text "!"
	done

ElmDirectionsText1:
	text "ROUTE 101 and"
	line "SILENT HILLS would"	
	cont "be great places to"
	cont "start looking for"
	cont "#MON."
	
	para "I'm sure you'll do"
	line "great!"

	para "But just in case,"
	line "here's my phone"
	cont "number."
	para "Call me if any"
	line "-thing comes up!"
	done

ElmDirectionsText3:
	text "<PLAY_G>."
	para "<RIVAL>."
	para "I'm counting on"
	line "you both!"
	done

GotElmsNumberText:
	text "<PLAYER> got OAK's"
	line "phone number."
	done

ElmDescribesMrPokemonText:
	text "This is such an"
	line "exciting"
	cont "opportunity!"
	done

ElmPokeBallText:
	text "It contains a"
	line "#MON caught by"
	cont "PROF.OAK."
	done

OaksLabHealingMachineText1:
	text "I wonder what this"
	line "does?"
	done

ElmWaitingEggHatchText:
	text "So, I hear you're"
	line "taking the NIHON"
	para "#MON LEAGUE"
	line "challenge."
	para "That's great!"
	line "I'm sure you've"
	para "got a fighting"
	line "chance to do"
	cont "great things!"
	done


ElmGiveEverstoneText1:
	text "Thanks, <PLAY_G>!"
	line "You're helping"

	para "unravel #MON"
	line "mysteries for us!"

	para "I want you to have"
	line "this as a token of"
	cont "our appreciation."
	done



AideText_AfterTheft:
	text "We appreciate"
	line "your assistance!"
	done

ElmGiveMasterBallText1:
	text "OAK: Hi, <PLAY_G>!"
	line "Thanks to you, my"

	para "research is going"
	line "great!"

	para "Take this as a"
	line "token of my"
	cont "appreciation."
	done

ElmGiveMasterBallText2:
	text "The MASTER BALL is"
	line "the best!"

	para "It's the ultimate"
	line "BALL! It'll catch"

	para "any #MON with-"
	line "out fail."

	para "It's given only to"
	line "recognized #MON"
	cont "researchers."

	para "I think you can"
	line "make much better"

	para "use of it than I"
	line "can, <PLAY_G>!"
	done

ElmGiveTicketText1:
	text "OAK: <PLAY_G>!"
	line "There you are!"

	para "I called because I"
	line "have something for"
	cont "you."

	para "See? It's an"
	line "S.S.TICKET."
	done

ElmGiveTicketText2:
	text "The docks in"
	line "WESTPORT CITY take"
	para "boats down to the"
	line "SOUTHWEST ISLANDS."
	para "There are lots of"
	line "rare #MON there"
	para "that can't be"
	line "found on the"
	cont "mainland."
	para "You should head on"
	line "down there when"
	cont "you get a chance."
	done


AideText_GiveYouPotion:
	text "<PLAY_G>, I want"
	line "you to have"
	para "something that"
	line "might help you"
	cont "out."
	done

AideText_AlwaysBusy:
	text "We appreciate"
	line "your assistance!"
	done

AideText_TheftTestimony:
	text "We appreciate"
	line "your assistance!"
	done



OaksLabTravelTip1Text:
	text "<PLAYER> opened a"
	line "book."

	para "Travel Tip 1:"

	para "Press START to"
	line "open the MENU."
	done

OaksLabTravelTip2Text:
	text "<PLAYER> opened a"
	line "book."

	para "Travel Tip 2:"

	para "Record your trip"
	line "with SAVE!"
	done

OaksLabTravelTip3Text:
	text "<PLAYER> opened a"
	line "book."

	para "Travel Tip 3:"

	para "Open your PACK and"
	line "press SELECT to"
	cont "move items."
	done

OaksLabTravelTip4Text:
	text "<PLAYER> opened a"
	line "book."

	para "Travel Tip 4:"

	para "Check your #MON"
	line "moves. Press the"

	para "A Button to switch"
	line "moves."
	done

OaksLabTrashcanText:
	text "The wrapper from"
	line "the snack PROF.OAK"
	cont "ate is in there…"
	done

ElmGiveEverstoneText2:
	text "That's an"
	line "EVERSTONE."

	para "Some species of"
	line "#MON evolve"

	para "when they grow to"
	line "certain levels."

	para "A #MON holding"
	line "the EVERSTONE"
	cont "won't evolve."

	para "Give it to a #-"
	line "MON you don't want"
	cont "to evolve."
	done

ElmText_CallYou:
	text "OAK: <PLAY_G>, I'll"
	line "call you if any-"
	cont "thing comes up."
	done
	
ElmRocketsReturnedText:
	text "I worry that TEAM"
	line "ROCKET is planning"
	para "something truly"
	line "terrible…"
	done
	
ElmYoureBasicallyAHeroText:
	text "It's incredible you"
	line "and <RIVAL>"
	para "took on TEAM"
	line "ROCKET!"
	para "You both are"
	line "heroes to all"
	cont "#MON!"
	para "Keep up the great"
	line "work, and aim for"
	cont "MT.FUJI!"
	done
	
ElmAfterLeagueInPersonText:
	text "Congratulations on"
	line "defeating the"
	cont "LEAGUE!"
	para "That's a huge"
	line "accomplishment!"
	para "And thanks again"
	line "for helping me"
	cont "with my research."
	para "If this is what"
	line "you've been able"
	para "to do already,"
	line "you've got a great"
	cont "future ahead!"
	done

OaksLab_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  3,  7, OAKS_LAB_ENTRANCE, 3
	warp_event  4,  7, OAKS_LAB_ENTRANCE, 3


	db 2 ; coord events
	coord_event  3,  7, SCENE_ELMSLAB_CANT_LEAVE, LabTryToLeaveScript
	coord_event  4,  7, SCENE_ELMSLAB_CANT_LEAVE, LabTryToLeaveScript

	db 7 ; bg events
	bg_event  0,  1, BGEVENT_READ, OaksLabBookshelf
	bg_event  1,  1, BGEVENT_READ, OaksLabBookshelf
	bg_event  2,  1, BGEVENT_READ, OaksLabBookshelf
	bg_event  3,  1, BGEVENT_READ, OaksLabBookshelf
	bg_event  0,  0, BGEVENT_READ, OaksLabBookshelf
	bg_event  1,  0, BGEVENT_READ, OaksLabBookshelf
	bg_event  9,  3, BGEVENT_READ, OaksLabTrashcan

	db 7 ; object events
	object_event  4,  2, SPRITE_ELM, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ProfElmScript, -1
	object_event  6,  6, SPRITE_SCIENTIST, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ElmsAideScript, EVENT_ELMS_AIDE_IN_LAB
	object_event  5,  2, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, FlambearPokeBallScript, EVENT_FLAMBEAR_POKEBALL_IN_ELMS_LAB
	object_event  6,  2, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CruisePokeBallScript, EVENT_CRUIZE_POKEBALL_IN_ELMS_LAB
	object_event  7,  2, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CHIKORITAPokeBallScript, EVENT_CHIKORITA_POKEBALL_IN_ELMS_LAB
	object_event  2,  3, SPRITE_BLUE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, OaksLabBlueScript, EVENT_BLUE_IN_ELMS_LAB
	object_event  4,  5, SPRITE_SILVER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, OaksLabSilverScript, EVENT_SILVER_IN_ELMS_LAB
