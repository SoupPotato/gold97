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

KantoCity_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint

.FlyPoint:
	setflag ENGINE_FLYPOINT_CELADON
	return
	
KantoCityTMDetect:
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
	
KantoMartSign:
	jumpstd martsign
	
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

KantoCity_MapEvents:
	db 0, 0 ; filler

	db 31 ; warp events
	warp_event 14, 17, CELADON_DEPT_STORE_1F, 1
	warp_event 22, 19, CELADON_MANSION_1F, 1
	warp_event 22, 13, CELADON_MANSION_1F, 3
	warp_event 23, 13, CELADON_MANSION_1F, 3
	warp_event 49, 30, CELADON_POKECENTER_1F, 1
	warp_event 29, 23, CELADON_GAME_CORNER, 1
	warp_event 34, 23, CELADON_GAME_CORNER_PRIZE_ROOM, 1
	warp_event  4,  5, CELADON_GYM, 1
	warp_event 40, 23, CELADON_CAFE, 1
	warp_event  6, 27, ROUTE_115_KANTO_GATE, 4
	warp_event 30, 19, SILPH_CO_1F, 1
	warp_event 31, 19, SILPH_CO_1F, 2
	warp_event 15, 17, CELADON_DEPT_STORE_1F, 2
	warp_event 23, 19, CELADON_MANSION_1F, 2
	warp_event  5,  5, CELADON_GYM, 2
	warp_event 38, 29, GOLDENROD_MAGNET_TRAIN_STATION, 1
	warp_event 12, 43, OAKS_LAB, 1
	warp_event 13, 43, OAKS_LAB, 2
	warp_event 13, 38, BLUES_HOUSE, 1
	warp_event  5, 38, REDS_HOUSE_1F,1
	warp_event 13,  4, KANTO_POKECENTER_1F,1
	warp_event  3, 18, KANTO_MART,1
	warp_event 42,  3, KANTO_BATTLE_CLUB_1F, 1
	warp_event 16, 23, KANTO_HOUSE_1, 1
	warp_event 51, 11, KANTO_HOUSE_2, 1
	warp_event 39, 38, KANTO_HOUSE_3, 1
	warp_event 45, 46, KANTO_HOUSE_4, 1
	warp_event 52, 45, DANCE_THEATRE, 1
	warp_event 53, 45, DANCE_THEATRE, 2
	warp_event 52, 23, DRAGON_SHRINE, 1
	warp_event 53, 23, DRAGON_SHRINE, 2

	db 0 ; coord events

	db 13 ; bg events
	bg_event 46, 18, BGEVENT_READ, KantoSign
	bg_event 14,  4, BGEVENT_READ, KantoPokecenterSign
	bg_event 50, 30, BGEVENT_READ, KantoPokecenterSign
	bg_event  7,  7, BGEVENT_READ, KantoGymSign
	bg_event  6, 41, BGEVENT_READ, PalletTownSign2
	bg_event  8, 38, BGEVENT_READ, RedsHouseSign2
	bg_event 16, 38, BGEVENT_READ, BluesHouseSign2
	bg_event 12, 45, BGEVENT_READ, OaksLabSign2
	bg_event  4, 18, BGEVENT_READ, KantoMartSign
	bg_event 18, 18, BGEVENT_READ, KantoDeptSign
	bg_event 26, 19, BGEVENT_READ, KantoMansionSign
	bg_event 44,  2, BGEVENT_READ, KantoBattleClubSign
	bg_event 54,  8, BGEVENT_READ, PokemonTowerSign

	db 10 ; object events
	object_event 14, 46, SPRITE_FISHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KantoFisherScript, -1
	object_event 50, 26, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_UP, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KantoCooltrainerMScript, -1
	object_event  9, 19, SPRITE_TEACHER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KantoTeacherScript, -1
	object_event 38,  7, SPRITE_POKEFAN_M, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KantoPokefanMScript, -1
	object_event 34, 21, SPRITE_LASS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KantoLassScript, -1
	object_event 31, 25, SPRITE_SUPER_NERD, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KantoSuperNerdScript, -1
	object_event  5,  9, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KantoYoungsterScript, -1
	object_event 40, 43, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KantoFisher2Script, -1
	object_event 51, 48, SPRITE_LASS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KantoLass2Script, -1
	object_event 32, 44, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, KantoCityTMDetect, EVENT_LAKE_OF_RAGE_TM_DETECT
