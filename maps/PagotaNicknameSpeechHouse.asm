	const_def 2 ; object constants
	const VIOLETNICKNAMESPEECHHOUSE_TEACHER
	const VIOLETNICKNAMESPEECHHOUSE_LASS
	const VIOLETNICKNAMESPEECHHOUSE_BIRD

PagotaNicknameSpeechHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

PagotaNicknameSpeechHouseTeacherScript:
	jumptextfaceplayer PagotaNicknameSpeechHouseTeacherText

PagotaNicknameSpeechHouseLassScript:
	jumptextfaceplayer PagotaNicknameSpeechHouseLassText

PagotaNicknameSpeechHouseBirdScript:
	faceplayer
	opentext
	writetext PagotaNicknameSpeechHouseBirdText
	cry PIDGEY
	waitbutton
	closetext
	end

PagotaNicknameSpeechHouseTeacherText:
	text "She uses the names"
	line "of her favorite"
	cont "things to eat."

	para "For the nicknames"
	line "she gives to her"
	cont "#MON, I mean."
	done

PagotaNicknameSpeechHouseLassText:
	text "I call my PIDGEY"
	line "STRAWBERRY!"
	done

PagotaNicknameSpeechHouseBirdText:
	text "STRAWBERRY: Pijji!"
	done

PagotaNicknameSpeechHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  3,  7, PAGOTA_CITY, 4
	warp_event  4,  7, PAGOTA_CITY, 4

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  2,  3, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PagotaNicknameSpeechHouseTeacherScript, -1
	object_event  6,  4, SPRITE_LASS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, PagotaNicknameSpeechHouseLassScript, -1
	object_event  5,  2, SPRITE_BIRD, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, PagotaNicknameSpeechHouseBirdScript, -1
