	const_def 2 ; object constants
	const TEAMROCKETBASEB1F_POKE_BALL1
	const TEAMROCKETBASEB1F_POKE_BALL2
	const TEAMROCKETBASEB1F_POKE_BALL3
	const TEAMROCKETBASEB1F_GRUNT1
	const TEAMROCKETBASEB1F_GRUNT2
	const TEAMROCKETBASEB1F_GRUNT3
	const TEAMROCKETBASEB1F_GRUNT4
	const TEAMROCKETBASEB1F_GRUNT5
	const TEAMROCKETBASEB1F_IMPOSTER
	const TEAMROCKETBASEB1F_EXECUTIVE
	const TEAMROCKETBASEB1F_OKERA
	const TEAMROCKETBASEB1F_IMPOSTER2
	const TEAMROCKETBASEB1F_OKERA2

TeamRocketBaseB2FOffice_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .ImposterandOkera
	
.ImposterandOkera
	checkevent EVENT_OKERA_AT_BASE
	iftrue .fighting
	return
	
.fighting
	appear TEAMROCKETBASEB1F_OKERA2
	appear TEAMROCKETBASEB1F_IMPOSTER2
	return
	

TeamRocketBaseB2FOfficeHyperPotion:
	itemball HYPER_POTION

TeamRocketBaseB2FOfficeNugget:
	itemball NUGGET

TeamRocketBaseB2FOfficeGuardSpec:
	itemball GUARD_SPEC

TeamRocketBaseB2FOfficeHiddenRevive:
	hiddenitem REVIVE, EVENT_TEAM_ROCKET_BASE_B1F_HIDDEN_REVIVE
	
RocketBossRoomGrunt1:
	jumptextfaceplayer RocketBossRoomGrunt1Text

RocketBossRoomGrunt2:
	jumptextfaceplayer RocketBossRoomGrunt2Text

RocketBossRoomGrunt3:
	jumptextfaceplayer RocketBossRoomGrunt3Text

RocketBossRoomGrunt4:
	jumptextfaceplayer RocketBossRoomGrunt4Text

RocketBossRoomGrunt5:
	jumptextfaceplayer RocketBossRoomGrunt5Text
	
ImposterScript:
	jumptext ImposterFighting
	
OkeraScript:
	jumptext OkeraFighting
	
	
ImposterConfrontationScene:
	showemote EMOTE_SHOCK, TEAMROCKETBASEB1F_IMPOSTER, 15
	turnobject PLAYER, UP
	applymovement PLAYER, PlayerStepsBack
	applymovement TEAMROCKETBASEB1F_IMPOSTER, ImposterStepsToPlayer
	jump ConfrontationScript
	end
	
ImposterConfrontationScene2:
	showemote EMOTE_SHOCK, TEAMROCKETBASEB1F_IMPOSTER, 15
	applymovement TEAMROCKETBASEB1F_IMPOSTER, ImposterStepsToPlayer
	turnobject PLAYER, UP
	jump ConfrontationScript
	end
	
ExecutiveConfrontationScene:
	applymovement PLAYER, PlayerWalksToExecutive
	jump ExecutiveScript
	end
	
ExecutiveConfrontationScene2:
	applymovement PLAYER, PlayerWalksToExecutive2
	jump ExecutiveScript
	end
	
ExecutiveConfrontationScene3:
	applymovement PLAYER, PlayerWalksToExecutive3
	jump ExecutiveScript
	end
	
