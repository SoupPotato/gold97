	const_def 2 ; object constants
	const SHIP_ROCKET_1
	const SHIP_ROCKET_2
	const SHIP_ENTRANCE_1
	const SHIP_ROCKET_3
	const SHIP_CAPTAIN_R
	const SHIP_ROCKET_4
	const SHIP_ROCKET_5
	const SHIP_BURGLAR
	const SHIP_ITEMBALL
	const SHIP_IMPOSTER
	const SHIP_ITEMBALL_2

RocketShipBase_MapScripts:
	db 2 ; scene scripts
	scene_script .SceneRocketShipBaseGreetings ; SCENE_DEFAULT
	scene_script .SceneRocketShipBaseImposter ;

	db 1 ; callbacks	
	callback MAPCALLBACK_TILES, .CheckBasementKey


.CheckBasementKey:
	checkevent EVENT_USED_BASEMENT_KEY
	iffalse .LockBasementDoor
	return

.LockBasementDoor:
	changeblock 28,28, $28 ; locked door
	return

.SceneRocketShipBaseGreetings
	end

.SceneRocketShipBaseImposter
	end

RocketGreetingsScript:
	moveobject SHIP_ENTRANCE_1, 3, 7
	appear SHIP_ENTRANCE_1
	applymovement SHIP_ENTRANCE_1, Movement_StepUpToMeShip
	showemote EMOTE_SHOCK, SHIP_ENTRANCE_1, 25
	applymovement SHIP_ENTRANCE_1, Movement_StepUpToMeShip2
	opentext
	writetext NotGonnaStandByText
	waitbutton
	closetext
	winlosstext RocketEntranceShip_WinText, RocketEntranceShip_LossText
	loadtrainer GRUNTF, GRUNTF_2
	startbattle
	reloadmapafterbattle
	jump .returnfrombattleshipentrance
	
.returnfrombattleshipentrance
	opentext
	writetext RocketEntranceShip_AfterText
	waitbutton
	closetext
	applymovement SHIP_ENTRANCE_1, Movement_StepDownFromMeShip
	disappear SHIP_ENTRANCE_1
	setscene SCENE_VIRIDIAN_GYM_IMPOSTER
	end
	
ImposterAndCaptainScript:
	showemote EMOTE_SHOCK, SHIP_IMPOSTER, 15
	turnobject SHIP_IMPOSTER, DOWN
	opentext
	writetext ImposterGreetingText
	waitbutton
	closetext
	applymovement SHIP_IMPOSTER, ImposterWalksToMe
	opentext
	writetext ImposterGreetingText2
	waitbutton
	closetext
	turnobject SHIP_IMPOSTER, UP
	pause 15
	opentext
	writetext ImposterTellsCaptainText
	waitbutton
	closetext
	pause 15
	applymovement SHIP_IMPOSTER, ImposterWalksToCaptain
	opentext
	writetext CaptainBeckons
	waitbutton
	closetext
	pause 15
	applymovement PLAYER, PlayerWalksToCaptain
	jump CaptainRocketScript
	

BasementDoorScript::
	opentext
	checkevent EVENT_USED_BASEMENT_KEY
	iftrue .Open
	checkitem BASEMENT_KEY
	iftrue .Unlock
	writetext UnknownText_0x7c5b0
	waitbutton
	closetext
	end

.Unlock:
	playsound SFX_TRANSACTION
	writetext UnknownText_0x7c5d6
	waitbutton
	closetext
	changeblock 28, 28, $2b ; unlocked door
	reloadmappart
	closetext
	setevent EVENT_USED_BASEMENT_KEY
	end

.Open:
	writetext UnknownText_0x7c5c3
	waitbutton
	closetext
	end

TrainerGruntM11:
	trainer GRUNTM, GRUNTM_11, EVENT_BEAT_ROCKET_GRUNTM_11, GruntM11SeenText, GruntM11BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM11AfterBattleText
	waitbutton
	closetext
	end
	

TrainerGruntM13:
	trainer GRUNTM, GRUNTM_13, EVENT_BEAT_ROCKET_GRUNTM_13, GruntM13SeenText, GruntM13BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM13AfterBattleText
	waitbutton
	closetext
	end

TrainerGruntM22:
	trainer GRUNTM, GRUNTM_22, EVENT_BEAT_ROCKET_GRUNTM_22, GruntM22SeenText, GruntM22BeatenText, 0, .Script


