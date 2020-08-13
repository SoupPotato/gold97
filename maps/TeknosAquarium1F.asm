	const_def 2 ; object constants
	const AQUA1F_RECEPTIONIST
	const AQUA1F_ROCKET2
	const AQUA1F_ROCKETF1
	const AQUA1F_YOUNGSTER
	const AQUA1F_LASS
	const AQUA1F_WHITNEY
	const AQUA1F_ROCKET3
	const AQUA1F_ROCKETF2
	const AQUA1F_ROCKET4
	const AQUA1F_ROCKETF22 ;fighting whitney
	const AQUA1F_ROCKET42 ;fighting whitney

TeknosAquarium1F_MapScripts:
	db 1 ; scene scripts
	scene_script .SceneWhitneyEnters 

	db 0 ; callbacks
	

.SceneWhitneyEnters:
	priorityjump .WhitneyEntersEvent
	end	


.WhitneyEntersEvent
	pause 15
	playsound SFX_ENTER_DOOR
	moveobject AQUA1F_WHITNEY, 13, 7
	appear AQUA1F_WHITNEY
	turnobject AQUA1F_WHITNEY, UP
	applymovement AQUA1F_WHITNEY, WhitneyDummyMovement
	pause 15
	applymovement AQUA1F_WHITNEY, WhitneyToCenter
	opentext
	writetext WhitneyThisisTerribleText
	waitbutton
	closetext
	pause 6
	turnobject AQUA1F_WHITNEY, RIGHT
	pause 6
	turnobject AQUA1F_WHITNEY, UP
	pause 6
	turnobject AQUA1F_WHITNEY, DOWN
	pause 6
	showemote EMOTE_SHOCK, AQUA1F_WHITNEY, 15
	applymovement AQUA1F_WHITNEY, WhitneyToPlayer
	opentext
	writetext WhitneyIRememberYouText
	waitbutton
	closetext
	applymovement AQUA1F_WHITNEY, WhitneyToRockets
	showemote EMOTE_SHOCK, AQUA1F_ROCKET3, 15
	turnobject AQUA1F_WHITNEY, UP
	applymovement AQUA1F_ROCKET4, RocketMtoWhitney
	turnobject AQUA1F_ROCKET4, UP
	turnobject AQUA1F_WHITNEY, DOWN
	applymovement AQUA1F_ROCKETF2, RocketFtoWhitney
	turnobject AQUA1F_WHITNEY, LEFT
	opentext
	writetext WhitneyWontGoEasyOnYouText
	waitbutton
	closetext
	appear AQUA1F_ROCKETF22
	appear AQUA1F_ROCKET42
	disappear AQUA1F_ROCKETF2
	disappear AQUA1F_ROCKET4
	setscene SCENE_AQUARIUM_ROCKET_TAKEOVER_1F_NOTHING
	clearevent WHITNEY_FIGHTING_ROCKETS
	setevent EVENT_AQUARIUM_ROCKETS_IDLE
	end

	
WhitneyDummyMovement:
	step_end
	
	
WhitneyToCenter:
	step UP
	step UP
	step LEFT
	step_end
	
WhitneyToPlayer:
	step DOWN
	step_end
	
WhitneyToRockets:
	step UP
	step LEFT
	step LEFT
	step_end
	
RocketMtoWhitney:
	big_step RIGHT
	big_step RIGHT
	step RIGHT
	step_end
	
RocketFtoWhitney:
	big_step RIGHT
	big_step RIGHT
	step_end

TrainerGruntM2:
	trainer GRUNTM, GRUNTM_2, EVENT_BEAT_ROCKET_GRUNTM_2, GruntM2SeenText, GruntM2BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM2AfterBattleText
	waitbutton
	closetext
	end
	
TrainerGruntF1:
	trainer GRUNTF, GRUNTF_1, EVENT_BEAT_ROCKET_GRUNTF_1, GruntF1SeenText, GruntF1BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntF1AfterBattleText
	waitbutton
	closetext
	end
	
