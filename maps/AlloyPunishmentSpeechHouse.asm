	const_def 2 ; object constants
	const OLIVINEPUNISHMENTSPEECHHOUSE_POKEFAN_M

AlloyPunishmentSpeechHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

AlloyPunishmentSpeechHouseDad:
	jumptextfaceplayer AlloyPunishmentSpeechHouseDadText



AlloyPunishmentSpeechHouseBookshelf2:
	jumpstd picturebookshelf

AlloyPunishmentSpeechHouseRadio:
	jumpstd radio2

AlloyPunishmentSpeechHouseDadText:
	text "SUGAR TOWN is such"
	line "a quaint little"
	cont "island."
	para "But reaching it"
	line "is difficult."
	para "The waters north"
	line "of here are filled"
	cont "with whirlpools."
	para "It's impossible to"
	line "pass without the"
	cont "help of #MON."
	done



AlloyPunishmentSpeechHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, ALLOY_CITY, 5
	warp_event  5,  7, ALLOY_CITY, 5

	db 0 ; coord events

	db 2 ; bg events
	bg_event  4,  1, BGEVENT_READ, AlloyPunishmentSpeechHouseRadio
	bg_event  4,  0, BGEVENT_READ, AlloyPunishmentSpeechHouseBookshelf2

	db 1 ; object events
	object_event  1,  2, SPRITE_GENTLEMAN, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AlloyPunishmentSpeechHouseDad, -1
