	const_def 2 ; object constants
	const TEAMROCKETBASEB2F_POKE_BALL
	const TEAMROCKETBASEB2F_GRUNTM8
	const TEAMROCKETBASEB2F_GRUNTM9
	const TEAMROCKETBASEB2F_GRUNTM10
	const TEAMROCKETBASEB2F_GRUNTM14
	const TEAMROCKETBASEB2F_GRUNTM15
	const TEAMROCKETBASEB2F_GRUNTM16
	const TEAMROCKETBASEB2F_SCIENTISTROSS
	const TEAMROCKETBASEB2F_SCIENTISTMITCH
	const TEAMROCKETBASEB2F_SILVER
	const TEAMROCKETBASEB2F_IMPOSTER
	const TEAMROCKETBASEB2F_RAITORA

TeamRocketBaseB1F_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .DamagedSystem
	
.DamagedSystem:
	checkevent EVENT_ROCKET_MACHINE_DAMAGED
	iffalse .Done
	changeblock 13, 13, $85 ; damage
	changeblock 15, 13, $85 ; damage
	changeblock 17, 13, $85 ; damage
	changeblock 11, 15, $82 ; damage
	changeblock 13, 17, $84 ; damage
	changeblock 17, 17, $84 ; damage	
	changeblock 11, 19, $86 ; damage
	changeblock 13, 19, $83 ; damage
	changeblock 15, 19, $87 ; damage
	changeblock 17, 19, $83 ; damage
	changeblock 19, 19, $88 ; damage
.Done:
	return
	
ImposterCompEncounter:
	showemote EMOTE_SHOCK, TEAMROCKETBASEB2F_SILVER, 20
	applymovement TEAMROCKETBASEB2F_SILVER, SilverWalksToImposterComputer
	opentext
	writetext YoureNotOakCompScene
	waitbutton
	closetext
	showemote EMOTE_SHOCK, TEAMROCKETBASEB2F_IMPOSTER, 20
	turnobject TEAMROCKETBASEB2F_IMPOSTER, LEFT
	applymovement TEAMROCKETBASEB2F_IMPOSTER, ImposterJumpsBack
	pause 5
	opentext
	writetext HowDidYouKidsGetDownHereText
	waitbutton
	closetext
	applymovement TEAMROCKETBASEB2F_IMPOSTER, ImposterRunsOff
	opentext
	writetext SilverHeyWaitWhatsGoingOnText
	waitbutton
	closetext
	applymovement TEAMROCKETBASEB2F_SILVER, ImposterRunsOff
	disappear TEAMROCKETBASEB2F_SILVER
	disappear TEAMROCKETBASEB2F_IMPOSTER
	setscene SCENE_TEAMROCKETBASEB2F_NOTHING
	setevent EVENT_ILEX_FOREST_LASS
	end


TeamRocketBaseB1FTMThief:
	itemball TM_PSYCH_UP

TeamRocketBaseB1FHiddenFullHeal:
	hiddenitem FULL_HEAL, EVENT_TEAM_ROCKET_BASE_B2F_HIDDEN_FULL_HEAL


TrainerGruntM8:
	trainer GRUNTM, GRUNTM_8, EVENT_BEAT_ROCKET_GRUNTM_8, GruntM8SeenText, GruntM8BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM8AfterBattleText
	waitbutton
	closetext
	end
	

TrainerGruntM9:
	trainer GRUNTM, GRUNTM_9, EVENT_BEAT_ROCKET_GRUNTM_9, GruntM9SeenText, GruntM9BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM9AfterBattleText
	waitbutton
	closetext
	end


TrainerGruntM10:
	trainer GRUNTM, GRUNTM_10, EVENT_BEAT_ROCKET_GRUNTM_10, GruntM10SeenText, GruntM10BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM10AfterBattleText
	waitbutton
	closetext
	end
	

