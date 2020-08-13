	const_def 2 ; object constants
	const KANTO_FISHER
	const KANTO_COOLTRAINER_M
	const KANTO_TEACHER
	const KANTO_POKEFAN_M
	const KANTO_LASS
	const KANTO_SUPER_NERD
	const KANTO_YOUNGSTER
	const KANTO_FISHER_2
	const KANTO_LASS_2
	const KANTO_ITEMBALL

KantoRegion_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint

.FlyPoint:
	setflag ENGINE_FLYPOINT_CELADON
	return
	
KantoRegionTMDetect:
	itemball TM_DETECT

KantoFisherScript:
	jumptextfaceplayer KantoFisherText

KantoSign:
	jumptext KantoSignText
	
KantoPokecenterSign:
	jumpstd pokecentersign
	
KantoGymSign:
	jumptext KantoGymSignText
	
PalletTownSign2:
	jumptext PalletTownSignText2
	
RedsHouseSign2:
	jumptext RedsHouseSignText2
	
BluesHouseSign2:
	jumptext BluesHouseSignText2
	
OaksLabSign2:
	jumptext OaksLabSign2Text
	
KantoDeptSign:
	jumptext KantoDeptSignText
	
KantoMansionSign:
	jumptext KantoMansionSignText
	
KantoBattleClubSign:
	jumptext KantoBattleClubSignText
	
PokemonTowerSign:
	jumptext PokemonTowerSignText
	
KantoCooltrainerMScript:
	jumptextfaceplayer KantoCooltrainerMText
	
KantoTeacherScript:
	jumptextfaceplayer KantoTeacherText
	
KantoPokefanMScript:
	jumptextfaceplayer KantoPokefanMText

KantoLassScript:
	jumptextfaceplayer KantoLassText
	
KantoSuperNerdScript:
	jumptextfaceplayer KantoSuperNerdText
	
KantoYoungsterScript:
	jumptextfaceplayer KantoYoungsterText
	
KantoFisher2Script:
	jumptextfaceplayer KantoFisher2Text
	
KantoLass2Script:
	jumptextfaceplayer KantoLass2Text
	
KantoLass2Text:
	text "The SCIENTISTs in"
	line "this lab are"
	cont "amazing!"
	para "They were able to"
	line "turn my fossil"
	para "into a living"
	line "#MON!"
	done
	
KantoFisher2Text:
	text "Boy, I sure do"
	line "love fishing!"
	para "And this is such"
	line "a peaceful spot"
	cont "to do it!"
	done
	
KantoYoungsterText:
	text "One day, I want"
	line "to be just as"
	cont "strong as RED."
	para "I'm not sure that"
	line "will happen,"
	cont "though."
	para "Very few people"
	line "are as good as"
	cont "him."
	done
	
KantoSuperNerdText:
	text "The owner of this"
	line "GAME CORNER"
	para "recently bought"
	line "ownership of the"
	para "newer one over on"
	line "BOARDWALK."
	done
	
KantoLassText:
	text "Do you know about"
	line "SILPH CO.?"
	para "If not, you"
	line "probably should."
	para "There's a good"
	line "chance they made"
	para "the #BALLs your"
	line "#MON are in!"
	done
	
KantoPokefanMText:
	text "I've never been a"
	line "serious trainer."
	para "I mean, I train"
	line "#MON, and I"
	cont "battle."
	para "But it's been more"
	line "of a hobby."
	para "The guy inside of"
	line "the KANTO BATTLE"
	para "CLUB wouldn't let"
	line "me inside…"
	done
	
KantoFisherText:
	text "Technology is"
	line "incredible!"
	para "You can now trade"
	line "#MON across"
	cont "time!"
	done
	
KantoSignText:
	text "KANTO-"
	line "NIHON's southern"
	cont "crown jewel."
	done
	
KantoGymSignText:
	text "KANTO #MON GYM"
	line "LEADER: RED"

	para "The Experienced"
	line "Veteran Trainer"
	done
	
PalletTownSignText2:
	text "PALLET TOWN"

	para "A tranquil setting"
	line "of peace and"
	cont "purity."
	done
	
RedsHouseSignText2:
	text "RED's house"
	done
	
BluesHouseSignText2:
	text "BLUE's house"
	done

OaksLabSign2Text:
	text "OAK #MON LAB"
	para "NOTICE: PROF.OAK"
	line "is currently"
	para "researching in"
	line "SILENT TOWN."
	done
	
KantoDeptSignText:
	text "Full Selection of"
	line "#MON Goods!"

	para "KANTO DEPT.STORE"
	done
	
KantoMansionSignText:
	text "KANTO MANSION"
	done
	
KantoBattleClubSignText:
	text "KANTO BATTLE CLUB"
	para "A members-only"
	line "club for serious"
	cont "trainers."
	done
	
PokemonTowerSignText:
	text "#MON TOWER"
	para "A monument to"
	line "#MON who have"
	cont "passed."
	done

