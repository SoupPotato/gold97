	const_def 2 ; object constants
	const BOULDERMINESB5F_POKE_BALL1
	const BOULDERMINESB5F_POKE_BALL2
	const BOULDERMINESB5F_LAPRAS

BoulderMinesB5F_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .Lapras

.Lapras:
	checkflag ENGINE_BOULDER_MINES_LAPRAS
	iftrue .NoAppear
	checkcode VAR_WEEKDAY
	ifequal FRIDAY, .Appear
.NoAppear:
	disappear BOULDERMINESB5F_LAPRAS
	return

.Appear:
	appear BOULDERMINESB5F_LAPRAS
	return

BoulderMinesLapras:
	faceplayer
	cry LAPRAS
	loadwildmon LAPRAS, 20
	startbattle
	disappear BOULDERMINESB5F_LAPRAS
	setflag ENGINE_BOULDER_MINES_LAPRAS
	reloadmapafterbattle
	end

BoulderMinesB5FElixer:
	itemball ELIXER

BoulderMinesB5FHyperPotion:
	itemball HYPER_POTION

BoulderMinesB5F_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event 11, 11, BOULDER_MINES_B4F, 2

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event 20,  8, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, BoulderMinesB5FElixer, EVENT_BOULDER_MINES_B5F_ELIXER
	object_event  2,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, BoulderMinesB5FHyperPotion, EVENT_BOULDER_MINES_B5F_HYPER_POTION
	object_event 13,  3, SPRITE_SURF, SPRITEMOVEDATA_SWIM_WANDER, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BoulderMinesLapras, EVENT_UNION_CAVE_B2F_LAPRAS