TrainerGruntM14:
	trainer GRUNTF, GRUNTF_7, EVENT_BEAT_ROCKET_GRUNTM_14, GruntM14SeenText, GruntM14BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM14AfterBattleText
	waitbutton
	closetext
	end
	

TrainerGruntM15:
	trainer GRUNTM, GRUNTM_15, EVENT_BEAT_ROCKET_GRUNTM_15, GruntM15SeenText, GruntM15BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM15AfterBattleText
	waitbutton
	closetext
	end
	

TrainerGruntM16:
	trainer GRUNTM, GRUNTM_16, EVENT_BEAT_ROCKET_GRUNTM_16, GruntM16SeenText, GruntM16BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM16AfterBattleText
	waitbutton
	closetext
	end
	
TrainerScientistRoss:
	trainer SCIENTIST, ROSS, EVENT_BEAT_SCIENTIST_ROSS, ScientistRossSeenText, ScientistRossBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext ScientistRossAfterBattleText
	waitbutton
	closetext
	end

TrainerScientistMitch:
	trainer SCIENTIST, MITCH, EVENT_BEAT_SCIENTIST_MITCH, ScientistMitchSeenText, ScientistMitchBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext ScientistMitchAfterBattleText
	waitbutton
	closetext
	end
	
TeamRocketBaseB1FComputerConsole:
;	setevent EVENT_ROUTE_30_BATTLE
	checkevent EVENT_GOLDENROD_CITY_ROCKET_SCOUT
	iftrue .SystemIsOff
	opentext
	playsound SFX_BOOT_PC
	pause 50
	writetext TeamRocketBaseB1FComputerConsoleIntroText
	waitbutton
	jump TeamRocketBaseB1FComputerConsole_loop
	
.SystemIsOff
	opentext
	writetext SystemAlreadyOff
	waitbutton
	closetext
	end

TeamRocketBaseB1FComputerConsole_loop:
	writetext ConsoleWhatDo
	loadmenu TeamRocketBaseB1FComputerConsoleMenu
	verticalmenu
	closewindow
	ifequal 1, .consolemenu1
	ifequal 2, .consolemenu2
	ifequal 3, .consolemenu3
	jump TeamRocketBaseB1FComputerConsole_cancel

	
.consolemenu1
	writetext ConsoleMenu1Text
	waitbutton
	jump TeamRocketBaseB1FComputerConsole_loop
	
.consolemenu2
	writetext ConsoleMenu2Text
	waitbutton
	jump TeamRocketBaseB1FComputerConsole_loop
	
.consolemenu3
	writetext ConsoleMenu3Text
	waitbutton
	playsound SFX_CHOOSE_PC_OPTION
TeamRocketBaseB1FComputerPower_loop:
	writetext ConsoleWhatDoPower
	loadmenu TeamRocketBaseB1FComputerConsolePowerMenu
	verticalmenu
	closewindow
	ifequal 1, .consolepowermenu1
	ifequal 2, .consolepowermenu2
	ifequal 3, .consolepowermenu3
	jump TeamRocketBaseB1FComputerConsole_loop
	
.consolepowermenu1
	writetext ConsolePowerMenu1Text
	waitbutton
	jump TeamRocketBaseB1FComputerPower_loop
	
.consolepowermenu2
	writetext ConsolePowerMenu2Text
	waitbutton
	jump TeamRocketBaseB1FComputerPower_loop
	
.consolepowermenu3
	writetext ConsolePowerMenu3Text
	waitbutton
	checkevent EVENT_ROUTE_30_BATTLE
	iftrue .KnowsPasswordShutDown
	jump TeamRocketBaseB1FComputerPower_loop
	
.KnowsPasswordShutDown
	writetext PasswordEntered
.PowerYesOrNo1:
	yesorno
	iftrue .ShutdownTime
	writetext ReturningToPowerMenu
	waitbutton
	jump TeamRocketBaseB1FComputerPower_loop
	
