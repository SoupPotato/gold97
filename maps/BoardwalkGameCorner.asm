	const_def 2 ; object constants
	const BOARDWALKGAMECORNER_CLERK
	const BOARDWALKGAMECORNER_RECEPTIONIST1
	const BOARDWALKGAMECORNER_RECEPTIONIST2
	const BOARDWALKGAMECORNER_PHARMACIST1
	const BOARDWALKGAMECORNER_PHARMACIST2
	const BOARDWALKGAMECORNER_POKEFAN_M1
	const BOARDWALKGAMECORNER_COOLTRAINER_M
	const BOARDWALKGAMECORNER_POKEFAN_F
	const BOARDWALKGAMECORNER_COOLTRAINER_F
	const BOARDWALKGAMECORNER_GENTLEMAN
	const BOARDWALKGAMECORNER_POKEFAN_M2
	const BOARDWALKGAMECORNER_MOVETUTOR
	const BOARDWALKGAMECORNER_RECEPTIONIST3

BoardwalkGameCorner_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .MoveTutor

.MoveTutor:
	checkevent EVENT_BEAT_ELITE_FOUR
	iffalse .finish
	checkitem COIN_CASE
	iffalse .move_tutor_inside
	checkcode VAR_WEEKDAY
	ifequal WEDNESDAY, .move_tutor_outside
	ifequal SATURDAY, .move_tutor_outside
.move_tutor_inside
	appear BOARDWALKGAMECORNER_MOVETUTOR
	return

.move_tutor_outside
	checkflag ENGINE_DAILY_MOVE_TUTOR
	iftrue .finish
	disappear BOARDWALKGAMECORNER_MOVETUTOR
.finish
	return

MoveTutorInsideScript:
	faceplayer
	opentext
	writetext MoveTutorInsideText
	waitbutton
	closetext
	turnobject BOARDWALKGAMECORNER_MOVETUTOR, RIGHT
	end

BoardwalkGameCornerCoinVendorScript:
	jumpstd gamecornercoinvendor

BoardwalkGameCornerSpecialVendorScript:
	faceplayer
	opentext
	writetext BoardwalkGameCornerPrizeVendorIntroText
	waitbutton
	checkitem COIN_CASE
	iffalse BoardwalkGameCornerPrizeVendor_NoCoinCaseScript
	writetext BoardwalkGameCornerPrizeVendorWhichPrizeText
	special DisplayCoinCaseBalance
	loadmenu BoardwalkGameCornerSpecialVendorMenuHeader
	verticalmenu
	closewindow
	ifequal 1, BoardwalkGameCornerStoneVendorScript
	ifequal 2, BoardwalkGameCornerItemVendorScript
	jump BoardwalkGameCornerPrizeVendor_CancelPurchaseScript
	
BoardwalkGameCornerStoneVendorScript:
	special DisplayCoinCaseBalance
	loadmenu BoardwalkGameCornerStoneVendorMenuHeader
	verticalmenu
	closewindow
	ifequal 1, .FireStone
	ifequal 2, .ThunderStone
	ifequal 3, .WaterStone
	ifequal 4, .LeafStone
	ifequal 5, .NextMenu
	jump BoardwalkGameCornerPrizeVendor_CancelPurchaseScript

.FireStone:
	checkcoins 1000
	ifequal HAVE_LESS, BoardwalkGameCornerPrizeVendor_NotEnoughCoinsScript
	itemtotext FIRE_STONE, MEM_BUFFER_0
	scall BoardwalkGameCornerPrizeVendor_ConfirmPurchaseScript
	iffalse BoardwalkGameCornerPrizeVendor_CancelPurchaseScript
	giveitem FIRE_STONE
	iffalse BoardwalkGameCornerPrizeMonVendor_NoRoomForPrizeScript
	takecoins 1000
	jump BoardwalkGameCornerStoneVendor_FinishScript

.ThunderStone:
	checkcoins 1000
	ifequal HAVE_LESS, BoardwalkGameCornerPrizeVendor_NotEnoughCoinsScript
	itemtotext THUNDERSTONE, MEM_BUFFER_0
	scall BoardwalkGameCornerPrizeVendor_ConfirmPurchaseScript
	iffalse BoardwalkGameCornerPrizeVendor_CancelPurchaseScript
	giveitem THUNDERSTONE
	iffalse BoardwalkGameCornerPrizeMonVendor_NoRoomForPrizeScript
	takecoins 1000
	jump BoardwalkGameCornerStoneVendor_FinishScript

