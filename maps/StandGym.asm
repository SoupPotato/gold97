	const_def 2 ; object constants
	const STANDGYM_OKERA
	const STANDGYM_GYMGUY2
	const STANDGYM_COOLTRAINER

StandGym_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	
StandGymOkeraScript:
	faceplayer
	checkevent EVENT_REMATCH_AVAILABLE_OKERA
	iftrue rematchscriptOkera
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue postrematchscriptOkera
	
	opentext
	checkevent EVENT_BEAT_OKERA
	iftrue .FightDone
	writetext OkeraIntroText1
	waitbutton
	closetext
	winlosstext OkeraLossText, 0
	loadtrainer OKERA, OKERA1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_OKERA
	opentext
	writetext GetStormBadgeText
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_STORMBADGE
	setmapscene STAND_CITY, SCENE_FUCHSIA_CITY_IMPOSTER
	checkcode VAR_BADGES
.FightDone:
	checkevent EVENT_GOT_TM46_THIEF
	iftrue .AlreadyGotTM
	writetext OkeraExplainBadgeText
	buttonsound
	verbosegiveitem TM_THIEF
	iffalse .BagFull
	setevent EVENT_GOT_TM46_THIEF
	writetext OkeraExplainTMText
	waitbutton
	closetext
	end

.AlreadyGotTM:
	writetext OkeraAfterText
	waitbutton
.BagFull:
	closetext
	end

rematchscriptOkera:
	opentext
	writetext OkeraRematchText
	waitbutton
	closetext
	winlosstext OkeraRematchWinText, 0
	loadtrainer OKERA, OKERA2
	startbattle
	reloadmapafterbattle
	clearevent EVENT_REMATCH_AVAILABLE_OKERA
	opentext
	writetext OkeraAfterRematchText
	waitbutton
	closetext
	end

postrematchscriptOkera:
	opentext
	writetext OkeraAfterRematchText
	waitbutton
	closetext
	end

OkeraRematchText:
	text "What do you want?"
	
	para "Aren't you the"
	line "CHAMPION now?"
	
	para "You want a second"
	line "BADGE from me or"
	cont "something?"
	
	para "Don't think I'll"
	line "back down from"
	cont "a challenge like"
	cont "this!"
	done

OkeraRematchWinText:
	text "Heh."
	done

OkeraAfterRematchText:
	text "I wasn't really"
	line "expecting to win,"
	cont "but I'd never"
	cont "back out of a"
	cont "fight. Even if"
	cont "all bets are"
	cont "against me."
	
	para "You're the same"
	line "way, aren't you?"
	done

.GoldenrodRockets:
	jumpstd goldenrodrockets

.RadioTowerRockets:
	jumpstd radiotowerrockets


StandGymStatue:
	checkflag ENGINE_STORMBADGE
	iftrue .Beaten
	jumpstd gymstatue1
.Beaten:
	trainertotext OKERA, OKERA1, MEM_BUFFER_1
	jumpstd gymstatue2
	

StandGymGuyScript2:
	faceplayer
	checkevent EVENT_BEAT_OKERA
	iftrue .StandGymGuyWinScript2
	opentext
	writetext StandGymGuyText2
	waitbutton
	closetext
	end

.StandGymGuyWinScript2:
	opentext
	writetext StandGymGuyWinText2
	waitbutton
	closetext
	end
	

TrainerCooltrainermAaron:
	trainer COOLTRAINERM, AARON, EVENT_BEAT_COOLTRAINERM_AARON, CooltrainermAaronSeenText, CooltrainermAaronBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainermAaronAfterBattleText
	waitbutton
	closetext
	end

TrainerCooltrainerfKelly:
	trainer COOLTRAINERF, KELLY, EVENT_BEAT_COOLTRAINERF_KELLY, CooltrainerfKellySeenText, CooltrainerfKellyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainerfKellyAfterBattleText
	waitbutton
	closetext
	end
	
TrainerCooltrainerfIrene:
	trainer COOLTRAINERF, IRENE, EVENT_BEAT_COOLTRAINERF_IRENE, CooltrainerfIreneSeenText, CooltrainerfIreneBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainerfIreneAfterText
	waitbutton
	closetext
	end
	
TrainerCooltrainerfJulia:
	trainer COOLTRAINERF, JULIA, EVENT_BEAT_COOLTRAINERF_JULIA, CooltrainerfJuliaSeenText, CooltrainerfJuliaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainerfJuliaAfterText
	waitbutton
	closetext
	end
	
TrainerCooltrainermBen:
	trainer COOLTRAINERM, BEN, EVENT_BEAT_COOLTRAINERM_BEN, CooltrainermBenSeenText, CooltrainermBenBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainermBenAfterBattleText
	waitbutton
	closetext
	end
	
TrainerCooltrainermRob:
	trainer COOLTRAINERM, ROB, EVENT_BEAT_COOLTRAINERM_ROB, CooltrainermRobSeenText, CooltrainermRobBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainermRobAfterBattleText
	waitbutton
	closetext
	end
	
LightSwitch:
	opentext
	writetext ItsASwitch
	yesorno
	iffalse .no
	closetext
	special FadeOutPalettes
	special FadeInPalettes
	special FadeOutPalettes
	special FadeInPalettes
	end
.no
	closetext
	end


CooltrainerfKellySeenText:
	text "What do you see"
	line "when you open"
	para "your eyes in the"
	line "dark?"
	done

CooltrainerfKellyBeatenText:
	text "Fine. I lost."
	done

