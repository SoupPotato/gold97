	const_def 2 ; object constants
	const WestportPort_SAILOR1
;	const WestportPort_SAILOR2
	const WestportPort_SAILOR3
	const WestportPort_FISHING_GURU1
	const WestportPort_FISHING_GURU2
	const WestportPort_YOUNGSTER
	const WestportPort_COOLTRAINER_F

WestportPort_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_DEFAULT
	scene_script .LeaveFastShip ; SCENE_WestportPort_LEAVE_SHIP

	db 0 ; callbacks

.DummyScene0:
	end

.LeaveFastShip:
	priorityjump .LeaveFastShipScript
	end

.LeaveFastShipScript:
	applymovement PLAYER, MovementData_0x74a32
	appear WestportPort_SAILOR1
	setscene SCENE_DEFAULT
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	blackoutmod ALLOY_CITY
	end

WestportPortSailorAtGangwayScript:
	faceplayer
	opentext
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iftrue WestportPortAlreadyRodeScript
	writetext UnknownText_0x74a55
	waitbutton
	closetext
	turnobject WestportPort_SAILOR1, DOWN
	pause 10
	playsound SFX_EXIT_BUILDING
	disappear WestportPort_SAILOR1
	waitsfx
	applymovement PLAYER, MovementData_0x74a30
	playsound SFX_EXIT_BUILDING
	special FadeOutPalettes
	waitsfx
	checkevent EVENT_FAST_SHIP_FIRST_TIME
	iffalse .FirstTime
	clearevent EVENT_FAST_SHIP_PASSENGERS_EASTBOUND
	setevent EVENT_FAST_SHIP_PASSENGERS_WESTBOUND
	clearevent EVENT_BEAT_COOLTRAINERM_SEAN
	clearevent EVENT_BEAT_COOLTRAINERF_CAROL
	clearevent EVENT_BEAT_GENTLEMAN_EDWARD
	clearevent EVENT_BEAT_BEAUTY_CASSIE
	clearevent EVENT_BEAT_PSYCHIC_RODNEY
	clearevent EVENT_BEAT_SUPER_NERD_SHAWN
	clearevent EVENT_BEAT_SAILOR_GARRETT
	clearevent EVENT_BEAT_FISHER_JONAH
	clearevent EVENT_BEAT_BLACKBELT_WAI
.FirstTime:
	clearevent EVENT_FAST_SHIP_DESTINATION_OLIVINE
	appear WestportPort_SAILOR1
	setmapscene FAST_SHIP_1F, SCENE_FASTSHIP1F_ENTER_SHIP
	warp FAST_SHIP_1F, 25, 1
	end

WestportPortSailorAtGangwayScriptTeku:
	faceplayer
	opentext
	writetext UnknownText_0x74a55
	waitbutton
	closetext
	turnobject WestportPort_SAILOR1, DOWN
	pause 10
	playsound SFX_EXIT_BUILDING
	disappear WestportPort_SAILOR1
	waitsfx
	applymovement PLAYER, MovementData_0x74a30
	playsound SFX_EXIT_BUILDING
	special FadeOutPalettes
	waitsfx
	warpfacing UP, TEKNOS_PORT, 4, 9
	end

WestportPortAlreadyRodeScript:
	writetext UnknownText_0x74a80
	waitbutton
	closetext
	end

WestportPortWalkUpToShipScript:
	appear WestportPort_SAILOR1
	turnobject WestportPort_SAILOR3, RIGHT
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iftrue .skip
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	iftrue .skip
	turnobject PLAYER, LEFT
	checkflag ENGINE_HIVEBADGE
	iftrue WestportPortSailorFerryToTekuScript
	opentext
	writetext WestportPortSailorBeforeHOFText
	waitbutton
	closetext
	applymovement PLAYER, MovementData_0x74a34
	end
	
.skip:
	end

WestportPortSailorOriginalScript:
	opentext
	checkevent EVENT_FAST_SHIP_FIRST_TIME
	iffalse .FirstTime
	checkcode VAR_WEEKDAY
	ifequal SUNDAY, .NextShipMonday
	ifequal SATURDAY, .NextShipMonday
	ifequal TUESDAY, .NextShipFriday
	ifequal WEDNESDAY, .NextShipFriday
	ifequal THURSDAY, .NextShipFriday