.WaterStone:
	checkcoins 1000
	ifequal HAVE_LESS, BoardwalkGameCornerPrizeVendor_NotEnoughCoinsScript
	itemtotext WATER_STONE, MEM_BUFFER_0
	scall BoardwalkGameCornerPrizeVendor_ConfirmPurchaseScript
	iffalse BoardwalkGameCornerPrizeVendor_CancelPurchaseScript
	giveitem WATER_STONE
	iffalse BoardwalkGameCornerPrizeMonVendor_NoRoomForPrizeScript
	takecoins 1000
	jump BoardwalkGameCornerStoneVendor_FinishScript
	
.LeafStone:
	checkcoins 1000
	ifequal HAVE_LESS, BoardwalkGameCornerPrizeVendor_NotEnoughCoinsScript
	itemtotext LEAF_STONE, MEM_BUFFER_0
	scall BoardwalkGameCornerPrizeVendor_ConfirmPurchaseScript
	iffalse BoardwalkGameCornerPrizeVendor_CancelPurchaseScript
	giveitem LEAF_STONE
	iffalse BoardwalkGameCornerPrizeMonVendor_NoRoomForPrizeScript
	takecoins 1000
	jump BoardwalkGameCornerStoneVendor_FinishScript
	
.PoisonStone:
	checkcoins 1000
	ifequal HAVE_LESS, BoardwalkGameCornerPrizeVendor_NotEnoughCoinsScript
	itemtotext POISON_STONE, MEM_BUFFER_0
	scall BoardwalkGameCornerPrizeVendor_ConfirmPurchaseScript
	iffalse BoardwalkGameCornerPrizeVendor_CancelPurchaseScript
	giveitem POISON_STONE
	iffalse BoardwalkGameCornerPrizeMonVendor_NoRoomForPrizeScript
	takecoins 1000
	jump BoardwalkGameCornerStoneVendor_FinishScript
	
.HeartStone:
	checkcoins 1000
	ifequal HAVE_LESS, BoardwalkGameCornerPrizeVendor_NotEnoughCoinsScript
	itemtotext HEART_STONE, MEM_BUFFER_0
	scall BoardwalkGameCornerPrizeVendor_ConfirmPurchaseScript
	iffalse BoardwalkGameCornerPrizeVendor_CancelPurchaseScript
	giveitem HEART_STONE
	iffalse BoardwalkGameCornerPrizeMonVendor_NoRoomForPrizeScript
	takecoins 1000
	jump BoardwalkGameCornerStoneVendor_FinishScript
	
.MoonStone:
	checkcoins 1000
	ifequal HAVE_LESS, BoardwalkGameCornerPrizeVendor_NotEnoughCoinsScript
	itemtotext MOON_STONE, MEM_BUFFER_0
	scall BoardwalkGameCornerPrizeVendor_ConfirmPurchaseScript
	iffalse BoardwalkGameCornerPrizeVendor_CancelPurchaseScript
	giveitem MOON_STONE
	iffalse BoardwalkGameCornerPrizeMonVendor_NoRoomForPrizeScript
	takecoins 1000
	jump BoardwalkGameCornerStoneVendor_FinishScript
	
.NextMenu
	loadmenu BoardwalkGameCornerStoneVendorMenu2Header
	verticalmenu
	closewindow
	ifequal 1, .PoisonStone
	ifequal 2, .HeartStone
	ifequal 3, .MoonStone
	jump BoardwalkGameCornerPrizeVendor_CancelPurchaseScript
	
BoardwalkGameCornerItemVendorScript:
	special DisplayCoinCaseBalance
	loadmenu BoardwalkGameCornerItemVendorMenuHeader
	verticalmenu
	closewindow
	ifequal 1, .KingsRock
	ifequal 2, .MetalCoat
	ifequal 3, .NextMenu2
	jump BoardwalkGameCornerPrizeVendor_CancelPurchaseScript

.KingsRock:
	checkcoins 2000
	ifequal HAVE_LESS, BoardwalkGameCornerPrizeVendor_NotEnoughCoinsScript
	itemtotext KINGS_ROCK, MEM_BUFFER_0
	scall BoardwalkGameCornerPrizeVendor_ConfirmPurchaseScript
	iffalse BoardwalkGameCornerPrizeVendor_CancelPurchaseScript
	giveitem KINGS_ROCK
	iffalse BoardwalkGameCornerPrizeMonVendor_NoRoomForPrizeScript
	takecoins 2000
	jump BoardwalkGameCornerItemVendor_FinishScript

