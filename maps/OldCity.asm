	const_def 2 ; object constants
	const OldCity_LASS
	const OldCity_SUPER_NERD
	const OldCity_GRAMPS
	const OldCity_YOUNGSTER
	const OldCity_FRUIT_TREE
	const OldCity_POKE_BALL1
	const OldCity_POKE_BALL2
	const OldCity_GRAMPS2

OldCity_MapScripts:
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
	disappear OldCity_GRAMPS2
	return

OldCityLassScript:
	jumptextfaceplayer OldCityLassText

OldCitySuperNerdScript:
	jumptextfaceplayer OldCitySuperNerdText

OldCityGrampsScript:
	jumptextfaceplayer OldCityGrampsText
	
OldCityGrampsScript2:
	jumptextfaceplayer OldCityGramps2Text

OldCityYoungsterScript:
	jumptextfaceplayer OldCityYoungsterText

KurtsHouseSign:
	jumptext KurtsHouseSignText

OldCitySign:
	jumptext OldCitySignText

VioletGymSign:
	jumptext VioletGymSignText

SproutTowerSign:
	jumptext SproutTowerSignText

EarlsPokemonAcademySign:
	jumptext EarlsPokemonAcademySignText

BillsHouseSign2:
	jumptext BillsHouseSign2Text

OldCityPokecenterSign:
	jumpstd pokecentersign

OldCityMartSign:
	jumpstd martsign

OldCityPPUp:
	itemball PP_UP

OldCityRareCandy:
	itemball RARE_CANDY
	

OldCityFruitTree:
	fruittree FRUITTREE_OLD_CITY

OldCityHiddenHyperPotion:
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

OldCityLassText:
	text "Ghosts are rumored"
	line "to appear in"
	cont "5 FLOOR TOWER."

	para "They said normal-"
	line "type #MON moves"

	para "had no effect on"
	line "ghosts."
	done

OldCitySuperNerdText:
	text "Hey, you're a"
	line "#MON trainer?"

	para "If you beat the"
	line "GYM LEADER here,"

	para "you'll be ready"
	line "for prime time!"
	done

OldCityGrampsText:
	text "FALKNER, from the"
	line "OLD CITY #MON"

	para "GYM, is a fine"
	line "trainer!"

	para "His FLYING-TYPE"
	line "bird #MON are"
	para "trained to perform"
	line "in parades and"
	cont "other events."
	done
	
OldCityGramps2Text:
	text "I'm sorry..."
	para "The TOWER is being"
	line "cleaned right now."

	para "Please come back"
	line "later."
	done
	
OldCityGuardText:
	text "The GYM LEADER"
	para "is absent right"
	line "now."

	para "Please come back"
	line "later."
	done

OldCityYoungsterText:
	text "Behind me is the"
	line "5 FLOOR TOWER!"
	
	para "Many trainers try"
	line "to climb it to get"
	cont "the ELDER's bles"
	cont "-sing."
	
	para "Without it, you"
	line "cant challenge the"
	cont "GYM."
	done

OldCitySignText:
	text "OLD CITY"

	para "Timeless as the"
	line "stars above."
	done

VioletGymSignText:
	text "OLD CITY"
	line "#MON GYM"
	cont "LEADER: FALKNER"

	para "The Elegant Master"
	line "of Flying #MON"
	done

SproutTowerSignText:
	text "5 FLOOR TOWER"

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
	


OldCity_MapEvents:
	db 0, 0 ; filler

	db 15 ; warp events
	warp_event  3, 26, VIOLET_MART, 1
	warp_event 26, 14, VIOLET_GYM, 1
	warp_event 27, 14, VIOLET_GYM, 2
	warp_event 10, 26, VIOLET_NICKNAME_SPEECH_HOUSE, 1
	warp_event 27, 28, VIOLET_POKECENTER_1F, 1
	warp_event 22, 26, EARLS_POKEMON_ACADEMY, 1
	warp_event 11, 17, SPROUT_TOWER_1F, 1
	warp_event 19, 31, ROUTE_31_VIOLET_GATE, 2
	warp_event 18, 31, ROUTE_31_VIOLET_GATE, 1
	warp_event  3, 31, KURTS_HOUSE, 1
	warp_event 29, 22, TEST_GARDEN, 5
	warp_event 12, 17, SPROUT_TOWER_1F, 2
	warp_event  4, 14, BILLS_HOUSE, 1
	warp_event  5, 14, BILLS_HOUSE, 2
	warp_event 30, 22, BILLS_FAMILYS_HOUSE, 1

	db 1 ; coord events
	coord_event  3, 32, SCENE_KURTS_HOUSE_LOCKED, KurtsDoorLockedScript

	db 9 ; bg events
	bg_event 20, 29, BGEVENT_READ, OldCitySign
	bg_event 28, 16, BGEVENT_READ, VioletGymSign
	bg_event  8, 16, BGEVENT_READ, SproutTowerSign
	bg_event  8, 14, BGEVENT_READ, EarlsPokemonAcademySign
	bg_event 28, 28, BGEVENT_READ, OldCityPokecenterSign
	bg_event  4, 26, BGEVENT_READ, OldCityMartSign
	bg_event 22,  4, BGEVENT_ITEM, OldCityHiddenHyperPotion
	bg_event  4, 32, BGEVENT_READ, KurtsHouseSign
	bg_event 26, 22, BGEVENT_READ, BillsHouseSign2

	db 8 ; object events
	object_event 26, 30, SPRITE_LASS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 2, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, OldCityLassScript, -1
	object_event 24, 18, SPRITE_SUPER_NERD, SPRITEMOVEDATA_WANDER, 1, 2, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, OldCitySuperNerdScript, -1
	object_event 15, 25, SPRITE_GRAMPS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OldCityGrampsScript, -1
	object_event 10, 21, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, OldCityYoungsterScript, -1
	object_event 17, 17, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OldCityFruitTree, -1
	object_event 16,  4, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, OldCityPPUp, EVENT_OLD_CITY_PP_UP
	object_event 23,  5, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, OldCityRareCandy, EVENT_OLD_CITY_RARE_CANDY
	object_event  9, 19, SPRITE_GRAMPS, SPRITEMOVEDATA_STILL, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, OldCityGrampsScript2, 0
