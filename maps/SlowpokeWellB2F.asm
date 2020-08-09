	const_def 2 ; object constants
	const SLOWPOKEB2F_SILVER
	const SLOWPOKEB2F_BLUE
	const SLOWPOKEB2F_OAK
	const SLOWPOKEB2F_ROCKET1
	const SLOWPOKEB2F_ROCKET2
	const SLOWPOKEB2F_ROCKET3
	const SLOWPOKEB2F_GYM_GUY
	const SLOWPOKEB2F_ELDER

SlowpokeWellB2F_MapScripts:
	db 2 ; scene scripts
	scene_script .SceneSlowpoke2Rockets ; SCENE_DEFAULT
	scene_script .SceneSlowpoke2Nothing ; SCENE_SLOWPOKE2_NOTHING

	db 0 ; callbacks
	
.SceneSlowpoke2Rockets
	end
	
.SceneSlowpoke2Nothing
	end

RocketEncounterScript:
	turnobject SLOWPOKEB2F_BLUE, DOWN
	showemote EMOTE_SHOCK, SLOWPOKEB2F_BLUE, 15
	opentext
	writetext BlueProblemText
	waitbutton
	closetext
	applymovement PLAYER, TwoStepsUpMovement
	turnobject SLOWPOKEB2F_BLUE, UP
	applymovement SLOWPOKEB2F_OAK, OakStepUpMovement
	opentext
	writetext OakStopThisText
	waitbutton
	closetext
	applymovement SLOWPOKEB2F_OAK, OakStepBackMovement
	showemote EMOTE_SHOCK, SLOWPOKEB2F_ROCKET2, 15
	opentext
	writetext WeDoWhatWeWantText
	waitbutton
	closetext
	showemote EMOTE_SHOCK, SLOWPOKEB2F_SILVER, 15
	opentext
	writetext WeAreAllTrainersText
	waitbutton
	closetext
	showemote EMOTE_SHOCK, SLOWPOKEB2F_ROCKET3, 15
	opentext
	writetext WellSeeText
	waitbutton
	closetext
	applymovement SLOWPOKEB2F_ROCKET1, RocketWalksToBlue
	applymovement SLOWPOKEB2F_ROCKET2, RocketWalksToMe
	applymovement SLOWPOKEB2F_ROCKET3, RocketWalksToSilver
	winlosstext GruntM4SeenText, GruntM4BeatenText
	loadtrainer GRUNTM, GRUNTM_4
	startbattle
	reloadmapafterbattle
	jump .returnfrombattle

.returnfrombattle
	opentext
	writetext RocketsPlan
	waitbutton
	closetext
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	disappear SLOWPOKEB2F_ROCKET1
	disappear SLOWPOKEB2F_ROCKET2
	disappear SLOWPOKEB2F_ROCKET3
	pause 15
	special FadeInQuickly
	pause 15
	applymovement SLOWPOKEB2F_OAK, OakSteptoSpeech
	pause 30
	applymovement SLOWPOKEB2F_OAK, OakReadyForSpeech
	opentext
	writetext OakSpeechText
	waitbutton
	closetext
	applymovement SLOWPOKEB2F_OAK, OakLeavesMovement
	turnobject SLOWPOKEB2F_BLUE, RIGHT
	turnobject PLAYER, LEFT
	turnobject SLOWPOKEB2F_SILVER, LEFT
	opentext
	writetext BlueOutText
	waitbutton
	closetext
	turnobject PLAYER, DOWN
	turnobject SLOWPOKEB2F_SILVER, DOWN
	applymovement SLOWPOKEB2F_BLUE, BlueLeavesMovement
	turnobject SLOWPOKEB2F_SILVER, LEFT
	turnobject PLAYER, RIGHT
	opentext
	writetext SilverOutText
	waitbutton
	closetext
	turnobject PLAYER, DOWN
	applymovement SLOWPOKEB2F_SILVER, SilverLeavesMovement
	disappear SLOWPOKEB2F_BLUE
	disappear SLOWPOKEB2F_OAK
	disappear SLOWPOKEB2F_SILVER
	applymovement SLOWPOKEB2F_ELDER, EldertoPlayerMovement
	turnobject PLAYER, UP
	opentext
	writetext ElderThisSurfText
	waitbutton
	verbosegiveitem HM_SURF
	setevent EVENT_GOT_HM03_SURF
	writetext ElderThisSurfText2
	waitbutton
	closetext
	applymovement SLOWPOKEB2F_ELDER, EldertExitMovement
	disappear SLOWPOKEB2F_ELDER
	turnobject PLAYER, DOWN
	setevent EVENT_RIVAL_BURNED_TOWER
	setevent EVENT_CINNABAR_ROCKS_CLEARED
	setscene SCENE_SLOWPOKE2_NOTHING
	setmapscene OAKS_LAB_ENTRANCE, SCENE_ELM_ENTRANCE_NOTHING
	clearevent EVENT_EXPLODING_TRAP_21	
	end
	