.MetalCoat:
	checkcoins 2000
	ifequal HAVE_LESS, BoardwalkGameCornerPrizeVendor_NotEnoughCoinsScript
	itemtotext METAL_COAT, MEM_BUFFER_0
	scall BoardwalkGameCornerPrizeVendor_ConfirmPurchaseScript
	iffalse BoardwalkGameCornerPrizeVendor_CancelPurchaseScript
	giveitem METAL_COAT
	iffalse BoardwalkGameCornerPrizeMonVendor_NoRoomForPrizeScript
	takecoins 2000
	jump BoardwalkGameCornerItemVendor_FinishScript
	
.NextMenu2
	loadmenu BoardwalkGameCornerItemVendorMenu2Header
	verticalmenu
	closewindow
	ifequal 1, .DragonScale
	ifequal 2, .Up_Grade
	ifequal 3, .CovenantOrb
	jump BoardwalkGameCornerPrizeVendor_CancelPurchaseScript
	
.DragonScale:
	checkcoins 2000
	ifequal HAVE_LESS, BoardwalkGameCornerPrizeVendor_NotEnoughCoinsScript
	itemtotext DRAGON_SCALE, MEM_BUFFER_0
	scall BoardwalkGameCornerPrizeVendor_ConfirmPurchaseScript
	iffalse BoardwalkGameCornerPrizeVendor_CancelPurchaseScript
	giveitem DRAGON_SCALE
	iffalse BoardwalkGameCornerPrizeMonVendor_NoRoomForPrizeScript
	takecoins 2000
	jump BoardwalkGameCornerItemVendor_FinishScript
	
.Up_Grade:
	checkcoins 2000
	ifequal HAVE_LESS, BoardwalkGameCornerPrizeVendor_NotEnoughCoinsScript
	itemtotext UP_GRADE, MEM_BUFFER_0
	scall BoardwalkGameCornerPrizeVendor_ConfirmPurchaseScript
	iffalse BoardwalkGameCornerPrizeVendor_CancelPurchaseScript
	giveitem UP_GRADE
	iffalse BoardwalkGameCornerPrizeMonVendor_NoRoomForPrizeScript
	takecoins 2000
	jump BoardwalkGameCornerItemVendor_FinishScript

.CovenantOrb:
	checkcoins 3000
	ifequal HAVE_LESS, BoardwalkGameCornerPrizeVendor_NotEnoughCoinsScript
	itemtotext LINKING_CORD, MEM_BUFFER_0
	scall BoardwalkGameCornerPrizeVendor_ConfirmPurchaseScript
	iffalse BoardwalkGameCornerPrizeVendor_CancelPurchaseScript
	giveitem LINKING_CORD
	iffalse BoardwalkGameCornerPrizeMonVendor_NoRoomForPrizeScript
	takecoins 3000
	jump BoardwalkGameCornerItemVendor_FinishScript
	
BoardwalkGameCornerSpecialVendorMenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 3, 19, TEXTBOX_Y - 2
	dw .MenuDataSpecial
	db 1 ; default option

.MenuDataSpecial:
	db STATICMENU_CURSOR ; flags
	db 3 ; items
	db "EVOLUTION STONES@"
	db "EVOLUTION ITEMS@"
	db "CANCEL@"

BoardwalkGameCornerStoneVendorMenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 2, 19, TEXTBOX_Y - -1
	dw .MenuDataStone
	db 1 ; default option

.MenuDataStone:
	db STATICMENU_CURSOR ; flags
	db 5 ; items
	db "FIRE STONE   1000@"
	db "THUNDERSTONE 1000@"
	db "WATER STONE  1000@"
	db "LEAF STONE   1000@"
	db "NEXT@"
	
BoardwalkGameCornerStoneVendorMenu2Header:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 2, 19, TEXTBOX_Y - 1
	dw .MenuDataStone2
	db 1 ; default option
	
.MenuDataStone2:
	db STATICMENU_CURSOR ; flags
	db 4 ; items
	db "POISON STONE 1000@"
	db "HEART STONE  1000@"
	db "MOON STONE   1000@"
	db "CANCEL@"
	
BoardwalkGameCornerItemVendorMenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 2, 19, TEXTBOX_Y - 3
	dw .MenuDataItems
	db 1 ; default option

.MenuDataItems:
	db STATICMENU_CURSOR ; flags
	db 3 ; items
	db "KING'S ROCK  2000@"
	db "METAL COAT   2000@"
	db "NEXT@"
	
BoardwalkGameCornerItemVendorMenu2Header:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 2, 19, TEXTBOX_Y - 1
	dw .MenuDataItems2
	db 1 ; default option
	
.MenuDataItems2:
	db STATICMENU_CURSOR ; flags
	db 4 ; items
	db "DRAGON SCALE 2000@"
	db "UP-GRADE     2000@"
	db "COVENANT ORB 3000@"
	db "CANCEL@"
	
