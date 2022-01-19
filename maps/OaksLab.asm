	const_def 2 ; object constants
	const OAKSLAB_OAK
	const OAKSLAB_OAKS_AIDE
	const OAKSLAB_POKE_BALL1
	const OAKSLAB_POKE_BALL2
	const OAKSLAB_POKE_BALL3
	const OAKSLAB_BLUE
	const OAKSLAB_SILVER

OaksLab_MapScripts:
	db 6 ; scene scripts
	scene_script .MeetOak ; SCENE_DEFAULT
	scene_script .DummyScene1 ; SCENE_OAKSLAB_CANT_LEAVE
	scene_script .DummyScene2 ; SCENE_OAKSLAB_NOTHING
	scene_script .DummyScene3 ; SCENE_OAKSLAB_MEET_OFFICER
	scene_script .DummyScene4 ; SCENE_OAKSLAB_UNUSED
	scene_script .DummyScene5 ; SCENE_OAKSLAB_AIDE_GIVES_POTION

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .MoveOakCallback

.MeetOak:
	priorityjump .WalkUpToOak
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

.MoveOakCallback:
	checkscene
	iftrue .Skip ; not SCENE_DEFAULT
	moveobject OAKSLAB_OAK, 4, 2
.Skip:
	return
	

.WalkUpToOak:
	applymovement PLAYER, OaksLab_WalkUpToOakMovement
	showemote EMOTE_SHOCK, OAKSLAB_OAK, 15
	opentext
	writetext OakText_Intro
	waitbutton
	closetext
	showemote EMOTE_SHOCK, OAKSLAB_SILVER, 15
	opentext
	writetext Text_OakIsOld
	waitbutton
	closetext
	pause 15
	opentext
	writetext Text_OakSpeech
	waitbutton
	closetext
	showemote EMOTE_SHOCK, OAKSLAB_SILVER, 15
	opentext
	writetext Text_Interesting
	waitbutton
	closetext
	showemote EMOTE_SHOCK, OAKSLAB_BLUE, 15
	opentext
	writetext BlueText_Pokedex
	waitbutton
	closetext
	applymovement OAKSLAB_BLUE, BlueGivesDex1
	pause 10
	applymovement OAKSLAB_BLUE, BlueGivesDex2
	pause 5
	opentext
	writetext Lab_GetDexText
	playsound SFX_ITEM
	waitsfx
	setflag ENGINE_POKEDEX
	pause 15
	waitbutton
	closetext
	applymovement OAKSLAB_BLUE, BlueGivesDex3
	opentext
	writetext Text_OakDream
	waitbutton
	closetext
	applymovement OAKSLAB_SILVER, MoveHeadLeft
	opentext
	writetext Text_RivalGenerous
	waitbutton
	closetext
	applymovement OAKSLAB_SILVER, MoveHeadUp
	setscene SCENE_OAKSLAB_CANT_LEAVE
	end

OaksLabSilverScript:
	jumptextfaceplayer Text_Best
	
OaksLabBlueScript:
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .BlueAfterEliteFour
	faceplayer
	opentext
	writetext BlueText_Accepted
	waitbutton
	closetext
	end
	
.BlueAfterEliteFour
	faceplayer
	opentext
	writetext BlueText_Accepted2
	waitbutton
	closetext
	end

ProfOakScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_SS_TICKET_FROM_OAK
	iftrue OakCheckMasterBall
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue OakGiveTicketScript
OakCheckMasterBall:
	checkevent EVENT_GOT_MASTER_BALL_FROM_OAK
	iftrue OakCheckEverstone
	checkflag ENGINE_RISINGBADGE
	iftrue OakGiveMasterBallScript
OakCheckEverstone:
	checkevent EVENT_TOLD_ELM_ABOUT_TOGEPI_OVER_THE_PHONE
	iffalse OakCheckTogepiEgg
	waitbutton
	closetext
	end

