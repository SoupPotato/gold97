	const_def 2 ; object constants
	const N64_HOUSE_SCIENTIST
	const N64_HOUSE_YOUNGSTER
	const N64_HOUSE_ROCKER
	const N64_HOUSE_LASS
	const N64_HOUSE_COOLTRAINER_M

Route102N64House_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

N64HouseScientistScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_FIRE_STONE_FROM_BILLS_GRANDPA
	iftrue .AlreadyAskedToSearchN64
	writetext N64HouseScientistText
	buttonsound
	writetext N64HouseScientistText2
	waitbutton
	closetext
	setevent EVENT_GOT_FIRE_STONE_FROM_BILLS_GRANDPA
	end

.AlreadyAskedToSearchN64
	checkevent EVENT_GOT_WATER_STONE_FROM_BILLS_GRANDPA
	iffalse .N64OnePersonSoFar
	writetext N64HouseScientistText2
	waitbutton
	closetext
	end
	
.N64OnePersonSoFar
	checkevent EVENT_GOLDENROD_DEPT_STORE_B1F_LAYOUT_2
	iffalse .N64TwoPeopleNow
	writetext N64HouseScientistText3
	waitbutton
	closetext
	end
	
.N64TwoPeopleNow
	checkevent EVENT_GOLDENROD_UNDERGROUND_WAREHOUSE_BLOCKED_OFF
	iffalse .N643PeopleTimeForStarter3
	writetext N64HouseScientistText4
	waitbutton
	closetext
	end
	
.N643PeopleTimeForStarter3
	checkevent EVENT_TIN_TOWER_1F_ENTEI
	iftrue .AlreadyGotStarter3
	writetext N64HouseScientistText5
	waitbutton
	checkevent EVENT_GOT_CRUIZE_FROM_ELM
	iftrue .HaveCruiseGiveFlambear
	checkevent EVENT_GOT_CHIKORITA_FROM_ELM
	iftrue .HaveCHIKORITAGiveCruise
	checkcode VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .PartyFullStarter3
	giveegg CHIKORITA, 5
	stringtotext .eggname3, MEM_BUFFER_1
	scall .GetStarter3Egg
	writetext TakeGoodCareOfStarter3
	waitbutton
	closetext
	setevent EVENT_TIN_TOWER_1F_ENTEI
	end
	
.HaveCHIKORITAGiveCruise
	checkcode VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .PartyFullStarter3
	giveegg CRUIZE, 5
	stringtotext .eggname3, MEM_BUFFER_1
	scall .GetStarter3Egg
	writetext TakeGoodCareOfStarter3
	waitbutton
	closetext
	setevent EVENT_TIN_TOWER_1F_ENTEI
	end
	
.HaveCruiseGiveFlambear
	checkcode VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .PartyFullStarter3
	giveegg FLAMBEAR, 5
	stringtotext .eggname3, MEM_BUFFER_1
	scall .GetStarter3Egg
	writetext TakeGoodCareOfStarter3
	waitbutton
	closetext
	setevent EVENT_TIN_TOWER_1F_ENTEI
	end
	
.AlreadyGotStarter3
	writetext AlreadyGotStarter3Text
	waitbutton
	closetext
	end
	
.eggname3
	db "EGG@"
	
.GetStarter3Egg:
	jumpstd receivetogepiegg
	end
	
.PartyFullStarter3
	writetext NoRoomForStarter3
	waitbutton
	closetext
	end
	
N64HouseRockerScript:
	faceplayer
	opentext
	writetext N64HouseRockerText
	waitbutton
	closetext
	turnobject N64_HOUSE_ROCKER, RIGHT
	end

N64HouseYoungsterScript:
	faceplayer
	opentext
	checkevent EVENT_GOLDENROD_DEPT_STORE_B1F_LAYOUT_2
	iffalse .RockerTwoPeopleNow
	writetext RockerN64AloneText
	waitbutton
	closetext
	turnobject N64_HOUSE_YOUNGSTER, UP
	end
	
.RockerTwoPeopleNow
	writetext RockerN64TwoPeopleText
	waitbutton
	closetext
	turnobject N64_HOUSE_YOUNGSTER, UP
	end
	
N64HouseLassScript:
	faceplayer
	opentext
	writetext N64HouseLassText
	waitbutton
	closetext
	turnobject N64_HOUSE_LASS, UP
	end
	
N64HouseCooltrainerMScript:
	faceplayer
	opentext
	writetext N64HouseCooltrainerMText
	waitbutton
	closetext
	turnobject N64_HOUSE_COOLTRAINER_M, LEFT
	end
	