BoardwalkGameCornerStoneVendor_FinishScript:
	waitsfx
	playsound SFX_TRANSACTION
	writetext BoardwalkGameCornerPrizeVendorHereYouGoText
	waitbutton
	jump BoardwalkGameCornerStoneVendorScript
	
BoardwalkGameCornerItemVendor_FinishScript:
	waitsfx
	playsound SFX_TRANSACTION
	writetext BoardwalkGameCornerPrizeVendorHereYouGoText
	waitbutton
	jump BoardwalkGameCornerItemVendorScript

BoardwalkGameCornerPrizeVendor_ConfirmPurchaseScript:
	writetext BoardwalkGameCornerPrizeVendorConfirmPrizeText
	yesorno
	end

BoardwalkGameCornerPrizeVendor_NotEnoughCoinsScript:
	writetext BoardwalkGameCornerPrizeVendorNeedMoreCoinsText
	waitbutton
	closetext
	end

BoardwalkGameCornerPrizeMonVendor_NoRoomForPrizeScript:
	writetext BoardwalkGameCornerPrizeVendorNoMoreRoomText
	waitbutton
	closetext
	end

BoardwalkGameCornerPrizeVendor_CancelPurchaseScript:
	writetext BoardwalkGameCornerPrizeVendorQuitText
	waitbutton
	closetext
	end

BoardwalkGameCornerPrizeVendor_NoCoinCaseScript:
	writetext BoardwalkGameCornerPrizeVendorNoCoinCaseText
	waitbutton
	closetext
	end

BoardwalkGameCornerPrizeMonVendorScript:
	faceplayer
	opentext
	writetext BoardwalkGameCornerPrizeVendorIntroText
	waitbutton
	checkitem COIN_CASE
	iffalse BoardwalkGameCornerPrizeVendor_NoCoinCaseScript
.loop
	writetext BoardwalkGameCornerPrizeVendorWhichPrizeText
	special DisplayCoinCaseBalance
	loadmenu .MenuHeader
	verticalmenu
	closewindow
	ifequal 1, .abra
	ifequal 2, .cubone
	ifequal 3, .porygon
	jump BoardwalkGameCornerPrizeVendor_CancelPurchaseScript

.abra
	checkcoins 100
	ifequal HAVE_LESS, BoardwalkGameCornerPrizeVendor_NotEnoughCoinsScript
	checkcode VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, BoardwalkGameCornerPrizeMonVendor_NoRoomForPrizeScript
	pokenamemem ABRA, MEM_BUFFER_0
	scall BoardwalkGameCornerPrizeVendor_ConfirmPurchaseScript
	iffalse BoardwalkGameCornerPrizeVendor_CancelPurchaseScript
	waitsfx
	playsound SFX_TRANSACTION
	writetext BoardwalkGameCornerPrizeVendorHereYouGoText
	waitbutton
	writebyte ABRA
	special GameCornerPrizeMonCheckDex
	givepoke ABRA, 5
	takecoins 100
	jump .loop

.cubone
	checkcoins 800
	ifequal HAVE_LESS, BoardwalkGameCornerPrizeVendor_NotEnoughCoinsScript
	checkcode VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, BoardwalkGameCornerPrizeMonVendor_NoRoomForPrizeScript
	pokenamemem CUBONE, MEM_BUFFER_0
	scall BoardwalkGameCornerPrizeVendor_ConfirmPurchaseScript
	iffalse BoardwalkGameCornerPrizeVendor_CancelPurchaseScript
	waitsfx
	playsound SFX_TRANSACTION
	writetext BoardwalkGameCornerPrizeVendorHereYouGoText
	waitbutton
	writebyte CUBONE
	special GameCornerPrizeMonCheckDex
	givepoke CUBONE, 15
	takecoins 800
	jump .loop

.porygon
	checkcoins 2500
	ifequal HAVE_LESS, BoardwalkGameCornerPrizeVendor_NotEnoughCoinsScript
	checkcode VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, BoardwalkGameCornerPrizeMonVendor_NoRoomForPrizeScript
	pokenamemem PORYGON, MEM_BUFFER_0
	scall BoardwalkGameCornerPrizeVendor_ConfirmPurchaseScript
	iffalse BoardwalkGameCornerPrizeVendor_CancelPurchaseScript
	waitsfx
	playsound SFX_TRANSACTION
	writetext BoardwalkGameCornerPrizeVendorHereYouGoText
	waitbutton
	writebyte PORYGON
	special GameCornerPrizeMonCheckDex
	givepoke PORYGON, 12
	takecoins 2500
	jump .loop

.MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 2, 17, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 4 ; items
	db "ABRA        100@"
	db "CUBONE      800@"
	db "PORYGON    2500@"
	db "CANCEL@"

BoardwalkGameCornerPharmacistScript:
	faceplayer
	opentext
	writetext BoardwalkGameCornerPharmacistText
	waitbutton
	closetext
	turnobject LAST_TALKED, LEFT
	end

BoardwalkGameCornerPokefanM1Script:
	faceplayer
	opentext
	writetext BoardwalkGameCornerPokefanM1Text
	waitbutton
	closetext
	turnobject BOARDWALKGAMECORNER_POKEFAN_M1, RIGHT
	end

BoardwalkGameCornerCooltrainerMScript:
	faceplayer
	opentext
	writetext BoardwalkGameCornerCooltrainerMText
	waitbutton
	closetext
	turnobject BOARDWALKGAMECORNER_COOLTRAINER_M, LEFT
	end

BoardwalkGameCornerPokefanFScript:
	faceplayer
	opentext
	writetext BoardwalkGameCornerPokefanFText
	waitbutton
	closetext
	turnobject BOARDWALKGAMECORNER_POKEFAN_F, RIGHT
	end

BoardwalkGameCornerCooltrainerFScript:
	jumptextfaceplayer BoardwalkGameCornerCooltrainerFText

BoardwalkGameCornerGentlemanScript:
	faceplayer
	opentext
	writetext BoardwalkGameCornerGentlemanText
	waitbutton
	closetext
	turnobject BOARDWALKGAMECORNER_GENTLEMAN, RIGHT
	end

BoardwalkGameCornerPokefanM2Script:
	jumptextfaceplayer BoardwalkGameCornerPokefanM2Text

BoardwalkGameCornerLeftTheirDrinkScript:
	jumptext BoardwalkGameCornerLeftTheirDrinkText

BoardwalkGameCornerSlotsMachineScript:
	random 6
	ifequal 0, BoardwalkGameCornerLuckySlotsMachineScript
	refreshscreen
	writebyte FALSE
	special SlotMachine
	closetext
	end

BoardwalkGameCornerLuckySlotsMachineScript:
	refreshscreen
	writebyte TRUE
	special SlotMachine
	closetext
	end

BoardwalkGameCornerCardFlipMachineScript:
	refreshscreen
	special CardFlip
	closetext
	end

;--------------------------------------

BoardwalkGameCornerDecorVendorScript:
	faceplayer
	opentext
	writetext BoardwalkGameCornerPrizeVendorIntroText
	waitbutton
	checkitem COIN_CASE
	iffalse BoardwalkGameCornerPrizeVendor_NoCoinCaseScript
BoardwalkGameCornerDecorVendor_LoopScript:
	writetext BoardwalkGameCornerPrizeVendorWhichPrizeText
	special DisplayCoinCaseBalance
	loadmenu BoardwalkGameCornerDecorVendorMenuHeader
	verticalmenu
	closewindow
	ifequal 1, .Bed
	ifequal 2, .Carpet
	ifequal 3, .Plant
	jump BoardwalkGameCornerPrizeVendor_CancelPurchaseScript
	
.Bed
	special DisplayCoinCaseBalance
	loadmenu BoardwalkGameCornerBedsVendorMenuHeader
	verticalmenu
	closewindow
	ifequal 1, .Pink
	ifequal 2, .Polkadot
	ifequal 3, .Pikachu
	jump BoardwalkGameCornerPrizeVendor_CancelPurchaseScript
	
.Pink
	checkcoins 1800
	ifequal HAVE_LESS, BoardwalkGameCornerPrizeVendor_NotEnoughCoinsScript
	writetext SendItemToHomePCText
	yesorno
	iffalse BoardwalkGameCornerPrizeVendor_CancelPurchaseScript
	checkevent EVENT_DECO_BED_2
	iftrue .AlreadyHaveDecorItem
	setevent EVENT_DECO_BED_2
	takecoins 1800
	jump BoardwalkGameCornerDecorVendor_FinishScript
	end
	
.Polkadot
	checkcoins 1800
	ifequal HAVE_LESS, BoardwalkGameCornerPrizeVendor_NotEnoughCoinsScript
	writetext SendItemToHomePCText
	yesorno
	iffalse BoardwalkGameCornerPrizeVendor_CancelPurchaseScript
	checkevent EVENT_DECO_BED_3
	iftrue .AlreadyHaveDecorItem
	setevent EVENT_DECO_BED_3
	takecoins 1800
	jump BoardwalkGameCornerDecorVendor_FinishScript
	end

