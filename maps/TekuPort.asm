	const_def 2 ; object constants
	const TEKUPORT_SAILOR1
	const TEKUPORT_SAILOR2

TekuPort_MapScripts:
	db 1 ; scene scripts
	scene_script .DummyScene0 ; SCENE_DEFAULT

	db 0 ; callbacks

.DummyScene0
	end

TekuPortWalkUpToShipScript:
	turnobject TEKUPORT_SAILOR1, RIGHT
	turnobject PLAYER, LEFT
	faceplayer
	opentext
	writetext TekuPortToWestText
	yesorno
	iffalse .NotGoing
	writetext TekuPortToWestText2
	waitbutton
	closetext
	applymovement PLAYER, MovementData_0x74a371
	jump TekuPortSailorAtGangwayScript
	end
	
.NotGoing
	writetext NotGoingToWestText
	waitbutton
	closetext
	applymovement PLAYER, MovementData_0x74a341
	end
	
TekuPortSailorScript:
	end
	
TekuPortSailorAtGangwayScript:
	faceplayer
	opentext
	writetext UnknownText_0x74a551
	waitbutton
	closetext
	turnobject TEKUPORT_SAILOR2, DOWN
	pause 10
	playsound SFX_EXIT_BUILDING
	disappear TEKUPORT_SAILOR2
	waitsfx
	applymovement PLAYER, MovementData_0x74a301
	clearevent EVENT_OLIVINE_PORT_SAILOR_AT_GANGWAY
	playsound SFX_EXIT_BUILDING
	special FadeOutPalettes
	waitsfx
	warpfacing UP, OLIVINE_PORT, 8, 15
	end
	
TekuPortToWestText:
	text "Welcome to the"
	line "TEKU CITY DOCKS."
	para "Would you like to"
	line "take a ferry to"
	cont "WEST CITY?"
	done
	
TekuPortToWestText2:
	text "Okay! Departing to"
	line "WEST CITY."
	done
	
NotGoingToWestText:
	text "Please join us"
	line "another time!"
	done
	
UnknownText_0x74a551:
	text "We're departing"
	line "soon. Please get"
	cont "on board."
	done
	
MovementData_0x74a371:
	step DOWN
	step DOWN
	step DOWN
	step_end
	
MovementData_0x74a301:
	step DOWN
	step_end
	
MovementData_0x74a341:
	step RIGHT
	turn_head LEFT
	step_end
	
TekuPort_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event 7, 5, TEKU_PORT_PASSAGE, 5

	db 1 ; coord events
	coord_event  3, 9, SCENE_DEFAULT, TekuPortWalkUpToShipScript

	db 0 ; bg events

	db 2 ; object events	
	object_event  2,  9, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TekuPortSailorScript, -1
	object_event  3, 13, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TekuPortSailorAtGangwayScript, -1