.FirstTime:
	writetext UnknownText_0x74a9c
	yesorno
	iffalse WestportPortNotRidingMoveAwayScript
	writetext UnknownText_0x74ada
	buttonsound
	checkitem S_S_TICKET
	iffalse .NoTicket
	writetext UnknownText_0x74b11
	waitbutton
	closetext
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	applymovement PLAYER, MovementData_0x74a37
	jump WestportPortSailorAtGangwayScript

.NoTicket:
	writetext UnknownText_0x74b41
	waitbutton
	closetext
	applymovement PLAYER, MovementData_0x74a34
	end

.NextShipMonday:
	writetext UnknownText_0x74ba8
	waitbutton
	closetext
	applymovement PLAYER, MovementData_0x74a34
	end

.NextShipFriday:
	writetext UnknownText_0x74bce
	waitbutton
	closetext
	applymovement PLAYER, MovementData_0x74a34
	end

.skip:
	end
	
WestportPortSailorFerryToTekuScript:
	faceplayer
	opentext
	writetext WestportPortSailorGoToTekuText
	yesorno
	iffalse .NotGoing
	writetext WestportPortSailorGoToTekuText2
	waitbutton
	closetext
	applymovement PLAYER, MovementData_0x74a37
	jump WestportPortSailorAtGangwayScriptTeku
	end
	
	
.NotGoing:
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue WestportPortSailorOriginalScript
	writetext WestportPortSailorNotGoingToTekuText
	waitbutton
	closetext
	applymovement PLAYER, MovementData_0x74a34
	end

WestportPortNotRidingScript:
	writetext UnknownText_0x74af6
	waitbutton
	closetext
	end

WestportPortNotRidingMoveAwayScript:
	writetext UnknownText_0x74af6
	waitbutton
	closetext
	applymovement PLAYER, MovementData_0x74a34
	end

WestportPortSailorAfterHOFScript:
	faceplayer
	opentext
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iftrue WestportPortAlreadyRodeScript
	checkevent EVENT_FAST_SHIP_FIRST_TIME
	iffalse .FirstTime
	checkcode VAR_WEEKDAY
	ifequal SUNDAY, .NextShipMonday
	ifequal SATURDAY, .NextShipMonday
	ifequal TUESDAY, .NextShipFriday
	ifequal WEDNESDAY, .NextShipFriday
	ifequal THURSDAY, .NextShipFriday
.FirstTime:
	writetext UnknownText_0x74a9c
	yesorno
	iffalse WestportPortNotRidingScript
	writetext UnknownText_0x74ada
	buttonsound
	checkitem S_S_TICKET
	iffalse .NoTicket
	writetext UnknownText_0x74b11
	waitbutton
	closetext
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	checkcode VAR_FACING
	ifequal RIGHT, .Right
	applymovement PLAYER, MovementData_0x74a3f
	jump WestportPortSailorAtGangwayScript

.Right:
	applymovement PLAYER, MovementData_0x74a49
	jump WestportPortSailorAtGangwayScript

.NoTicket:
	writetext UnknownText_0x74b41
	waitbutton
	closetext
	end

.NextShipMonday:
	writetext UnknownText_0x74ba8
	waitbutton
	closetext
	end

.NextShipFriday:
	writetext UnknownText_0x74bce
	waitbutton
	closetext
	end

WestportPortSailorBeforeHOFScript:

	end



WestportPortFishingGuru1Script:
	faceplayer
	opentext
	writetext WestportPortFishingGuru1Text
	waitbutton
	closetext
	turnobject WestportPort_FISHING_GURU1, UP
	end

WestportPortFishingGuru2Script:
	faceplayer
	opentext
	writetext WestportPortFishingGuru2Text
	waitbutton
	closetext
	turnobject WestportPort_FISHING_GURU2, UP
	end

WestportPortYoungsterScript:
	faceplayer
	opentext
	writetext WestportPortYoungsterText
	waitbutton
	closetext
	turnobject WestportPort_YOUNGSTER, DOWN
	end

WestportPortCooltrainerFScript:
	faceplayer
	opentext
	writetext WestportPortCooltrainerFText
	waitbutton
	closetext
	turnobject WestportPort_COOLTRAINER_F, DOWN
	end

WestportPortHiddenProtein:
	hiddenitem PROTEIN, EVENT_OLIVINE_PORT_HIDDEN_PROTEIN

MovementData_0x74a30:
	step DOWN
	step_end

MovementData_0x74a32:
	step UP
	step_end