.ShutdownTime
	writetext SystemShuttingDown
	waitbutton
	playsound SFX_SHUT_DOWN_PC
	closetext
	setevent EVENT_GOLDENROD_CITY_ROCKET_SCOUT
	pause 15
	moveobject TEAMROCKETBASEB2F_SILVER, 13, 25
	appear TEAMROCKETBASEB2F_SILVER
	applymovement TEAMROCKETBASEB2F_SILVER, SilverWalksLeftToMachine
	opentext
	writetext WowItsShuttingDown
	waitbutton
	closetext
	turnobject TEAMROCKETBASEB2F_SILVER, LEFT
	pause 15
	moveobject TEAMROCKETBASEB2F_RAITORA, 14, 20
	appear TEAMROCKETBASEB2F_RAITORA
	turnobject TEAMROCKETBASEB2F_SILVER, LEFT
	playsound SFX_BALL_POOF
	waitsfx
	cry RAITORA
	turnobject TEAMROCKETBASEB2F_SILVER, LEFT
	pause 15
	opentext
	writetext RaitoraDestroyThisThing
	waitbutton
	closetext
;	pause 15
;	pause 5
	opentext
	writetext RaitoraDestroyThisThing2
	waitbutton
	closetext
	turnobject TEAMROCKETBASEB2F_SILVER, UP
	playsound SFX_JUMP_OVER_LEDGE
	applymovement TEAMROCKETBASEB2F_RAITORA, RaitoraJumpsUp
	pause 15
	opentext
	writetext RaitoraDestroysTheThing
	waitbutton
	closetext
	playsound SFX_ZAP_CANNON
	earthquake 80
	special FadeOutPalettes
	changeblock 13, 13, $85 ; damage
	changeblock 15, 13, $85 ; damage
	special FadeInPalettes
	reloadmappart
	waitsfx
	playsound SFX_ZAP_CANNON
	earthquake 80
	special FadeOutPalettes
	changeblock 17, 13, $85 ; damage
	changeblock 11, 15, $82 ; damage
	special FadeInPalettes
	reloadmappart
	waitsfx
	playsound SFX_ZAP_CANNON
	earthquake 80
	special FadeOutPalettes
	changeblock 13, 17, $84 ; damage
	changeblock 17, 17, $84 ; damage
	special FadeInPalettes
	reloadmappart	
	waitsfx
	pause 15
	playsound SFX_JUMP_OVER_LEDGE
	applymovement TEAMROCKETBASEB2F_RAITORA, RaitoraJumpsDown
	playsound SFX_MEGA_PUNCH
	earthquake 80
	special FadeOutPalettes
	changeblock 11, 19, $86 ; damage
	changeblock 13, 19, $83 ; damage
	special FadeInPalettes
	reloadmappart
	waitsfx
	playsound SFX_MEGA_PUNCH
	earthquake 80
	special FadeOutPalettes
	changeblock 19, 19, $88 ; damage
	special FadeInPalettes
	reloadmappart
	waitsfx
	playsound SFX_MEGA_PUNCH
	earthquake 80
	special FadeOutPalettes
	changeblock 15, 19, $87 ; damage
	changeblock 17, 19, $83 ; damage
	special FadeInPalettes
	reloadmappart
	playsound SFX_SHUT_DOWN_PC
	waitsfx
	playsound SFX_SHUT_DOWN_PC
	waitsfx
	playsound SFX_SHUT_DOWN_PC
	waitsfx
	pause 15
	turnobject TEAMROCKETBASEB2F_SILVER, LEFT
	opentext
	writetext RaitoraDestroyedTheThing
	waitbutton
	closetext
	playsound SFX_BALL_POOF
	disappear TEAMROCKETBASEB2F_RAITORA
	pause 10
	turnobject TEAMROCKETBASEB2F_SILVER, LEFT
	turnobject TEAMROCKETBASEB2F_SILVER, UP
	opentext
	writetext RaitoraDestroyedTheThing2
	waitbutton
	closetext
	moveobject TEAMROCKETBASEB2F_GRUNTM8, 13, 25
	appear TEAMROCKETBASEB2F_GRUNTM8
	applymovement TEAMROCKETBASEB2F_GRUNTM8, TeamRocketGuyWalksUp
	showemote EMOTE_SHOCK, TEAMROCKETBASEB2F_GRUNTM8, 20
	opentext
	writetext WhatHaveYouDoneText
	waitbutton
	closetext
	pause 15
	applymovement TEAMROCKETBASEB2F_GRUNTM8, TeamRocketGuyStepsBack
	turnobject TEAMROCKETBASEB2F_GRUNTM8, DOWN
	opentext
	writetext WhatHaveYouDoneText2
	waitbutton
	closetext
	applymovement TEAMROCKETBASEB2F_GRUNTM8, TeamRocketGuyLeaves
	turnobject TEAMROCKETBASEB2F_SILVER, LEFT
	showemote EMOTE_SHOCK, TEAMROCKETBASEB2F_SILVER, 20
	opentext
	writetext WaitGottaFindOut
	waitbutton
	closetext
	applymovement TEAMROCKETBASEB2F_SILVER, SilverLeaves
	disappear TEAMROCKETBASEB2F_GRUNTM8
	disappear TEAMROCKETBASEB2F_GRUNTM9
	disappear TEAMROCKETBASEB2F_GRUNTM10
	disappear TEAMROCKETBASEB2F_GRUNTM14
	disappear TEAMROCKETBASEB2F_GRUNTM15
	disappear TEAMROCKETBASEB2F_GRUNTM16
	disappear TEAMROCKETBASEB2F_SCIENTISTROSS
	disappear TEAMROCKETBASEB2F_SCIENTISTMITCH
	disappear TEAMROCKETBASEB2F_SILVER
	setevent EVENT_BLACKTHORN_CITY_SUPER_NERD_DOES_NOT_BLOCK_GYM
	setevent EVENT_ROCKET_MACHINE_DAMAGED
	jumpstd radiotowerrockets
	end

	
