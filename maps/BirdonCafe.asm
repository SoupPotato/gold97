	const_def 2 ; object constants
	const BIRDONCAFE_POKEFAN_M
	const BIRDONCAFE_POKEFAN_F
	const BIRDONCAFE_FISHER
	const BIRDONCAFE_LASS
	const BIRDONCAFE_N64_YOUNGSTER

BirdonCafe_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	
BirdonCafeFisherScript:
	jumptextfaceplayer BirdonCafeFisherScriptText
	
BirdonCafeLassScript:
	jumptextfaceplayer BirdonCafeLassScriptText

BirdonCafe_DairyFarmer:
	faceplayer
	opentext
	checkitem MOOMOO_MILK
	iftrue DairyFarmerScript_Milking
	writetext DairyFarmerText_BuyMilk
	special PlaceMoneyTopRight
	yesorno
	iffalse DairyFarmerScript_NoSale
	checkmoney YOUR_MONEY, 500
	ifequal HAVE_LESS, DairyFarmerScript_NoMoney
	giveitem MOOMOO_MILK
	iffalse DairyFarmerScript_NoRoom
	takemoney YOUR_MONEY, 500
	special PlaceMoneyTopRight
	waitsfx
	playsound SFX_TRANSACTION
	writetext DairyFarmerText_GotMilk
	buttonsound
	itemnotify
	closetext
	end

DairyFarmerScript_NoMoney:
	writetext DairyFarmerText_NoMoney
	waitbutton
	closetext
	end

DairyFarmerScript_NoRoom:
	writetext DairyFarmerText_NoRoom
	waitbutton
	closetext
	end

DairyFarmerScript_NoSale:
	writetext DairyFarmerText_NoSale
	waitbutton
	closetext
	end

DairyFarmerScript_Milking:
	writetext DairyFarmerText_Milking
	waitbutton
	closetext
	end

BirdonCafe_PokefanF:
	jumptextfaceplayer BirdonCafe_PokefanFText_SnoreSpeech


FarmhouseBookshelf:
	jumpstd picturebookshelf
	
BirdonCafeN64YoungsterScript:
	faceplayer
	opentext
	checkevent EVENT_N64_HOUSE_LOOKING_FOR_PLAYERS
	iftrue .SendN64YoungsterOff
	writetext BirdonCafeN64YoungsterBoredText
	waitbutton
	closetext
	end

.SendN64YoungsterOff
	writetext BirdonCafeN64YoungsterBoredText
	buttonsound
	writetext SendN64YoungsterOffText
	waitbutton
	closetext
	checkcode VAR_FACING
	ifequal DOWN, BirdonCafeN64YoungsterDownScript
	jump BirdonCafeN64YoungsterLeftScript
	end
	
BirdonCafeN64YoungsterDownScript:
	applymovement BIRDONCAFE_N64_YOUNGSTER, BirdonCafeN64YoungsterDownMovement
	playsound SFX_EXIT_BUILDING
	disappear BIRDONCAFE_N64_YOUNGSTER
	setevent EVENT_BIRDON_N64_YOUNGSTER_LEFT_CAFE
	clearevent EVENT_BIRDON_YOUNGSTER_AT_N64_HOUSE
	clearevent EVENT_KANTO_N64_ROCKER_AT_GAME_CORNER
	waitsfx
	end
	
BirdonCafeN64YoungsterLeftScript:
	applymovement BIRDONCAFE_N64_YOUNGSTER, BirdonCafeN64YoungsterLeftMovement
	playsound SFX_EXIT_BUILDING
	disappear BIRDONCAFE_N64_YOUNGSTER
	setevent EVENT_BIRDON_N64_YOUNGSTER_LEFT_CAFE
	clearevent EVENT_BIRDON_YOUNGSTER_AT_N64_HOUSE
	clearevent EVENT_KANTO_N64_ROCKER_AT_GAME_CORNER
	waitsfx
	end
	
BirdonCafeN64YoungsterLeftMovement:
	step UP
	step RIGHT
	step RIGHT
	step DOWN
	step DOWN
	step DOWN
	step_end
	
BirdonCafeN64YoungsterDownMovement:
	step RIGHT
	step RIGHT
	step DOWN
	step DOWN
	step_end
	
BirdonCafeN64YoungsterBoredText:
	text "Man, I'm bored."
	para "There's nothing to"
	line "do in this town."
	para "I'd love to meet"
	line "some other"
	para "trainers, and hang"
	line "out and play video"
	cont "games with them."
	para "But I don't know"
	line "anywhere I could"
	cont "do that."
	done
	
SendN64YoungsterOffText:
	text "Oh?"
	para "There's a place"
	line "outside WESTPORT"
	cont "where I could go?"
	para "What the heck, I"
	line "have nothing else"
	cont "to do."
	para "I'll check it out,"
	line "thanks!"
	done
	
BirdonCafeFisherScriptText:
	text "I come here just"
	line "about every day."
	para "I swear, that"
	line "MOOMOO MILK must"
	cont "be addictive."
	done
	
BirdonCafeLassScriptText:
	text "There isn't too"
	line "much to do in this"
	cont "town."
	para "A lot of us spend"
	line "our time here just"
	cont "drinking milk."
	done

DairyFarmerText_BuyMilk:
	text "How'd you like a"
	line "drink?"
	para "We serve MOOMOO"
	line "MILK here."
	para "Ya want some?"
	done

DairyFarmerText_GotMilk:
	text "Here ya go!"
	line "Drink up'n enjoy!"
	done

DairyFarmerText_NoMoney:
	text "Sorry, there."
	line "No cash, no sale!"
	done

DairyFarmerText_NoRoom:
	text "I reckon yer"
	line "PACK's full."
	done

DairyFarmerText_NoSale:
	text "You don't want it?"
	line "Come again, hear?"
	done

DairyFarmerText_Milking:
	text "It goes down real"
	line "smooth."
	para "#MON love it"
	line "as well!"
	done


BirdonCafe_PokefanFText_SnoreSpeech:
	text "MOOMOO MILK is"
	line "just plain"
	cont "delicious!"
	done

BirdonCafe_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, BIRDON_TOWN, 2
	warp_event  3,  7, BIRDON_TOWN, 2

	db 0 ; coord events

	db 0 ; bg events

	db 5 ; object events
	object_event  4,  1, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BirdonCafe_DairyFarmer, -1
	object_event  7,  5, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, BirdonCafe_PokefanF, -1
	object_event  3,  3, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, BirdonCafeFisherScript, -1
	object_event  2,  3, SPRITE_LASS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, BirdonCafeLassScript, -1
	object_event  0,  5, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, BirdonCafeN64YoungsterScript, EVENT_BIRDON_N64_YOUNGSTER_LEFT_CAFE
