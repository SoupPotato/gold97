	const_def 2 ; object constants
	const PagotaCity_LASS
	const PagotaCity_SUPER_NERD
	const PagotaCity_GRAMPS
	const PagotaCity_YOUNGSTER
	const PagotaCity_FRUIT_TREE
	const PagotaCity_POKE_BALL1
	const PagotaCity_POKE_BALL2
	const PagotaCity_GRAMPS2

PagotaCity_MapScripts:
	db 0 ; scene scripts

	db 2 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint
	callback MAPCALLBACK_OBJECTS, .grampsgone

.FlyPoint:
	setflag ENGINE_FLYPOINT_VIOLET
	return
	
.grampsgone
	checkevent EVENT_TALKED_TO_KURT_AND_FALKNER
	iftrue .gone
	return
	
.gone
	disappear PagotaCity_GRAMPS2
	return

PagotaCityLassScript:
	jumptextfaceplayer PagotaCityLassText

PagotaCitySuperNerdScript:
	jumptextfaceplayer PagotaCitySuperNerdText

PagotaCityGrampsScript:
	jumptextfaceplayer PagotaCityGrampsText
	
PagotaCityGrampsScript2:
	jumptextfaceplayer PagotaCityGramps2Text

PagotaCityYoungsterScript:
	jumptextfaceplayer PagotaCityYoungsterText

KurtsHouseSign:
	jumptext KurtsHouseSignText

PagotaCitySign:
	jumptext PagotaCitySignText

VioletGymSign:
	jumptext VioletGymSignText

SproutTowerSign:
	jumptext SproutTowerSignText

EarlsPokemonAcademySign:
	jumptext EarlsPokemonAcademySignText

BillsHouseSign2:
	jumptext BillsHouseSign2Text

PagotaCityPokecenterSign:
	jumpstd pokecentersign

PagotaCityMartSign:
	jumpstd martsign

PagotaCityPPUp:
	itemball PP_UP

PagotaCityRareCandy:
	itemball RARE_CANDY
	

PagotaCityFruitTree:
	fruittree FRUITTREE_OLD_CITY

PagotaCityHiddenHyperPotion:
	hiddenitem HYPER_POTION, EVENT_OLD_CITY_HIDDEN_HYPER_POTION
	
KurtsDoorLockedScript:
	opentext
	writetext KurtsDoorLockedText
	waitbutton
	closetext
	applymovement PLAYER, KurtsDoorLocked_Movement
	end
	
KurtsDoorLocked_Movement:
	step DOWN
	step_end

	
KurtsDoorLockedText:
	text "It's locked…"
	done

PagotaCityLassText:
	text "Ghosts are rumored"
	line "to appear in"
	cont "BRASS TOWER."

	para "They said normal-"
	line "type #MON moves"

	para "had no effect on"
	line "ghosts."
	done

PagotaCitySuperNerdText:
	text "Hey, you're a"
	line "#MON trainer?"

	para "If you beat the"
	line "GYM LEADER here,"

	para "you'll be ready"
	line "for prime time!"
	done

PagotaCityGrampsText:
	text "FALKNER, is a fine"
	line "GYM LEADER."

	para "His FLYING-TYPE"
	line "bird #MON are"
	para "trained to perform"
	line "in parades and"
	cont "other events."
	done
	
PagotaCityGramps2Text:
	text "I'm sorry..."
	para "The TOWER is being"
	line "cleaned right now."

	para "Please come back"
	line "later."
	done
	
PagotaCityGuardText:
	text "The GYM LEADER"
	para "is absent right"
	line "now."

	para "Please come back"
	line "later."
	done

PagotaCityYoungsterText:
	text "Behind me is the"
	line "BRASS TOWER!"
	
	para "Many trainers try"
	line "to climb it to get"
	cont "the ELDER's bles"
	cont "-sing."
	
	para "Without it, you"
	line "can't challenge"
	cont "the GYM."
	done

PagotaCitySignText:
	text "PAGOTA CITY"

	para "Timeless as the"
	line "stars above."
	done

VioletGymSignText:
	text "PAGOTA CITY"
	line "#MON GYM"
	cont "LEADER: FALKNER"

	para "The Elegant Master"
	line "of Flying #MON"
	done

SproutTowerSignText:
	text "BRASS TOWER"

	para "Experience the"
	line "Way of #MON"
	done

EarlsPokemonAcademySignText:
	text "EARL'S ART HOUSE"
	done
	
KurtsHouseSignText:
	text "KURT'S HOUSE"
	done
	
BillsHouseSign2Text:
	text "BILL'S HOUSE"
	done
	


PagotaCity_MapEvents:
	db 0, 0 ; filler

	db 14 ; warp events
	warp_event  3, 26, PAGOTA_MART, 1
	warp_event 26, 14, PAGOTA_GYM, 1
	warp_event 27, 14, PAGOTA_GYM, 2
	warp_event 10, 26, PAGOTA_NICKNAME_SPEECH_HOUSE, 1
	warp_event 27, 28, PAGOTA_POKECENTER_1F, 1
	warp_event 22, 26, PAGOTA_TRAINER_SCHOOL, 1
	warp_event 11, 17, BRASS_TOWER_1F, 1
	warp_event 19, 31, ROUTE_101_PAGOTA_GATE, 2
	warp_event 18, 31, ROUTE_101_PAGOTA_GATE, 1
	warp_event  3, 31, KURTS_HOUSE, 1
	warp_event 12, 17, BRASS_TOWER_1F, 2
	warp_event  4, 14, EARLS_ART_HOUSE, 1
	warp_event  5, 14, EARLS_ART_HOUSE, 2
	warp_event 30, 22, BILLS_FAMILYS_HOUSE, 1

	db 1 ; coord events
	coord_event  3, 32, SCENE_KURTS_HOUSE_LOCKED, KurtsDoorLockedScript

	db 9 ; bg events
	bg_event 20, 29, BGEVENT_READ, PagotaCitySign
	bg_event 28, 16, BGEVENT_READ, VioletGymSign
	bg_event  8, 16, BGEVENT_READ, SproutTowerSign
	bg_event  8, 14, BGEVENT_READ, EarlsPokemonAcademySign
	bg_event 28, 28, BGEVENT_READ, PagotaCityPokecenterSign
	bg_event  4, 26, BGEVENT_READ, PagotaCityMartSign
	bg_event 14, 11, BGEVENT_ITEM, PagotaCityHiddenHyperPotion
	bg_event  4, 32, BGEVENT_READ, KurtsHouseSign
	bg_event 26, 22, BGEVENT_READ, BillsHouseSign2

	db 8 ; object events
	object_event 26, 30, SPRITE_LASS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 2, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, PagotaCityLassScript, -1
	object_event 24, 18, SPRITE_SUPER_NERD, SPRITEMOVEDATA_WANDER, 1, 2, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, PagotaCitySuperNerdScript, -1
	object_event 15, 25, SPRITE_GRAMPS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PagotaCityGrampsScript, -1
	object_event 10, 21, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, PagotaCityYoungsterScript, -1
	object_event 23, 21, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PagotaCityFruitTree, -1
	object_event 16,  4, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, PagotaCityPPUp, EVENT_OLD_CITY_PP_UP
	object_event 23,  5, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, PagotaCityRareCandy, EVENT_OLD_CITY_RARE_CANDY
	object_event  9, 19, SPRITE_GRAMPS, SPRITEMOVEDATA_STILL, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, PagotaCityGrampsScript2, 0
