	const_def 2 ; object constants
	const ELMENTRANCE_AIDE
	const ELMENTRANCE_SILVER
	const ELMENTRANCE_BLUE
	const ELMENTRANCE_DAISY

OaksLabEntrance_MapScripts:
	db 5 ; scene scripts
	scene_script .SceneElmDoorLocked ; SCENE_DEFAULT
	scene_script .SceneHeadToTheBack ;
	scene_script .SceneOaksLabEntranceNothing ;does this work?
	scene_script .SceneOaksLabEntranceBattle ;seems to!
	scene_script .SceneOaksLabEntranceDaisy

	db 0 ; callbacks
	
.SceneElmDoorLocked:
	end
	
.SceneHeadToTheBack:
	follow ELMENTRANCE_BLUE, PLAYER
	applymovement ELMENTRANCE_BLUE, Movement_BlueToBack
	stopfollow
	playsound SFX_ENTER_DOOR
	disappear ELMENTRANCE_BLUE
	applymovement PLAYER, Movement_PlayerThroughDoor
	playsound SFX_ENTER_DOOR
	special FadeOutPalettes
	warpfacing UP, OAKS_LAB, 3, 7
	end

.SceneOaksLabEntranceNothing:
	end

.SceneOaksLabEntranceBattle:
	end
	
.SceneOaksLabEntranceDaisy:
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
	checkevent EVENT_GOT_CRUIZE_FROM_ELM
	iftrue .Cruise
	checkevent EVENT_GOT_CHIKORITA_FROM_ELM
	iftrue .CHIKORITA
	winlosstext SilverEntranceWinText, SilverEntranceLossText
	loadtrainer RIVAL1, RIVAL1_1_CRUIZE
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
	opentext
	writetext DaisySpeechText
	buttonsound
	stringtotext .mapcardname, MEM_BUFFER_1
	scall .JumpstdReceiveItem
	setflag ENGINE_MAP_CARD
	writetext DaisySpeechText2
	buttonsound
	verbosegiveitem POTION
	verbosegiveitem POKE_BALL, 5
	writetext DaisySpeechText3
	waitbutton
	closetext
	applymovement ELMENTRANCE_DAISY, DaisyLeftMovement
	setscene SCENE_ELM_ENTRANCE_NOTHING
	setmapscene ROUTE_101, SCENE_ROUTE29_CATCH_TUTORIAL
	end
	
.JumpstdReceiveItem:
	jumpstd receiveitem
	end

.mapcardname
	db "MAP CARD@"
	
DaisyStopsScript2:
	applymovement ELMENTRANCE_DAISY, DaisyWalksUp2
	opentext
	writetext DaisySpeechText
	buttonsound
	stringtotext .mapcardname, MEM_BUFFER_1
	scall .JumpstdReceiveItem
	setflag ENGINE_MAP_CARD
	writetext DaisySpeechText2
	buttonsound
	verbosegiveitem POTION
	verbosegiveitem POKE_BALL, 5
	writetext DaisySpeechText3
	waitbutton
	closetext
	applymovement ELMENTRANCE_DAISY, DaisyLeftMovement
	setscene SCENE_ELM_ENTRANCE_NOTHING
	setmapscene ROUTE_101, SCENE_ROUTE29_CATCH_TUTORIAL
	end
	
.JumpstdReceiveItem:
	jumpstd receiveitem
	end

.mapcardname
	db "MAP CARD@"
	
OaksLabEntranceDaisyScript:
	jumptextfaceplayer Text_RootingText

OaksLabEntranceSilverScript:
	jumptextfaceplayer OaksLabEntranceSilverText

OaksLabEntranceAideScript:
	jumptextfaceplayer OaksLabEntranceAideText
	
OaksLabEntranceComputerScript:
	jumptext OaksLabEntranceComputerText
	
OaksLabEntranceBookshelf:
	jumpstd difficultbookshelf
	
OaksLabEntranceSign:
	jumptext OaksLabEntranceSignText
	
OaksLabEntranceSignText:
	text "Remember to SAVE"
	line "your progress!"
	done	
	
