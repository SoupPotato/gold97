	const_def 2 ; object constants
	const ECRUTEAKCITY_GRAMPS1
	const ECRUTEAKCITY_GRAMPS2
	const ECRUTEAKCITY_LASS1
	const ECRUTEAKCITY_LASS2
	const ECRUTEAKCITY_FISHER
	const ECRUTEAKCITY_YOUNGSTER
	const ECRUTEAKCITY_GRAMPS3
	const ECRUTEAKCITY_ROCKET1
	const ECRUTEAKCITY_ROCKET2
	const ECRUTEAKCITY_ROCKET3
	const ECRUTEAKCITY_ROCKET4
	const ECRUTEAKCITY_LASS3
	const ECRUTEAKCITY_WORKER1
	const ECRUTEAKCITY_WORKER2

TeknosCity_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_ROUTE8_NOTHING
	scene_script SceneRocketTakeOverScript ; SCENE_ROUTE8_GIRL

	db 3 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint
	callback MAPCALLBACK_TILES, .ClearTekuCityRocks
	callback MAPCALLBACK_OBJECTS, .rockets
	
.rockets
	checkevent EVENT_BURNED_TOWER_MORTY
	iffalse .canfight
	return
	
.canfight
	disappear ECRUTEAKCITY_ROCKET1
	disappear ECRUTEAKCITY_ROCKET1
	return
	
.ClearTekuCityRocks:
	checkevent EVENT_CINNABAR_ROCKS_CLEARED
	iftrue .Done
	changeblock 23,  5, $80 ; water
.Done:
	return

.FlyPoint:
	setflag ENGINE_FLYPOINT_ECRUTEAK
	return
	
.DummyScene0:
	end
	
SceneRocketTakeOverScript:
	checkevent EVENT_MAHOGANY_TOWN_POKEFAN_M_BLOCKS_GYM
	iftrue .SceneEcruteakNothing
	checkevent EVENT_ECRUTEAK_SCARED_LASS
	iftrue .SceneEcruteakNothing
	opentext
	writetext RocketsAreCommin
	waitbutton
	closetext
	showemote EMOTE_SHOCK, PLAYER, 15
	turnobject PLAYER, RIGHT
	applymovement PLAYER, WalkToCenter
	applymovement ECRUTEAKCITY_LASS3, LassRun1
	pause 6
	turnobject ECRUTEAKCITY_LASS3, RIGHT
	pause 6
	turnobject ECRUTEAKCITY_LASS3, LEFT
	pause 6
	turnobject ECRUTEAKCITY_LASS3, RIGHT
	pause 6
	turnobject ECRUTEAKCITY_LASS3, LEFT
	pause 6
	turnobject ECRUTEAKCITY_LASS3, DOWN
	pause 6
	turnobject ECRUTEAKCITY_LASS3, UP
	pause 6
	opentext
	writetext RocketsAreCommin2
	waitbutton
	closetext
	applymovement ECRUTEAKCITY_LASS3, LassRun2
	disappear ECRUTEAKCITY_LASS3
	setevent EVENT_ECRUTEAK_SCARED_LASS
	setmapscene TEKNOS_AQUARIUM_1F, SCENE_DEFAULT
	end
	
.SceneEcruteakNothing:
	end

WorkerScript:
	faceplayer
	opentext
	writetext WorkerText
	waitbutton
	closetext
	turnobject ECRUTEAKCITY_WORKER2, UP
	turnobject ECRUTEAKCITY_WORKER1, UP
	end
	

TeknosCityGramps1Script:
	jumptextfaceplayer TeknosCityGramps1Text

TeknosCityGramps2Script:
	faceplayer
	opentext
	checkevent EVENT_CINNABAR_ROCKS_CLEARED
	iftrue .Gramps2Script2
	writetext TeknosCityGramps2Text
	waitbutton
	closetext
	end
	
.Gramps2Script2:
	writetext TeknosCityGramps2Text2
	waitbutton
	closetext
	end

TeknosCityGramps3Script:
	jumptextfaceplayer TeknosCityGramps3Text

TeknosCityLass1Script:
	jumptextfaceplayer TeknosCityLass1Text

TeknosCityLass2Script:
	jumptextfaceplayer TeknosCityLass2Text

	
TeknosCityFisherScript:
	faceplayer
	opentext
	checkevent EVENT_MAHOGANY_TOWN_POKEFAN_M_BLOCKS_GYM
	iftrue .NoRockets
	writetext TeknosCityFisherText_TheresRockets
	waitbutton
	closetext
	end

.NoRockets:
	writetext TeknosCityFisherText
	waitbutton
	closetext
	end


TeknosCityRocket1Script:
	jumptextfaceplayer TeknosCityRocket1Text
	
TeknosCityRocket2Script:
	jumptextfaceplayer TeknosCityRocket2Text

TeknosCityYoungsterScript:
	jumptextfaceplayer TeknosCityYoungsterText