AquaReceptionistScript:
	faceplayer
	opentext
	checkevent EVENT_MAHOGANY_TOWN_POKEFAN_M_BLOCKS_GYM
	iftrue .ReceptionistNoRockets
	writetext AquaReceptionistRocketsText
	waitbutton
	closetext
	end

.ReceptionistNoRockets:
	writetext AquaReceptionistNoRocketsText
	waitbutton
	closetext
	end
	
AquaYoungsterScript:
	faceplayer
	opentext
	checkevent EVENT_MAHOGANY_TOWN_POKEFAN_M_BLOCKS_GYM
	iftrue .YoungsterNoRockets
	writetext AquaYoungsterRocketsText
	waitbutton
	closetext
	end

.YoungsterNoRockets:
	writetext AquaYoungsterNoRocketsText
	waitbutton
	closetext
	end
	
AquaLassScript:
	faceplayer
	opentext
	checkevent EVENT_MAHOGANY_TOWN_POKEFAN_M_BLOCKS_GYM
	iftrue .LassNoRockets
	writetext AquaLassRocketsText
	waitbutton
	closetext
	end

.LassNoRockets:
	writetext AquaLassNoRocketsText
	waitbutton
	closetext
	end
	
Aqua1FExhibit1Script:
	jumptext Aqua1FExhibit1Text
	
Aqua1FExhibit2Script:
	jumptext Aqua1FExhibit2Text
	
Aqua1FExhibit3Script:
	jumptext Aqua1FExhibit3Text
	
Aqua1FExhibit4Script:
	jumptext Aqua1FExhibit4Text
	
WhitneyAquariumScript:
	jumptext WhitneyIwillHandlethisText
	
RocketGruntWhitney1Script:
	jumptext RocketGruntWhitney1Text
	
RocketGruntWhitney2Script:
	jumptext RocketGruntWhitney2Text
	
RocketGruntWhitney3Script:
	jumptext RocketGruntWhitney3Text
	
Aqua1FExhibit1Text:
	text "KRABBY like to"
	line "hide under sand."
	para "Look closely to"
	line "find the burrowed"
	cont "#MON."
	done
	
Aqua1FExhibit2Text:
	text "NEW EXHIBIT COMING"
	line "SOON"
	done

Aqua1FExhibit3Text:
	text "CORASUN and"
	line "MAGIKARP can"
	para "peacefully share"
	line "the same living"
	cont "space."
	para "These #MON"
	line "often inhabit"
	cont "the same waters."
	done
	
GruntM2SeenText:
	text "We're gonna come"
	line "in here, take what"
	para "we want, and sell"
	line "it off!"
	para "We need the money,"
	line "cause we've got"
	cont "big plans, kid!"
	done
	
Aqua1FExhibit4Text:
	text "LAPRAS STATUE"
	para "Occasional reports"
	line "have claimed that"
	para "LAPRAS can be"
	line "found living deep"
	para "in the MINE west"
	line "of town."
	done

GruntM2BeatenText:
	text "Just…"
	line "Too strong…"
	done

GruntM2AfterBattleText:
	text "You'll be seeing"
	line "more of us!"
	done
	

AquaReceptionistRocketsText:
	text "Be careful! Kids"
	line "shouldn't be here"
	cont "right now."
	para "We're having an"
	line "issue with"
	para "dangerous criminal"
	line "activity here."
	done

AquaReceptionistNoRocketsText:
	text "Welcome to the"
	line "TEKNOS CITY"
	cont "AQUARIUM!"
	para "Please feel free"
	line "to look around."
	done

GruntF1SeenText:
	text "This place has"
	line "rare #MON that"
	para "we can steal and"
	line "sell off!"
	para "Don't get in our"
	line "way, kid!"
	done
	
WhitneyThisisTerribleText:
	text "Oh no!"
	line "This is terrible!"
	done
	
