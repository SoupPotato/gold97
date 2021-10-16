	const_def 2 ; object constants
	const AMAMIPORTPASSAGE_TEACHER
	const AMAMIPORTPASSAGE_GRAMPS
	const AMAMIPORTPASSAGE_ABRA
	const AMAMIPORTPASSAGE_CLERK

AmamiPortPassage_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .DollFriday

.DollFriday:
	checkcode VAR_WEEKDAY
	ifequal FRIDAY, .DollFridayAppears
	disappear AMAMIPORTPASSAGE_CLERK
	return

.DollFridayAppears:
	appear AMAMIPORTPASSAGE_CLERK
	return
	

TravelingDollSalesmanFriday:
	faceplayer
	opentext
	writetext DollSalesmanTextFriday
	waitbutton
DollSalesmanFriday_LoopScript:
	writetext DollSalesmanTextFriday_AskWhichPrizeText
	special PlaceMoneyTopRight
	loadmenu DollSalesmanFridayMenu
	verticalmenu
	closewindow
	ifequal 1, .Doll1
	ifequal 2, .Doll2
	ifequal 3, .Doll3
	jump DollSalesmanFriday_Cancel
	
.Doll1
	checkmoney YOUR_MONEY, 5000
	ifequal HAVE_LESS, DollSalesmanFridayNoMoney
	writetext SendItemToPCTextDollFriday
	yesorno
	iffalse DollSalesmanFriday_Cancel
	checkevent EVENT_DECO_VOLTORB_DOLL
	iftrue .AlreadyHaveDecorItem
	setevent EVENT_DECO_VOLTORB_DOLL
	takemoney YOUR_MONEY, 5000
	jump DollSalesmanFriday_FinishScript
	end
	
.Doll2
	checkmoney YOUR_MONEY, 5000
	ifequal HAVE_LESS, DollSalesmanFridayNoMoney
	writetext SendItemToPCTextDollFriday
	yesorno
	iffalse DollSalesmanFriday_Cancel
	checkevent EVENT_DECO_WEEDLE_DOLL
	iftrue .AlreadyHaveDecorItem
	setevent EVENT_DECO_WEEDLE_DOLL
	takemoney YOUR_MONEY, 5000
	jump DollSalesmanFriday_FinishScript
	end
	
.Doll3
	checkmoney YOUR_MONEY, 5000
	ifequal HAVE_LESS, DollSalesmanFridayNoMoney
	writetext SendItemToPCTextDollFriday
	yesorno
	iffalse DollSalesmanFriday_Cancel
	checkevent EVENT_DECO_GEODUDE_DOLL
	iftrue .AlreadyHaveDecorItem
	setevent EVENT_DECO_GEODUDE_DOLL
	takemoney YOUR_MONEY, 5000
	jump DollSalesmanFriday_FinishScript
	end
	
.AlreadyHaveDecorItem
	writetext AlreadyHaveDecorItemTextSalesmanFriday
	waitbutton
	jump DollSalesmanFriday_LoopScript

	
DollSalesmanFridayMenu:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 2, 19, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 4 ; items
	db "VOLTORB     ¥5000@"
	db "WEEDLE      ¥5000@"
	db "GEODUDE     ¥5000@"
	db "CANCEL@"
	
DollSalesmanFriday_FinishScript:
	waitsfx
	playsound SFX_TRANSACTION
	writetext DollSalesmanFriday_HereYouGoText
	waitbutton
	jump DollSalesmanFriday_LoopScript

DollSalesmanFriday_Cancel:
	writetext DollSalesmanFridayComeAgain
	waitbutton
	closetext
	end

	
DollSalesmanFridayNoMoney:
	writetext DollSalesmanFridayNoMoneyText
	waitbutton
	closetext
	end
	
SendItemToPCTextDollFriday:
	text "Send this DOLL to"
	line "your bedroom PC?"
	done

