	const_def 2 ; object constants
	const VERMILIONPORT_SAILOR1
	const VERMILIONPORT_SAILOR2
	const VERMILIONPORT_SUPER_NERD

AmamiPort_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_DEFAULT
	scene_script .LeaveFastShip ; SCENE_VERMILIONPORT_LEAVE_SHIP

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint

.DummyScene0:
	end

.LeaveFastShip:
	priorityjump .LeaveFastShipScript
	end

.FlyPoint:
	setflag ENGINE_FLYPOINT_VERMILION
	return

.LeaveFastShipScript:
	disappear VERMILIONPORT_SAILOR1
	checkevent EVENT_FAST_SHIP_CABINS_SE_SSE_GENTLEMAN
	iffalse .NeedNewPart
	applymovement PLAYER, AmamiPlayerLeavesShip
	applymovement VERMILIONPORT_SAILOR2, AmamiSailorMovesAway
	applymovement PLAYER, AmamiPlayerLeavesShip2
	applymovement VERMILIONPORT_SAILOR2, AmamiSailorBlocksEntry
	appear VERMILIONPORT_SAILOR1
	setscene SCENE_DEFAULT
;	setevent EVENT_FAST_SHIP_CABINS_SE_SSE_CAPTAINS_CABIN_TWIN_1
;	setevent EVENT_FAST_SHIP_CABINS_SE_SSE_GENTLEMAN
	setevent EVENT_FAST_SHIP_PASSENGERS_FIRST_TRIP
	clearevent EVENT_OLIVINE_PORT_PASSAGE_POKEFAN_M
	setevent EVENT_FAST_SHIP_FIRST_TIME
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	blackoutmod AMAMI_TOWN
	end
	
.NeedNewPart
	applymovement PLAYER, AmamiPlayerLeavesShip3
	pause 10
	appear VERMILIONPORT_SAILOR1
	turnobject PLAYER, DOWN
	opentext
	writetext NeedANewPartText
	waitbutton
	closetext
	applymovement PLAYER, AmamiPlayerLeavesShip4
	applymovement VERMILIONPORT_SAILOR2, AmamiSailorMovesAway
	applymovement PLAYER, AmamiPlayerLeavesShip2
	applymovement VERMILIONPORT_SAILOR2, AmamiSailorBlocksEntry
	setscene SCENE_DEFAULT
;	setevent EVENT_FAST_SHIP_CABINS_SE_SSE_CAPTAINS_CABIN_TWIN_1
;	setevent EVENT_FAST_SHIP_CABINS_SE_SSE_GENTLEMAN
	setevent EVENT_FAST_SHIP_PASSENGERS_FIRST_TRIP
	clearevent EVENT_OLIVINE_PORT_PASSAGE_POKEFAN_M
	setevent EVENT_FAST_SHIP_FIRST_TIME
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	blackoutmod AMAMI_TOWN
	end
	

AmamiPortSailorGuardScript:
	faceplayer
	opentext
	checkevent EVENT_FAST_SHIP_CABINS_SE_SSE_GENTLEMAN
	iffalse .StillNeedToReturnPart
	writetext AmamiPortSailorGoToWestportText
	yesorno
	iffalse AmamiPortNotRidingScript
	writetext UnknownText_0x74f8b
	buttonsound
	checkitem S_S_TICKET
	iffalse .NoTicket
	writetext AmamiPortSSTicketText
	waitbutton
	closetext
	applymovement PLAYER, AmamiPlayerWalkRight
	applymovement VERMILIONPORT_SAILOR2, AmamiSailorMovesAway
	applymovement PLAYER, AmamiPlayerWalksToShip
	opentext
	writetext AmamiPortSailorBoardingSoonText
	closetext
	turnobject WestportPort_SAILOR1, DOWN
	pause 10
	playsound SFX_EXIT_BUILDING
	disappear VERMILIONPORT_SAILOR1
	waitsfx
	applymovement PLAYER, AmamiPlayerEntersShip
	playsound SFX_EXIT_BUILDING
	special FadeOutPalettes
	waitsfx
	setevent EVENT_FAST_SHIP_PASSENGERS_EASTBOUND
	clearevent EVENT_FAST_SHIP_PASSENGERS_WESTBOUND
	clearevent EVENT_BEAT_POKEMANIAC_ETHAN
	clearevent EVENT_BEAT_BURGLAR_COREY
	clearevent EVENT_BEAT_BUG_CATCHER_KEN
	clearevent EVENT_BEAT_GUITARIST_CLYDE
	clearevent EVENT_BEAT_POKEFANM_JEREMY
	clearevent EVENT_BEAT_POKEFANF_GEORGIA
	clearevent EVENT_BEAT_SAILOR_KENNETH
	clearevent EVENT_BEAT_TEACHER_SHIRLEY
	clearevent EVENT_BEAT_SCHOOLBOY_NATE
	clearevent EVENT_BEAT_SCHOOLBOY_RICKY
	setevent EVENT_FAST_SHIP_DESTINATION_OLIVINE
	appear VERMILIONPORT_SAILOR1
	setmapscene FAST_SHIP_1F, SCENE_FASTSHIP1F_ENTER_SHIP
	warp FAST_SHIP_1F, 25, 1
	end
	
