	const_def 2 ; object constants
	const CHARCOAL_POKEFAN_M
	const CHARCOAL_POKEFAN_F
	const BAR_FISHER
	const BAR_LASS
	const BAR_N64_YOUNGSTER

BirdonCafe_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	
BarFisherScript:
	jumptextfaceplayer BarFisherScriptText
	
BarLassScript:
	jumptextfaceplayer BarLassScriptText

PokefanM_DairyFarmer:
	faceplayer
	opentext
	checkitem MOOMOO_MILK
	iftrue FarmerMScript_Milking
	writetext FarmerMText_BuyMilk
	special PlaceMoneyTopRight
	yesorno
	iffalse FarmerMScript_NoSale
	checkmoney YOUR_MONEY, 500
	ifequal HAVE_LESS, FarmerMScript_NoMoney
	giveitem MOOMOO_MILK
	iffalse FarmerMScript_NoRoom
	takemoney YOUR_MONEY, 500
	special PlaceMoneyTopRight
	waitsfx
	playsound SFX_TRANSACTION
	writetext FarmerMText_GotMilk
	buttonsound
	itemnotify
	closetext
	end

FarmerMScript_NoMoney:
	writetext FarmerMText_NoMoney
	waitbutton
	closetext
	end

FarmerMScript_NoRoom:
	writetext FarmerMText_NoRoom
	waitbutton
	closetext
	end

FarmerMScript_NoSale:
	writetext FarmerMText_NoSale
	waitbutton
	closetext
	end

FarmerMScript_Milking:
	writetext FarmerMText_Milking
	waitbutton
	closetext
	end

PokefanF_SnoreFarmer:
	jumptextfaceplayer FarmerFText_SnoreSpeech


FarmhouseBookshelf:
	jumpstd picturebookshelf
	
BarN64YoungsterScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_FIRE_STONE_FROM_BILLS_GRANDPA
	iftrue .SendN64YoungsterOff
	writetext BarN64YoungsterBoredText
	waitbutton
	closetext
	end

.SendN64YoungsterOff
	writetext BarN64YoungsterBoredText
	buttonsound
	writetext SendN64YoungsterOffText
	waitbutton
	closetext
	checkcode VAR_FACING
	ifequal DOWN, BarN64YoungsterDownScript
	jump BarN64YoungsterLeftScript
	end
	
BarN64YoungsterDownScript:
	applymovement BAR_N64_YOUNGSTER, BarN64YoungsterDownMovement
	playsound SFX_EXIT_BUILDING
	disappear BAR_N64_YOUNGSTER
	setevent EVENT_GOT_LEAF_STONE_FROM_BILLS_GRANDPA
	clearevent EVENT_GOT_WATER_STONE_FROM_BILLS_GRANDPA
	clearevent EVENT_GOLDENROD_DEPT_STORE_B1F_LAYOUT_1
	waitsfx
	end
	
BarN64YoungsterLeftScript:
	applymovement BAR_N64_YOUNGSTER, BarN64YoungsterLeftMovement
	playsound SFX_EXIT_BUILDING
	disappear BAR_N64_YOUNGSTER
	setevent EVENT_GOT_LEAF_STONE_FROM_BILLS_GRANDPA
	clearevent EVENT_GOT_WATER_STONE_FROM_BILLS_GRANDPA
	clearevent EVENT_GOLDENROD_DEPT_STORE_B1F_LAYOUT_1
	waitsfx
	end
	
BarN64YoungsterLeftMovement:
	step UP
	step RIGHT
	step RIGHT
	step DOWN
	step DOWN
	step DOWN
	step_end
	
BarN64YoungsterDownMovement:
	step RIGHT
	step RIGHT
	step DOWN
	step DOWN
	step_end
	
BarN64YoungsterBoredText:
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
	
BarFisherScriptText:
	text "I come here just"
	line "about every day."
	para "I swear, that"
	line "MOOMOO MILK must"
	cont "be addictive."
	done
	
BarLassScriptText:
	text "There isn't too"
	line "much to do in this"
	cont "town."
	para "A lot of us spend"
	line "our time here just"
	cont "drinking milk."
	done

FarmerMText_BuyMilk:
	text "How'd you like a"
	line "drink?"
	para "We serve MOOMOO"
	line "MILK here."
	para "Ya want some?"
	done

FarmerMText_GotMilk:
	text "Here ya go!"
	line "Drink up'n enjoy!"
	done

FarmerMText_NoMoney:
	text "Sorry, there."
	line "No cash, no sale!"
	done

FarmerMText_NoRoom:
	text "I reckon yer"
	line "PACK's full."
	done

FarmerMText_NoSale:
	text "You don't want it?"
	line "Come again, hear?"
	done

FarmerMText_Milking:
	text "It goes down real"
	line "smooth."
	para "#MON love it"
	line "as well!"
	done


FarmerFText_SnoreSpeech:
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
	object_event  4,  1, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, PokefanM_DairyFarmer, -1
	object_event  7,  5, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, PokefanF_SnoreFarmer, -1
	object_event  3,  3, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, BarFisherScript, -1
	object_event  2,  3, SPRITE_LASS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, BarLassScript, -1
	object_event  0,  5, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, BarN64YoungsterScript, EVENT_GOT_LEAF_STONE_FROM_BILLS_GRANDPA