N64HouseFisherScript:
	jumptextfaceplayer N64HouseFisherText
	
N64HouseN64Script:
	jumptext N64HouseN64Text
	
N64HouseN64Text:
	text "<PLAYER> played the"
	line "N64."

	para "Better get going--"
	line "no time to lose!"
	done
	
N64HouseFisherText:
	text "Should I try to"
	line "play the racing"
	para "game with those"
	line "guys?"
	para "I think I'd be no"
	line "good at it."
	done
	
N64HouseCooltrainerMText:
	text "This place has a"
	line "great selection of"
	cont "sports games!"
	done
	
N64HouseLassText:
	text "I'm no good at"
	line "sports games, but"
	para "my friend here"
	line "helps me learn."
	done
	
TakeGoodCareOfStarter3:
	text "I know you'll take"
	line "great care of that"
	cont "#MON."
	done
	
NoRoomForStarter3:
	text "Oh, wait! You have"
	line "no room for this!"
	done
	
AlreadyGotStarter3Text:
	text "This place is the"
	line "coolest spot for"
	para "trainers to come"
	line "socialize and play"
	cont "games!"
	para "All thanks to you!"
	done
	
N64HouseScientistText5:
	text "Wow, look at all"
	line "of these trainers."
	para "It's incredible!"
	line "I owe you a ton!"
	para "Here, take this"
	line "#MON EGG."
	para "It's a rare"
	line "#MON, I'm sure"
	para "you'd appreciate"
	line "it."
	done
	
N64HouseRockerText:
	text "I'm gonna win!"
	done

RockerN64AloneText:
	text "This racing game"
	line "is neat, but"
	para "there's no one"
	line "here to race"
	cont "against!"
	para "I came here to"
	line "meet other"
	para "trainers, but I'm"
	line "alone so far."
	done
	
RockerN64TwoPeopleText:
	text "Hey, this is much"
	line "more fun with"
	cont "another person!"
	done

N64HouseScientistText4:
	text "Wow, two people!"
	para "I may realize my"
	line "dream of owning"
	para "a hot gathering"
	line "place for #MON"
	cont "trainers!"
	para "See if you can"
	line "find another!"
	para "Maybe somewhere"
	line "that people meet"
	para "to socialize, but"
	line "doesn't have any"
	cont "games to play…"
	done
	
N64HouseScientistText3:
	text "Hey, someone"
	line "showed up!"
	para "That's great!"
	para "Did you let him"
	line "know about this"
	cont "place?"
	para "I'm very grateful."
	para "See if you can"
	line "find anyone else!"
	para "Maybe look some-"
	line "where that people"
	para "play other types"
	line "of games…"
	done
	
N64HouseScientistText2:
	text "How about it?"
	para "Let any trainers"
	line "who might be"
	para "interested know"
	line "about this place."
	para "Maybe look in a"
	line "town where there"
	para "isn't too much"
	line "to do…"
	done

N64HouseScientistText:
	text "Hmmm."
	para "I opened this game"
	line "house as a place"
	para "for trainers to"
	line "come and socialize"
	cont "between battles."
	para "But it doesn't"
	line "seem to be"
	cont "catching on…"
	para "Hey, if you find"
	line "any trainers who"
	para "might be interest-"
	line "ed in a place like"
	para "this, could you"
	line "let them know?"
	done
	
Route102N64House_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, ROUTE_102, 2
	warp_event  5,  7, ROUTE_102, 2

	db 0 ; coord events

	db 2 ; bg events
	bg_event  4,  3, BGEVENT_READ, N64HouseN64Script
	bg_event  0,  3, BGEVENT_READ, N64HouseN64Script


	db 6 ; object events
	object_event 6,  6, SPRITE_SCIENTIST, SPRITEMOVEDATA_SPINRANDOM_SLOW, 2, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, N64HouseScientistScript, -1
	object_event 4,  4, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, N64HouseYoungsterScript, EVENT_GOT_WATER_STONE_FROM_BILLS_GRANDPA
	object_event 3,  3, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, N64HouseRockerScript, EVENT_GOLDENROD_DEPT_STORE_B1F_LAYOUT_2
	object_event 0,  4, SPRITE_LASS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, N64HouseLassScript, EVENT_GOLDENROD_UNDERGROUND_WAREHOUSE_BLOCKED_OFF
	object_event 1,  3, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, N64HouseCooltrainerMScript, EVENT_GOLDENROD_UNDERGROUND_WAREHOUSE_BLOCKED_OFF
	object_event 7,  2, SPRITE_FISHER, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, N64HouseFisherScript, EVENT_GOLDENROD_UNDERGROUND_WAREHOUSE_BLOCKED_OFF