ConfrontationScript:
	opentext
	writetext ImposterConfront
	waitbutton
	closetext
	winlosstext Imposter2WinText, Imposter2LossText
	loadtrainer SABRINA, SABRINA2
	startbattle
	reloadmapafterbattle	
	opentext
	writetext ImposterConfront2
	waitbutton
	closetext
	setevent EVENT_IMPOSTER_FIGHTING_OKERA_2
	clearevent EVENT_IMPOSTER_FIGHTING_OKERA
	moveobject TEAMROCKETBASEB1F_OKERA, 9, 9
	appear TEAMROCKETBASEB1F_OKERA
	applymovement TEAMROCKETBASEB1F_OKERA, OkeraRuns
	turnobject TEAMROCKETBASEB1F_IMPOSTER, RIGHT
	playsound SFX_TACKLE
	applymovement TEAMROCKETBASEB1F_IMPOSTER, OkeraBumpsIntoImposter	
	opentext
	writetext OkeraWatchIt
	waitbutton
	closetext
	showemote EMOTE_SHOCK, TEAMROCKETBASEB1F_OKERA, 15
	opentext
	writetext OkeraConfront
	waitbutton
	closetext
	turnobject TEAMROCKETBASEB1F_OKERA, DOWN
	opentext
	writetext OkeraConfront2
	waitbutton
	closetext
	applymovement TEAMROCKETBASEB1F_OKERA, OkeratoImposter
	appear TEAMROCKETBASEB1F_OKERA2
	disappear TEAMROCKETBASEB1F_OKERA
	appear TEAMROCKETBASEB1F_IMPOSTER2
	disappear TEAMROCKETBASEB1F_IMPOSTER
	setscene SCENE_EXECUTIVE
	end
	
ExecutiveScript:
	pause 10
	opentext
	writetext TheExecutiveGreeting
	waitbutton
	closetext
	winlosstext ExecutiveWinText, ExecutiveLossText
	loadtrainer EXECUTIVEM, EXECUTIVEM_2
	startbattle
	reloadmapafterbattle
	opentext
	writetext ExecutiveSceneAfterBattleText
	waitbutton
	closetext
	applymovement TEAMROCKETBASEB1F_EXECUTIVE, ExecutiveLeavesOffice
	turnobject PLAYER, DOWN
	disappear TEAMROCKETBASEB1F_EXECUTIVE
	disappear TEAMROCKETBASEB1F_OKERA2
	disappear TEAMROCKETBASEB1F_IMPOSTER2
	pause 15
	turnobject PLAYER, UP
	pause 15
	showemote EMOTE_SHOCK, PLAYER, 15
	applymovement PLAYER, NoticeComputer
	turnobject PLAYER, UP
	opentext
	writetext ComputerIsOn
	waitbutton
	closetext
	setevent EVENT_IMPOSTER_FIGHTING_OKERA
	clearevent EVENT_OKERA_AT_BASE
	setevent EVENT_TEAM_ROCKET_BASE_B2F_ELECTRODE_1
	setscene SCENE_TEAMROCKETBASEB1F_NOTHING
	end
	
TeamRocketBaseB2FOfficePassword:
	opentext
	writetext BadSecurityPractices
	waitbutton
	closetext
	setevent EVENT_ROUTE_30_BATTLE
	end
	
PlayerStepsUpToImposter:
	step UP
	step_end
	
NoticeComputer:
	step RIGHT
	step RIGHT
	step_end
	
ImposterStepsToPlayer:
	step DOWN
	step_end
	
PlayerStepsBack:
	fix_facing
	step DOWN
	remove_fixed_facing
	step_end
	
OkeraRuns:
	big_step DOWN
	big_step DOWN
	big_step DOWN
	big_step LEFT
	step_end
	
OkeraBumpsIntoImposter:
	fix_facing
	fast_jump_step LEFT
	remove_fixed_facing
	step_end
	
OkeratoImposter:
	step LEFT
	step LEFT
	step_end
	
PlayerWalksToExecutive:
	step UP
	step UP
	step UP
	step RIGHT
	step UP
	step_end

PlayerWalksToExecutive2:
	step UP
	step UP
	step UP
	step UP
	step_end
	
PlayerWalksToExecutive3:
	step UP
	step UP
	step UP
	step LEFT
	step UP
	step_end

ExecutiveLeavesOffice:
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step DOWN
	big_step DOWN
	big_step DOWN
	big_step DOWN
	big_step RIGHT
	big_step RIGHT
	big_step DOWN
	big_step DOWN
	big_step DOWN
	big_step DOWN
	step_end
	
