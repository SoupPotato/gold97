	const_def 2 ; object constants
	const VICTORYROAD_POKE_BALL1
	const VICTORYROAD_POKE_BALL2
	const VICTORYROAD_POKE_BALL3
	const VICTORYROAD_POKE_BALL4
	const VICTORYROAD_POKE_BALL5
	const VICTORYROAD_COOLTRAINER_M
	const VICTORYROAD_COOLTRAINER_M2
	const VICTORYROAD_COOLTRAINER_F
	const VICTORYROAD_INSTRUCTOR
	const VICTORYROAD_SWIMMERM
	const VICTORYROAD_SWIMMERF
	const VICTORYROAD_ENGINEER
	const VICTORYROAD_COOLTRAINER_M3
	const VICTORYROAD_COOLTRAINER_F2

VictoryRoad_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks


VictoryRoadTMEarthquake:
	itemball TM_EARTHQUAKE

VictoryRoadMaxRevive:
	itemball MAX_REVIVE

VictoryRoadFullRestore:
	itemball FULL_RESTORE

VictoryRoadFullHeal:
	itemball FULL_HEAL

VictoryRoadHPUp:
	itemball HP_UP

VictoryRoadHiddenMaxPotion:
	hiddenitem MAX_POTION, EVENT_VICTORY_ROAD_HIDDEN_MAX_POTION

VictoryRoadHiddenFullHeal:
	hiddenitem FULL_HEAL, EVENT_VICTORY_ROAD_HIDDEN_FULL_HEAL

TrainerCooltrainermCody:
	trainer COOLTRAINERM, CODY, EVENT_BEAT_COOLTRAINERM_CODY, CooltrainermCodySeenText, CooltrainermCodyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainermCodyAfterBattleText
	waitbutton
	closetext
	end

TrainerCooltrainermJake:
	trainer COOLTRAINERM, JAKE, EVENT_BEAT_COOLTRAINERM_JAKE, CooltrainermJakeSeenText, CooltrainermJakeBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainermJakeAfterBattleText
	waitbutton
	closetext
	end

TrainerCooltrainerfJoyce:
	trainer COOLTRAINERF, JOYCE, EVENT_BEAT_COOLTRAINERF_JOYCE, CooltrainerfJoyceSeenText, CooltrainerfJoyceBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainerfJoyceAfterBattleText
	waitbutton
	closetext
	end


TrainerInstructorGeoff:
	trainer INSTRUCTOR, GEOFF, EVENT_BEAT_INSTRUCTOR_GEOFF, InstructorGeoffSeenText, InstructorGeoffBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext InstructorGeoffAfterBattleText
	waitbutton
	closetext
	end
	

TrainerSwimmermHarold:
	trainer SWIMMERM, HAROLD, EVENT_BEAT_SWIMMERM_HAROLD, SwimmermHaroldSeenText, SwimmermHaroldBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermHaroldAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmerfLisa:
	trainer SWIMMERF, LISA, EVENT_BEAT_SWIMMERF_LISA, SwimmerfLisaSeenText, SwimmerfLisaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerfLisaAfterBattleText
	waitbutton
	closetext
	end

TrainerEngineerDavidson:
	trainer ENGINEER, DAVIDSON, EVENT_BEAT_ENGINEER_DAVIDSON, EngineerDavidsonSeenText, EngineerDavidsonBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext EngineerDavidsonAfterBattleText
	waitbutton
	closetext
	end

TrainerCooltrainermErick:
	trainer COOLTRAINERM, ERICK, EVENT_BEAT_COOLTRAINERM_ERICK, CooltrainermErickSeenText, CooltrainermErickBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainermErickAfterBattleText
	waitbutton
	closetext
	end


TrainerCooltrainerfQuinn:
	trainer COOLTRAINERF, QUINN, EVENT_BEAT_COOLTRAINERF_QUINN, CooltrainerfQuinnSeenText, CooltrainerfQuinnBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainerfQuinnAfterBattleText
	waitbutton
	closetext
	end

CooltrainermErickSeenText:
	text "Getting tired yet?"
	done

CooltrainermErickBeatenText:
	text "Looks like I'm"
	line "pretty tired."
	done

CooltrainermErickAfterBattleText:
	text "There's still a"
	line "long way to go"
	cont "before the top."
	para "I hear the last"
	line "part is like a"
	cont "maze."
	done


CooltrainermJakeSeenText:
	text "I'm making my"
	line "final preparations"

	para "for the #MON"
	line "LEAGUE."
	done

CooltrainermJakeBeatenText:
	text "I blew it!"
	done

CooltrainermJakeAfterBattleText:
	text "It's going to be"
	line "tough to win at"
	cont "the LEAGUE."

	para "I need to do some"
	line "more training."

	para "I hear that the"
	line "LEAGUE's ELITE"

	para "FOUR are tougher"
	line "than GYM LEADERS."
	done

CooltrainerfJoyceSeenText:
	text "Since you've come"
	line "this far, you must"
	cont "be good."

	para "I'm going to give"
	line "this battle every-"
	cont "thing I've got!"
	done

