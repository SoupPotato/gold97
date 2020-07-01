	const_def 2 ; object constants
	const ELMENTRANCE_AIDE
	const ELMENTRANCE_SILVER
	const ELMENTRANCE_BLUE
	const ELMENTRANCE_DAISY

ElmEntrance_MapScripts:
	db 5 ; scene scripts
	scene_script .SceneElmDoorLocked ; SCENE_DEFAULT
	scene_script .SceneHeadToTheBack ;
	scene_script .SceneElmEntranceNothing ;does this work?
	scene_script .SceneElmEntranceBattle ;seems to!
	scene_script .SceneElmEntranceDaisy

	db 0 ; callbacks
	
.SceneElmDoorLocked:
	end
	
.SceneHeadToTheBack:
	turnobject PLAYER, UP
	opentext
	writetext Text_InBack
	waitbutton
	closetext
	applymovement PLAYER, CatchUp_Movement
	follow ELMENTRANCE_BLUE, PLAYER
	applymovement ELMENTRANCE_BLUE, Movement_BlueToBack
	stopfollow
	applymovement ELMENTRANCE_BLUE, Movement_BlueThroughDoor
	playsound SFX_ENTER_DOOR
	disappear ELMENTRANCE_BLUE
	applymovement PLAYER, Movement_PlayerThroughDoor
	playsound SFX_ENTER_DOOR
	special FadeOutPalettes
	warpfacing UP, ELMS_LAB, 3, 7
	end

.SceneElmEntranceNothing:
	end

.SceneElmEntranceBattle:
	end
	
.SceneElmEntranceDaisy:
	end

BattleScript:
	applymovement PLAYER, Movement_DownOne
	playsound SFX_EXIT_BUILDING
	moveobject ELMENTRANCE_SILVER, 4, 0
	appear ELMENTRANCE_SILVER
	applymovement ELMENTRANCE_SILVER, Movement_SilverDownOne
	special FadeOutMusic
	playmusic MUSIC_RIVAL_ENCOUNTER
	opentext
	writetext TimeToBattle
	waitbutton
	closetext
	checkevent EVENT_GOT_CRUISE_FROM_ELM
	iftrue .Cruise
	checkevent EVENT_GOT_CHIKORITA_FROM_ELM
	iftrue .CHIKORITA
	winlosstext SilverEntranceWinText, SilverEntranceLossText
	loadtrainer RIVAL1, RIVAL1_1_CRUISE
	writecode VAR_BATTLETYPE, BATTLETYPE_CANLOSE
	startbattle
	dontrestartmapmusic
	reloadmap
	iftrue .AfterVictorious
	jump .AfterYourDefeat

.Cruise:
	winlosstext SilverEntranceWinText, SilverEntranceLossText
	loadtrainer RIVAL1, RIVAL1_1_CHIKORITA
	writecode VAR_BATTLETYPE, BATTLETYPE_CANLOSE
	startbattle
	dontrestartmapmusic
	reloadmap
	iftrue .AfterVictorious
	jump .AfterYourDefeat

.CHIKORITA:
	winlosstext SilverEntranceWinText, SilverEntranceLossText
	loadtrainer RIVAL1, RIVAL1_1_FLAMBEAR
	writecode VAR_BATTLETYPE, BATTLETYPE_CANLOSE
	startbattle
	dontrestartmapmusic
	reloadmap
	iftrue .AfterVictorious
	jump .AfterYourDefeat

.AfterVictorious:
	playmusic MUSIC_RIVAL_AFTER
	opentext
	writetext EntranceRivalText_YouWon
	waitbutton
	closetext
	jump .FinishRival

.AfterYourDefeat:
	playmusic MUSIC_RIVAL_AFTER
	opentext
	writetext EntranceRivalText_YouLost
	waitbutton
	closetext
.FinishRival:
	applymovement ELMENTRANCE_SILVER, SilverLeavesLab
	disappear ELMENTRANCE_SILVER
	setscene SCENE_ELM_ENTRANCE_DAISY
	special HealParty
	playmapmusic
	end


DoorLockedScript:
	opentext
	writetext DoorLockedText
	waitbutton
	closetext
	applymovement PLAYER, DoorLocked_Movement
	end
	
DaisyStopsScript1:
	applymovement ELMENTRANCE_DAISY, DaisyWalksUp1
	jump .DaisySpeech