ComputerIsOn:
	text "Looks like theres"
	line "something still"
	cont "on the computer"
	cont "screen..."
	done
	
RocketBossRoomGrunt1Text:
	text "This is the final"
	line "preparation"
	para "meeting before our"
	line "machine becomes"
	cont "fully functional."
	para "I'm sure there"
	line "isn't anything"
	para "that can get in"
	line "the way of our"
	cont "plan now!"
	done
	
RocketBossRoomGrunt2Text:
	text "IMPOSTER OAK did a"
	line "great job"
	para "convincing the"
	line "people of STAND"
	para "CITY to not worry"
	line "about our"
	cont "operations here."
	done
	
RocketBossRoomGrunt3Text:
	text "The EXECUTIVE is"
	line "the only person"
	para "who knows the"
	line "password to shut"
	para "down the mind"
	line "control antenna."
	para "He can also be"
	line "very forgetful…"
	done
	
RocketBossRoomGrunt4Text:
	text "The world won't"
	line "know what hit them"
	para "when our machine"
	line "is at full power"
	para "and we summon all"
	line "of their #MON"
	cont "to do our work!"
	done
	
RocketBossRoomGrunt5Text:
	text "According to my"
	line "calculations, the"
	para "mind control"
	line "signal should be"
	para "at full strength"
	line "within the next"
	cont "week!"
	done
	
BadSecurityPractices:
	text "What's this?"
	
	para "It's the password"
	line "to the console!"
	
	para "…"
	
	para "<PLAY_G>"
	line "remembered the"
	cont "password!"
	done
	
ExecutiveSceneAfterBattleText:
	text "Argh!"
	para "You may have"
	line "defeated me in"
	cont "battle, but that"
	cont "means little now."
	
	para "Our machine is"
	line "inching ever"
	cont "closer to full"
	cont "power!"
	
	para "Soon, even your"
	line "#MON will be"
	cont "under our control!"

	para "Now if you'll"
	line "excuse me,"
	
	para "I've got some very"
	line "urgent business to"
	cont "attend to!"
	done
	
ExecutiveWinText:
	text "I can't believe"
	line "this!"
	done
	
ExecutiveLossText:
	text "HA!"
	done
	
Imposter2WinText:
	text "W-what!?"
	line "H-how!?"
	done
	
Imposter2LossText:
	text "HA!"
	done
	
TheExecutiveGreeting:
	text "Do you understand"
	line "what you've gotten"
	cont "yourself into?"
	
	para "…"
	
	para "You remember me,"
	line "right?"
	
	para "I was the CAPTAIN"
	line "of our cargo ship."
	
	para "But primarily, I'm"
	line "the lead EXECUTIVE"
	cont "of TEAM ROCKET."
	
	para "Second only to our"
	line "leader, GIOVANNI."
	
	para "So you've figured"
	line "out what we are"
	cont "up to?"
	
	para "We've built a"
	line "radio device that"
	cont "can be used to"
	cont "control the minds"
	cont "of #MON!"
	
	para "In other words,"
	line "to control them"
	cont "for TEAM ROCKET!"

	para "We'll make better"
	line "use of them than"
	cont "anyone else!"
	
	para "I refuse to let"
	line "you get in the way"
	cont "of TEAM ROCKET any"
	cont "longer!"
	done
	
	
ImposterConfront:
	text "You little skunk!"

	para "I knew you were"
	line "strong,..."
	
	para "But to defeat all"
	line "of our guards?"
	
	para "Unacceptable!"
	
	para "I will end your"
	line "little crusade"
	cont "here!"
	
	para "This time I wont"
	line "hold back!"
	done
	
ImposterConfront2:
	text "No!"

	para "I will not accept"
	line "this!"
	
	para "You may still not"
	line "have the password,"
	
	para "But I'm done taking"
	line "any chances."
	
	para "The EXECUTIVE wont"
	line "be disturbed."
	
	para "I will remove you"
	line "by any means..."
	done
	
OkeraWatchIt:	
	text "OKERA: Hey!"
	line "Watch it!"
	done
	
