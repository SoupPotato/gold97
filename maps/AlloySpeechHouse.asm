	const_def 2 ; object constants
	const ALLOYSPEECHHOUSE_POKEFAN_M

AlloySpeechHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

AlloySpeechHouseDad:
	jumptextfaceplayer AlloySpeechHouseDadText



AlloySpeechHouseBookshelf2:
	jumpstd picturebookshelf

AlloySpeechHouseRadio:
	jumpstd radio2

AlloySpeechHouseDadText:
	text "KOBAN ISLAND has"
	line "such a quaint"
	cont "little town."
	para "But reaching it"
	line "is difficult."
	para "The waters north"
	line "of here are filled"
	cont "with whirlpools."
	para "It's impossible to"
	line "pass without the"
	cont "help of #MON."
	done



AlloySpeechHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, ALLOY_CITY, 5
	warp_event  5,  7, ALLOY_CITY, 5

	db 0 ; coord events

	db 2 ; bg events
	bg_event  4,  1, BGEVENT_READ, AlloySpeechHouseRadio
	bg_event  4,  0, BGEVENT_READ, AlloySpeechHouseBookshelf2

	db 1 ; object events
	object_event  1,  2, SPRITE_GENTLEMAN, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AlloySpeechHouseDad, -1
