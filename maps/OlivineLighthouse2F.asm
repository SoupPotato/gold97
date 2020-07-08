	const_def 2 ; object constants
	const AQUA2F_ROCKET1
	const AQUA2F_ROCKET3
	const AQUA2F_POKEFAN_M
	const AQUA2F_POKEFAN_F

OlivineLighthouse2F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks


TrainerGruntM1:
	trainer GRUNTM, GRUNTM_1, EVENT_BEAT_ROCKET_GRUNTM_1, GruntM1SeenText, GruntM1BeatenText, 0, .Script

.Script:
	opentext
	writetext TrainerGruntM1WhenTalkText
	waitbutton
	closetext
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	disappear AQUA2F_ROCKET1
	pause 15
	special FadeInQuickly
	pause 30
	setevent EVENT_MAHOGANY_TOWN_POKEFAN_M_BLOCKS_GYM; this is the event for the rocket objects
	setevent EVENT_BURNED_TOWER_MORTY
	setevent EVENT_WHITNEY_BACK_IN_GYM
	clearflag ENGINE_ROCKETS_IN_MAHOGANY
	special FadeOutPalettes
	special HealParty
	pause 15
	warp ECRUTEAK_CITY, 6, 28
	end

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
	text "KINGOLD are among"
	line "the smallest of"
	para "all aquatic"
	line "#MON."
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
	text "Yeah, TEAM ROCKET"
	line "was broken up"
	cont "a year ago."

	para "But we continued"
	line "our activities"
	cont "underground."

	para "Now you can have"
	line "fun watching us"
	cont "stir up trouble!"
	
	para "We don't need this"
	line "place! There are"
	para "plenty of other"
	line "avenues for us to"
	cont "make some money."
	para "Our ambitions are"
	line "bigger than cash,"
	cont "though!"
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

OlivineLighthouse2F_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  0,  7, OLIVINE_LIGHTHOUSE_1F, 3

	db 0 ; coord events

	db 3 ; bg events
	bg_event  3,  3, BGEVENT_READ, Aqua2FExhibit1Script
	bg_event  7,  3, BGEVENT_READ, Aqua2FExhibit2Script
	bg_event 11,  3, BGEVENT_READ, Aqua2FExhibit3Script

	db 4 ; object events
	object_event 15,  4, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 0, TrainerGruntM1, EVENT_MAHOGANY_TOWN_POKEFAN_M_BLOCKS_GYM
	object_event  5,  4, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 4, TrainerGruntM3, EVENT_MAHOGANY_TOWN_POKEFAN_M_BLOCKS_GYM
	object_event  7,  6, SPRITE_POKEFAN_M, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, AquaPokefanMScript, -1
	object_event 10,  4, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_RIGHT, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, AquaPokefanFScript, -1