OkeraConfront:
	text "You!"

	para "I been lookin'"
	line "for you gramps!"
	
	para "Make'n a signal"
	line "in my town,"
	
	para "Disruptin' my"
	line "peaceful, quiet"
	cont "life..."
	
	para "You've got a lotta"
	line "nerve!"
	done
	
OkeraConfront2:
	text "Hey kid!"
	
	para "I'll take care of"
	line "gramps here."
	
	para "You go on ahead."
	done
	
ImposterFighting:
	text "...ugh."
	
	para "Our plans will"
	line "proceed..."
	done
	
OkeraFighting:
	text "You think you're"
	line "tough, gramps?"
	done

TeamRocketBaseB2FOffice_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 24, 17, TEAM_ROCKET_BASE_B2F, 4
	warp_event 25, 17, TEAM_ROCKET_BASE_B2F, 5

	db 5 ; coord events
	coord_event  7, 12, SCENE_DEFAULT, ImposterConfrontationScene
	coord_event  7, 13, SCENE_DEFAULT, ImposterConfrontationScene2
	coord_event  3,  8, SCENE_EXECUTIVE, ExecutiveConfrontationScene
	coord_event  4,  8, SCENE_EXECUTIVE, ExecutiveConfrontationScene2
	coord_event  5,  8, SCENE_EXECUTIVE, ExecutiveConfrontationScene3


	db 3 ; bg events
	bg_event  9,  1, BGEVENT_ITEM, TeamRocketBaseB2FOfficeHiddenRevive
	bg_event  6,  1, BGEVENT_READ, TeamRocketBaseB2FOfficePassword
	bg_event  7,  1, BGEVENT_READ, TeamRocketBaseB2FOfficePassword


	db 13 ; object events
	object_event  9, 16, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, TeamRocketBaseB2FOfficeHyperPotion, EVENT_TEAM_ROCKET_BASE_B1F_HYPER_POTION
	object_event 16,  1, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, TeamRocketBaseB2FOfficeNugget, EVENT_TEAM_ROCKET_BASE_B1F_NUGGET
	object_event 24,  1, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, TeamRocketBaseB2FOfficeGuardSpec, EVENT_TEAM_ROCKET_BASE_B1F_GUARD_SPEC
	object_event 21,  3, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 1, RocketBossRoomGrunt1, EVENT_BLACKTHORN_CITY_SUPER_NERD_DOES_NOT_BLOCK_GYM
	object_event 28,  6, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_LEFT, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 1, RocketBossRoomGrunt2, EVENT_BLACKTHORN_CITY_SUPER_NERD_DOES_NOT_BLOCK_GYM
	object_event 22, 10, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_UP, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 1, RocketBossRoomGrunt3, EVENT_BLACKTHORN_CITY_SUPER_NERD_DOES_NOT_BLOCK_GYM
	object_event 19,  7, SPRITE_ROCKET_GIRL, SPRITEMOVEDATA_STANDING_RIGHT, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 1, RocketBossRoomGrunt4, EVENT_BLACKTHORN_CITY_SUPER_NERD_DOES_NOT_BLOCK_GYM
	object_event 25,  3, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 1, RocketBossRoomGrunt5, EVENT_BLACKTHORN_CITY_SUPER_NERD_DOES_NOT_BLOCK_GYM
	object_event  7, 11, SPRITE_SURGE, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 1, ImposterScript,  EVENT_IMPOSTER_FIGHTING_OKERA_2
	object_event  4,  1, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 1, ObjectEvent, EVENT_TEAM_ROCKET_BASE_B2F_ELECTRODE_1
	object_event -4, -4, SPRITE_CHUCK, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, OkeraScript, -1
	object_event  5, 12, SPRITE_SURGE, SPRITEMOVEDATA_STANDING_RIGHT, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 1, ImposterScript, EVENT_IMPOSTER_FIGHTING_OKERA
	object_event  6, 12, SPRITE_CHUCK, SPRITEMOVEDATA_STANDING_LEFT, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, OkeraScript, EVENT_IMPOSTER_FIGHTING_OKERA