.DaisySpeech:
	opentext
	writetext DaisySpeechText
	buttonsound
	stringtotext .mapcardname, MEM_BUFFER_1
	scall .JumpstdReceiveItem
	setflag ENGINE_MAP_CARD
	writetext DaisySpeechText2
	buttonsound
	itemtotext POKE_BALL, MEM_BUFFER_1
	scall DaisyScript_ReceiveTheBalls
	giveitem POKE_BALL, 5
	itemnotify
	writetext DaisySpeechText3
	waitbutton
	closetext
	applymovement ELMENTRANCE_DAISY, DaisyLeftMovement
	setscene SCENE_ELM_ENTRANCE_NOTHING
	setmapscene ROUTE_29, SCENE_ROUTE29_CATCH_TUTORIAL
	end
	
.JumpstdReceiveItem:
	jumpstd receiveitem
	end

.mapcardname
	db "MAP CARD@"
	

DaisyStopsScript2:
	applymovement ELMENTRANCE_DAISY, DaisyWalksUp2
	jump .DaisySpeech
	
.DaisySpeech:
	opentext
	writetext DaisySpeechText
	buttonsound
	stringtotext .mapcardname, MEM_BUFFER_1
	scall .JumpstdReceiveItem
	setflag ENGINE_MAP_CARD
	writetext DaisySpeechText2
	buttonsound
	itemtotext POKE_BALL, MEM_BUFFER_1
	scall DaisyScript_ReceiveTheBalls
	giveitem POKE_BALL, 5
	itemnotify
	writetext DaisySpeechText3
	waitbutton
	closetext
	applymovement ELMENTRANCE_DAISY, DaisyLeftMovement
	setscene SCENE_ELM_ENTRANCE_NOTHING
	setmapscene ROUTE_29, SCENE_ROUTE29_CATCH_TUTORIAL
	end
	
.JumpstdReceiveItem:
	jumpstd receiveitem
	end

.mapcardname
	db "MAP CARD@"
	
DaisyScript_ReceiveTheBalls:
	jumpstd receiveitem
	end
	

	
ElmEntranceBlueScript:
	jumptextfaceplayer Text_InBack
	
ElmEntranceDaisyScript:
	jumptextfaceplayer Text_RootingText

ElmEntranceSilverScript:
	jumptextfaceplayer ElmEntranceSilverText

ElmEntranceAideScript:
	jumptextfaceplayer ElmEntranceAideText
	
ElmEntranceComputerScript:
	jumptext ElmEntranceComputerText
	
ElmEntranceBookshelf:
	jumpstd difficultbookshelf
	
ElmEntranceSign:
	jumptext ElmEntranceSignText
	
ElmEntranceSignText:
	text "Remember to SAVE"
	line "your progress!"
	done	
	
ElmEntranceComputerText:
	text "It's a paper on"
	line "#MON habitats."
	done
	
Text_RootingText:
	text "I'll be rooting"
	line "for you!"
	done
	
DaisySpeechText:
	text "The boy who"
	line "brought you"
	cont "here…"
	para "That's my little"
	line "brother."
	para "In other words…"
	para "I'm PROF.OAK's"
	line "granddaughter!"
	para "Grandpa's a"
	line "fantastic"
	cont "researcher!"
	para "I'm so happy I can"
	line "help him out."
	para "But he'd get full"
	line "of himself if he"
	para "heard that, so"
	line "don't tell him!"
	para "…But he can be a"
	line "little forgetful."
	para "He was also"
	line "supposed to give"
	cont "you this!"
	done

DaisySpeechText2:
	text "The MAP CARD"
	line "lets you view"
	para "a map right in"
	line "your #GEAR!"
	para "It's incredibly"
	line "helpful if you"
	para "want to see"
	line "where you're"
	cont "going."
	para "I'll also throw"
	line "in a few"
	para "#BALLs to"
	line "help out."
	done

DaisySpeechText3:
	text "But like Grandpa"
	line "said, if you need"
	para "more #BALLs,"
	line "you can find them"
	para "at just about any"
	line "MART."
	para "Also, we can't"
	line "have your mother"
	para "worrying, so make"
	line "sure to say"
	para "goodbye before"
	line "you leave town."
	para "I'll be rooting"
	line "for you!"
	done

SilverEntranceWinText:
	text "Wow! I thought my"
	line "#MON would have"
	para "been the best!"
	done

EntranceRivalText_YouLost:
	text "<PLAY_G>! I'm"
	line "so ready to show"
	para "the world how"
	line "great my #MON"
	cont "is!"
	para "I'll see you"
	line "around soon!"
	done

SilverEntranceLossText:
	text "Alright! My"
	line "#MON rules!"
	done