.Script:
	setevent EVENT_ROCKET_KEY_DIALOGUE
	checkevent EVENT_USED_BASEMENT_KEY
	iftrue .HowdYouGetThat
	opentext
	writetext GruntM22AfterBattleText
	waitbutton
	closetext
	end

.HowdYouGetThat
	opentext
	writetext GruntM22HowdGetKey
	waitbutton
	closetext
	end


CaptainRocketScript:
	pause 15
	faceplayer
	opentext
	writetext CaptainRBeforeText
	waitbutton
	closetext
	pause 10
	turnobject SHIP_CAPTAIN_R, LEFT
	opentext
	writetext CaptainRTellsImposterOff
	waitbutton
	closetext
	showemote EMOTE_SHOCK, SHIP_IMPOSTER, 15
	turnobject SHIP_IMPOSTER, RIGHT
	opentext
	writetext ImposterOakIsShocked
	waitbutton
	closetext
	pause 15
	opentext
	writetext CaptainRTellsImposterOff2
	waitbutton
	closetext
	pause 15
	opentext
	writetext ImposterOakIsShocked2
	waitbutton
	closetext
	applymovement SHIP_IMPOSTER, ImposterLeavesRoom
	playsound SFX_EXIT_BUILDING
	disappear SHIP_IMPOSTER
	pause 5
	turnobject SHIP_CAPTAIN_R, DOWN
	opentext
	writetext CaptainRFinishesSpeech
	waitbutton
	closetext
	winlosstext CaptainRWinText, CaptainRLossText
	loadtrainer EXECUTIVEM, EXECUTIVEM_1
	startbattle
	reloadmapafterbattle
	opentext
	writetext CaptainRAfterText
	waitbutton
	closetext
	special FadeOutPalettes
	special HealParty
	pause 15
	setevent EVENT_ROUTE_5_6_POKEFAN_M_BLOCKS_UNDERGROUND_PATH
	clearevent EVENT_FLORIA_AT_FLOWER_SHOP
	setevent EVENT_PRYCE_IN_GYM
	setevent EVENT_FOUGHT_BELMITT
	setmapscene ROUTE_104, SCENE_ROUTE33_NOTHING
	warp SUNPOINT_DOCKS, 13, 3
	end
	

TrainerGruntM25:
	trainer GRUNTM, GRUNTM_25, EVENT_BEAT_ROCKET_GRUNTM_25, GruntM25SeenText, GruntM25BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM25AfterBattleText
	waitbutton
	closetext
	end
	
TrainerGruntF3:
	trainer GRUNTF, GRUNTF_3, EVENT_BEAT_ROCKET_GRUNTF_3, GruntF3SeenText, GruntF3BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntF3AfterBattleText
	waitbutton
	closetext
	end
	

TrainerBurglarEddie:
	trainer BURGLAR, EDDIE, EVENT_BEAT_BURGLAR_EDDIE, BurglarEddieSeenText, BurglarEddieBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BurglarEddieAfterBattleText
	waitbutton
	closetext
	end
	
RocketShipBaseSmokeBall:
	itemball SMOKE_BALL
	
RocketShipBaseAmuletCoin:
	itemball AMULET_COIN
	
TrashCanBoatScript:
	jumptext TrashCanBoatText

	
Movement_StepUpToMeShip:
	step UP
	step_end
	
Movement_StepUpToMeShip2:
	step UP
	step UP
	step UP
	step_end
	
Movement_StepDownFromMeShip:
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end
	
ImposterWalksToMe:
	step DOWN
	;step LEFT
	;turn_head DOWN
	step_end
	
ImposterWalksToCaptain:
	step UP
	step UP
	step LEFT
	step LEFT
	step UP
	step UP
	step UP
	turn_head DOWN
	step_end
	
PlayerWalksToCaptain:
	step UP
	step UP
	step UP
	step_end
	
ImposterLeavesRoom:
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step RIGHT
	step RIGHT
	step DOWN
	step_end
	
TrashCanBoatText:
	text "There's nothing in"
	line "here…"
	done

GruntM22SeenText:
	text "You're pretty far"
	line "into the ship."
	para "But you'll go no"
	line "further!"
	done

GruntM22BeatenText:
	text "The CAPTAIN won't"
	line "like this…"
	done

GruntM22AfterBattleText:
	text "You may have won."
	
	para "But you can't get"
	line "into the CAPTAIN's"
	cont "cabin without the"
	cont "SHIP KEY!"

	para "Some other grunt"
	line "probably has it."
	
	para "Maybe here on the"
	line "on the SHIP..."
	cont "or not..."
	cont "...who knows?"
	
	para "Once the rest of"
	line "crew return from"
	cont "the SANSKRIT post,"
	cont "we are outta here!"	
	done

