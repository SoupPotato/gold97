	const_def 2 ; object constants
	const ROUTE33_LASS
	const ROUTE33_FRUIT_TREE
	const ROUTE33_GARDENER
	const ROUTE33_SUPER_NERD
	const ROUTE33_POKEFAN_M
	const ROUTE33_FIREBREATHER
	const ROUTE33_CAMPER
	const ROUTE33_TEACHER
	const ROUTE33_OFFICER
	const ROUTE33_TUSCANY
	const ROUTE33_ITEMBALL

Route104_MapScripts:
	db 2 ; scene scripts
	scene_script .SceneRoute104Gardener ; SCENE_DEFAULT
	scene_script .SceneRoute104Nothing ;

	db 2 ; callbacks
	callback MAPCALLBACK_OBJECTS, .Tuscany
	callback MAPCALLBACK_TILES, .Flowers


.SceneRoute104Gardener
	end

.SceneRoute104Nothing
	end
	
.Flowers:
	checkevent EVENT_ROUTE_5_6_POKEFAN_M_BLOCKS_UNDERGROUND_PATH
	iftrue .Done
	changeblock 53, 13, $8b ; water
.Done:
	return

.Tuscany:
	checkflag ENGINE_ZEPHYRBADGE
	iftrue .DoesTuscanyAppear

.TuscanyDisappears:
	disappear ROUTE33_TUSCANY
	return

.DoesTuscanyAppear:
	checkcode VAR_WEEKDAY
	ifnotequal TUESDAY, .TuscanyDisappears
	appear ROUTE33_TUSCANY
	return
	
GardenerStopsYou:
	jump Route104GardenerScript
	end

GardenerStopsYou2:
	jump Route104GardenerScript
	end

Route104GardenerScript:
	showemote EMOTE_SHOCK, ROUTE33_GARDENER, 15
	opentext
	writetext DontStepFlowers
	waitbutton
	closetext
	applymovement PLAYER, Movement_1LEFT
	end
	
Route104GardenerWateringScript:
	opentext
	writetext LaDiDa
	waitbutton
	closetext
	end
	
Route104LassScript:
	jumptextfaceplayer Route104LassText

Route104TeacherScript:
	jumptextfaceplayer Route104TeacherText


Route104Sign:
	jumptext Route104SignText
	
Route104SignActual:
	jumptext Route104SignActualText

Route104FruitTree:
	fruittree FRUITTREE_ROUTE_33
	
Movement_1LEFT:
	step LEFT
	step_end

TrainerSupernerdSam:
	trainer SUPER_NERD, SAM, EVENT_BEAT_SUPER_NERD_SAM, SupernerdSamSeenText, SupernerdSamBeatenText, 0, .Script
	
.Script:
	endifjustbattled
	opentext
	writetext SupernerdSamAfterBattleText
	waitbutton
	closetext
	end
	

TrainerHikerDaniel:
	trainer HIKER, DANIEL, EVENT_BEAT_HIKER_DANIEL, HikerDanielSeenText, HikerDanielBeatenText, 0, .Script
	
.Script:
	endifjustbattled
	opentext
	writetext HikerDanielAfterBattleText
	waitbutton
	closetext
	end


TrainerFirebreatherBurt:
	trainer FIREBREATHER, BURT, EVENT_BEAT_FIREBREATHER_BURT, FirebreatherBurtSeenText, FirebreatherBurtBeatenText, 0, .Script
	
.Script:
	endifjustbattled
	opentext
	writetext FirebreatherBurtAfterBattleText
	waitbutton
	closetext
	end


TrainerCamperElliot:
	trainer CAMPER, ELLIOT, EVENT_BEAT_CAMPER_ELLIOT, CamperElliotSeenText, CamperElliotBeatenText, 0, .Script
	
.Script:
	endifjustbattled
	opentext
	writetext CamperElliotAfterBattleText
	waitbutton
	closetext
	end

TrainerOfficerDirk:
	faceplayer
	opentext
	checktime NITE
	iffalse .NotNight
	checkevent EVENT_BEAT_OFFICER_DIRK
	iftrue .AfterBattle
	playmusic MUSIC_OFFICER_ENCOUNTER
	writetext OfficerDirkSeenText
	waitbutton
	closetext
	winlosstext OfficerDirkBeatenText, 0
	loadtrainer OFFICER, DIRK
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_OFFICER_DIRK
	closetext
	end

.AfterBattle:
	writetext OfficerDirkAfterBattleText
	waitbutton
	closetext
	end

.NotNight:
	writetext OfficerDirkPrettyToughText
	waitbutton
	closetext
	end

TuscanyScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_PINK_BOW_FROM_TUSCANY
	iftrue TuscanyTuesdayScript
	checkcode VAR_WEEKDAY
	ifnotequal TUESDAY, TuscanyNotTuesdayScript
	checkevent EVENT_MET_TUSCANY_OF_TUESDAY
	iftrue .MetTuscany
	writetext MeetTuscanyText
	buttonsound
	setevent EVENT_MET_TUSCANY_OF_TUESDAY
.MetTuscany:
	writetext TuscanyGivesGiftText
	buttonsound
	verbosegiveitem PINK_BOW
	iffalse TuscanyDoneScript
	setevent EVENT_GOT_PINK_BOW_FROM_TUSCANY
	writetext TuscanyGaveGiftText
	waitbutton
	closetext
	end

TuscanyTuesdayScript:
	writetext TuscanyTuesdayText
	waitbutton
TuscanyDoneScript:
	closetext
	end

TuscanyNotTuesdayScript:
	writetext TuscanyNotTuesdayText
	waitbutton
	closetext
	end
	
