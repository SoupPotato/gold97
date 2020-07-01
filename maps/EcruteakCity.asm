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

EcruteakCity_MapScripts:
	db 0 ; scene scripts

	db 2 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint
	callback MAPCALLBACK_TILES, .ClearTekuCityRocks

.ClearTekuCityRocks:
	checkevent EVENT_CINNABAR_ROCKS_CLEARED
	iftrue .Done
	changeblock 21,  7, $25 ; fence
	changeblock 23,  7, $25 ; fence
	changeblock 25,  7, $25 ; fence
	changeblock 21,  5, $07 ; water
	changeblock 23,  5, $07 ; water
	changeblock 25,  5, $07 ; water
.Done:
	return

.FlyPoint:
	setflag ENGINE_FLYPOINT_ECRUTEAK
	return

EcruteakCityGramps1Script:
	jumptextfaceplayer EcruteakCityGramps1Text

EcruteakCityGramps2Script:
	faceplayer
	opentext
	checkevent EVENT_CINNABAR_ROCKS_CLEARED
	iftrue .Gramps2Script2
	writetext EcruteakCityGramps2Text
	waitbutton
	closetext
	end
	
.Gramps2Script2:
	writetext EcruteakCityGramps2Text2
	waitbutton
	closetext
	end

EcruteakCityGramps3Script:
	jumptextfaceplayer EcruteakCityGramps3Text

EcruteakCityLass1Script:
	jumptextfaceplayer EcruteakCityLass1Text

EcruteakCityLass2Script:
	jumptextfaceplayer EcruteakCityLass2Text

	
EcruteakCityFisherScript:
	faceplayer
	opentext
	checkevent EVENT_MAHOGANY_TOWN_POKEFAN_M_BLOCKS_GYM
	iftrue .NoRockets
	writetext EcruteakCityFisherText_TheresRockets
	waitbutton
	closetext
	end

.NoRockets:
	writetext EcruteakCityFisherText
	waitbutton
	closetext
	end


EcruteakCityRocket1Script:
	jumptextfaceplayer EcruteakCityRocket1Text
	
EcruteakCityRocket2Script:
	jumptextfaceplayer EcruteakCityRocket2Text

EcruteakCityYoungsterScript:
	jumptextfaceplayer EcruteakCityYoungsterText

EcruteakCitySign:
	jumptext EcruteakCitySignText

TinTowerSign:
	checkevent EVENT_CINNABAR_ROCKS_CLEARED
	iftrue .TinTowerSign2
	jumptext TinTowerSignText
	
.TinTowerSign2
	jumptext TinTowerSignText2

EcruteakGymSign:
	jumptext EcruteakGymSignText
	
TekuCityDocksSign:
	jumptext TekuCityDocksText

EcruteakDanceTheaterSign:
	jumptext EcruteakDanceTheaterSignText

BurnedTowerSign:
	jumptext BurnedTowerSignText

EcruteakCityPokecenterSign:
	jumpstd pokecentersign

EcruteakCityMartSign:
	jumpstd martsign

EcruteakCityHiddenHyperPotion:
	hiddenitem HYPER_POTION, EVENT_ECRUTEAK_CITY_HIDDEN_HYPER_POTION

EcruteakCityRocket1Text:
	text "Stay out of the"
	line "AQUARIUM if you"
	para "know what's good"
	line "for you, kid!"
	done
	
EcruteakCityRocket2Text:
	text "Hehehehe!"
	para "This place has to"
	line "be full of rare"
	para "#MON we can"
	line "sell off to the"
	cont "highest bidder!"
	
	done

UnusedMissingDaughterText:
; unused
	text "Oh, no. Oh, no…"

	para "My daughter is"
	line "missing."

	para "No… She couldn't"
	line "have gone to the"
	cont "BURNED TOWER."

	para "I told her not to"
	line "go near it…"

	para "People seem to"
	line "disappear there…"

	para "Oh, what should I"
	line "do…?"
	done

EcruteakCityGramps1Text:
	text "I've lived here"
	line "my whole life."
	para "This city is a"
	line "whole lot busier"
	para "than when I was"
	line "young."
	done

EcruteakCityGramps2Text:
	text "This city is going"
	line "to grow even more"
	para "once the BOARDWALK"
	line "is finished."
	para "Many more people"
	line "will be passing"
	cont "through."
	done
	
EcruteakCityGramps2Text2:
	text "I have to admit,"
	line "I'm a big fan of"
	para "the new GAME"
	line "CORNER that just"
	para "opened north of"
	line "here."
	done

EcruteakCityLass1Text:
	text "TEKU used to be"
	line "a quiet town."
	para "But it's grown"
	line "quickly, and I"
	para "don't think"
	line "everyone has"
	para "adjusted to it"
	line "yet."
	done

EcruteakCityLass2Text:
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

EcruteakCityLass2Text_ReleasedBeasts:
	text "Three big #MON"
	line "ran off in differ-"
	cont "ent directions."
	cont "What were they?"
	done

