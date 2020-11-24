	const_def 2
	const IETOWN_NPC1
	const IETOWN_NPC2

IeTown_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint

.FlyPoint:
	setflag ENGINE_FLYPOINT_IE
	return

IeTownPokecenterSign:
	jumpstd pokecentersign

IeTownSign:
	jumptext IeTownSignText
	
TMShopSign:
	jumptext TMShopSignText
	
IeTownSignText:
	text "IE TOWN -"
	line "The stalwart"
	cont "castle town."
	done

TMShopSignText:
	text "TM EMPORIUM"
	line "Get the hottest"
	cont "competitive moves"
	done

IeTownNPC1Script:
	jumptextfaceplayer IeTownNPC1Text

IeTownNPC2Script:
	jumptextfaceplayer IeTownNPC2Text


IeTownNPC1Text:
	text "People here have"
	line "been hearing odd"
	cont "noises coming"
	cont "from the CASTLE"
	cont "at night."
	
	para "I wonder if it's"
	line "the GREEN DRAGON"
	cont "that supposedly"
	cont "lives somewhere"
	cont "inside…"
	done

IeTownNPC2Text:
	text "I've seen some"
	line "shady guys around"
	cont "the CASTLE at"
	cont "night."
	
	para "I don't think"
	line "they're from"
	cont "around here."
	done


IeTown_MapEvents:
	db 0, 0 ; filler

	db 7 ; warp events
	warp_event  5,  6, IE_POKECENTER_1F, 1
	warp_event 22,  7, IE_TM_SHOP, 1
	warp_event 23,  7, IE_TM_SHOP, 2
	warp_event  8, 11, IE_HOUSE_1, 1
	warp_event 20, 11, IE_HOUSE_2, 1
	warp_event 13,  5, CASTLE_MOUNTAIN_1F, 1
	warp_event 14,  5, CASTLE_MOUNTAIN_1F, 2

	db 0 ; coord events

	db 3 ; bg events
	bg_event 26,  6, BGEVENT_READ, IeTownSign
	bg_event 19,  7, BGEVENT_READ, TMShopSign
	bg_event  6,  6, BGEVENT_READ, IeTownPokecenterSign

	db 2 ; object events
	object_event 15, 13, SPRITE_TEACHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, IeTownNPC1Script, -1
	object_event 12,  9, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, IeTownNPC2Script, -1