TeamRocketBaseB1FComputerConsoleMenu:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 2, 19, TEXTBOX_Y - 1
	dw .MenuDataConsole
	db 1 ; default option

.MenuDataConsole:
	db STATICMENU_CURSOR ; flags
	db 4 ; items
	db "ABOUT SYSTEM@"
	db "CURRENT STATUS@"
	db "POWER SETTINGS@"
	db "SIGN OUT@"
	
TeamRocketBaseB1FComputerConsolePowerMenu:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 2, 19, TEXTBOX_Y - 1
	dw .MenuDataPowerConsole
	db 1 ; default option

.MenuDataPowerConsole:
	db STATICMENU_CURSOR ; flags
	db 4 ; items
	db "INCREASE POWER@"
	db "DECREASE POWER@"
	db "SHUT DOWN POWER@"
	db "PREVIOUS MENU@"
	
TeamRocketBaseB1FComputerConsole_cancel:
	writetext TeamRocketBaseB1FComputerConsoleCancelText
	waitbutton
	playsound SFX_SHUT_DOWN_PC
	closetext
	end
	
TeamRocketGuyLeaves:
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step LEFT
	step_end
	
SilverLeaves:	
	step DOWN
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step LEFT
	step_end
	
ImposterRunsOff:
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step_end
	
ImposterJumpsBack:
	turn_head LEFT
	fix_facing
	big_step RIGHT
	remove_fixed_facing
	step_end
	
SilverWalksToImposterComputer:
	step RIGHT
	step UP
	turn_head RIGHT
	step_end
	
SilverWalksLeftToMachine:
	step UP
	step UP
	step UP
	step UP
	step RIGHT
	step RIGHT
	step UP
	step_end
	
TeamRocketGuyWalksUp:
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	step RIGHT
	step UP
	step_end
	
TeamRocketGuyStepsBack:
	fix_facing
	step DOWN
	remove_fixed_facing
	step_end
	
RaitoraJumpsUp:
	jump_step UP
	step_end

