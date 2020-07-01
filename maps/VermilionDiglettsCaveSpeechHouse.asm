	const_def 2 ; object constants
	const VERMILIONDIGLETTSCAVESPEECHHOUSE_GENTLEMAN

VermilionDiglettsCaveSpeechHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

VermilionDiglettsCaveSpeechHouseGentlemanScript:
	jumptextfaceplayer VermilionDiglettsCaveSpeechHouseGentlemanText

VermilionDiglettsCaveSpeechHouseGentlemanText:
	text "Over many years,"
	line "a long time ago,"
	para "people from the"
	line "mainland sailed"
	para "here and settled"
	line "on the islands."
	para "I feel our culture"
	line "is slightly more"
	cont "relaxed here."
	done

VermilionDiglettsCaveSpeechHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, VERMILION_CITY, 9
	warp_event  5,  7, VERMILION_CITY, 9

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  1,  3, SPRITE_GENTLEMAN, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, VermilionDiglettsCaveSpeechHouseGentlemanScript, -1
