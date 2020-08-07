	const_def 2 ; object constants
	const PEWTERSNOOZESPEECHHOUSE_TEACHER

YoronSnoozeSpeechHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

YoronSnoozeSpeechHouseTeacherScript:
	jumptextfaceplayer YoronSnoozeSpeechHouseTeacherText
	
YoronSnoozeSpeechHouseTeacherText:
	text "Life is so"
	line "peaceful here on"
	cont "the ISLANDS."
	para "I think I'll take"
	line "a snooze…"
	done
	
	

YoronSnoozeSpeechHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, YORON_CITY, 4
	warp_event  5,  7, YORON_CITY, 4

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  4,  4, SPRITE_TEACHER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, YoronSnoozeSpeechHouseTeacherScript, -1