.StillNeedToReturnPart
	opentext
	writetext GoGetThePart
	waitbutton
	closetext
	checkitem CARD_KEY
	iftrue .GiveFuelLine
	end

.GiveFuelLine
	showemote EMOTE_SHOCK, VERMILIONPORT_SAILOR2, 15
	opentext
	writetext YouHaveTheFuelLine
	waitbutton
	closetext
	takeitem CARD_KEY
	applymovement VERMILIONPORT_SAILOR2, SailorWalksToShipAndBack
	opentext
	writetext ThanksForTheFuelLine
	waitbutton
	closetext
	setevent EVENT_FAST_SHIP_CABINS_SE_SSE_GENTLEMAN
	clearevent EVENT_TELEPORT_GUY
	end
	
.NoTicket
	writetext AmamiSailorNoTicketText
	waitbutton
	closetext
	end

AmamiPortNotRidingScript:
	writetext UnknownText_0x74fa7
	waitbutton
	closetext
	end


AmamiPortSuperNerdScript:
	faceplayer
	opentext
	writetext UnknownText_0x750a6
	waitbutton
	closetext
	end

AmamiPortHiddenIron:
	hiddenitem IRON, EVENT_VERMILION_PORT_HIDDEN_IRON
	
SailorWalksToShipAndBack:
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step RIGHT
	step LEFT
	step RIGHT
	step LEFT
	step RIGHT
	step LEFT
	step RIGHT
	step LEFT
	step UP
	step UP
	step UP
	step UP
	step UP
	step_end
	
AmamiSailorBlocksEntry:
	step RIGHT
	step DOWN
	turn_head UP
	step_end

AmamiSailorMovesAway:
	step UP
	step LEFT
	turn_head RIGHT
	step_end
	
AmamiPlayerWalkRight:
	step RIGHT
	turn_head LEFT
	step_end

AmamiPlayerWalksToShip:
	step LEFT
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end
	
AmamiPlayerEntersShip:
	step DOWN
	step_end
	
AmamiPlayerLeavesShip:
	step UP
	step UP
	step UP
	step UP
	step_end
	
AmamiPlayerLeavesShip2:
	step UP
	step UP
	step RIGHT
	step_end
	
AmamiPlayerLeavesShip3:
	step UP
	step_end

AmamiPlayerLeavesShip4:
	step UP
	step UP
	step UP
	step_end

	
ThanksForTheFuelLine:
	text "Thanks, kid!"
	para "The S.S.AQUA is"
	line "back to being"
	cont "fully operational!"
	para "We can't thank you"
	line "enough!"
	para "Talk to the"
	line "CAPTAIN next time"
	cont "you're onboard."
	para "I'm sure he'll"
	line "have some way to"
	cont "show his thanks!"
	done
	
YouHaveTheFuelLine:
	text "Ah, the FUEL LINE!"
	para "Wow!"
	para "Let me go bring"
	line "this to the ship"
	cont "crew!"
	done
	
NeedANewPartText:
	text "Wait, Kid!"
	para "That rough sea we"
	line "just had, damaged"
	cont "the ship's FUEL"
	cont "LINE!"
	
	para "There's a guy in"
	line "YORON CITY who'll"
	cont "have a new one for"
	cont "us."
	
	para "Until then, we"
	line "can't get back to"
	cont "WESTPORT."
	
	para "Can you head to"
	line "YORON CITY and"
	cont "pick up the new"
	cont "FUEL LINE?"
	
	para "Otherwise, we will"
	line "be stranded here!"
	done
		
GoGetThePart:
	text "Alright, kid. We"
	line "need a new FUEL"
	cont "LINE."
	para "There's a guy in"
	line "YORON CITY who'll"
	cont "have what we need."
	para "Bring it back here"
	line "when you have it!"
	done

AmamiPortSailorBoardingSoonText:
	text "We're departing"
	line "soon. Please get"
	cont "on board."
	done

AmamiPortSailorGoToWestportText:
	text "Welcome to FAST"
	line "SHIP S.S.AQUA."

	para "Will you be board-"
	line "ing for WESTPORT"
	cont "today?"
	done

UnknownText_0x74f8b:
	text "May I see your"
	line "S.S.TICKET?"
	done

UnknownText_0x74fa7:
	text "We hope to see you"
	line "again!"
	done

AmamiPortSSTicketText:
	text "<PLAYER> flashed"
	line "the S.S.TICKET."

	para "That's it."
	line "Thank you!"
	done
	
AmamiSailorNoTicketText:
	text "..."
	para "Sorry!"
	line "Trips to"
	para "WESTPORT require"
	line "you to have an"
	cont "S.S.TICKET."
	done

UnknownText_0x750a6:
	text "You came from"
	line "the mainland?"

	para "I hear many rare"
	line "#MON live over"
	cont "there."
	done

AmamiPort_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 13,  7, AMAMI_PORT_PASSAGE, 5
	warp_event  7, 17, FAST_SHIP_1F, 1

	db 0 ; coord events

	db 1 ; bg events
	bg_event  6, 10, BGEVENT_ITEM, AmamiPortHiddenIron

	db 3 ; object events
	object_event  7, 17, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event  7, 12, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AmamiPortSailorGuardScript, -1
	object_event 10, 10, SPRITE_SUPER_NERD, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AmamiPortSuperNerdScript, -1
