	const_def 1 ; object constants
	const NEWECRUTEAKGATESOUTH_OFFICER
	const NEWECRUTEAKGATESOUTH_ROCKER
	const ROUTE105ROUTE106GATE_CLERK

Route105Route106Gate_MapScripts:
	db 0 ; scene scripts

	db 1 ; scene scripts
	callback MAPCALLBACK_OBJECTS, .DollWednesday

.DollWednesday:
	checkcode VAR_WEEKDAY
	ifequal WEDNESDAY, .DollWednesdayAppears
	disappear ROUTE105ROUTE106GATE_CLERK
	return

.DollWednesdayAppears:
	appear ROUTE105ROUTE106GATE_CLERK
	return

Route105Route106GateOfficerScript:
	jumptextfaceplayer Route105Route106GateOfficerText
	
Route105Route106GateRockerScript:
	jumptextfaceplayer Route105Route106GateRockerText

;-------------
	
TravelingDollSalesmanWednesday:
	faceplayer
	opentext
	writetext DollSalesmanTextWednesday
	waitbutton
DollSalesmanWednesday_LoopScript:
	writetext DollSalesmanTextWednesday_AskWhichPrizeText
	special PlaceMoneyTopRight
	loadmenu DollSalesmanWednesdayMenu
	verticalmenu
	closewindow
	ifequal 1, .Doll1
	ifequal 2, .Doll2
	ifequal 3, .Doll3
	jump DollSalesmanWednesday_Cancel
	
.Doll1
	checkmoney YOUR_MONEY, 5000
	ifequal HAVE_LESS, DollSalesmanWednesdayNoMoney
	writetext SendItemToPCTextDollWednesday
	yesorno
	iffalse DollSalesmanWednesday_Cancel
	checkevent EVENT_DECO_SQUIRTLE_DOLL
	iftrue .AlreadyHaveDecorItem
	setevent EVENT_DECO_SQUIRTLE_DOLL
	takemoney YOUR_MONEY, 5000
	jump DollSalesmanWednesday_FinishScript
	end
	
.Doll2
	checkmoney YOUR_MONEY, 5000
	ifequal HAVE_LESS, DollSalesmanWednesdayNoMoney
	writetext SendItemToPCTextDollWednesday
	yesorno
	iffalse DollSalesmanWednesday_Cancel
	checkevent EVENT_DECO_MAGIKARP_DOLL
	iftrue .AlreadyHaveDecorItem
	setevent EVENT_DECO_MAGIKARP_DOLL
	takemoney YOUR_MONEY, 5000
	jump DollSalesmanWednesday_FinishScript
	end
	
.Doll3
	checkmoney YOUR_MONEY, 5000
	ifequal HAVE_LESS, DollSalesmanWednesdayNoMoney
	writetext SendItemToPCTextDollWednesday
	yesorno
	iffalse DollSalesmanWednesday_Cancel
	checkevent EVENT_DECO_ODDISH_DOLL
	iftrue .AlreadyHaveDecorItem
	setevent EVENT_DECO_ODDISH_DOLL
	takemoney YOUR_MONEY, 5000
	jump DollSalesmanWednesday_FinishScript
	end
	
.AlreadyHaveDecorItem
	writetext AlreadyHaveDecorItemTextSalesmanWednesday
	waitbutton
	jump DollSalesmanWednesday_LoopScript

	
DollSalesmanWednesdayMenu:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 2, 19, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 4 ; items
	db "SQUIRTLE    ¥5000@"
	db "MAGIKARP    ¥5000@"
	db "ODDISH      ¥5000@"
	db "CANCEL@"
	
DollSalesmanWednesday_FinishScript:
	waitsfx
	playsound SFX_TRANSACTION
	writetext DollSalesmanWednesday_HereYouGoText
	waitbutton
	jump DollSalesmanWednesday_LoopScript

DollSalesmanWednesday_Cancel:
	writetext DollSalesmanWednesdayComeAgain
	waitbutton
	closetext
	end

	
DollSalesmanWednesdayNoMoney:
	writetext DollSalesmanWednesdayNoMoneyText
	waitbutton
	closetext
	end
	
SendItemToPCTextDollWednesday:
	text "Send this DOLL to"
	line "your bedroom PC?"
	done

AlreadyHaveDecorItemTextSalesmanWednesday:
	text "You already have"
	line "this DOLL!"
	done

DollSalesmanWednesday_HereYouGoText:
	text "Here you go!"
	done
	
DollSalesmanWednesdayComeAgain:
	text "Hope to see you"
	line "again somewhere!"
	done
	
DollSalesmanWednesdayNoMoneyText:
	text "Sorry, you'll"
	line "need more money!"
	done
	
DollSalesmanTextWednesday:
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
	
DollSalesmanTextWednesday_AskWhichPrizeText:
	text "Now which DOLL"
	line "would you like?"
	done
	
;---------------------------------


Route105Route106GateOfficerText:
	text "JADE FOREST is"
	line "a mysterious area."
	para "Be sure to treat"
	line "it with respect."
	done

Route105Route106GateRockerText:
	text "I like going for"
	line "peaceful walks in"
	cont "JADE FOREST."
	para "It's a lot less"
	line "scary in there"
	para "once you know your"
	line "way around."
	done

Route105Route106Gate_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  4,  0, ROUTE_105, 1
	warp_event  5,  0, ROUTE_105, 2
	warp_event  4,  7, ROUTE_106, 1
	warp_event  5,  7, ROUTE_106, 2

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  0,  4, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route105Route106GateOfficerScript, -1
	object_event  6,  3, SPRITE_ROCKER, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route105Route106GateRockerScript, -1
	object_event  3,  2, SPRITE_CLERK, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, TravelingDollSalesmanWednesday, EVENT_DOLL_SALESMAN_WEDNESDAY
