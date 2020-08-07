	const_def 2 ; object constants
	const GOLDENRODBIKESHOP_CLERK

WestportBikeShop_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

.UnreferencedDummyScene:
	end

WestportBikeShopClerkScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_BICYCLE
	iftrue .GotBicycle
	writetext WestportBikeShopClerkIntroText
	yesorno
	iffalse .Refused
	writetext WestportBikeShopClerkAgreedText
	buttonsound
	waitsfx
	giveitem BICYCLE
	writetext BorrowedABicycleText
	playsound SFX_KEY_ITEM
	waitsfx
	itemnotify
	setflag ENGINE_BIKE_SHOP_CALL_ENABLED
	setevent EVENT_GOT_BICYCLE
.GotBicycle:
	writetext WestportBikeShopClerkFirstRateBikesText
	waitbutton
	closetext
	end

.Refused:
	writetext WestportBikeShopClerkRefusedText
	waitbutton
	closetext
	end

WestportBikeShopJustReleasedCompactBike:
; unused
	jumptext WestportBikeShopJustReleasedCompactBikeText

WestportBikeShopBicycle:
	jumptext WestportBikeShopBicycleText

WestportBikeShopClerkIntroText:
	text "…sigh… I moved"
	line "here, but I can't"

	para "sell my BICYCLES."
	line "Why is that?"

	para "Could you ride a"
	line "BICYCLE and adver-"
	cont "tise for me?"
	done

WestportBikeShopClerkAgreedText:
	text "Really? Great!"

	para "Give me your name"
	line "and phone number,"

	para "and I'll loan you"
	line "a BICYCLE."
	done

BorrowedABicycleText:
	text "<PLAYER> borrowed a"
	line "BICYCLE."
	done

WestportBikeShopClerkFirstRateBikesText:
	text "My BICYCLES are"
	line "first-rate! You"

	para "can ride them"
	line "anywhere."
	done

WestportBikeShopClerkRefusedText:
	text "…sigh… Oh, for"
	line "the kindness of"
	cont "people…"
	done

WestportBikeShopJustReleasedCompactBikeText:
	text "Just released!"

	para "First-rate compact"
	line "BICYCLES!"
	done

WestportBikeShopBicycleText:
	text "It's a shiny new"
	line "BICYCLE!"
	done

WestportBikeShop_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, WESTPORT_UNDERGROUND, 2
	warp_event  3,  7, WESTPORT_UNDERGROUND, 2

	db 0 ; coord events

	db 9 ; bg events
	bg_event  1,  2, BGEVENT_READ, WestportBikeShopBicycle
	bg_event  0,  3, BGEVENT_READ, WestportBikeShopBicycle
	bg_event  1,  3, BGEVENT_READ, WestportBikeShopBicycle
	bg_event  0,  5, BGEVENT_READ, WestportBikeShopBicycle
	bg_event  1,  5, BGEVENT_READ, WestportBikeShopBicycle
	bg_event  0,  6, BGEVENT_READ, WestportBikeShopBicycle
	bg_event  1,  6, BGEVENT_READ, WestportBikeShopBicycle
	bg_event  6,  6, BGEVENT_READ, WestportBikeShopBicycle
	bg_event  7,  6, BGEVENT_READ, WestportBikeShopBicycle

	db 1 ; object events
	object_event  7,  2, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, WestportBikeShopClerkScript, -1