OakCheckTogepiEgg:
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue OakAfterLeagueInPerson
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue OakAfterRadioTowerInPerson
	checkevent EVENT_RIVAL_BURNED_TOWER
	iftrue OakRocketsReturnedScript
	checkevent EVENT_GOT_ODD_EGG_FROM_OAKS_AIDE
	iftrue OakHearAboutLeagueHatchScript
	checkevent EVENT_GOT_A_POKEMON_FROM_OAK
	iftrue OakOpportunityScript
	writetext OakText_LetYourMonBattleIt
	waitbutton
	closetext
	end

LabTryToLeaveScript:
	turnobject OAKSLAB_OAK, DOWN
	opentext
	writetext LabWhereGoingText
	waitbutton
	closetext
	applymovement PLAYER, OaksLab_CantLeaveMovement
	end
	
OakHearAboutLeagueHatchScript:
	writetext OakHearAboutLeagueHatchText
	waitbutton
	closetext
	end
	
OakRocketsReturnedScript:
	writetext OakRocketsReturnedText
	waitbutton
	closetext
	end
	
OakAfterRadioTowerInPerson:
	writetext OakYoureBasicallyAHeroText
	waitbutton
	closetext
	end
	
OakAfterLeagueInPerson:
	writetext OakAfterLeagueInPersonText
	waitbutton
	closetext
	end

FlambearPokeBallScript:
	checkevent EVENT_GOT_A_POKEMON_FROM_OAK
	iftrue LookAtOakPokeBallScript
	turnobject OAKSLAB_OAK, DOWN
	refreshscreen
	pokepic FLAMBEAR
	cry FLAMBEAR
	waitbutton
	closepokepic
	opentext
	writetext TakeFlambearText
	yesorno
	iffalse DidntChooseStarterScript
	disappear OAKSLAB_POKE_BALL1
	setevent EVENT_GOT_FLAMBEAR_FROM_OAK
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
	applymovement OAKSLAB_SILVER, SilverGetCruiseMovement
	opentext
	writetext Text_SilverTakeThisOne
	waitbutton
	closetext
	disappear OAKSLAB_POKE_BALL2
	opentext
	writetext Text_SilverGetCruise
	playsound SFX_CAUGHT_MON
	waitsfx
	buttonsound
	closetext
	setevent EVENT_CRUIZE_POKEBALL_IN_OAKS_LAB
	setevent EVENT_PLAYERS_HOUSE_1F_NEIGHBOR
	clearevent EVENT_PLAYERS_NEIGHBORS_HOUSE_NEIGHBOR
	jump OakDirectionsScript

CruisePokeBallScript:
	checkevent EVENT_GOT_A_POKEMON_FROM_OAK
	iftrue LookAtOakPokeBallScript
	turnobject OAKSLAB_OAK, DOWN
	refreshscreen
	pokepic CRUIZE
	cry CRUIZE
	waitbutton
	closepokepic
	opentext
	writetext TakeCruiseText
	yesorno
	iffalse DidntChooseStarterScript
	disappear OAKSLAB_POKE_BALL2
	setevent EVENT_GOT_CRUIZE_FROM_OAK
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
	applymovement OAKSLAB_SILVER, SilverGetCHIKORITAMovement
	opentext
	writetext Text_SilverTakeThisOne
	waitbutton
	closetext
	disappear OAKSLAB_POKE_BALL3
	opentext
	writetext Text_SilverGetCHIKORITA
	playsound SFX_CAUGHT_MON
	waitsfx
	buttonsound
	closetext
	setevent EVENT_CHIKORITA_POKEBALL_IN_OAKS_LAB
	setevent EVENT_PLAYERS_HOUSE_1F_NEIGHBOR
	clearevent EVENT_PLAYERS_NEIGHBORS_HOUSE_NEIGHBOR
	jump OakDirectionsScript

