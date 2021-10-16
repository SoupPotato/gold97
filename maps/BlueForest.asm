	const_def 2 ; object constants
	const BLUEFOREST_BLACK_BELT
	const BLUEFOREST_COOLTRAINER_F1
	const BLUEFOREST_YOUNGSTER1
	const BLUEFOREST_SANTOS
	const BLUEFOREST_COOLTRAINER_F2

BlueForest_MapScripts:
	db 0 ; scene scripts

	db 2 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint
	callback MAPCALLBACK_OBJECTS, .Santos

.FlyPoint:
	setflag ENGINE_FLYPOINT_BLUEFOREST
	return

.Santos:
	checkcode VAR_WEEKDAY
	ifequal SATURDAY, .SantosAppears
	disappear BLUEFOREST_SANTOS
	return

.SantosAppears:
	appear BLUEFOREST_SANTOS
	return

BlueForestBlackBeltScript:
	jumptextfaceplayer BlackBeltText_WeirdRadio



BlueForestCooltrainerF1Script:
	jumptextfaceplayer BlueForestCooltrainerF1Text

BlueForestYoungsterScript:
	jumptextfaceplayer BlueForestYoungsterText

BlueForestCooltrainerF2Script:
	faceplayer
	opentext
	checkevent EVENT_PRYCE_IN_GYM
	iffalse .HotshotWow
	writetext BlueForestCooltrainerF2TextNotWow
	waitbutton
	closetext
	end
	
.HotshotWow
	writetext BlueForestCooltrainerF2Text
	waitbutton
	closetext
	end

SantosScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_SPELL_TAG_FROM_SANTOS
	iftrue .Saturday
	checkcode VAR_WEEKDAY
	ifnotequal SATURDAY, .NotSaturday
	checkevent EVENT_MET_SANTOS_OF_SATURDAY
	iftrue .MetSantos
	writetext MeetSantosText
	buttonsound
	setevent EVENT_MET_SANTOS_OF_SATURDAY
.MetSantos:
	writetext SantosGivesGiftText
	buttonsound
	verbosegiveitem SPELL_TAG
	iffalse .Done
	setevent EVENT_GOT_SPELL_TAG_FROM_SANTOS
	writetext SantosGaveGiftText
	waitbutton
	closetext
	end

.Saturday:
	writetext SantosSaturdayText
	waitbutton
.Done:
	closetext
	end

.NotSaturday:
	writetext SantosNotSaturdayText
	waitbutton
	closetext
	end

BlueForestSign:
	jumptext BlueForestSignText

BlueForestGymSign:
	jumptext BlueForestGymSignText

MoveDeletersHouseSign:
	jumptext MoveDeletersHouseSignText

DragonDensSign:
	jumptext DragonDensSignText

BlueForestTrainerTips:
	jumptext BlueForestTrainerTipsText

BlueForestPokecenterSign:
	jumpstd pokecentersign

BlueForestMartSign:
	jumpstd martsign

BlackBeltText_WeirdRadio:
	text "PRYCE is the GYM"
	line "LEADER here."
	para "He puts on a cold"
	line "as ice exterior,"
	para "but he has a heart"
	line "of gold."
	done

BlueForestCooltrainerF1Text:
	text "Are you going to"
	line "make your #MON"
	cont "forget some moves?"
	para "The MOVE DELETER's"
	line "house is just west"
	cont "of here."
	done

BlueForestYoungsterText:
	text "There are lots of"
	line "ICE type #MON"
	para "in the DEEPWATER"
	line "PASSAGE."
	done

MeetSantosText:
	text "SANTOS: …"

	para "It's Saturday…"

	para "I'm SANTOS of"
	line "Saturday…"
	done

SantosGivesGiftText:
	text "You can have this…"
	done

SantosGaveGiftText:
	text "SANTOS: …"

	para "SPELL TAG…"

	para "Ghost-type moves"
	line "get stronger…"

	para "It will frighten"
	line "you…"
	done

SantosSaturdayText:
	text "SANTOS: …"

	para "See you again on"
	line "another Saturday…"

	para "I won't have any"
	line "more gifts…"
	done

SantosNotSaturdayText:
	text "SANTOS: Today's"
	line "not Saturday…"
	done

BlueForestCooltrainerF2Text:
	text "Wow, you went"
	line "through the"
	cont "DEEPWATER PASSAGE?"
	para "You must be a real"
	line "hotshot trainer!"
	done
	
BlueForestCooltrainerF2TextNotWow:
	text "I've never gone to"
	line "FROSTPOINT TOWN."
	para "Traveling through"
	line "the DEEPWATER"
	para "PASSAGE is too"
	line "intimidating."
	done

BlueForestSignText:
	text "BLUE FOREST"

	para "A Quiet Snowy"
	line "Retreat"
	done

BlueForestGymSignText:
	text "BLUE FOREST"
	line "#MON GYM"
	cont "LEADER: PRYCE"

	para "The Icy Chill"
	line "Elder"
	done

MoveDeletersHouseSignText:
	text "MOVE DELETER'S"
	line "HOUSE"
	done

DragonDensSignText:
	text "DEEPWATER PASSAGE"
	line "South Entrance"
	done

BlueForestTrainerTipsText:
	text "TRAINER TIPS"

	para "A #MON holding"
	line "a MIRACLEBERRY"

	para "will cure itself"
	line "of any status"
	cont "problem."
	done

BlueForest_MapEvents:
	db 0, 0 ; filler

	db 11 ; warp events
	warp_event 26, 21, BLUE_FOREST_GYM, 1
	warp_event  9,  9, BLUE_FOREST_SPEECH_HOUSE, 1
	warp_event 19, 13, BLUE_FOREST_EMYS_HOUSE, 1
	warp_event 25,  6, BLUE_FOREST_MART, 1
	warp_event 13, 18, BLUE_FOREST_POKECENTER_1F, 1
	warp_event  3, 22, MOVE_DELETERS_HOUSE, 1
	warp_event 27, 11, BLUE_FOREST_NIGHTMARE_HOUSE, 1
	warp_event  5,  5, DEEPWATER_PASSAGE_1F, 1
	warp_event 18,  3, ROUTE_111_BLUE_FOREST_GATE, 3
	warp_event 19,  3, ROUTE_111_BLUE_FOREST_GATE, 4
	warp_event 27, 21, BLUE_FOREST_GYM, 2

	db 0 ; coord events

	db 7 ; bg events
	bg_event  2, 26, BGEVENT_READ, BlueForestSign
	bg_event 28, 22, BGEVENT_READ, BlueForestGymSign
	bg_event  0, 18, BGEVENT_READ, MoveDeletersHouseSign
	bg_event  4,  8, BGEVENT_READ, DragonDensSign
	bg_event  0, 17, BGEVENT_READ, BlueForestTrainerTips
	bg_event 26,  6, BGEVENT_READ, BlueForestMartSign
	bg_event 14, 18, BGEVENT_READ, BlueForestPokecenterSign

	db 5 ; object events
	object_event 26, 23, SPRITE_BLACK_BELT, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BlackthornBlackBeltScript, -1
	object_event 16, 23, SPRITE_TEACHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BlackthornCooltrainerF1Script, -1
	object_event 13, 14, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BlackthornYoungsterScript, -1
	object_event 16,  7, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SantosScript, EVENT_BLACKTHORN_CITY_SANTOS_OF_SATURDAY
	object_event 25, 16, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, BlackthornCooltrainerF2Script, -1
