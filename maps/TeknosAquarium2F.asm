	const_def 2 ; object constants
	const AQUA2F_ROCKET1
	const AQUA2F_ROCKET3
	const AQUA2F_POKEFAN_M
	const AQUA2F_POKEFAN_F
	const AQUA2F_WHITNEY

TeknosAquarium2F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks


TrainerGruntM1:
	trainer GRUNTM, GRUNTM_1, EVENT_BEAT_ROCKET_GRUNTM_1, GruntM1SeenText, GruntM1BeatenText, 0, .Script

.Script:
	clearevent WHITNEY_DEFEATS_ROCKETS
	opentext
	writetext TrainerGruntM1WhenTalkText
	waitbutton
	closetext
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	disappear AQUA2F_ROCKET1
	disappear AQUA2F_ROCKET3
	pause 15
	special FadeInQuickly
	clearflag ENGINE_ROCKETS_IN_MAHOGANY
	pause 8
	special PlayMapMusic
	setevent EVENT_MAHOGANY_TOWN_POKEFAN_M_BLOCKS_GYM; this is the event for the rocket objects
	setevent EVENT_BURNED_TOWER_MORTY
	setevent EVENT_WHITNEY_BACK_IN_GYM
	setevent WHITNEY_FIGHTING_ROCKETS
	appear AQUA2F_WHITNEY
	applymovement AQUA2F_WHITNEY, WhitneyToPlayerAfterRocket
	turnobject AQUA2F_WHITNEY, UP
	turnobject PLAYER, DOWN
	opentext
	writetext WhitneyWayToGoText
	waitbutton
	closetext
	applymovement AQUA2F_WHITNEY, WhitneyAwayfromPlayerAfterRocket
	disappear AQUA2F_WHITNEY
	setevent WHITNEY_DEFEATS_ROCKETS
	end
	
	
WhitneyToPlayerAfterRocket:
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step_end
	
WhitneyAwayfromPlayerAfterRocket:
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step_end

TrainerGruntM3:
	trainer GRUNTM, GRUNTM_3, EVENT_BEAT_ROCKET_GRUNTM_3, GruntM3SeenText, GruntM3BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM3AfterBattleText
	waitbutton
	closetext
	end

AquaPokefanMScript:
	faceplayer
	opentext
	checkevent EVENT_MAHOGANY_TOWN_POKEFAN_M_BLOCKS_GYM
	iftrue .PokefanMNoRockets
	writetext AquaPokefanMRocketsText
	waitbutton
	closetext
	end

.PokefanMNoRockets:
	writetext AquaPokefanMNoRocketsText
	waitbutton
	closetext
	end
	
AquaPokefanFScript:
	faceplayer
	opentext
	checkevent EVENT_MAHOGANY_TOWN_POKEFAN_M_BLOCKS_GYM
	iftrue .PokefanFNoRockets
	writetext AquaPokefanFRocketsText
	waitbutton
	closetext
	end

.PokefanFNoRockets:
	writetext AquaPokefanFNoRocketsText
	waitbutton
	closetext
	end
	
Aqua2FExhibit1Script:
	jumptext Aqua2FExhibit1Text

Aqua2FExhibit2Script:
	jumptext Aqua2FExhibit2Text
	
Aqua2FExhibit3Script:
	jumptext Aqua2FExhibit3Text
	
Aqua2FExhibit1Text:
	text "GUPGOLD are among"
	line "the smallest of"
	para "all aquatic"
	line "#MON."
	done

WhitneyWayToGoText:
	text "Way to go"
	line "<PLAY_G>!"
	
	para "You really showed"
	line "them who's boss!"
	
	para "TEAM ROCKET won't"
	line "hurt any of these"
	cont "aquatic #MON"
	cont "anymore."
	
	para "Hey..."
	
	para "You're actually"
	line "pretty strong!"

	para "Why don't you come"
	line "to my GYM later?"
	
	para "I would love to"
	line "battle you!"
	
	para "Speaking of which,"
	line "I better get back"
	cont "to the GYM."
	
	para "See ya!"
	done
	

Aqua2FExhibit2Text:
	text "NEW EXHIBIT COMING"
	line "SOON"
	done
	
Aqua2FExhibit3Text:
	text "TURBAN can survive"
	line "on both land and"
	cont "fully underwater."
	para "It has a unique"
	line "relationship with"
	cont "the SLOWPOKE line."
	done

GruntM1SeenText:
	text "What do you want?"

	para "If you interrupt"
	line "our work, don't"
	cont "expect any mercy!"
	done

GruntM1BeatenText:
	text "You did OK today,"
	line "but wait till next"
	cont "time!"
	done

TrainerGruntM1WhenTalkText:
	text "Drat!"
	para "I can't beleive"
	line "our plan was"
	cont "foiled by a kid!"

	para "This is"
	line "embarrassing..."

	para "But no matter."
	
	para "There are plenty "
	line "of other avenues"
	cont "for us to fund"
	cont "our operations."

	para "You haven't seen"
	line "the last of us!"
	done
	

GruntM3SeenText:
	text "We'll show you"
	line "how scary we are!"
	done

GruntM3BeatenText:
	text "Too strong! We"
	line "must watch you…"
	done

GruntM3AfterBattleText:
	text "You're too strong."

	para "Our plan for here"
	line "isn't the most"
	para "important part of"
	line "our plan."
	para "You're merely a"
	line "distraction."
	done
	
AquaPokefanMRocketsText:
	text "I reckon these"
	line "troublemakers do"
	cont "not belong here."
	done
	
AquaPokefanMNoRocketsText:
	text "Were those guys"
	line "part of TEAM"
	cont "ROCKET?"
	para "I thought they'd"
	line "been taken care"
	cont "of last year."
	done
	
AquaPokefanFRocketsText:
	text "Oh dear, so much"
	line "for a peaceful"
	cont "day."
	done
	
AquaPokefanFNoRocketsText:
	text "I've never been"
	line "a huge fan of"
	cont "fish anyways."
	done

TeknosAquarium2F_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  0,  7, TEKNOS_AQUARIUM_1F, 3

	db 0 ; coord events

	db 3 ; bg events
	bg_event  3,  3, BGEVENT_READ, Aqua2FExhibit1Script
	bg_event  7,  3, BGEVENT_READ, Aqua2FExhibit2Script
	bg_event 11,  3, BGEVENT_READ, Aqua2FExhibit3Script

	db 5 ; object events
	object_event 15,  4, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 0, TrainerGruntM1, EVENT_MAHOGANY_TOWN_POKEFAN_M_BLOCKS_GYM
	object_event  5,  4, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 4, TrainerGruntM3, EVENT_MAHOGANY_TOWN_POKEFAN_M_BLOCKS_GYM
	object_event  7,  6, SPRITE_POKEFAN_M, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, AquaPokefanMScript, -1
	object_event 10,  4, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_RIGHT, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, AquaPokefanFScript, -1
	object_event  9,  5, SPRITE_WHITNEY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, WhitneyAquariumScript, WHITNEY_DEFEATS_ROCKETS
