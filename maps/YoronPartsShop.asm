	const_def 2 ; object constants
	const YoronPartsShop_GURU

YoronPartsShop_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

FuelLineGuruScript:
	faceplayer
	opentext
	checkevent EVENT_FAST_SHIP_CABINS_SE_SSE_GENTLEMAN
	iftrue .SSAquaDoingGreat
	checkevent EVENT_USED_THE_CARD_KEY_IN_THE_RADIO_TOWER
	iffalse .GiveCard
	writetext AlreadyGotFuelLineText
	waitbutton
	closetext
	end
	
.SSAquaDoingGreat
	writetext SSAquaDoingGreatText
	waitbutton
	closetext
	end
	
.GiveCard
	writetext YouNeedAFuelLine
	waitbutton
	verbosegiveitem CARD_KEY
	writetext AlreadyGotFuelLineText
	waitbutton
	closetext
	setevent EVENT_USED_THE_CARD_KEY_IN_THE_RADIO_TOWER
	end
	
SSAquaDoingGreatText:
	text "Hey, kid!"
	para "I hear the S.S."
	line "AQUA is sailing"
	para "the seas as smooth"
	line "as ever!"
	done
	
YouNeedAFuelLine:
	text "Well, hello!"
	para "You need parts for"
	line "seafaring vessels?"
	para "I'm your guy!"
	para "…"
	para "Oh, dear!"
	para "The S.S.AQUA needs"
	line "a new FUEL LINE?"
	para "Why, that ship is"
	line "a modern marvel!"
	para "I'll give you the"
	line "part you need,"
	cont "free of charge!"
	done
	
AlreadyGotFuelLineText:
	text "Alright, kid. That"
	line "should be what"
	cont "they need!"
	para "You'll be a hero"
	line "to the whole crew!"
	done

YoronPartsShop_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, YORON_CITY, 3
	warp_event  3,  7, YORON_CITY, 3

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  2,  1, SPRITE_FISHING_GURU, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, FuelLineGuruScript, -1
