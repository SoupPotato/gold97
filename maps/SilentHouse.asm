	const_def 2 ; object constants
	const ELMSHOUSE_ELMS_WIFE
	const ELMSHOUSE_ELMS_SON

SilentHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

ElmsWife:
	jumptextfaceplayer ElmsWifeText

ElmsSon:
	jumptextfaceplayer ElmsSonText

SilentHousePC:
	jumptext SilentHousePCText

SilentHouseBookshelf:
	jumpstd difficultbookshelf

ElmsWifeText:
	text "Hi, <PLAY_G>! My"
	line "son's always so"
	cont "energetic."
	para "When he gets his"
	line "mind set on"
	para "something, he'll"
	line "just go at it,"
	cont "full speed ahead."
	done

ElmsSonText:
	text "When I grow up,"
	line "I'm going to be"
	cont "a #MON breeder!"

	para "I'll raise all"
	line "the #MON!"
	done

SilentHouseLabFoodText:
; unused
	text "There's some food"
	line "here. It must be"
	cont "for the LAB."
	done

SilentHousePokemonFoodText:
; unused
	text "There's some food"
	line "here. This must be"
	cont "for #MON."
	done

SilentHousePCText:
	text "#MON. Where do"
	line "they come from? "

	para "Where are they"
	line "going?"

	para "Why has no one"
	line "ever witnessed a"
	cont "#MON's birth?"

	para "I want to know! I"
	line "will dedicate my"

	para "life to the study"
	line "of #MON!"

	para "…"

	para "It's a part of"
	line "PROF.ELM's re-"
	cont "search papers."
	done

SilentHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, SILENT_TOWN, 4
	warp_event  3,  7, SILENT_TOWN, 4

	db 0 ; coord events

	db 2 ; bg events
	bg_event  5,  1, BGEVENT_READ, SilentHouseBookshelf
	bg_event  5,  0, BGEVENT_READ, SilentHouseBookshelf

	db 2 ; object events
	object_event  5,  3, SPRITE_BUENA, SPRITEMOVEDATA_STANDING_LEFT, 0, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, ElmsWife, -1
	object_event  2,  4, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ElmsSon, -1
