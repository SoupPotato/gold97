	const_def 2 ; object constants
	const BLACKTHORNDRAGONSPEECHHOUSE_GRANNY
	const BLACKTHORNDRAGONSPEECHHOUSE_SLOWPOKE

BlueForestSpeechHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

BlueForestSpeechHouseGrannyScript:
	jumptextfaceplayer BlueForestSpeechHouseGrannyText

BlueForestSpeechHouseDratiniScript:
	opentext
	writetext BlueForestSpeechHouseDratiniText
	cry SLOWPOKE
	waitbutton
	closetext
	end

; unused
BlueForestSpeechHousePictureBookshelf:
	jumpstd picturebookshelf

; unused
BlueForestSpeechHouseMagazineBookshelf:
	jumpstd magazinebookshelf

BlueForestSpeechHouseGrannyText:
	text "North of town, out"
	line "in the ocean, lies"
	cont "WHIRL ISLAND."
	para "It is named so"
	line "because of the"
	para "many whirlpools"
	line "that surround it."
	para "It is a dangerous"
	line "maze that leads"
	cont "nowhere."
	para "Make sure you know"
	line "what you're doing"
	para "if you intend to"
	line "explore it."
	done

BlueForestSpeechHouseDratiniText:
	text "SLOWPOKE: Bwa?"
	done

BlueForestSpeechHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  3,  7, BLUE_FOREST, 2
	warp_event  4,  7, BLUE_FOREST, 2

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  2,  3, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BlueForestSpeechHouseGrannyScript, -1
	object_event  5,  5, SPRITE_SLOWPOKE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BlueForestSpeechHouseDratiniScript, -1