TeknosCitySign:
	jumptext TeknosCitySignText

TinTowerSign:
	jumptext TinTowerSignText

EcruteakGymSign:
	jumptext EcruteakGymSignText
	
TekuCityDocksSign:
	jumptext TekuCityDocksText

EcruteakDanceTheaterSign:
	jumptext EcruteakDanceTheaterSignText

BurnedTowerSign:
	jumptext BurnedTowerSignText

TeknosCityPokecenterSign:
	jumpstd pokecentersign

TeknosCityMartSign:
	jumpstd martsign

TeknosCityHiddenHyperPotion:
	hiddenitem HYPER_POTION, EVENT_ECRUTEAK_CITY_HIDDEN_HYPER_POTION
	
TeknosCityRocketTrainer1Script:
	trainer GRUNTM, GRUNTM_32, EVENT_BEAT_TEKU_CITY_GRUNT1, TeknosCityRocket1SeenText, TeknosCityRocket1BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext TeknosCityRocket1AfterBattleText
	waitbutton
	closetext
	end
	
TeknosCityRocketTrainer2Script:
	trainer GRUNTM, GRUNTM_33, EVENT_BEAT_TEKU_CITY_GRUNT2, TeknosCityRocket2SeenText, TeknosCityRocket2BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext TeknosCityRocket2AfterBattleText
	waitbutton
	closetext
	end
	
TeknosCityRocket1SeenText:
	text "Hey kid!"
	
	para "What do you think"
	line "you're doing?"
	
	para "This place is off"
	line "limits!"
	done

TeknosCityRocket1BeatenText:
	text "What happened?"
	done

TeknosCityRocket1AfterBattleText:
	text "Don't bother going"
	line "inside."

	para "There's nothing a"
	line "kid like you can"
	cont "do."
	done
	
TeknosCityRocket2SeenText:
	text "Hold it!"
	
	para "Kids shouldn't"
	line "get in our way!"
	done

TeknosCityRocket2BeatenText:
	text "W-who are you?"
	done

TeknosCityRocket2AfterBattleText:
	text "The AQUARIUM"
	line "should have a lot"
	cont "#MON for us to"
	cont "sell off!"
	done

TeknosCityRocket1Text:
	text "Move aside?"
	
	para "Sorry kid, we"
	line "grown-ups have"
	cont "buisness here!"
	done
	
TeknosCityRocket2Text:
	text "What do you want?"
	
	para "Go play in the"
	line "MINES or"	
	cont "something..."
	done

TeknosCityGramps1Text:
	text "I've lived here"
	line "my whole life."
	para "This city is a"
	line "whole lot busier"
	para "than when I was"
	line "young."
	done

TeknosCityGramps2Text:
	text "This city is going"
	line "to grow even more"
	para "once the BOARDWALK"
	line "is finished."
	para "Many more people"
	line "will be passing"
	cont "through."
	done
	
TeknosCityGramps2Text2:
	text "I have to admit,"
	line "I'm a big fan of"
	para "the new GAME"
	line "CORNER that just"
	para "opened north of"
	line "here."
	done

TeknosCityLass1Text:
	text "TEKNOS used to be"
	line "a quiet town."
	para "But it's grown"
	line "quickly, and I"
	para "don't think"
	line "everyone has"
	para "adjusted to it"
	line "yet."
	done

TeknosCityLass2Text:
	text "WHITNEY is our GYM"
	line "LEADER here!"
	para "She's always been"
	line "a huge help to"
	cont "the town!"
	para "Sometimes it's"
	line "hard to catch her"
	para "at her GYM, since"
	line "she'll always be"
	para "out if there's"
	line "some issue that"
	para "she feels she can"
	line "help with."
	done

TeknosCityLass2Text_ReleasedBeasts:
	text "Three big #MON"
	line "ran off in differ-"
	cont "ent directions."
	cont "What were they?"
	done

TeknosCityFisherText:
	text "The AQUARIUM isn't"
	line "too interesting to"
	cont "SAILORs like me."
	para "We see all these"
	line "#MON out on the"
	cont "sea! Ohoho!"
	done

TeknosCityFisherText_TheresRockets:
	text "These guys sure do"
	line "look like TEAM"
	cont "ROCKET members."
	para "I thought they"
	line "weren't around"
	cont "anymore?"
	done

TeknosCityYoungsterText:
	text "I've tried many"
	line "times, but I've"
	para "never been able to"
	line "defeat WHITNEY…"
	done

TeknosCityGramps3Text:
	text "TEKNOS is starting"
	line "to grow as another"
	cont "port town."
	para "It's always been"
	line "a favorite of mine"
	cont "to visit."
	para "I hope it doesn't"
	line "get too crowded"
	cont "here!"
	done

TeknosCitySignText:
	text "TEKNOS CITY"
	line "A City that"
	para "embraces the"
	line "future."
	done