CHIKORITAPokeBallScript:
	checkevent EVENT_GOT_A_POKEMON_FROM_OAK
	iftrue LookAtOakPokeBallScript
	turnobject OAKSLAB_OAK, DOWN
	refreshscreen
	pokepic CHIKORITA
	cry CHIKORITA
	waitbutton
	closepokepic
	opentext
	writetext TakeCHIKORITAText
	yesorno
	iffalse DidntChooseStarterScript
	disappear OAKSLAB_POKE_BALL3
	setevent EVENT_GOT_CHIKORITA_FROM_OAK
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
	applymovement OAKSLAB_SILVER, SilverGetFlambearMovement
	opentext
	writetext Text_SilverTakeThisOne
	waitbutton
	closetext
	disappear OAKSLAB_POKE_BALL1
	opentext
	writetext Text_SilverGetFlambear
	playsound SFX_CAUGHT_MON
	waitsfx
	buttonsound
	closetext
	setevent EVENT_FLAMBEAR_POKEBALL_IN_OAKS_LAB
	setevent EVENT_PLAYERS_HOUSE_1F_NEIGHBOR
	clearevent EVENT_PLAYERS_NEIGHBORS_HOUSE_NEIGHBOR
	jump OakDirectionsScript

DidntChooseStarterScript:
	writetext DidntChooseStarterText
	waitbutton
	closetext
	end

OakDirectionsScript:
	applymovement OAKSLAB_OAK, OakToTable
	turnobject PLAYER, UP
	opentext
	writetext OakDirectionsText1
	waitbutton
	closetext
	addcellnum PHONE_ELM
	opentext
	writetext GotOaksNumberText
	playsound SFX_REGISTER_PHONE_NUMBER
	waitsfx
	waitbutton
	closetext
	opentext
	writetext OakDirectionsText3
	waitbutton
	closetext
	applymovement OAKSLAB_OAK, OakBackFromTable
	setevent EVENT_GOT_A_POKEMON_FROM_OAK
	setevent EVENT_RIVAL_CHERRYGROVE_CITY
	setscene SCENE_OAKSLAB_AIDE_GIVES_POTION
	setmapscene SILENT_TOWN, SCENE_NEW_BARK_NOTHING
	setmapscene OAKS_LAB_ENTRANCE, SCENE_OAK_ENTRANCE_BATTLE
	setevent EVENT_SILVER_IN_OAKS_LAB
	clearevent EVENT_DAISY_OAKS_LAB_ENTRANCE
	setevent EVENT_BIRDON_AIDE_HIDDEN
	end

OakOpportunityScript:
	writetext OakOpportunityText
	waitbutton
	closetext
	end

LookAtOakPokeBallScript:
	opentext
	writetext OakPokeBallText
	waitbutton
	closetext
	end

OakGiveMasterBallScript:
	writetext OakGiveMasterBallText1
	buttonsound
	verbosegiveitem MASTER_BALL
	iffalse .notdone
	setevent EVENT_GOT_MASTER_BALL_FROM_OAK
	writetext OakGiveMasterBallText2
	waitbutton
.notdone
	closetext
	end

OakGiveTicketScript:
	writetext OakGiveTicketText
	buttonsound
	verbosegiveitem S_S_TICKET
	setevent EVENT_GOT_SS_TICKET_FROM_OAK
	writetext OakGiveTicketText
	waitbutton
	closetext
	end

OaksAideScript:
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
	
OakBackFromTable:
	step LEFT
	step LEFT
	step DOWN
	step_end

MoveHeadLeft:
	turn_head LEFT
	step_end
	
MoveHeadUp:
	turn_head UP
	step_end
	
OakToTable:
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

OaksLab_WalkUpToOakMovement:
	step UP
	step UP
	step_end

OaksLab_CantLeaveMovement:
	step UP
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
	
BlueText_Accepted2:
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
	
OakText_Intro:
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
	cont "important task…"

	para "Since I was a "
	line "young boy, I have"
	cont "dreamed of having"
	cont "a complete guide"
	cont "on every species"
	cont "of #MON."
	
	para "However…"
	para "More and more are"
	line "being discovered"
	cont "every day!"
	
	para "But my age is"
	line "catching on me…"
	
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
	
	para "I tried to com-"
	line "plete the #DEX"
	cont "once…"
	
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
	line "#BALLS on the"
	cont "table."
	
	para "Both of you can"
	line "choose one to be"
	cont "your companion!"	
	done
	