CooltrainerfJoyceBeatenText:
	text "No! I don't"
	line "believe this!"
	done

CooltrainerfJoyceAfterBattleText:
	text "I've defeated"
	line "eight GYM LEADERS,"

	para "so I was feeling"
	line "confident."

	para "I'll have to try"
	line "harder next time."
	done

InstructorGeoffSeenText:
	text "The trainers here"
	line "are very strong."
	para "Each battle can be"
	line "a good learning"
	cont "experience."
	done
	
InstructorGeoffBeatenText:
	text "I definitely"
	line "learned something"
	cont "here."
	done
	
InstructorGeoffAfterBattleText:
	text "The wild #MON"
	line "here are very"
	cont "strong as well."
	done


SwimmermHaroldSeenText:
	text "You're using a"
	line "#MON to get you"
	cont "through the cave?"
	para "If you were ready"
	line "for the LEAGUE,"
	cont "you'd swim!"
	done

SwimmermHaroldBeatenText:
	text "Glub…"
	done

SwimmermHaroldAfterBattleText:
	text "I guess swimming"
	line "ability doesn't"
	para "mean much in a"
	line "#MON battle."
	done

SwimmerfLisaSeenText:
	text "The water is"
	line "warmer than I'd"
	cont "expected it to be."
	done

SwimmerfLisaBeatenText:
	text "I'm sunk!"
	done

SwimmerfLisaAfterBattleText:
	text "I prefer swimming"
	line "in caves to the"
	cont "outdoors."
	done
	
EngineerDavidsonSeenText:
	text "I'm going to find"
	line "a faster way to"
	para "the summit than"
	line "walking through"
	cont "these caves!"
	done
	
EngineerDavidsonBeatenText:
	text "Maybe I'll just"
	line "walk."
	done
	
EngineerDavidsonAfterBattleText:
	text "You're pretty"
	line "tough."
	para "Don't lose at the"
	line "LEAGUE, or I'll"
	para "feel worse about"
	line "losing to you!"
	done


CooltrainermCodySeenText:
	text "MT.FUJI is very"
	line "large."
	para "You better be pre-"
	line "pared, because"
	para "you're gonna be"
	line "here for a while!"
	done

CooltrainermCodyBeatenText:
	text "Rats! If only I"
	line "had better #-"
	cont "MON!"
	done

CooltrainermCodyAfterBattleText:
	text "This mountain is"
	line "divided into five"
	cont "different parts."
	para "This here is just"
	line "part one!"
	done
	
CooltrainerfQuinnSeenText:
	text "You there!"
	line "Want to battle?"
	done

CooltrainerfQuinnBeatenText:
	text "Down and out…"
	done

CooltrainerfQuinnAfterBattleText:
	text "You're strong."

	para "You obviously must"
	line "have trained hard."
	done


VictoryRoad_MapEvents:
	db 0, 0 ; filler

	db 9 ; warp events
	warp_event  8, 51, CROWN_CITY, 5
	warp_event  4, 41, VICTORY_ROAD_OUTSIDE, 1
	warp_event  4, 33, VICTORY_ROAD_OUTSIDE, 2
	warp_event 26, 23, VICTORY_ROAD_OUTSIDE, 3
	warp_event 24, 15, VICTORY_ROAD_OUTSIDE, 4
	warp_event  8,  3, VICTORY_ROAD_OUTSIDE, 5
	warp_event 34, 25, VICTORY_ROAD, 8
	warp_event 34, 42, VICTORY_ROAD, 7
	warp_event 31,  2, VICTORY_ROAD_2F, 5

	db 0 ; coord events

	db 2 ; bg events
	bg_event 37, 33, BGEVENT_ITEM, VictoryRoadHiddenMaxPotion
	bg_event 19, 44, BGEVENT_ITEM, VictoryRoadHiddenFullHeal

	db 14 ; object events
	object_event 34,  2, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, VictoryRoadTMEarthquake, EVENT_VICTORY_ROAD_TM_EARTHQUAKE
	object_event 33, 40, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, VictoryRoadMaxRevive, EVENT_VICTORY_ROAD_MAX_REVIVE
	object_event 11, 31, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, VictoryRoadFullRestore, EVENT_VICTORY_ROAD_FULL_RESTORE
	object_event 23, 44, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, VictoryRoadFullHeal, EVENT_VICTORY_ROAD_FULL_HEAL
	object_event  8, 15, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, VictoryRoadHPUp, EVENT_VICTORY_ROAD_HP_UP
	object_event 13, 46, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerCooltrainermCody, -1
	object_event 31, 44, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerCooltrainermJake, -1
	object_event 24, 46, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 4, TrainerCooltrainerfJoyce, -1
	object_event 18, 49, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerInstructorGeoff, -1
	object_event 10, 24, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerSwimmermHarold, -1
	object_event 18, 25, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerSwimmerfLisa, -1
	object_event 30, 25, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 2, TrainerEngineerDavidson, -1
	object_event  2,  4, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 2, TrainerCooltrainermErick, -1
	object_event 27, 11, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerCooltrainerfQuinn, -1