EntranceRivalText_YouWon:
	text "<PLAY_G>! I'm"
	line "so ready to show"
	para "the world how"
	line "great my #MON"
	cont "is!"
	para "I'll see you"
	line "around soon!"
	done
	
TimeToBattle:
	text "<PLAY_G>!"
	para "You're not getting"
	line "off that easy!"
	para "OAK gave us these"
	line "#MON, so now"
	para "we gotta battle"
	line "them!"
	para "I'm not gonna hold"
	line "back!"
	done
	
Text_InBack:
	text "PROF.OAK just got"
	line "back in. He's"
	para "waiting for you"
	line "right through the"
	para "door in the back."
	done

ElmEntranceAideText:
	text "If you're looking"
	line "for PROF.OAK, he's"
	para "usually in his"
	line "back office."
	done
	
DoorLockedText:
	text "The door seems to"
	line "be locked…"
	done
	
ElmEntranceSilverText:
	text "Yo <PLAY_G>!"
	
	para "Looks like PROF."
	line "OAK isn't here!"
	
	para "I wonder when"
	line "he would have"
	
	para "expected us to"
	line "show up!"
	
	done
	
DaisyLeftMovement:
	step LEFT
	step LEFT
	turn_head DOWN
	step_end
	
DaisyWalksUp1:
	step RIGHT
	step RIGHT
	step UP
	step_end
	
DaisyWalksUp2:
	step RIGHT
	step RIGHT
	step RIGHT
	step UP
	step_end
	
SilverLeavesLab:
	step LEFT
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end
	
Movement_SilverDownOne:
	step DOWN
	step_end
	
Movement_DownOne:
	step DOWN
	turn_head UP
	step_end	
	
CatchUp_Movement:
	step UP
	step_end

DoorLocked_Movement:
	turn_head DOWN
	step DOWN
	step_end

Movement_BlueToBack:
	step UP
	step UP
	step UP
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
	
Movement_BlueThroughDoor:
	step UP
	step_end
	
Movement_PlayerThroughDoor:
	step UP
	step UP
	step_end

ElmEntrance_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  3, 15, SILENT_TOWN, 1
	warp_event  4, 15, SILENT_TOWN, 5
	warp_event  4,  0, ELMS_LAB, 1


	db 4 ; coord events
	coord_event  4,  1, SCENE_DEFAULT, DoorLockedScript
	coord_event  4,  1, SCENE_ELM_ENTRANCE_BATTLE, BattleScript
	coord_event  3, 11, SCENE_ELM_ENTRANCE_DAISY, DaisyStopsScript1
	coord_event  4, 11, SCENE_ELM_ENTRANCE_DAISY, DaisyStopsScript2

	db 14 ; bg events
	bg_event  6,  1, BGEVENT_READ, ElmEntranceComputerScript
	bg_event  0,  7, BGEVENT_READ, ElmEntranceBookshelf
	bg_event  1,  7, BGEVENT_READ, ElmEntranceBookshelf
	bg_event  2,  7, BGEVENT_READ, ElmEntranceBookshelf
	bg_event  5,  7, BGEVENT_READ, ElmEntranceBookshelf
	bg_event  6,  7, BGEVENT_READ, ElmEntranceBookshelf
	bg_event  7,  7, BGEVENT_READ, ElmEntranceBookshelf
	bg_event  0, 11, BGEVENT_READ, ElmEntranceBookshelf
	bg_event  1, 11, BGEVENT_READ, ElmEntranceBookshelf
	bg_event  2, 11, BGEVENT_READ, ElmEntranceBookshelf
	bg_event  5, 11, BGEVENT_READ, ElmEntranceBookshelf
	bg_event  6, 11, BGEVENT_READ, ElmEntranceBookshelf
	bg_event  7, 11, BGEVENT_READ, ElmEntranceBookshelf
	bg_event  2,  0, BGEVENT_READ, ElmEntranceSign


	db 4 ; object events
	object_event  6, 13, SPRITE_SCIENTIST, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ElmEntranceAideScript, -1
	object_event  3,  4, SPRITE_SILVER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ElmEntranceSilverScript, EVENT_RIVAL_ELM_ENTRANCE
	object_event  4, 13, SPRITE_BLUE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ElmEntranceBlueScript, EVENT_BLUE_ELM_ENTRANCE
	object_event  1, 13, SPRITE_DAISY, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ElmEntranceDaisyScript, EVENT_DAISY_ELM_ENTRANCE

	