OaksLabEntranceComputerText:
	text "It's a paper on"
	line "#MON habitats."
	done
	
Text_RootingText:
	text "I'll be rooting"
	line "for you!"
	done
	
DaisySpeechText:
	text "Oh, are you leav"
	line "-ing on a journey?"
	
	para "BLUE is my little"
	line "brother."
	
	para "If Grandpa gave"
	line "you a task,"
	
	para "I would like to"
	line "help you."

	para "He was also"
	line "supposed to give"
	cont "you this!"
	done

DaisySpeechText2:
	text "The MAP CARD"
	line "lets you view"
	cont "a map right in"
	cont "your #GEAR!"
	
	para "Now..."
	line "How can I help?"
	
	para "..."
	
	para "Oh I know!"	
	done

DaisySpeechText3:
	text "A POTION can heal"
	line "your #MON if"
	cont "they are hurt,"
	
	para "and #BALLS"
	line "allow you to catch"
	cont "wild #MON."
	
	para "If you run out of"
	line "#BALLS you can"
	cont "buy more at any"
	cont "town MART."
	
	para "Good luck,"
	line "<PLAY_G>!"
	
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

OaksLabEntranceAideText:
	text "If you're looking"
	line "for PROF.OAK, he's"
	para "usually in his"
	line "back office."
	done
	
DoorLockedText:
	text "The door seems to"
	line "be locked…"
	done
	
OaksLabEntranceSilverText:
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
	step UP
	step UP
	step_end

Movement_PlayerThroughDoor:
	step UP
	step_end

OaksLabEntrance_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  3, 15, SILENT_TOWN, 1
	warp_event  4, 15, SILENT_TOWN, 5
	warp_event  4,  0, OAKS_LAB, 1


	db 4 ; coord events
	coord_event  4,  1, SCENE_DEFAULT, DoorLockedScript
	coord_event  4,  1, SCENE_ELM_ENTRANCE_BATTLE, BattleScript
	coord_event  3, 11, SCENE_ELM_ENTRANCE_DAISY, DaisyStopsScript1
	coord_event  4, 11, SCENE_ELM_ENTRANCE_DAISY, DaisyStopsScript2

	db 14 ; bg events
	bg_event  6,  1, BGEVENT_READ, OaksLabEntranceComputerScript
	bg_event  0,  7, BGEVENT_READ, OaksLabEntranceBookshelf
	bg_event  1,  7, BGEVENT_READ, OaksLabEntranceBookshelf
	bg_event  2,  7, BGEVENT_READ, OaksLabEntranceBookshelf
	bg_event  5,  7, BGEVENT_READ, OaksLabEntranceBookshelf
	bg_event  6,  7, BGEVENT_READ, OaksLabEntranceBookshelf
	bg_event  7,  7, BGEVENT_READ, OaksLabEntranceBookshelf
	bg_event  0, 11, BGEVENT_READ, OaksLabEntranceBookshelf
	bg_event  1, 11, BGEVENT_READ, OaksLabEntranceBookshelf
	bg_event  2, 11, BGEVENT_READ, OaksLabEntranceBookshelf
	bg_event  5, 11, BGEVENT_READ, OaksLabEntranceBookshelf
	bg_event  6, 11, BGEVENT_READ, OaksLabEntranceBookshelf
	bg_event  7, 11, BGEVENT_READ, OaksLabEntranceBookshelf
	bg_event  2,  0, BGEVENT_READ, OaksLabEntranceSign


	db 4 ; object events
	object_event  6, 13, SPRITE_SCIENTIST, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, OaksLabEntranceAideScript, -1
	object_event  3,  4, SPRITE_SILVER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OaksLabEntranceSilverScript, EVENT_RIVAL_ELM_ENTRANCE
	object_event  4, 14, SPRITE_BLUE, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_BLUE_ELM_ENTRANCE
	object_event  1, 13, SPRITE_DAISY, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, OaksLabEntranceDaisyScript, EVENT_DAISY_ELM_ENTRANCE

	