CooltrainerfKellyAfterBattleText:
	text "Where is the GYM"
	line "LEADER?"
	para "He lives in the"
	line "shadows, beyond"
	cont "what can be seen."
	done

CooltrainermAaronSeenText:
	text "Are you afraid"
	line "of the dark?"
	done

CooltrainermAaronBeatenText:
	text "Whew…"
	line "Good battle."
	done

CooltrainermAaronAfterBattleText:
	text "This GYM isn't"
	line "really that scary."
	para "The lights are"
	line "just turned off."
	done

StandGymGuyText2:
	text "Hey, champ-in-the-"
	line "making!"
	para "It sure is dark in"
	line "here!"
	para "OKERA can be kind"
	line "of moody, and he"
	cont "likes it dark."
	para "But don't let his"
	line "age and behavior"
	cont "fool you."
	para "He's one tough"
	line "trainer!"
	done
	
StandGymGuyWinText2:
	text "I knew you weren't"
	line "afraid of the"
	cont "dark!"
	done

OkeraIntroText1:
	text "Tch…"
	
	para "Another trainer"
	line "wants some pain?"

	para "Fine!"

	para "I only became GYM"
	line "LEADER because my"
	cont "old man retired."
	
	para "DARK type #MON"
	line "got a bad rep that"
	cont "I can resonate"
	cont "with, ya know?"
	

	para "Still want some,"
	line "punk?"
	
	para "Then put em' up!"
	done


OkeraLossText:
	text "Tch!"
	para "I lost."

	para "You ain't no push-"
	line "over."
	
	para "I guess you get"
	line "the DUSKBADGE."
	done

GetStormBadgeText:
	text "<PLAYER> received"
	line "DUSKBADGE."
	done

OkeraExplainBadgeText:
	text "The DUSKBADGE"
	line "makes all #MON"
	cont "up to Level 70"
	cont "obey…"
	
	para "Or else…"

	para "Your #MON can"
	line "use ROCK SMASH"
	cont "when you're not in"
	cont "a battle too!"

	para "I guess I'm in a"
	line "good mood."
	
	para "Take this as well."
	done

OkeraExplainTMText:
	text "That move is"
	line "THIEF."

	para "It causes damage,"
	line "and also can steal"
	cont "an opponent's held"
	cont "item."
	
	para "Take what is"
	line "rightfully yours."
	
	para "That's what I say."
	done

OkeraAfterText:
	text "That was a good"
	line "battle."
	
	para "Your challenge was"
	line "worth my time."
	done
	
CooltrainerfIreneSeenText:
	text "Kyaaah!"
	line "Someone found me!"
	done

CooltrainerfIreneBeatenText:
	text "Ohhh!"
	line "Too strong!"
	done

CooltrainerfIreneAfterText:
	text "The dark can be"
	line "scary."

	para "But it can be"
	line "safe too."
	done
	
CooltrainerfJuliaSeenText:
	text "Do you believe in"
	line "bad luck?"
	done

CooltrainerfJuliaBeatenText:
	text "I certainly have"
	line "bad luck!"
	done

CooltrainerfJuliaAfterText:
	text "I wonder if these"
	line "switches even"
	cont "work?"
	done
	
CooltrainermBenSeenText:
	text "You need to master"
	line "the dark to get"
	cont "past this GYM!"
	done

CooltrainermBenBeatenText:
	text "Too bright!"
	done

CooltrainermBenAfterBattleText:
	text "Would be nice if"
	line "lights were"
	cont "working…"
	done
	
CooltrainermRobSeenText:
	text "Did you know"	
	line "Light and Dark"
	cont "are parallels?"
	done

CooltrainermRobBeatenText:
	text "Can't see…"
	done

CooltrainermRobAfterBattleText:
	text "Which do you"
	line "prefer?"
	
	para "Light or Dark?"
	done
	
ItsASwitch:
	text "Looks like a"
	line "LIGHT SWITCH…"
	
	para "It says 'FAULTY'."
	
	para "Push it anyway?"
	done

StandGym_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event 10, 23, STAND_CITY, 3
	warp_event 11, 23, STAND_CITY, 10
	warp_event  8, 13, STAND_GYM, 1

	db 0 ; coord events

	db 8 ; bg events
	bg_event  9, 21, BGEVENT_READ, StandGymStatue
	bg_event 12, 21, BGEVENT_READ, StandGymStatue
	bg_event 11, 18, BGEVENT_READ, LightSwitch
	bg_event  9,  0, BGEVENT_READ, LightSwitch
	bg_event 21,  2, BGEVENT_READ, LightSwitch
	bg_event 17,  8, BGEVENT_READ, LightSwitch
	bg_event  1, 12, BGEVENT_READ, LightSwitch
	bg_event 21, 12, BGEVENT_READ, LightSwitch

	db 8 ; object events
	object_event 10, 11, SPRITE_OKERA, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, StandGymOkeraScript, EVENT_OKERA_AT_BASE
	object_event  8, 21, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, StandGymGuyScript2, -1
	object_event 20, 14, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerCooltrainermAaron, -1
	object_event 23,  3, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 2, TrainerCooltrainerfKelly, -1
	object_event  5, 11, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 2, TrainerCooltrainerfIrene, -1
	object_event  7,  1, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 2, TrainerCooltrainerfJulia, -1
	object_event 15,  7, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 2, TrainerCooltrainermBen, -1
	object_event  3, 17, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerCooltrainermRob, -1