KantoCooltrainerMText:
	text "They're holding an"
	line "eating contest in"
	cont "the restaurant."
	para "Just watching them"
	line "go at it makes me"
	cont "feel bloated…"
	done
	
KantoTeacherText:
	text "The KANTO DEPT."
	line "STORE has the best"
	cont "selection."
	para "If you can't get"
	line "it there, you"
	para "can't get it any-"
	line "where!"
	para "…Gee, I sound"
	line "like a sales"
	cont "clerk."
	done

KantoRegion_MapEvents:
	db 0, 0 ; filler

	db 36 ; warp events
	warp_event 24, 21, KANTO_DEPT_STORE_1F, 1
	warp_event 29, 21, KANTO_CELADON_MANSION_1F, 1
	warp_event 30, 15, KANTO_CELADON_MANSION_1F, 3
	warp_event 38, 35, DIGLETTS_CAVE,1
	warp_event 29, 33, KANTO_POKECENTER_1F, 1
	warp_event 23, 27, KANTO_GAME_CORNER, 1
	warp_event 24, 27, KANTO_GAME_CORNER_PRIZE_ROOM, 1
	warp_event  2,  5, KANTO_GYM, 1
	warp_event 35, 13, KANTO_LEFTOVERS_HOUSE, 1
	warp_event  4, 24, ROUTE_115_KANTO_GATE, 4
	warp_event  4, 25, ROUTE_115_KANTO_GATE, 4
	warp_event 37, 29, SILPH_CO_1F, 1
	warp_event 20, 19, DIGLETTS_CAVE,3
	warp_event 25, 21, KANTO_DEPT_STORE_1F, 2
	warp_event 48, 29, ROCK_TUNNEL_1F,2
	warp_event  3,  5, KANTO_GYM, 2
	warp_event 46, 17, ROCK_TUNNEL_1F,1
	warp_event 14, 45, OAKS_KANTO_LAB, 1
	warp_event 15, 45, OAKS_KANTO_LAB, 2
	warp_event 15, 39, BLUES_HOUSE, 1
	warp_event  9, 39, REDS_HOUSE_1F,1
	warp_event 28,  7, MOUNT_MOON, 1
	warp_event 32,  7, MOUNT_MOON, 2
	warp_event 47, 53, KANTO_BATTLE_CLUB_1F, 1
	warp_event 37,  7, KANTO_HOUSE_1, 1
	warp_event 11, 11, KANTO_HOUSE_2, 1
	warp_event 49,  5, KANTO_HOUSE_3, 1
	warp_event 17, 23, KANTO_HOUSE_4, 1
	warp_event  8, 55, KANTO_FOSSIL_LAB, 1
	warp_event  2, 15, KANTO_VICTORY_ROAD,1
	warp_event 27, 25, KANTO_CAFE, 1
	warp_event 37, 17, KANTO_CAFE, 2 ; daycare house
	warp_event  2,  9, KANTO_VICTORY_ROAD,10
	warp_event  3,  9, KANTO_VICTORY_ROAD,10
	warp_event 35, 45, SAFARI_ZONE_FUCHSIA_GATE_BETA,3
	warp_event 47, 23, KANTO_POWER_PLANT,1

	db 0 ; coord events

	db 11 ; bg events
	bg_event  3, 16, BGEVENT_READ, KantoSign
	bg_event 30, 33, BGEVENT_READ, KantoPokecenterSign
	
	bg_event  4,  6, BGEVENT_READ, KantoGymSign
	bg_event  9, 43, BGEVENT_READ, PalletTownSign2
	bg_event 10, 40, BGEVENT_READ, RedsHouseSign2
	bg_event 16, 40, BGEVENT_READ, BluesHouseSign2
	bg_event 15, 47, BGEVENT_READ, OaksLabSign2
	
	bg_event 26, 21, BGEVENT_READ, KantoDeptSign
	bg_event 28, 22, BGEVENT_READ, KantoMansionSign
	bg_event 46, 54, BGEVENT_READ, KantoBattleClubSign
	bg_event 55, 32, BGEVENT_READ, PokemonTowerSign

	db 10 ; object events
	object_event  9, 46, SPRITE_FISHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KantoFisherScript, -1
	object_event 29, 27, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_UP, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KantoCooltrainerMScript, -1
	object_event 23, 23, SPRITE_TEACHER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KantoTeacherScript, -1
	object_event 39, 10, SPRITE_POKEFAN_M, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KantoPokefanMScript, -1
	object_event 33, 24, SPRITE_LASS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KantoLassScript, -1
	object_event 22, 29, SPRITE_SUPER_NERD, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KantoSuperNerdScript, -1
	object_event  1, 18, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KantoYoungsterScript, -1
	object_event 37, 53, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KantoFisher2Script, -1
	object_event 11, 56, SPRITE_LASS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KantoLass2Script, -1
	object_event 29, 42, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, KantoRegionTMDetect, EVENT_LAKE_OF_RAGE_TM_DETECT
