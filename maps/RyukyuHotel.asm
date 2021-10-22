	const_def 2 ; object constants
	const RYUKYU_HOTEL_RECEPTIONIST
	const RYUKYU_HOTEL_CLERK_1
	const RYUKYU_HOTEL_PLACEHOLDER
	const RYUKYU_HOTEL_CLERK_2
	const RYUKYU_HOTEL_YOUNGSTER
	const RYUKYU_HOTEL_BUG_CATCHER
	const RYUKYU_HOTEL_TEACHER
	const RYUKYU_HOTEL_LASS
	const RYUKYU_HOTEL_JANINE

RyukyuHotel_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .CheckForRoomPass
	

.CheckForRoomPass:
	checkitem ROOM_PASS
	iffalse .UpstairsClosed
	appear RYUKYU_HOTEL_CLERK_2
	disappear RYUKYU_HOTEL_PLACEHOLDER
	disappear RYUKYU_HOTEL_CLERK_1
	return

.UpstairsClosed:
	disappear RYUKYU_HOTEL_CLERK_2
	appear RYUKYU_HOTEL_PLACEHOLDER
	appear RYUKYU_HOTEL_CLERK_1	
	return

RyukyuHotelHiddenMaxPotion:
	hiddenitem MAX_POTION, EVENT_RYUKYU_HOTEL_HIDDEN_MAX_POTION
	
	
RyukyuHotelReceptionist:
	faceplayer
	checkevent EVENT_REPAIRED_SHIP_FUEL_LINE
	iffalse .NoPassYet
	checkevent EVENT_GOT_HOTEL_PASS
	iftrue .AfterGotHotelPass
	opentext
	writetext HotelReceptionistText2
	waitbutton
	writetext HotelReceptionistText
	special PlaceMoneyTopRight
	yesorno
	iffalse HotelReceptionist_NoSale
	checkmoney YOUR_MONEY, 10000
	ifequal HAVE_LESS, HotelReceptionist_NoMoney
;	giveitem MOOMOO_MILK; lolololol why was this here? Looks like the receptionist was handing out secret milk
	takemoney YOUR_MONEY, 10000
	special PlaceMoneyTopRight
	waitsfx
	playsound SFX_TRANSACTION
	writetext HotelReceptionist_GotPass
	waitbutton
	verbosegiveitem ROOM_PASS
	writetext HotelReceptionistText3
	waitbutton
	closetext
	disappear RYUKYU_HOTEL_CLERK_1
	disappear RYUKYU_HOTEL_PLACEHOLDER
	appear RYUKYU_HOTEL_CLERK_2
	setmapscene OAKS_LAB_ENTRANCE, SCENE_OAK_LAB_FRONT_ROOM_AFTER_TALKING_TO_CLERK
	setevent EVENT_FLAMBEAR_POKEBALL_IN_ELMS_LAB
	setevent EVENT_CRUIZE_POKEBALL_IN_ELMS_LAB
	setevent EVENT_CHIKORITA_POKEBALL_IN_ELMS_LAB
	setevent EVENT_GOT_HOTEL_PASS
	end
	
.AfterGotHotelPass
	opentext
	writetext HotelReceptionistText3
	waitbutton
	closetext
	end
	
.NoPassYet
	opentext
	writetext HotelReceptionistText2
	waitbutton
	writetext HotelReceptionistText4
	waitbutton
	closetext
	end
	
HotelReceptionist_NoSale:
	writetext HotelReceptionistNoSaleText
	waitbutton
	closetext
	end
	
HotelReceptionist_NoMoney:
	writetext HotelReceptionistNoMoneyText
	waitbutton
	closetext
	end
	
RyukyuHotelClerk:
	jumptextfaceplayer RyukyuHotelClerkText
	
RyukyuHotelClerk2:
	jumptextfaceplayer RyukyuHotelClerk2Text
	
RyukyuHotelElevatorNeedsPass:
	jumptextfaceplayer RyukyuHotelElevatorNeedsPassText
	
RyukyuHotelYoungster:
	jumptextfaceplayer RyukyuHotelYoungsterText
	
RyukyuHotelBugCatcher:
	jumptextfaceplayer RyukyuHotelBugCatcherText
	
RyukyuHotelTeacher:
	jumptextfaceplayer RyukyuHotelTeacherText
	
RyukyuHotelLass:
	jumptextfaceplayer RyukyuHotelLassText
	
RyukyuHotelJanine:
	jumptextfaceplayer RyukyuHotelJanineText
	
