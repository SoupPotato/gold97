	const_def 2 ; object constants
	const ROUTE7SAFFRONGATE_OFFICER
	const ROUTE118SUNPOINTGATE_CLERK

Route118SunpointGate_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .DollTuesday

.DollTuesday:
	checkcode VAR_WEEKDAY
	ifequal TUESDAY, .DollTuesdayAppears
	disappear ROUTE118SUNPOINTGATE_CLERK
	return

.DollTuesdayAppears:
	appear ROUTE118SUNPOINTGATE_CLERK
	return

Route7SaffronGuardScript:
	jumptextfaceplayer Route7SaffronGuardSeriousText

;-------------
	
TravelingDollSalesmanTuesday:
	faceplayer
	opentext
	writetext DollSalesmanTextTuesday
	waitbutton
DollSalesmanTuesday_LoopScript:
	writetext DollSalesmanTextTuesday_AskWhichPrizeText
	special PlaceMoneyTopRight
	loadmenu DollSalesmanTuesdayMenu
	verticalmenu
	closewindow
	ifequal 1, .Doll1
	ifequal 2, .Doll2
	ifequal 3, .Doll3
	jump DollSalesmanTuesday_Cancel
	
.Doll1
	checkmoney YOUR_MONEY, 5000
	ifequal HAVE_LESS, DollSalesmanTuesdayNoMoney
	writetext SendItemToPCTextDollTuesday
	yesorno
	iffalse DollSalesmanTuesday_Cancel
	checkevent EVENT_DECO_CHARMANDER_DOLL
	iftrue .AlreadyHaveDecorItem
	setevent EVENT_DECO_CHARMANDER_DOLL
	takemoney YOUR_MONEY, 5000
	jump DollSalesmanTuesday_FinishScript
	end
	
.Doll2
	checkmoney YOUR_MONEY, 5000
	ifequal HAVE_LESS, DollSalesmanTuesdayNoMoney
	writetext SendItemToPCTextDollTuesday
	yesorno
	iffalse DollSalesmanTuesday_Cancel
	checkevent EVENT_DECO_DIGLETT_DOLL
	iftrue .AlreadyHaveDecorItem
	setevent EVENT_DECO_DIGLETT_DOLL
	takemoney YOUR_MONEY, 5000
	jump DollSalesmanTuesday_FinishScript
	end
	
.Doll3
	checkmoney YOUR_MONEY, 5000
	ifequal HAVE_LESS, DollSalesmanTuesdayNoMoney
	writetext SendItemToPCTextDollTuesday
	yesorno
	iffalse DollSalesmanTuesday_Cancel
	checkevent EVENT_DECO_STARMIE_DOLL
	iftrue .AlreadyHaveDecorItem
	setevent EVENT_DECO_STARMIE_DOLL
	takemoney YOUR_MONEY, 5000
	jump DollSalesmanTuesday_FinishScript
	end
	
.AlreadyHaveDecorItem
	writetext AlreadyHaveDecorItemTextSalesmanTuesday
	waitbutton
	jump DollSalesmanTuesday_LoopScript

	
DollSalesmanTuesdayMenu:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 2, 19, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 4 ; items
	db "CHARMANDER  ¥5000@"
	db "DIGLETT     ¥5000@"
	db "STARYU      ¥5000@"
	db "CANCEL@"
	
DollSalesmanTuesday_FinishScript:
	waitsfx
	playsound SFX_TRANSACTION
	writetext DollSalesmanTuesday_HereYouGoText
	waitbutton
	jump DollSalesmanTuesday_LoopScript

DollSalesmanTuesday_Cancel:
	writetext DollSalesmanTuesdayComeAgain
	waitbutton
	closetext
	end

	
DollSalesmanTuesdayNoMoney:
	writetext DollSalesmanTuesdayNoMoneyText
	waitbutton
	closetext
	end
	
SendItemToPCTextDollTuesday:
	text "Send this DOLL to"
	line "your bedroom PC?"
	done

AlreadyHaveDecorItemTextSalesmanTuesday:
	text "You already have"
	line "this DOLL!"
	done

DollSalesmanTuesday_HereYouGoText:
	text "Here you go!"
	done
	
DollSalesmanTuesdayComeAgain:
	text "Hope to see you"
	line "again somewhere!"
	done
	
DollSalesmanTuesdayNoMoneyText:
	text "Sorry, you'll"
	line "need more money!"
	done
	
DollSalesmanTextTuesday:
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
	
DollSalesmanTextTuesday_AskWhichPrizeText:
	text "Now which DOLL"
	line "would you like?"
	done
	
;---------------------------------

Route7SaffronGuardSeriousText:
	text "Have you ever"
	line "wondered why this"
	para "city is called"
	line "SUNPOINT?"
	para "It's because of"
	line "shipping routes of"
	para "countries north of"
	line "NIHON."
	para "When they come to"
	line "do business with"
	para "us, this city is"
	line "the sunniest part"
	cont "of their travels."	
	done

Route118SunpointGate_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  0,  7, SUNPOINT_CITY, 5
	warp_event  1,  7, SUNPOINT_CITY, 5
	warp_event  8,  7, ROUTE_118, 1
	warp_event  9,  7, ROUTE_118, 1

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  5,  2, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route7SaffronGuardScript, -1
	object_event  0,  2, SPRITE_CLERK, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, TravelingDollSalesmanTuesday, EVENT_DOLL_SALESMAN_TUESDAY
