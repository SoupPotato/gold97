	const_def 2 ; object constants
	const GOLDENRODPOKECENTER1F_NURSE 
	const GOLDENRODPOKECENTER1F_GAMEBOY_KID
	const GOLDENRODPOKECENTER1F_LASS

WestpointPokecenter1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

WestpointPokecenter1FNurseScript:
	jumpstd pokecenternurse



WestpointPokecenter1FGameboyKidScript:
	jumptextfaceplayer WestpointPokecenter1FGameboyKidText

WestpointPokecenter1FLassScript:
	jumptextfaceplayer WestpointPokecenter1FLassText

WestpointPokecenter1FGameboyKidText:
	text "Have you tried"
	line "catching #MON"
	cont "with a GREAT BALL?"
	para "It has a better"
	line "rate of success"
	para "than a standard"
	line "# BALL."
	done

WestpointPokecenter1FLassText:
	text "A higher level"
	line "#MON doesn't"
	cont "always win."

	para "After all, it may"
	line "have a type dis-"
	cont "advantage."

	para "I don't think"
	line "there is a single"

	para "#MON that is"
	line "the toughest."
	done



WestpointPokecenter1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  5,  7, WESTPORT_CITY, 8
	warp_event  6,  7, WESTPORT_CITY, 8
	warp_event  0,  7, POKECENTER_2F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  5,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WestpointPokecenter1FNurseScript, -1
	object_event  8,  1, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, WestpointPokecenter1FGameboyKidScript, -1
	object_event  1,  4, SPRITE_LASS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WestpointPokecenter1FLassScript, -1
