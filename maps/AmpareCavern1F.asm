	const_def 2 ; object constants
	const AMPARECAVERN1F_PHARMACIST
	const AMPARECAVERN1F_POKE_BALL1
	const AMPARECAVERN1F_POKE_BALL2

AmpareCavern1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

AmpareCavern1FBlackGlassesGuyScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_BLACKGLASSES_IN_AMPARE_CAVERN
	iftrue .GotBlackglasses
	writetext AmpareCavern1FBlackGlassesGuyText1
	buttonsound
	verbosegiveitem BLACKGLASSES
	iffalse .PackFull
	setevent EVENT_GOT_BLACKGLASSES_IN_AMPARE_CAVERN
.GotBlackglasses:
	writetext AmpareCavern1FBlackGlassesGuyText2
	waitbutton
.PackFull:
	closetext
	end

AmpareCavern1FRevive:
	itemball REVIVE

AmpareCavern1FTMMegaphone:
	itemball TM_MEGAPHONE

AmpareCavern1FBlackGlassesGuyText1:
	text "Whoa! You startled"
	line "me there!"

	para "I had my BLACK-"
	line "GLASSES on, so I"

	para "didn't notice you"
	line "at all."

	para "What am I doing"
	line "here?"

	para "Hey, don't you"
	line "worry about it."

	para "I'll give you a"
	line "pair of BLACK-"
	cont "GLASSES, so forget"
	cont "you saw me, OK?"
	done

AmpareCavern1FBlackGlassesGuyText2:
	text "BLACKGLASSES ups"
	line "the power of dark-"
	cont "type moves."
	done

AmpareCavern1F_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4, 17, ROUTE_109, 1
	warp_event 19, 25, AMPARE_CAVERN_B1F, 2

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event 13, 29, SPRITE_PHARMACIST, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AmpareCavern1FBlackGlassesGuyScript, -1
	object_event 25, 26, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, AmpareCavern1FRevive, EVENT_AMPARE_CAVERN_REVIVE
	object_event 15, 13, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, AmpareCavern1FTMMegaphone, EVENT_AMPARE_CAVERN_TM_MEGAPHONE