GruntM11SeenText:
	text "What are you doing"
	line "here?"
	para "Don't get in my"
	line "way!"
	done

GruntM11BeatenText:
	text "You're getting in"
	line "my way!"
	done

GruntM11AfterBattleText:
	text "Really, I'm not up"
	line "to anything"
	cont "important."
	
	para "I just like to"
	line "ride on a ship!"
	done

GruntM25SeenText:
	text "Ha! I bet you"
	line "weren't expecting"
	cont "me here!"
	para "Too bad, cause"
	line "here I am!"
	done

GruntM25BeatenText:
	text "I think I'll stay"
	line "in this closet…"
	done

GruntM25AfterBattleText:
	text "No one bothers"
	line "me back here."
	done

GruntM13SeenText:
	text "I don't care if"
	line "you're lost."

	para "You show up here,"
	line "you're nothing but"
	cont "a victim!"
	done

GruntM13BeatenText:
	text "Urk! Yeah, think"
	line "you're cool, huh?"
	done

GruntM13AfterBattleText:
	text "You must have ice"
	line "in your veins to"
	cont "diss TEAM ROCKET."
	done

UnknownText_0x7c5b0:
	text "The door's locked…"
	done

UnknownText_0x7c5c3:
	text "The door is open."
	done

UnknownText_0x7c5d6:
	text "The SHIP KEY"
	line "opened the door."
	done

CaptainRBeforeText:
	text "I'm impressed that"
	line "you've reached me."
	
	para "It seems my crew"
	line "couldn't stop you."
	
	para "Useless grunts..."
	
	para "But our operations"
	line "here are finished."

	para "Our plan will"
	line "continue as"
	cont "scheduled."
	done
	
CaptainRTellsImposterOff:
	text "PROF. OAK!"
	done
	
ImposterOakIsShocked:
	text "IMPOSTER OAK: Yes,"
	line "sir!"
	done
	
CaptainRTellsImposterOff2:
	text "CAPTAIN: You have"
	line "your orders."
	para "Leave us."
	done
	
ImposterOakIsShocked2:
	text "IMPOSTER OAK: Yes,"
	line "Sir!"
	done
	
CaptainRFinishesSpeech:
	text "…"
	para "I see you've"
	line "met our IMPOSTER"
	cont "OAK."

	para "I wouldn't expect"
	line "you to be fooled."
	
	para "But it's not you"
	line "we need to"
	cont "convince."
	
	para "Our plans are none"
	line "of your buisness."
	
	para "Nosey children"
	line "need to be"
	cont "punished!"
	done

CaptainRWinText:
	text "Hmm..."
	para "Impressive for a"
	line "child."
	done
	
CaptainRLossText:
	text "Ha!"
	done
	
CaptainRAfterText:
	text "Your #MON are"
	line "quite strong..."

	para "But our shipments"
	line "are complete."
	
	para "We have the"
	line "materials we need"
	cont "for our ultimate"
	cont "weapon!"

	para "Soon, we will have"
	line "total control of"
	cont "all #MON"
	cont "globally!"

	para "Farwell child."
	
	para "Im sure our paths"
	line "will cross again."
	done


NotGonnaStandByText:
	text "I see you scared"
	line "off our guard."
	para "But you're dumber"
	line "than you look if"
	para "you think I'm"
	line "just gonna let you"
	para "walk right on in"
	line "here!"
	para "Just try to get"
	line "past me!"
	done
	
RocketEntranceShip_WinText:
	text "You're tougher"
	line "than you look!"
	done
	
RocketEntranceShip_LossText:
	text "Ha!"
	done
	
RocketEntranceShip_AfterText:
	text "Argh!"
	para "I better go warn"
	line "the CAPTAIN about"
	cont "you."
	para "He'll take care"
	line "of your meddling"
	cont "ways!"
	done

GruntF3SeenText:
	text "What do you have"
	line "against TEAM"
	cont "ROCKET?"
	done

GruntF3BeatenText:
	text "Our plans are"
	line "still bigger than"
	cont "you know!"
	done

GruntF3AfterBattleText:
	text "We're getting"
	line "ready to head out"
	cont "of here anyways."
	done


BurglarEddieSeenText:
	text "Shh! I'm not a"
	line "part of TEAM"
	cont "ROCKET!"

	para "I'm searching for"
	line "loot."
	done