RaitoraJumpsDown:
	jump_step DOWN
	step_end
	
WaitGottaFindOut:
	text "<RIVAL>: Wait!"
	line "There's still"
	cont "more!?"
	
	para "Come on,"
	line "<PLAY_G>!"

	para "We have to take"
	line "these guys out,"
	cont "once and for all!"
	done
	
WhatHaveYouDoneText:
	text "EXECUTIVE: No!"
	
	para "What have you"
	line "done?!"
	
	para "You've destroyed"
	line "all of our hard"
	cont "work!"
	
	para "GIOVANNI will be"
	line "furious when he"
	cont "finds out!"
	done
	
WhatHaveYouDoneText2:
	text "…"
	para "I had hoped it"
	line "wouldn't have to"
	cont "come to this."
	
	para "But TEAM ROCKET is"
	line "not finished yet!"
	
	para "We still have one"
	line "final plan."	
	done
	
RaitoraDestroyedTheThing:
	text "<RIVAL>: Great"
	line "job, RAITORA!"
	para "You did it!"
	done
	
RaitoraDestroyedTheThing2:
	text "Now this thing"
	line "will never hurt"
	cont "another #MON!"
	done
	
RaitoraDestroysTheThing:
	text "RAITORA:"
	line "Raiiiii!!"
	done
	
RaitoraDestroyThisThing:
	text "Go! RAITORA!"
	done
	
RaitoraDestroyThisThing2:
	text "Hop on up there"
	line "and destroy this"
	para "thing with your"
	line "best THUNDERBOLT"
	cont "attack!"
	done
	
WowItsShuttingDown:
	text "<RIVAL>: Wow,"
	line "<PLAYER>!"
	para "You got it to turn"
	line "off!"
	
	para "This thing was"
	line "going to be able"
	cont "to control the"
	cont "minds of #MON!"
	
	para "How despicable..."

	para "I don't think"
	line "it's enough to"
	cont "just turn this"
	cont "thing off!"
	
	para "It needs to be"
	line "destroyed!"
	done
	
HowDidYouKidsGetDownHereText:
	text "IMPOSTER OAK: Hey!"
	line "How'd you kids get"
	cont "down here!?"
	
	para "No unauthorized"
	line "personnel should"
	cont "be anywhere near"
	cont "this machine!"
	
	para "It is a very"
	line "powerful antenna,"
	cont "that takes time to"
	cont "reach full power!"
	
	para "Well, I guess it"
	line "doesn't matter."
	
	para "You can't turn it"
	line "off unless you"
	cont "know the password!"
	
	para "I gotta tell the"
	line "boss that we have"
	cont "intruders!"
	done
	
SilverHeyWaitWhatsGoingOnText:
	text "Hey, wait!"
	para "What's this all"
	line "about!?"
	para "I demand answers!"
	done
	
YoureNotOakCompScene:
	text "<RIVAL>: Wait!"
	para "What's going on"
	line "here!?"
	para "You're not PROF."
	line "OAK!"
	done
	
SystemAlreadyOff:
	text "The system makes"
	line "no noise and seems"
	cont "inoperable…"
	done
	
SystemShuttingDown:
	text "REQUEST CONFIRMED"
	para "SYSTEM POWER"
	line "SHUTTING DOWN"
	para ".................."
	line ".................."
	done
	
ReturningToPowerMenu:
	text "RETURNING TO"
	line "PREVIOUS MENU…"
	done
	
PasswordEntered:
	text "<PLAY_G> entered"
	line "the password…"
	para "'HAIL GIOVANNI'"
	para "…"
	para "WARNING!"
	line "THE ACTION YOU ARE"
	para "ABOUT TO TAKE CAN-"
	line "NOT BE EASILY"
	cont "REVERSED!"
	para "PLEASE CONFIRM"
	line "INTENT AGAIN."
	para "DO YOU WISH TO"
	line "SHUT DOWN ALL"
	cont "SYSTEM POWER?"
	done
	