.Pikachu
	checkcoins 1800
	ifequal HAVE_LESS, BoardwalkGameCornerPrizeVendor_NotEnoughCoinsScript
	writetext SendItemToHomePCText
	yesorno
	iffalse BoardwalkGameCornerPrizeVendor_CancelPurchaseScript
	checkevent EVENT_DECO_BED_4
	iftrue .AlreadyHaveDecorItem
	setevent EVENT_DECO_BED_4
	takecoins 1800
	jump BoardwalkGameCornerDecorVendor_FinishScript
	end

.Carpet; COME_BACK2
	special DisplayCoinCaseBalance
	loadmenu BoardwalkGameCornerCarpetVendorMenuHeader
	verticalmenu
	closewindow
	ifequal 1, .BlueCarpet
	ifequal 2, .YellowCarpet
	ifequal 3, .GreenCarpet
	jump BoardwalkGameCornerPrizeVendor_CancelPurchaseScript
	
.BlueCarpet
	checkcoins 1800
	ifequal HAVE_LESS, BoardwalkGameCornerPrizeVendor_NotEnoughCoinsScript
	writetext SendItemToHomePCText
	yesorno
	iffalse BoardwalkGameCornerPrizeVendor_CancelPurchaseScript
	checkevent EVENT_DECO_CARPET_2
	iftrue .AlreadyHaveDecorItem
	setevent EVENT_DECO_CARPET_2
	takecoins 1800
	jump BoardwalkGameCornerDecorVendor_FinishScript
	end
	
.YellowCarpet
	checkcoins 1800
	ifequal HAVE_LESS, BoardwalkGameCornerPrizeVendor_NotEnoughCoinsScript
	writetext SendItemToHomePCText
	yesorno
	iffalse BoardwalkGameCornerPrizeVendor_CancelPurchaseScript
	checkevent EVENT_DECO_CARPET_3
	iftrue .AlreadyHaveDecorItem
	setevent EVENT_DECO_CARPET_3
	takecoins 1800
	jump BoardwalkGameCornerDecorVendor_FinishScript
	end

.GreenCarpet
	checkcoins 1800
	ifequal HAVE_LESS, BoardwalkGameCornerPrizeVendor_NotEnoughCoinsScript
	writetext SendItemToHomePCText
	yesorno
	iffalse BoardwalkGameCornerPrizeVendor_CancelPurchaseScript
	checkevent EVENT_DECO_CARPET_4
	iftrue .AlreadyHaveDecorItem
	setevent EVENT_DECO_CARPET_4
	takecoins 1800
	jump BoardwalkGameCornerDecorVendor_FinishScript
	end

.Plant; COME_BACK2
	special DisplayCoinCaseBalance
	loadmenu BoardwalkGameCornerPlantVendorMenuHeader
	verticalmenu
	closewindow
	ifequal 1, .Magna
	ifequal 2, .Tropic
	ifequal 3, .Jumbo
	jump BoardwalkGameCornerPrizeVendor_CancelPurchaseScript
	
.Magna
	checkcoins 1800
	ifequal HAVE_LESS, BoardwalkGameCornerPrizeVendor_NotEnoughCoinsScript
	writetext SendItemToHomePCText
	yesorno
	iffalse BoardwalkGameCornerPrizeVendor_CancelPurchaseScript
	checkevent EVENT_DECO_PLANT_1
	iftrue .AlreadyHaveDecorItem
	setevent EVENT_DECO_PLANT_1
	takecoins 1800
	jump BoardwalkGameCornerDecorVendor_FinishScript
	end
	
.Tropic
	checkcoins 1800
	ifequal HAVE_LESS, BoardwalkGameCornerPrizeVendor_NotEnoughCoinsScript
	writetext SendItemToHomePCText
	yesorno
	iffalse BoardwalkGameCornerPrizeVendor_CancelPurchaseScript
	checkevent EVENT_DECO_PLANT_2
	iftrue .AlreadyHaveDecorItem
	setevent EVENT_DECO_PLANT_2
	takecoins 1800
	jump BoardwalkGameCornerDecorVendor_FinishScript
	end

.Jumbo
	checkcoins 1800
	ifequal HAVE_LESS, BoardwalkGameCornerPrizeVendor_NotEnoughCoinsScript
	writetext SendItemToHomePCText
	yesorno
	iffalse BoardwalkGameCornerPrizeVendor_CancelPurchaseScript
	checkevent EVENT_DECO_PLANT_3
	iftrue .AlreadyHaveDecorItem
	setevent EVENT_DECO_PLANT_3
	takecoins 1800
	jump BoardwalkGameCornerDecorVendor_FinishScript
	end
	