Route104TMEndure:
	itemball TM_ENDURE


Route104LassText:
	text "Pant, pant…"

	para "It's a long walk"
	line "just to get this"
	cont "far."
	para "But there's still"
	line "a long way to go"
	cont "to ALLOY CITY."
	para "JADE FOREST is a"
	line "maze."
	para "I need to make"
	line "sure I'm ready."
	done

Route104TeacherText:
	text "I'm confused."
	para "I came though this"
	line "route by going"
	cont "down this ledge."
	para "But I can't figure"
	line "out my way back"
	cont "to BIRDON TOWN."
	para "There's got to be"
	line "a way around…"
	done

DontStepFlowers:
	text "Hey!"
	para "Don't step there!"
	para "I work really hard"
	line "getting my garden"
	para "to look nice in"
	line "such a dry area!"
	para "Don't trample my"
	line "flowers!"
	done

LaDiDa:
	text "La-Di-Da!"
	para "Oh, how I enjoy"
	line "tending to my"
	cont "garden!"
	done


SupernerdSamSeenText:
	text "Do you collect"
	line "rare #MON?"
	done

SupernerdSamBeatenText:
	text "Oi!"
	done

SupernerdSamAfterBattleText:
	text "I collect rare"
	line "#MON."
	para "Or at least, I"
	line "wish I did."
	done
	
HikerDanielSeenText:
	text "I'm setting out"
	line "on a long hike."
	para "Let's see how"
	line "prepared I am!"
	done

HikerDanielBeatenText:
	text "Foot cramps!"
	done

HikerDanielAfterBattleText:
	text "Looks like I need"
	line "to make sure I'm"
	para "up for the long"
	line "journey."
	done

FirebreatherBurtSeenText:
	text "Can you take the"
	line "heat that I'm"
	cont "about to give?"
	done

FirebreatherBurtBeatenText:
	text "Ow, hot!"
	done

FirebreatherBurtAfterBattleText:
	text "This ROUTE is too"
	line "hot!"
	done


CamperElliotSeenText:
	text "I'm on my way"
	line "to go camping"
	cont "in the FOREST!"
	done

CamperElliotBeatenText:
	text "I'm beat!"
	done

CamperElliotAfterBattleText:
	text "This area is"
	line "pretty dry."
	para "But the FOREST up"
	line "ahead is a lot"
	cont "less arid."
	done
	

OfficerDirkSeenText:
	text "Danger lurks in"
	line "the night!"
	done

OfficerDirkBeatenText:
	text "Whoops!"
	done

OfficerDirkAfterBattleText:
	text "You know, night-"
	line "time is fun in its"
	cont "own ways."

	para "But don't overdo"
	line "it, OK?"
	done

OfficerDirkPrettyToughText:
	text "Your #MON look"
	line "pretty tough."

	para "You could go any-"
	line "where safely."
	done

Route104SignText:
	text "GEOFFREY the"
	line "Gardener's house"
	done
	
Route104SignActualText:
	text "ROUTE 104"
	line "BIRDON TOWN -"
	cont "ALLOY CITY"
	done
	

MeetTuscanyText:
	text "TUSCANY: I do be-"
	line "lieve that this is"

	para "the first time"
	line "we've met?"

	para "Please allow me to"
	line "introduce myself."

	para "I am TUSCANY of"
	line "Tuesday."
	done

TuscanyGivesGiftText:
	text "By way of intro-"
	line "duction, please"

	para "accept this gift,"
	line "a PINK BOW."
	done

TuscanyGaveGiftText:
	text "TUSCANY: Wouldn't"
	line "you agree that it"
	cont "is most adorable?"

	para "It strengthens"
	line "normal-type moves."

	para "I am certain it"
	line "will be of use."
	done

TuscanyTuesdayText:
	text "TUSCANY: Have you"
	line "met MONICA, my"
	cont "older sister?"

	para "Or my younger"
	line "brother, WESLEY?"

	para "I am the second of"
	line "seven children."
	done

TuscanyNotTuesdayText:
	text "TUSCANY: Today is"
	line "not Tuesday. That"
	cont "is unfortunate…"
	done

Route104_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event 55,  7, ROUTE_104_GARDENERS_HOUSE, 1

	db 2 ; coord events
	coord_event 52, 12, SCENE_DEFAULT, GardenerStopsYou
	coord_event 52, 13, SCENE_DEFAULT, GardenerStopsYou2

	db 2 ; bg events
	bg_event 56,  8, BGEVENT_READ, Route104Sign
	bg_event  6,  8, BGEVENT_READ, Route104SignActual

	db 11 ; object events
	object_event 88,  7, SPRITE_LASS, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route104LassScript, -1
	object_event 61,  7, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route104FruitTree, -1
	object_event 52, 11, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route104GardenerWateringScript, EVENT_ROUTE_5_6_POKEFAN_M_BLOCKS_UNDERGROUND_PATH
	object_event 59,  2, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 4, TrainerSupernerdSam, -1
	object_event 12, 12, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 2, TrainerHikerDaniel, -1
	object_event 82, 13, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerFirebreatherBurt, -1
	object_event 45,  8, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 2, TrainerCamperElliot, -1
	object_event 24, 13, SPRITE_TEACHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route104TeacherScript, -1
	object_event 76, 10, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, TrainerOfficerDirk, -1
	object_event 48,  5, SPRITE_TEACHER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TuscanyScript, EVENT_ROUTE_29_TUSCANY_OF_TUESDAY
	object_event 68,  4, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route104TMEndure, EVENT_BURNED_TOWER_B1F_TM_ENDURE