BurglarEddieBeatenText:
	text "Over the top!"
	done

BurglarEddieAfterBattleText:
	text "Does stealing from"
	line "bad guys make me"
	cont "a good guy?"
	done
	
Text_EndDemo:
	text "Also, thanks a ton"
	line "for playing!"
	para "This point is"
	line "where the demo"
	cont "ends."
	para "You've completed"
	line "what's available"
	cont "of the story."
	para "But feel free to"
	line "spend time"
	para "exploring and"
	line "catching #MON!"
	para "I've got a few"
	line "things for you"
	para "that will make"
	line "exploring easier."
	para "HM02 FLY and the"
	line "badge you need to"
	cont "use it!"
	done
	
Text_ReceivedMineralBadgeDemo:
	text "<PLAYER> received"
	line "MINERALBADGE."
	done
	
Text_EndDemo2:
	text "Alright, see ya!"
	done
	
GruntM22HowdGetKey:
	text "How'd you get that"
	line "key!?"
	done
	
ImposterGreetingText:
	text "Well, who do we"
	line "have here?"
	done
	
ImposterGreetingText2:
	text "Don't you"
	line "recognize me?"
	para "It's me, PROF.OAK!"
	para "I'm working with"
	line "TEAM ROCKET now!"
	para "…Nah, I know"
	line "you're not buying"
	cont "it."
	done
	
ImposterTellsCaptainText:
	text "Hey, CAPTAIN!"
	line "We got some kid"
	cont "here!"
	para "I bet it's the one"
	line "we've been hearing"
	cont "about!"
	done
	
CaptainBeckons:
	text "CAPTAIN: Come"
	line "here, kid!"
	done

RocketShipBase_MapEvents:
	db 0, 0 ; filler

	db 17 ; warp events
	warp_event  3,  1, SUNPOINT_DOCKS, 3
	warp_event  3,  8, ROCKET_SHIP_BASE, 3
	warp_event 13,  1, ROCKET_SHIP_BASE, 2
	warp_event 13, 12, ROCKET_SHIP_BASE, 5
	warp_event 29,  1, ROCKET_SHIP_BASE, 4
	warp_event 33,  3, ROCKET_SHIP_BASE, 7
	warp_event  3, 18, ROCKET_SHIP_BASE, 6
	warp_event 35,  3, ROCKET_SHIP_BASE, 9
	warp_event 13, 24, ROCKET_SHIP_BASE, 8
	warp_event 19, 19, ROCKET_SHIP_BASE, 11
	warp_event  3, 34, ROCKET_SHIP_BASE, 10
	warp_event 25, 19, ROCKET_SHIP_BASE, 13
	warp_event 13, 34, ROCKET_SHIP_BASE, 12
	warp_event 29, 29, ROCKET_SHIP_BASE, 15
	warp_event 35, 22, ROCKET_SHIP_BASE, 14
	warp_event 39, 22, ROCKET_SHIP_BASE, 14
	warp_event  2, 18, ROCKET_SHIP_BASE, 6

	db 2 ; coord events
	coord_event  3,  2, SCENE_DEFAULT, RocketGreetingsScript
	coord_event 35, 21, SCENE_VIRIDIAN_GYM_IMPOSTER, ImposterAndCaptainScript

	db 2 ; bg events
	bg_event 29, 29, BGEVENT_READ, BasementDoorScript
	bg_event 29,  7, BGEVENT_READ, TrashCanBoatScript


	db 11 ; object events
	object_event 11,  3, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerGruntM11, -1
	object_event 31,  4, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerGruntM13, -1
	object_event -6,  2, SPRITE_ROCKET_GIRL, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event 28, 30, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerGruntM22, -1
	object_event 35, 15, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CaptainRocketScript, -1
	object_event  3, 16, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerGruntM25, -1
	object_event  1, 26, SPRITE_ROCKET_GIRL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerGruntF3, -1
	object_event 26, 23, SPRITE_PHARMACIST, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 2, TrainerBurglarEddie, -1
	object_event  4, 26, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, RocketShipBaseSmokeBall, EVENT_GOLDENROD_UNDERGROUND_SWITCH_ROOM_ENTRANCES_SMOKE_BALL
	object_event 35, 19, SPRITE_SURGE, SPRITEMOVEDATA_STANDING_RIGHT, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event  1, 16, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, RocketShipBaseAmuletCoin, EVENT_OLIVINE_LIGHTHOUSE_6F_SUPER_POTION