EcruteakCityFisherText:
	text "The AQUARIUM isn't"
	line "too interesting to"
	cont "SAILORs like me."
	para "We see all these"
	line "#MON out on the"
	cont "sea! Ohoho!"
	done

EcruteakCityFisherText_TheresRockets:
	text "These guys sure do"
	line "look like TEAM"
	cont "ROCKET members."
	para "I thought they"
	line "weren't around"
	cont "anymore?"
	done

EcruteakCityYoungsterText:
	text "I've tried many"
	line "times, but I've"
	para "never been able to"
	line "defeat WHITNEY…"
	done

EcruteakCityGramps3Text:
	text "TEKU is starting"
	line "to grow as another"
	cont "port town."
	para "It's always been"
	line "a favorite of mine"
	cont "to visit."
	para "I hope it doesn't"
	line "get too crowded"
	cont "here!"
	done

EcruteakCitySignText:
	text "TEKU CITY"
	line "A City that"
	para "embraces the"
	line "future."
	done

TinTowerSignText:
	text "COMING SOON!"
	para "BOARDWALK and"
	line "BOARDWALK GAME"
	cont "CORNER!"
	para "A walkable seaside"
	line "connection from"
	para "TEKU CITY to HONTO"
	line "TOWN, with games"
	cont "and prizes galore!"
	done

TinTowerSignText2:
	text "North to BOARDWALK"
	line "and BOARDWALK"
	cont "GAME CORNER!"
	para "Games, prizes, and"
	line "fun!"
	done

EcruteakGymSignText:
	text "TEKU CITY"
	line "#MON GYM"
	cont "LEADER: WHITNEY"

	para "The energetic"
	line "go-getter!"
	done

EcruteakDanceTheaterSignText:
	text "TEKU CITY"
	line "AQUARIUM"
	done

BurnedTowerSignText:
	text "FISHING GURU"
	line "ARNOLD'S HOUSE"
	done
	
TekuCityDocksText:
	text "TEKU CITY DOCKS"
	done

EcruteakCity_MapEvents:
	db 0, 0 ; filler

	db 14 ; warp events
	warp_event 22, 31, TEKU_PORT_PASSAGE, 1
	warp_event 23, 31, TEKU_PORT_PASSAGE, 2
	warp_event 31, 10, ECRUTEAK_POKECENTER_1F, 1
	warp_event  7, 17, ECRUTEAK_BLISSEY_SPEECH_HOUSE, 1
	warp_event  7, 27, OLIVINE_LIGHTHOUSE_1F, 2
	warp_event 31, 16, ECRUTEAK_MART, 1
	warp_event 10, 11, GOLDENROD_GYM, 1
	warp_event 15, 17, ECRUTEAK_ITEMFINDER_HOUSE, 1
	warp_event  6, 27, OLIVINE_LIGHTHOUSE_1F, 1
	warp_event  9, 11, ROUTE_38_ECRUTEAK_GATE, 4
	warp_event 22,  1, ROUTE_43_MAHOGANY_GATE, 3
	warp_event 23,  1, ROUTE_43_MAHOGANY_GATE, 4
	warp_event 11, 11, GOLDENROD_GYM, 2
	warp_event 33, 20, VIOLET_KYLES_HOUSE, 1

	db 0 ; coord events

	db 9 ; bg events
	bg_event 18, 21, BGEVENT_READ, EcruteakCitySign
	bg_event 24,  8, BGEVENT_READ, TinTowerSign
	bg_event 12, 12, BGEVENT_READ, EcruteakGymSign
	bg_event 10, 27, BGEVENT_READ, EcruteakDanceTheaterSign
	bg_event 10, 17, BGEVENT_READ, BurnedTowerSign
	bg_event 32, 10, BGEVENT_READ, EcruteakCityPokecenterSign
	bg_event 32, 16, BGEVENT_READ, EcruteakCityMartSign
	bg_event 33, 13, BGEVENT_ITEM, EcruteakCityHiddenHyperPotion
	bg_event 24, 29, BGEVENT_READ, TekuCityDocksSign

	db 9 ; object events
	object_event 14, 21, SPRITE_GRAMPS, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakCityGramps1Script, -1
	object_event 19,  9, SPRITE_GRAMPS, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakCityGramps2Script, -1
	object_event 28, 27, SPRITE_LASS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, EcruteakCityLass1Script, -1
	object_event 23, 14, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakCityLass2Script, -1
	object_event  9, 30, SPRITE_SAILOR, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, EcruteakCityFisherScript, -1
	object_event 10, 14, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, EcruteakCityYoungsterScript, -1
	object_event 22, 13, SPRITE_SAILOR, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, EcruteakCityGramps3Script, -1
	object_event  5, 28, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakCityRocket1Script, EVENT_MAHOGANY_TOWN_POKEFAN_M_BLOCKS_GYM
	object_event  8, 28, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakCityRocket2Script, EVENT_MAHOGANY_TOWN_POKEFAN_M_BLOCKS_GYM

	