Text_RivalGenerous:
	text "<RIVAL>: You"
	line "can choose first"
	cont "<PLAY_G>…"
	
	para "I want some time"
	line "to decide."
	done

BlueText_Accepted:
	text "Thanks, <PLAY_G>!"

	para "I appreciate you"
	line "helping out"
	cont "gramps."
	done

OakText_ChooseAPokemon:
	text "I want you to"
	line "raise one of the"

	para "#MON contained"
	line "in these BALLS."

	para "You'll be that"
	line "#MON's first"
	cont "partner, <PLAY_G>!"

	para "Go on. Pick one!"
	done

OakText_LetYourMonBattleIt:
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

OakDirectionsText1:
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
	para "Call me if any-"
	line "thing comes up!"
	done

OakDirectionsText3:
	text "<PLAY_G>."
	para "<RIVAL>."
	para "I'm counting on"
	line "you both!"
	done

GotOaksNumberText:
	text "<PLAYER> got OAK's"
	line "phone number."
	done

OakOpportunityText:
	text "This is such an"
	line "exciting"
	cont "opportunity!"
	done

OakPokeBallText:
	text "It contains a"
	line "#MON caught by"
	cont "PROF.OAK."
	done

OakHearAboutLeagueHatchText:
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


OakGiveMasterBallText1:
	text "OAK: Hi, <PLAY_G>!"
	line "Thanks to you, my"

	para "research is going"
	line "great!"

	para "Take this as a"
	line "token of my"
	cont "appreciation."
	done

OakGiveMasterBallText2:
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

OakGiveTicketText:
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

AideText_AlwaysBusy:
	text "We appreciate"
	line "your assistance!"
	done

OaksLabTrashcanText:
	text "The wrapper from"
	line "the snack PROF.OAK"
	cont "ate is in there…"
	done

OakRocketsReturnedText:
	text "I worry that TEAM"
	line "ROCKET is planning"
	para "something truly"
	line "terrible…"
	done
	
OakYoureBasicallyAHeroText:
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
	
OakAfterLeagueInPersonText:
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
	coord_event  3,  7, SCENE_OAKSLAB_CANT_LEAVE, LabTryToLeaveScript
	coord_event  4,  7, SCENE_OAKSLAB_CANT_LEAVE, LabTryToLeaveScript

	db 7 ; bg events
	bg_event  0,  1, BGEVENT_READ, OaksLabBookshelf
	bg_event  1,  1, BGEVENT_READ, OaksLabBookshelf
	bg_event  2,  1, BGEVENT_READ, OaksLabBookshelf
	bg_event  3,  1, BGEVENT_READ, OaksLabBookshelf
	bg_event  0,  0, BGEVENT_READ, OaksLabBookshelf
	bg_event  1,  0, BGEVENT_READ, OaksLabBookshelf
	bg_event  9,  3, BGEVENT_READ, OaksLabTrashcan

	db 7 ; object events
	object_event  4,  2, SPRITE_OAK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ProfOakScript, -1
	object_event  6,  6, SPRITE_SCIENTIST, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, OaksAideScript, EVENT_OAKS_AIDE_IN_LAB
	object_event  5,  2, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, FlambearPokeBallScript, EVENT_FLAMBEAR_POKEBALL_IN_OAKS_LAB
	object_event  6,  2, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CruisePokeBallScript, EVENT_CRUIZE_POKEBALL_IN_OAKS_LAB
	object_event  7,  2, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CHIKORITAPokeBallScript, EVENT_CHIKORITA_POKEBALL_IN_OAKS_LAB
	object_event  2,  3, SPRITE_BLUE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, OaksLabBlueScript, EVENT_BLUE_IN_OAKS_LAB
	object_event  4,  5, SPRITE_SILVER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, OaksLabSilverScript, EVENT_SILVER_IN_OAKS_LAB