TinTowerSignText:
	text "North to BOARDWALK"
	line "and BOARDWALK"
	cont "GAME CORNER!"
	para "Games, prizes, and"
	line "fun!"
	done

EcruteakGymSignText:
	text "TEKNOS CITY"
	line "#MON GYM"
	cont "LEADER: WHITNEY"

	para "The energetic"
	line "go-getter!"
	done

EcruteakDanceTheaterSignText:
	text "TEKNOS CITY"
	line "AQUARIUM"
	done

BurnedTowerSignText:
	text "FISHING GURU"
	line "ARNOLD'S HOUSE"
	done
	
TekuCityDocksText:
	text "TEKNOS CITY DOCKS"
	done
	
RocketsAreCommin:
	text "...Eeek!"
	done
	
RocketsAreCommin2:
	text "Help!"
	
	para "TEAM ROCKET is"
	line "trying to take"
	cont "over the AQUARIUM!"
	done
	
WorkerText:
	text "Those ROCKET thugs"
	line "damaged the bridge"
	cont "to the GATE..."
	
	para "We need some time"
	line "to repair it."
	done
	
WalkToCenter:
	step RIGHT
	step_end
	
LassRun1:
	big_step LEFT
	big_step LEFT
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	big_step LEFT
	step_end
	
LassRun2:
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	step_end

TeknosCity_MapEvents:
	db 0, 0 ; filler

	db 13 ; warp events
	warp_event 22, 31, TEKNOS_PORT_PASSAGE, 1
	warp_event 23, 31, TEKNOS_PORT_PASSAGE, 2
	warp_event 31, 10, TEKNOS_POKECENTER_1F, 1
	warp_event  7, 17, TEKNOS_OLD_ROD_HOUSE, 1
	warp_event  6, 27, TEKNOS_AQUARIUM_1F, 1
	warp_event  7, 27, TEKNOS_AQUARIUM_1F, 1
	warp_event 31, 16, TEKNOS_MART, 1
	warp_event 15, 17, TEKNOS_GRAMPS_ITEMFINDER_HOUSE, 1
	warp_event 22,  1, BOARDWALK_TEKNOS_GATE, 3
	warp_event 23,  1, BOARDWALK_TEKNOS_GATE, 4
	warp_event 10, 11, TEKNOS_GYM, 1
	warp_event 11, 11, TEKNOS_GYM, 2
	warp_event 33, 20, TEKNOS_KYLES_HOUSE, 1

	db 1 ; coord events
	coord_event 15, 18, SCENE_ECRUTEAK_ROCKET_TAKEOVER, SceneRocketTakeOverScript

	db 9 ; bg events
	bg_event 18, 21, BGEVENT_READ, TeknosCitySign
	bg_event 24,  8, BGEVENT_READ, TinTowerSign
	bg_event 12, 12, BGEVENT_READ, EcruteakGymSign
	bg_event 10, 27, BGEVENT_READ, EcruteakDanceTheaterSign
	bg_event 10, 17, BGEVENT_READ, BurnedTowerSign
	bg_event 32, 10, BGEVENT_READ, TeknosCityPokecenterSign
	bg_event 32, 16, BGEVENT_READ, TeknosCityMartSign
	bg_event 33, 13, BGEVENT_ITEM, TeknosCityHiddenHyperPotion
	bg_event 24, 29, BGEVENT_READ, TekuCityDocksSign

	db 14 ; object events
	object_event 14, 21, SPRITE_GRAMPS, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TeknosCityGramps1Script, -1
	object_event 19,  9, SPRITE_GRAMPS, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TeknosCityGramps2Script, -1
	object_event 28, 27, SPRITE_LASS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, TeknosCityLass1Script, -1
	object_event 23, 14, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TeknosCityLass2Script, -1
	object_event  9, 30, SPRITE_SAILOR, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, TeknosCityFisherScript, -1
	object_event 10, 14, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, TeknosCityYoungsterScript, -1
	object_event 22, 13, SPRITE_SAILOR, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, TeknosCityGramps3Script, -1
	object_event  5, 28, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 2, TeknosCityRocketTrainer1Script, EVENT_MAHOGANY_TOWN_POKEFAN_M_BLOCKS_GYM
	object_event  8, 28, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_LEFT, 1, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 2, TeknosCityRocketTrainer2Script, EVENT_MAHOGANY_TOWN_POKEFAN_M_BLOCKS_GYM
	object_event  6, 28, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TeknosCityRocket1Script, EVENT_BURNED_TOWER_MORTY
	object_event  7, 28, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TeknosCityRocket2Script, EVENT_BURNED_TOWER_MORTY
	object_event  22, 22, SPRITE_LASS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_ECRUTEAK_SCARED_LASS
	object_event 22,  6, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_UP, 1, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, WorkerScript, EVENT_CINNABAR_ROCKS_CLEARED
	object_event 23,  6, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_UP, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, WorkerScript, EVENT_CINNABAR_ROCKS_CLEARED

	