RyukyuHotelYoungsterText:
	text "I've never stayed"
	line "in such a huge"
	cont "hotel before!"
	done
	
RyukyuHotelBugCatcherText:
	text "I want to go out"
	line "to the beach!"
	done
	
RyukyuHotelTeacherText:
	text "Our hotel suite"
	line "is so cozy!"
	done

RyukyuHotelLassText:
	text "Which floor is my"
	line "room on?"
	done
	
RyukyuHotelJanineText:
	text "The weather here"
	line "is beautiful!"
	done
	
RyukyuHotelElevatorNeedsPassText:
	text "It requires a ROOM"
	line "PASS to access…"
	done
	
RyukyuHotelClerkText:
	text "I'm terribly"
	line "sorry, but I can"
	para "only allow access"
	line "to those with a"
	cont "ROOM PASS."
	done
	
RyukyuHotelClerk2Text:
	text "Welcome!"
	para "Many of our guests"
	line "are experienced"
	para "#MON trainers"
	line "who are waiting"
	para "to battle in"
	line "their suites!"
	done
	
HotelReceptionistNoSaleText:
	text "Not interested?"
	para "The offer will"
	line "be waiting."
	done
	
HotelReceptionistNoMoneyText:
	text "Oh, I would have"
	line "assumed the CHAMP-"
	para "ION could have"
	line "afforded this."
	done
	
HotelReceptionist_GotPass:
	text "Here you go!"
	para "Your room is on"
	line "the 5th floor."
	done
	

HotelReceptionistText:
	text "…Say, aren't you"
	line "<PLAYER>?"
	para "As NIHON's CHAMP-"
	line "ION, surely you'd"
	para "want to book a"
	line "room with us."
	para "May I offer you"
	line "a discounted ROOM"
	cont "PASS?"
	para "It's good for the"
	line "year for only"
	cont "¥10000."
	done
	
HotelReceptionistText2:
	text "Welcome to RYUKYU"
	line "HOTEL!"
	para "We are a major"
	line "tourist hotspot"
	cont "for all of NIHON!"
	para "We often have some"
	line "well-known faces"
	cont "booking with us!"
	done

HotelReceptionistText3:
	text "You know PROF.OAK,"
	line "correct?"
	para "He's recently"
	line "started booking"
	cont "weekends here."
	done
	
HotelReceptionistText4:
	text "Though if what I"
	line "hear about the"
	para "S.S.AQUA being out"
	line "of service is"
	para "true, it may dis-"
	line "rupt the travel"
	para "plans of some of"
	line "our future guests…"
	done

RyukyuHotel_MapEvents:
	db 0, 0 ; filler

	db 10 ; warp events
	warp_event 14,  9, RYUKYU_CITY, 12
	warp_event 15,  9, RYUKYU_CITY, 13
	warp_event 13,  9, RYUKYU_CITY, 12
	warp_event 16,  9, RYUKYU_CITY, 13
	warp_event 12,  9, RYUKYU_CITY, 12
	warp_event 17,  9, RYUKYU_CITY, 13
	warp_event  0,  6, RYUKYU_RESTAURANT, 3
	warp_event  0,  7, RYUKYU_RESTAURANT, 4
	warp_event 26,  0, RYUKYU_ELEVATOR, 1
	warp_event 29,  0, RYUKYU_HOTEL_2F, 2

	
	db 0 ; coord events

	db 1 ; bg events
	bg_event 23,  4, BGEVENT_ITEM, RyukyuHotelHiddenMaxPotion

	db 9 ; object events
	object_event  6,  2, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, RyukyuHotelReceptionist, -1
	object_event 29,  1, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, RyukyuHotelClerk, EVENT_HOTEL_UPSTAIRS_IS_BLOCKED
	object_event 26,  0, SPRITE_PLACEHOLDER, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, RyukyuHotelElevatorNeedsPass, EVENT_HOTEL_UPSTAIRS_IS_BLOCKED
	object_event 28,  1, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, RyukyuHotelClerk2, EVENT_HOTEL_UPSTAIRS_IS_NOT_BLOCKED
	object_event 14,  2, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, RyukyuHotelYoungster, -1
	object_event 24,  7, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RyukyuHotelBugCatcher, -1
	object_event 25,  7, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RyukyuHotelTeacher, -1
	object_event 21,  1, SPRITE_LASS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RyukyuHotelLass, -1
	object_event 18,  6, SPRITE_BETA_GIRL, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, RyukyuHotelJanine, -1