OakLeavesMovement:
	step LEFT
	step LEFT
	step DOWN
	step DOWN
	step DOWN
	step RIGHT
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end
	
SilverLeavesMovement:
	step DOWN
	step LEFT
	step LEFT
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end
	
BlueLeavesMovement:
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end

OakSteptoSpeech:
	step UP
	step UP
	step_end

OakReadyForSpeech:
	step RIGHT
	step RIGHT
	turn_head DOWN
	step_end

TwoStepsUpMovement:
	step UP
	step RIGHT
	step UP
	step_end

OakStepUpMovement:
	step UP
	step_end
	
OakStepBackMovement:
	fix_facing
	step DOWN
	remove_fixed_facing
	step_end
	
RocketWalksToSilver:
	step DOWN
	step DOWN
	step_end
	
RocketWalksToBlue:
	step DOWN
	step RIGHT
	step DOWN
	step_end
	
RocketWalksToMe:
	step DOWN
	step LEFT
	step DOWN
	step_end
	
OneStepUp:
	step UP
	step_end
	
EldertoPlayerMovement:
	slow_step DOWN
	slow_step DOWN
	slow_step DOWN
	slow_step DOWN
	step_end
	
EldertExitMovement:
	slow_step LEFT
	slow_step DOWN
	slow_step DOWN
	slow_step DOWN
	slow_step DOWN
	slow_step DOWN
	slow_step DOWN
	slow_step DOWN
	step_end

SlowpokeWellB2FGymGuyScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_KINGS_ROCK_IN_SLOWPOKE_WELL
	iftrue .GotKingsRock
	writetext SlowpokeWellB2FGymGuyText
	buttonsound
	verbosegiveitem KINGS_ROCK
	iffalse .NoRoom
	setevent EVENT_GOT_KINGS_ROCK_IN_SLOWPOKE_WELL
.NoRoom:
	closetext
	end

.GotKingsRock:
	writetext SlowpokeWellB2FGymGuyText_GotKingsRock
	waitbutton
	closetext
	end

SlowpokeWellB2FGymGuyText:
	text "I'm waiting to see"
	line "SLOWPOKE's moment"
	cont "of evolution."

	para "Through observa-"
	line "tion, I made a new"
	cont "discovery."

	para "A SLOWPOKE with a"
	line "KING'S ROCK often"

	para "gets bitten by a"
	line "TURBAN."

	para "Here, I'll share a"
	line "KING'S ROCK with"
	cont "you."
	done

SlowpokeWellB2FGymGuyText_GotKingsRock:
	text "I'm going to be"
	line "like SLOWPOKE."

	para "I'll wait patient-"
	line "ly, so I can see"
	cont "one evolve."
	done
	
OakSpeechText:
	text "OAK: Well..."
	
	para "This research trip"
	line "didn't go as"
	cont "planned…"
	
	para "Regardless..."
	
	para "We have rescued"
	line "the SLOWPOKE."
	
	para "Now they can live"
	line "without losing"
	cont "their TAILs to"
	cont "TEAM ROCKET."
	
	para "But TEAM ROCKET"
	line "returning..."
	
	para "After three years,"
	line "why now?"
	
	para "BLUE, we best re"
	line "-turn to the lab"
	cont "and investigate."
	
	para "<PLAY_G>, <RIVAL>!"
	line "You two should go"	
	cont "ahead and continue"
	cont "your journey."
	
	para "If you need me,"
	line "you know where"
	cont "I'll be."
	done
	