ConsoleWhatDoPower:
	text "SELECT POWER"
	line "ADJUSTMENTS"
	done
	
ConsolePowerMenu1Text:
	text "POWER IS ALREADY"
	line "INCREASING!"
	done
	
ConsolePowerMenu2Text:
	text "THIS FUNCTION IS"
	line "NOT CURRENTLY"
	cont "AVAILABLE"
	done
	
ConsolePowerMenu3Text:
	text "PASSWORD REQUIRED"
	line "FOR THIS FUNCTION"
	done
	
ConsoleWhatDo:
	text "MAIN MENU -"
	line "SELECT ACTION"
	done
	
ConsoleMenu1Text:
	text "MIND CONTROL"
	line "SYSTEM SOFTWARE"
	cont "VERSION 1.03"	
	done
	
ConsoleMenu2Text:
	text "CURRENT CAPACITY-"
	line "74 PERCENT…"
	done
	
ConsoleMenu3Text:
	text "ENTERING POWER"
	line "SETTINGS MENU"
	done
	
TeamRocketBaseB1FComputerConsoleCancelText:
	text "SIGNING OUT OF"
	line "CONSOLE…"
	done
	
TeamRocketBaseB1FComputerConsoleIntroText:
	text "BOOTING TEAM"
	line "ROCKET #MON"
	cont "CONTROL CONSOLE"
	done

ScientistMitchSeenText:
	text "Our mind control"
	line "wave will allow"
	para "us to take over"
	line "the world!"
	done
	
ScientistMitchBeatenText:
	text "As soon as it's"
	line "fully functional."
	done
	
ScientistMitchAfterBattleText:
	text "TEAM ROCKET's"
	line "scientific"
	para "accomplishments"
	line "are incredible!"
	done


ScientistRossSeenText:
	text "What are we"
	line "doing here, you"
	cont "ask?"
	para "Nothing much."
	para "Only on the brink"
	line "of taking control"
	para "of every #MON"
	line "in the world!"
	done
	
ScientistRossBeatenText:
	text "Yours clearly"
	line "aren't under our"
	cont "control…"
	done
	
ScientistRossAfterBattleText:
	text "The antenna isn't"
	line "at full power yet."
	para "It takes a very"
	line "long time to"
	cont "reach full power."
	done

GruntM16SeenText:
	text "You again?"
	para "I'm really tired"
	line "of seeing you"
	cont "around."
	done
	
GruntM16BeatenText:
	text "I'm really tired"
	line "of losing, too."
	done
	
GruntM16AfterBattleText:
	text "I'm kinda tired"
	line "of working for"
	para "TEAM ROCKET as"
	line "well."
	done


GruntM15SeenText:
	text "You're a real"
	line "pain, you know"
	cont "that?"
	done
	
GruntM15BeatenText:
	text "This was also"
	line "painful!"
	done
	
GruntM15AfterBattleText:
	text "You know, we all"
	line "get in trouble"
	para "after you kids"
	line "come in here and"
	cont "walk all over us."
	done


GruntM14SeenText:
	text "We're all really"
	line "excited about"
	para "what's about to"
	line "happen!"
	para "I don't want to"
	line "see some kid get"
	cont "in the way!"
	done
	
GruntM14BeatenText:
	text "How dare you!"
	done
	
GruntM14AfterBattleText:
	text "Just try to stop"
	line "our operations!"
	done


GruntM10SeenText:
	text "I'll show you what"
	line "happens when you"
	cont "get in my way!"
	done
	
GruntM10BeatenText:
	text "I lose…"
	done
	
GruntM10AfterBattleText:
	text "Apparently I get"
	line "defeated when you"
	cont "get in my way…"
	done

GruntM9SeenText:
	text "I'm the one who"
	line "is really going to"
	cont "stop you!"
	done
	
GruntM9BeatenText:
	text "Why did I expect"
	line "anything else?"
	done
	
