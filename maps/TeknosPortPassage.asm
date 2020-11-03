	const_def 2 ; object constants
	const TEKNOSPORTPASSAGE_CLERK

TeknosPortPassage_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .DollThursday

.DollThursday:
	checkcode VAR_WEEKDAY
	ifequal THURSDAY, .DollThursdayAppears
	disappear TEKNOSPORTPASSAGE_CLERK
	return

.DollThursdayAppears:
	appear TEKNOSPORTPASSAGE_CLERK
	return


;-------------
	
TravelingDollSalesmanThursday:
	faceplayer
	opentext
	writetext DollSalesmanTextThursday
	waitbutton
DollSalesmanThursday_LoopScript:
	writetext DollSalesmanTextThursday_AskWhichPrizeText
	special PlaceMoneyTopRight
	loadmenu DollSalesmanThursdayMenu
	verticalmenu
	closewindow
	ifequal 1, .Doll1
	ifequal 2, .Doll2
	ifequal 3, .Doll3
	jump DollSalesmanThursday_Cancel
	
.Doll1
	checkmoney YOUR_MONEY, 5000
	ifequal HAVE_LESS, DollSalesmanThursdayNoMoney
	writetext SendItemToPCTextDollThursday
	yesorno
	iffalse DollSalesmanThursday_Cancel
	checkevent EVENT_DECO_GENGAR_DOLL
	iftrue .AlreadyHaveDecorItem
	setevent EVENT_DECO_GENGAR_DOLL
	takemoney YOUR_MONEY, 5000
	jump DollSalesmanThursday_FinishScript
	end
	
.Doll2
	checkmoney YOUR_MONEY, 5000
	ifequal HAVE_LESS, DollSalesmanThursdayNoMoney
	writetext SendItemToPCTextDollThursday
	yesorno
	iffalse DollSalesmanThursday_Cancel
	checkevent EVENT_DECO_SHELLDER_DOLL
	iftrue .AlreadyHaveDecorItem
	setevent EVENT_DECO_SHELLDER_DOLL
	takemoney YOUR_MONEY, 5000
	jump DollSalesmanThursday_FinishScript
	end
	
.Doll3
	checkmoney YOUR_MONEY, 5000
	ifequal HAVE_LESS, DollSalesmanThursdayNoMoney
	writetext SendItemToPCTextDollThursday
	yesorno
	iffalse DollSalesmanThursday_Cancel
	checkevent EVENT_DECO_GRIMER_DOLL
	iftrue .AlreadyHaveDecorItem
	setevent EVENT_DECO_GRIMER_DOLL
	takemoney YOUR_MONEY, 5000
	jump DollSalesmanThursday_FinishScript
	end
	
.AlreadyHaveDecorItem
	writetext AlreadyHaveDecorItemTextSalesmanThursday
	waitbutton
	jump DollSalesmanThursday_LoopScript

	
DollSalesmanThursdayMenu:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 2, 19, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 4 ; items
	db "GENGAR      ¥5000@"
	db "SHELLDER    ¥5000@"
	db "GRIMER      ¥5000@"
	db "CANCEL@"
	
DollSalesmanThursday_FinishScript:
	waitsfx
	playsound SFX_TRANSACTION
	writetext DollSalesmanThursday_HereYouGoText
	waitbutton
	jump DollSalesmanThursday_LoopScript

DollSalesmanThursday_Cancel:
	writetext DollSalesmanThursdayComeAgain
	waitbutton
	closetext
	end

	
DollSalesmanThursdayNoMoney:
	writetext DollSalesmanThursdayNoMoneyText
	waitbutton
	closetext
	end
	
SendItemToPCTextDollThursday:
	text "Send this DOLL to"
	line "your bedroom PC?"
	done

AlreadyHaveDecorItemTextSalesmanThursday:
	text "You already have"
	line "this DOLL!"
	done

DollSalesmanThursday_HereYouGoText:
	text "Here you go!"
	done
	
DollSalesmanThursdayComeAgain:
	text "Hope to see you"
	line "again somewhere!"
	done
	
DollSalesmanThursdayNoMoneyText:
	text "Sorry, you'll"
	line "need more money!"
	done
	
DollSalesmanTextThursday:
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
	
DollSalesmanTextThursday_AskWhichPrizeText:
	text "Now which DOLL"
	line "would you like?"
	done
	
;---------------------------------


	
TeknosPortPassage_MapEvents:
	db 0, 0 ; filler

	db 5 ; warp events
	warp_event 13, 14, TEKNOS_CITY, 1
	warp_event 14, 14, TEKNOS_CITY, 2
	warp_event 14, 16, TEKNOS_PORT_PASSAGE, 4
	warp_event 3, 2, TEKNOS_PORT_PASSAGE, 3
	warp_event 3, 14, TEKNOS_PORT, 1

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events	
	object_event 11, 15, SPRITE_CLERK, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, TravelingDollSalesmanThursday, EVENT_DOLL_SALESMAN_THURSDAY	