.AlreadyHaveDecorItem
	writetext AlreadyHaveDecorItemText
	waitbutton
	jump BoardwalkGameCornerDecorVendor_LoopScript

	
BoardwalkGameCornerDecorVendor_FinishScript:
	waitsfx
	playsound SFX_TRANSACTION
	writetext BoardwalkGameCornerPrizeVendorHereYouGoText
	waitbutton
	jump BoardwalkGameCornerDecorVendor_LoopScript
	
BoardwalkGameCornerPlantVendorMenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 2, 19, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 4 ; items
	db "MAGNAPLANT   1800@"
	db "TROPICPLANT  1800@"
	db "JUMBOPLANT   1800@"
	db "CANCEL@"	

BoardwalkGameCornerCarpetVendorMenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 2, 19, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 4 ; items
	db "BLUE CARPET  1800@"
	db "YELLOW CARPET1800@"
	db "GREEN CARPET 1800@"
	db "CANCEL@"	

BoardwalkGameCornerBedsVendorMenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 2, 19, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 4 ; items
	db "PINK BED     1800@"
	db "POLKADOT BED 1800@"
	db "PIKACHU BED  1800@"
	db "CANCEL@"	
	
BoardwalkGameCornerDecorVendorMenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 2, 19, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 4 ; items
	db "BEDS@"
	db "CARPETS@"
	db "PLANTS@"
	db "CANCEL@"

;--------------------------------------

AlreadyHaveDecorItemText:
	text "You already have"
	line "this item."
	done
	
SendItemToHomePCText:
	text "Send this item to"
	line "your bedroom PC?"
	done


BoardwalkGameCornerPrizeVendorIntroText:
	text "Welcome!"

	para "We exchange your"
	line "game coins for"
	cont "fabulous prizes!"
	done

BoardwalkGameCornerPrizeVendorWhichPrizeText:
	text "Which prize would"
	line "you like?"
	done

BoardwalkGameCornerPrizeVendorConfirmPrizeText:
	text_ram wStringBuffer3
	text "."
	line "Is that right?"
	done

BoardwalkGameCornerPrizeVendorHereYouGoText:
	text "Here you go!"
	done

BoardwalkGameCornerPrizeVendorNeedMoreCoinsText:
	text "Sorry! You need"
	line "more coins."
	done

BoardwalkGameCornerPrizeVendorNoMoreRoomText:
	text "Sorry. You can't"
	line "carry any more."
	done

BoardwalkGameCornerPrizeVendorQuitText:
	text "OK. Please save"
	line "your coins and"
	cont "come again!"
	done

BoardwalkGameCornerPrizeVendorNoCoinCaseText:
	text "Oh? You don't have"
	line "a COIN CASE."
	done

BoardwalkGameCornerPharmacistText:
	text "I always play this"
	line "slot machine. It"

	para "pays out more than"
	line "others, I think."
	done

BoardwalkGameCornerPokefanM1Text:
	text "I just love this"
	line "new slot machine."

	para "It's just the"
	line "right level of"
	cont "challenge."
	done

BoardwalkGameCornerCooltrainerMText:
	text "Life is a gamble."
	line "I'm going to flip"
	cont "cards till I drop!"
	done

BoardwalkGameCornerPokefanFText:
	text "Card flip…"

	para "I prefer it over"
	line "the slots because"

	para "it's easier to"
	line "figure the odds."

	para "But the payout is"
	line "much lower."
	done

BoardwalkGameCornerCooltrainerFText:
	text "I won't quit until"
	line "I win!"
	done

BoardwalkGameCornerGentlemanText:
	text "I evolved my #-"
	line "MON with a POISON"
	cont "STONE."

	para "It was hard to get"
	line "enough coins for"

	para "it, but it was"
	line "worth it."
	done

BoardwalkGameCornerPokefanM2Text:
	text "I couldn't win at"
	line "the slots, and I"

	para "blew it on card"
	line "flipping…"

	para "I took too many"
	line "risks, and they"
	cont "weren't worth it."
	done

MoveTutorInsideText:
	text "Wahahah! The coins"
	line "keep rolling in!"
	done

BoardwalkGameCornerLeftTheirDrinkText:
	text "Someone left their"
	line "drink."

	para "It smells sweet."
	done