AlreadyHaveDecorItemTextSalesmanFriday:
	text "You already have"
	line "this DOLL!"
	done

DollSalesmanFriday_HereYouGoText:
	text "Here you go!"
	done
	
DollSalesmanFridayComeAgain:
	text "Hope to see you"
	line "again somewhere!"
	done
	
DollSalesmanFridayNoMoneyText:
	text "Sorry, you'll"
	line "need more money!"
	done
	
DollSalesmanTextFriday:
	text "Hiya!"
	para "I'm a traveling"
	line "DOLL salesman!"
	para "What does that"
	line "mean?"
	para "It means that I'm"
	line "who you talk to"
	para "if you want to"
	line "deck out your"
	cont "bedroom!"
	para "My stock and my"
	line "location change"
	para "daily, so keep an"
	line "eye out for me!"
	done
	
DollSalesmanTextFriday_AskWhichPrizeText:
	text "Now which DOLL"
	line "would you like?"
	done
	

AmamiPortPassageTeacherScript:
	jumptextfaceplayer AmamiPortPassageTeacherText
	
TeleportGuyScript:
	faceplayer
	opentext
	checkevent EVENT_ABRA_TELEPORT_GUY_AMAMI
	iftrue .SkipTeleportTextAmami
	writetext TeleportGuyText1
	buttonsound
	setevent EVENT_ABRA_TELEPORT_GUY_AMAMI
.SkipTeleportTextAmami
	writetext TeleportGuyText1_2
	yesorno
	iffalse .No
	writetext TeleportGuyYesText
	waitbutton
	closetext
	playsound SFX_WARP_TO
	special FadeOutPalettes
	waitsfx
	warp WESTPORT_PORT_PASSAGE, 13, 2
	end

.No:
	writetext TeleportGuyNoText
	waitbutton
	closetext
	end

AbraScript:
	opentext
	writetext AbraText
	cry ABRA
	waitbutton
	closetext
	end


AmamiPortPassageTeacherText:
	text "The S.S.AQUA sails"
	line "to WESTPORT CITY"
	para "on Wednesdays and"
	line "Sundays."
	done
	

TeleportGuyText1:
	text "Don't feel like"
	line "taking the ship?"
	para "Or maybe it isn't"
	line "running today?"
	para "Well look here!"
	para "My beloved ABRA"
	line "can send you back"
	para "to the mainland in"
	line "an instant!"
	para "I got a buddy "
	line "waiting at the"
	cont "WESTPORT DOCKS."
	para "I'll send you to"
	line "him!"
	para "How about it?"
	done
	
TeleportGuyText1_2:
	text "Want to go to"
	line "WESTPORT CITY?"
	done

TeleportGuyYesText:
	text "OK, OK. Picture"
	line "WESTPORT CITY in"
	cont "your mind…"
	done

TeleportGuyNoText:
	text "OK, OK. I'll be"
	line "here!"
	done

AbraText:
	text "ABRA: Aabra…"
	done


AmamiPortPassage_MapEvents:
	db 0, 0 ; filler

	db 5 ; warp events
	warp_event 19,  4, AMAMI_TOWN, 1
	warp_event 19,  5, AMAMI_TOWN, 2
	warp_event 15, 14, AMAMI_PORT_PASSAGE, 4
	warp_event 15,  4, AMAMI_PORT_PASSAGE, 3
	warp_event  3, 14, AMAMI_PORT, 1

	db 0 ; coord events

	db 0 ; bg events

	db 4 ; object events
	object_event 18,  2, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AmamiPortPassageTeacherScript, -1
	object_event 13,  1, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, TeleportGuyScript, EVENT_TELEPORT_GUY
	object_event 14,  1, SPRITE_JYNX, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, AbraScript, EVENT_TELEPORT_GUY
	object_event  5, 13, SPRITE_CLERK, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, TravelingDollSalesmanFriday, EVENT_DOLL_SALESMAN_FRIDAY
