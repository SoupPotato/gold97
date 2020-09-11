	const_def 2
	const DAITOHOUSE_FARMER
	const DAITOHOUSE_WIFE


DaitoRanchHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

DaitoRanchero_DairyFarmer:
	faceplayer
	opentext
	checkevent EVENT_HEALED_MOOMOO
	iftrue DaitoRancheroScript_SellMilk
	writetext DaitoRancheroText_SickCow
	waitbutton
	closetext
	setevent EVENT_TALKED_TO_FARMER_ABOUT_MOOMOO
	end

DaitoRancheroScript_SellMilk:
	checkitem MOOMOO_MILK
	iftrue DaitoRancheroScript_Milking
	writetext DaitoRancheroText_BuyMilk
	special PlaceMoneyTopRight
	yesorno
	iffalse DaitoRancheroScript_NoSale
	checkmoney YOUR_MONEY, 500
	ifequal HAVE_LESS, DaitoRancheroScript_NoMoney
	giveitem MOOMOO_MILK
	iffalse DaitoRancheroScript_NoRoom
	takemoney YOUR_MONEY, 500
	special PlaceMoneyTopRight
	waitsfx
	playsound SFX_TRANSACTION
	writetext DaitoRancheroText_GotMilk
	buttonsound
	itemnotify
	closetext
	end

DaitoRancheroScript_NoMoney:
	writetext DaitoRancheroText_NoMoney
	waitbutton
	closetext
	end

DaitoRancheroScript_NoRoom:
	writetext DaitoRancheroText_NoRoom
	waitbutton
	closetext
	end

DaitoRancheroScript_NoSale:
	writetext DaitoRancheroText_NoSale
	waitbutton
	closetext
	end

DaitoRancheroScript_Milking:
	writetext DaitoRancheroText_Milking
	waitbutton
	closetext
	end

DaitoRancheroText_SickCow:
	text "My MILTANK ain't"
	line "givin' me milk"
	cont "n'more."

	para "This here FARM's"
	line "got famous milk."

	para "Most everyone"
	line "wants a drink."

	para "It'll give me lots"
	line "o' milk if'n I"

	para "feed it lots o'"
	line "APPLES, I reckon."
	done

DaitoRancheroText_BuyMilk:
	text "How'd you like my"
	line "MOOMOO MILK?"

	para "It's my pride and"
	line "joy, there."

	para "Give it to #MON"
	line "to restore HP!"

	para "I'll give it to ya"
	line "fer just ¥500."
	done

DaitoRancheroText_GotMilk:
	text "Here ya go!"
	line "Drink up'n enjoy!"
	done

DaitoRancheroText_NoMoney:
	text "Sorry, there."
	line "No cash, no sale!"
	done

DaitoRancheroText_NoRoom:
	text "I reckon yer"
	line "PACK's full."
	done

DaitoRancheroText_NoSale:
	text "You don't want it?"
	line "Come again, hear?"
	done

DaitoRancheroText_Milking:
	text "I best go do my"
	line "milkin'."
	done

DaitoHouseWifeScript:
	faceplayer
	opentext
	writetext Route26HealHouseRestAWhileText
	waitbutton
	closetext
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	special StubbedTrainerRankings_Healings
	playmusic MUSIC_HEAL
	special HealParty
	pause 60
	special FadeInQuickly
	special RestartMapMusic
	opentext
	writetext Route26HealHouseKeepAtItText
	waitbutton
	closetext
	end
	
Route26HealHouseRestAWhileText:
	text "Your #MON look"
	line "a little tired."

	para "You should rest"
	line "them a while."
	done

Route26HealHouseKeepAtItText:
	text "There!"

	para "Your #MON are"
	line "looking good!"

	para "Keep at it!"
	done


DaitoRanchHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, DAITO_RANCH, 1
	warp_event  5,  7, DAITO_RANCH, 1

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  4,  3, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, DaitoRanchero_DairyFarmer, -1
	object_event  7,  4, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, DaitoHouseWifeScript, -1