BlueOutText:
	text "BLUE: Thanks for"
	line "your help today,"
	cont "guys."
	
	para "Hopefully me and"
	line "Gramps can find"
	cont "out what these"
	cont "guys are up to."	
	done
	
SilverOutText:
	text "<RIVAL>: See ya"
	line "around, <PLAY_G>!"
	
	para "Don't fall too far"
	line "behind!"
	done

RocketsPlan:
	text "Hmph!"
	
	para "This doesn't"
	line "really matter."
	
	para "TEAM ROCKET is"
	line "already so far"
	cont "along with its"
	cont "plan!"
	
	para "A small setback"
	line "like this means"
	cont "nothing!"
	
	para "You'll soon see"
	line "the fruits of our"
	cont "labor when all"
	cont "#MON are under"
	cont "our control!"
	
	para "Team, retreat!"
	done

GruntM4SeenText:
	text "ARGH! Beaten by"
	line "children?"
	done

GruntM4BeatenText:
	text "Ha! Told ya!"
	done

WeDoWhatWeWantText:
	text "TEAM ROCKET will"
	line "do what it wants!"
	para "You can't stop us!"
	done
	
WeAreAllTrainersText:
	text "<RIVAL>: BLUE,"
	line "<PLAY_G>, and I"
	cont "are all trainers!"
	
	para "We can beat you"
	line "easily!"
	
	para "My #MON are"
	line "stronger than"
	cont "anyone elses!"
	done
	
WellSeeText:
	text "Ha!"
	para "We'll see about"
	line "that!"
	done

BlueProblemText:
	text "BLUE: <PLAY_G>!"
	
	para "It's a good thing"
	line "you and <RIVAL>"
	cont "showed up!"
	
	para "We've got a"
	line "problem!"
	done

OakStopThisText:
	text "OAK: You people"
	line "are hurting these"
	cont "innocent SLOWPOKE!"
	
	para "It's not right to"
	line "cut their TAILs"
	cont "off to sell them"
	cont "for profit!"
	done
	
ElderThisSurfText:
	text "Ah!"
	
	para "Thank you for"
	line "saving the"
	cont "SLOWPOKE!"
	
	para "I am the village"
	line "elder."
	
	para "I was paying"
	line "a visit to the"
	cont "SLOWPOKE when"
	cont "those three thugs"
	cont "appeared."
	
	para "They began cutting"
	line "off the poor "
	cont "SLOWPOKE's tails!"
	
	para "I was about to"
	line "chase them off but"
	cont "you saved me the"
	cont "trouble."
	
	para "I must thank you"
	line "somehow..."
	
	para "Please take this,"
	line "don't be shy, now."
	done
	
ElderThisSurfText2:
	text "That HM contains"
	line "SURF."
	
	para "It will allow your"
	line "you #MON to"
	cont "sail across water."
	
	para "May it serve you"
	line "well."
	
	para "I shall return to"
	line "my house now."
	
	para "Goodbye."
	done

SlowpokeWellB2F_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  8, 15, SLOWPOKE_WELL_B1F, 2

	db 1 ; coord events
	coord_event  9, 10, SCENE_DEFAULT, RocketEncounterScript
	

	db 0 ; bg events

	db 9 ; object events
	object_event 11,  8, SPRITE_SILVER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_RIVAL_BURNED_TOWER
	object_event  9,  8, SPRITE_BLUE, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_RIVAL_BURNED_TOWER
	object_event  8,  8, SPRITE_OAK, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_RIVAL_BURNED_TOWER
	object_event  8,  5, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_RIVAL_BURNED_TOWER
	object_event 12,  5, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_RIVAL_BURNED_TOWER
	object_event 10,  5, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_RIVAL_BURNED_TOWER
	object_event  4,  2, SPRITE_GYM_GUY, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SlowpokeWellB2FGymGuyScript, EVENT_EXPLODING_TRAP_21
	object_event 10,  3, SPRITE_ELDER, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_GOT_HM03_SURF