GruntM9AfterBattleText:
	text "We GRUNTS don't"
	line "really get much"
	para "time to raise our"
	line "#MON."
	done
	
GruntM8SeenText:
	text "You don't belong"
	line "in here!"
	para "TEAM ROCKET"
	line "members only!"
	done
	
GruntM8BeatenText:
	text "You still don't"
	line "belong…"
	done
	
GruntM8AfterBattleText:
	text "Go on ahead, I"
	line "suppose."
	para "I don't care to"
	line "do anything else"
	cont "to stop you."
	done

TeamRocketBaseB1F_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  2, 10, STAND_ROCKET_HOUSE_1F, 3
	warp_event 15,  3, TEAM_ROCKET_BASE_B2F, 1
	warp_event 23, 15, TEAM_ROCKET_BASE_B2F, 2
	warp_event 26, 26, TEAM_ROCKET_BASE_B2F, 3


	db 3 ; coord events
	coord_event 10, 20, SCENE_DEFAULT, ImposterCompEncounter
	coord_event 10, 21, SCENE_DEFAULT, ImposterCompEncounter
	coord_event 10, 22, SCENE_DEFAULT, ImposterCompEncounter


	db 5 ; bg events
	bg_event 25, 16, BGEVENT_ITEM, TeamRocketBaseB1FHiddenFullHeal
	bg_event 12, 19, BGEVENT_READ, TeamRocketBaseB1FComputerConsole
	bg_event 13, 19, BGEVENT_READ, TeamRocketBaseB1FComputerConsole
	bg_event 16, 19, BGEVENT_READ, TeamRocketBaseB1FComputerConsole
	bg_event 17, 19, BGEVENT_READ, TeamRocketBaseB1FComputerConsole

	db 12 ; object events
	object_event  7, 19, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, TeamRocketBaseB1FTMThief, EVENT_TEAM_ROCKET_BASE_B2F_TM_THIEF
	object_event  3, 16, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 1, TrainerGruntM8, EVENT_BLACKTHORN_CITY_SUPER_NERD_DOES_NOT_BLOCK_GYM
	object_event 19,  6, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 2, TrainerGruntM9, EVENT_BLACKTHORN_CITY_SUPER_NERD_DOES_NOT_BLOCK_GYM
	object_event 25,  4, SPRITE_ROCKET, SPRITEMOVEDATA_SPINRANDOM_FAST, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerGruntM10, EVENT_BLACKTHORN_CITY_SUPER_NERD_DOES_NOT_BLOCK_GYM
	object_event 27, 13, SPRITE_ROCKET_GIRL, SPRITEMOVEDATA_STANDING_LEFT, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 2, TrainerGruntM14, EVENT_BLACKTHORN_CITY_SUPER_NERD_DOES_NOT_BLOCK_GYM
	object_event  2,  6, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_UP, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 1, TrainerGruntM15, EVENT_BLACKTHORN_CITY_SUPER_NERD_DOES_NOT_BLOCK_GYM
	object_event 21, 24, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_LEFT, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 2, TrainerGruntM16, EVENT_BLACKTHORN_CITY_SUPER_NERD_DOES_NOT_BLOCK_GYM
	object_event  6, 26, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerScientistRoss, EVENT_BLACKTHORN_CITY_SUPER_NERD_DOES_NOT_BLOCK_GYM
	object_event 26, 27, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_RIGHT, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerScientistMitch, EVENT_BLACKTHORN_CITY_SUPER_NERD_DOES_NOT_BLOCK_GYM
	object_event 11, 21, SPRITE_SILVER, SPRITEMOVEDATA_STANDING_RIGHT, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_ILEX_FOREST_LASS
	object_event 13, 20, SPRITE_SURGE, SPRITEMOVEDATA_STANDING_UP, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_ILEX_FOREST_LASS
	object_event -5, -5, SPRITE_GROWLITHE, SPRITEMOVEDATA_POKEMON, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_ILEX_FOREST_LASS