WhitneyIRememberYouText:
	text "Hey! I remember"
	line "you from the MINE!"
	
	para "Listen..."
	
	para "TEAM ROCKET are"
	line "trying to take"
	cont "the AQUARIUM!"
	
	para "Those meanies!"
	
	para "As GYM LEADER,"
	line "I cannot allow it."
	
	para "Can you help me"
	line "fight them off?"
	
	para "Their commander"
	line "must be on the"
	cont "2nd Floor..."
	
	para "Lets get 'em!"
	done
	
WhitneyWontGoEasyOnYouText:
	text "...giggle..."
	
	para "Don't expect me to"
	line "go easy on you"
	cont "just because I'm"
	cont "a cutie!"
	done
	
WhitneyIwillHandlethisText:
	text "I'll handle these"
	line "jerks..."
	
	para "You go after the"
	line "commander!"
	done

GruntF1BeatenText:
	text "You rotten brat!"
	done

GruntF1AfterBattleText:
	text "TEAM ROCKET won't"
	line "forget this!"
	done
	
AquaYoungsterRocketsText:
	text "Hmm… I don't"
	line "think these guys"
	para "in black are"
	line "supposed to be"
	cont "here…"
	done

AquaYoungsterNoRocketsText:
	text "I was hoping I'd"
	line "see an ANCHORAGE"
	para "in person, but"
	line "there isn't one"
	cont "here."
	done
	
AquaLassRocketsText:
	text "Eeek!"
	para "Oh, you're not"
	line "with them."
	para "These people here"
	line "are scaring me."
	para "I should probably"
	line "leave."
	done

AquaLassNoRocketsText:
	text "This AQUARIUM is"
	line "pretty new."
	para "They don't have"
	line "too many exhibits"
	cont "yet."
	done
	
RocketGruntWhitney1Text:
	text "Get lost, brat!"
	done
	
RocketGruntWhitney2Text:
	text "Who do you think"
	line "you are?"
	
	para "Find your own"
	line "place to rob!"
	done
	
RocketGruntWhitney3Text:
	text "Gah!"
	
	para "She's cute but she"
	line "is tough!"
	
	para "Especially that"
	line "MILTANK."
	done

TeknosAquarium1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event 12,  7, TEKNOS_CITY, 5
	warp_event 13,  7, TEKNOS_CITY, 6
	warp_event  0,  7, TEKNOS_AQUARIUM_2F, 1

	db 0 ; coord events

	db 4 ; bg events
	bg_event  1,  3, BGEVENT_READ, Aqua1FExhibit1Script
	bg_event  7,  3, BGEVENT_READ, Aqua1FExhibit2Script
	bg_event 10,  3, BGEVENT_READ, Aqua1FExhibit3Script
	bg_event  4,  1, BGEVENT_READ, Aqua1FExhibit4Script


	db 11 ; object events
	object_event 15,  5, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, AquaReceptionistScript, -1
	object_event  7,  4, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerGruntM2, EVENT_MAHOGANY_TOWN_POKEFAN_M_BLOCKS_GYM
	object_event  5,  7, SPRITE_ROCKET_GIRL, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerGruntF1, EVENT_MAHOGANY_TOWN_POKEFAN_M_BLOCKS_GYM
	object_event 13,  2, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, AquaYoungsterScript, -1
	object_event  3,  5, SPRITE_LASS, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, AquaLassScript, -1
	object_event 10,  5, SPRITE_WHITNEY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, WhitneyAquariumScript, WHITNEY_FIGHTING_ROCKETS
	object_event 10,  4, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RocketGruntWhitney1Script, EVENT_MAHOGANY_TOWN_POKEFAN_M_BLOCKS_GYM
	object_event  7,  5, SPRITE_ROCKET_GIRL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, RocketGruntWhitney2Script, EVENT_AQUARIUM_ROCKETS_IDLE
	object_event  7,  6, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RocketGruntWhitney3Script, EVENT_AQUARIUM_ROCKETS_IDLE
	object_event  9,  5, SPRITE_ROCKET_GIRL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, RocketGruntWhitney2Script, WHITNEY_FIGHTING_ROCKETS
	object_event 10,  6, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RocketGruntWhitney3Script, WHITNEY_FIGHTING_ROCKETS
