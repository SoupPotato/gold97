	const_def 2 ; object constants
	const SUGARHOUSE_2_GURU

SugarHouse2_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

SugarHouse2GuruScript:
	jumptextfaceplayer SugarHouse2GuruText
	
SugarHouse2GuruText:
	text "It's said that"
	line "DRAGON #MON"
	para "still inhabit the"
	line "cave just north"
	cont "of here."
	para "I've never found"
	line "any by fishing."
	para "Maybe you have to"
	line "have a special"
	cont "ROD…"
	done

SugarHouse2_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  3,  7, PALLET_TOWN, 4
	warp_event  4,  7, PALLET_TOWN, 4

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  2, 3, SPRITE_FISHING_GURU, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, SugarHouse2GuruScript, -1