MovementData_0x74a34:
	step RIGHT
	turn_head LEFT
	step_end

MovementData_0x74a37:
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end

MovementData_0x74a3f:
	step RIGHT
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end

MovementData_0x74a49:
	step UP
	step RIGHT
	step RIGHT
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end

WestportPortSailorNotGoingToTekuText:
	text "Please join us"
	line "another time!"
	done

WestportPortSailorGoToTekuText:
	text "Welcome to the"
	line "WESTPORT CITY"
	cont "DOCKS."
	para "Would you like to"
	line "take a ferry to"
	cont "TEKNOS CITY?"
	done

WestportPortSailorGoToTekuText2:
	text "Okay! Departing to"
	line "TEKNOS CITY."
	done

UnknownText_0x74a55:
	text "We're departing"
	line "soon. Please get"
	cont "on board."
	done

UnknownText_0x74a80:
	text "Sorry. You can't"
	line "board now."
	done

UnknownText_0x74a9c:
	text "We now also offer"
	line "trips to NIHON's"
	cont "SOUTHWEST ISLANDS."
	para "Would you like to"
	line "travel there?"
	done

UnknownText_0x74ada:
	text "May I see your"
	line "S.S.TICKET?"
	done

UnknownText_0x74af6:
	text "We hope to see you"
	line "again!"
	done

UnknownText_0x74b11:
	text "<PLAYER> flashed"
	line "the S.S.TICKET."

	para "That's it."
	line "Thank you!"
	done

UnknownText_0x74b41:
	text "<PLAYER> tried to"
	line "show the S.S."
	cont "TICKET…"

	para "…But no TICKET!"

	para "Sorry!"
	line "Trips to the"
	para "islands require"
	line "you to have an"
	cont "S.S.TICKET."
	done

UnknownText_0x74ba8:
	text "The next trip to"
	line "the SOUTHWEST"
	cont "ISLANDS will set"
	cont "sail on Monday."
	para "Today, we only"
	line "offer ferries to"
	cont "TEKNOS CITY."
	done

UnknownText_0x74bce:
	text "The next trip to"
	line "the SOUTHWEST"
	cont "ISLANDS will set"
	cont "sail on Friday."
	para "Today, we only"
	line "offer ferries to"
	cont "TEKNOS CITY."
	done

WestportPortFishingGuru1Text:
	text "SHELLDER are easy"
	line "to catch here."

	para "They're kind of"
	line "rare elsewhere."
	done

WestportPortFishingGuru2Text:
	text "Do you have any"
	line "fishing RODS?"

	para "Different RODS"
	line "catch different"
	cont "#MON."
	done

WestportPortYoungsterText:
	text "S.S.AQUA uses jets"
	line "to skim over the"
	cont "waves!"
	done

WestportPortCooltrainerFText:
	text "There are lots of"
	line "#MON on the"
	cont "ISLANDS."

	para "I wish I could go…"
	done

WestportPortSailorBeforeHOFText:
	text "We're very sorry,"
	line "but the DOCKS are"
	cont "currently closed"
	cont "for maintenance."
	done


WestportPort_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 11,  7, WESTPORT_PORT_PASSAGE, 5
	warp_event  7, 23, FAST_SHIP_1F, 1

	db 1 ; coord events
	coord_event  7, 15, SCENE_DEFAULT, WestportPortWalkUpToShipScript

	db 1 ; bg events
	bg_event  1, 22, BGEVENT_ITEM, WestportPortHiddenProtein

	db 6 ; object events
	object_event  7, 23, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WestportPortSailorAtGangwayScript, EVENT_OLIVINE_PORT_SAILOR_AT_GANGWAY
	object_event  6, 15, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WestportPortSailorAfterHOFScript, -1
	object_event  4, 12, SPRITE_FISHING_GURU, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, WestportPortFishingGuru1Script, EVENT_OLIVINE_PORT_SPRITES_BEFORE_HALL_OF_FAME
	object_event  3,  9, SPRITE_FISHING_GURU, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, WestportPortFishingGuru2Script, EVENT_OLIVINE_PORT_SPRITES_BEFORE_HALL_OF_FAME
	object_event  2, 13, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WestportPortYoungsterScript, EVENT_OLIVINE_PORT_SPRITES_AFTER_HALL_OF_FAME
	object_event 11, 15, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WestportPortCooltrainerFScript, EVENT_OLIVINE_PORT_SPRITES_AFTER_HALL_OF_FAME