BoardwalkGameCorner_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 10, 13, BOARDWALK, 7
	warp_event 11, 13, BOARDWALK, 8

	db 0 ; coord events

	db 31 ; bg events
	bg_event  6,  6, BGEVENT_READ, BoardwalkGameCornerSlotsMachineScript
	bg_event  6,  7, BGEVENT_READ, BoardwalkGameCornerSlotsMachineScript
	bg_event  6,  8, BGEVENT_READ, BoardwalkGameCornerSlotsMachineScript
	bg_event  6,  9, BGEVENT_READ, BoardwalkGameCornerSlotsMachineScript
	bg_event  6, 10, BGEVENT_READ, BoardwalkGameCornerSlotsMachineScript
	bg_event  6, 11, BGEVENT_RIGHT, BoardwalkGameCornerSlotsMachineScript
	bg_event  7,  6, BGEVENT_READ, BoardwalkGameCornerSlotsMachineScript
	bg_event  7,  7, BGEVENT_READ, BoardwalkGameCornerLuckySlotsMachineScript
	bg_event  7,  8, BGEVENT_READ, BoardwalkGameCornerSlotsMachineScript
	bg_event  7,  9, BGEVENT_READ, BoardwalkGameCornerSlotsMachineScript
	bg_event  7, 10, BGEVENT_READ, BoardwalkGameCornerSlotsMachineScript
	bg_event  7, 11, BGEVENT_LEFT, BoardwalkGameCornerSlotsMachineScript
	bg_event 12,  6, BGEVENT_READ, BoardwalkGameCornerSlotsMachineScript
	bg_event 12,  7, BGEVENT_READ, BoardwalkGameCornerSlotsMachineScript
	bg_event 12,  8, BGEVENT_READ, BoardwalkGameCornerSlotsMachineScript
	bg_event 12,  9, BGEVENT_READ, BoardwalkGameCornerSlotsMachineScript
	bg_event 12, 10, BGEVENT_READ, BoardwalkGameCornerSlotsMachineScript
	bg_event 12, 11, BGEVENT_RIGHT, BoardwalkGameCornerSlotsMachineScript
	bg_event 13,  6, BGEVENT_READ, BoardwalkGameCornerCardFlipMachineScript
	bg_event 13,  7, BGEVENT_READ, BoardwalkGameCornerCardFlipMachineScript
	bg_event 13,  8, BGEVENT_READ, BoardwalkGameCornerCardFlipMachineScript
	bg_event 13,  9, BGEVENT_READ, BoardwalkGameCornerCardFlipMachineScript
	bg_event 13, 10, BGEVENT_READ, BoardwalkGameCornerCardFlipMachineScript
	bg_event 13, 11, BGEVENT_LEFT, BoardwalkGameCornerCardFlipMachineScript
	bg_event 18,  6, BGEVENT_READ, BoardwalkGameCornerCardFlipMachineScript
	bg_event 18,  7, BGEVENT_READ, BoardwalkGameCornerCardFlipMachineScript
	bg_event 18,  8, BGEVENT_READ, BoardwalkGameCornerCardFlipMachineScript
	bg_event 18,  9, BGEVENT_READ, BoardwalkGameCornerCardFlipMachineScript
	bg_event 18, 10, BGEVENT_READ, BoardwalkGameCornerCardFlipMachineScript
	bg_event 18, 11, BGEVENT_RIGHT, BoardwalkGameCornerCardFlipMachineScript
	bg_event 12,  1, BGEVENT_LEFT, BoardwalkGameCornerLeftTheirDrinkScript

	db 13 ; object events
	object_event  3,  2, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BoardwalkGameCornerCoinVendorScript, -1
	object_event 17,  2, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BoardwalkGameCornerSpecialVendorScript, -1
	object_event 19,  2, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BoardwalkGameCornerPrizeMonVendorScript, -1
	object_event  8,  7, SPRITE_PHARMACIST, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, DAY, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BoardwalkGameCornerPharmacistScript, -1
	object_event  8,  7, SPRITE_PHARMACIST, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, NITE, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BoardwalkGameCornerPharmacistScript, -1
	object_event 11, 10, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, BoardwalkGameCornerPokefanM1Script, -1
	object_event 14,  8, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BoardwalkGameCornerCooltrainerMScript, -1
	object_event 17,  6, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BoardwalkGameCornerPokefanFScript, -1
	object_event 10,  3, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_WANDER, 2, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, BoardwalkGameCornerCooltrainerFScript, -1
	object_event  5, 10, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BoardwalkGameCornerGentlemanScript, -1
	object_event  2,  9, SPRITE_POKEFAN_M, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, BoardwalkGameCornerPokefanM2Script, -1
	object_event 17, 10, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, MoveTutorInsideScript, EVENT_BOARDWALK_GAME_CORNER_MOVE_TUTOR
	object_event 15,  2, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BoardwalkGameCornerDecorVendorScript, -1
