	const_def 2 ; object constants
	const ROUTE32POKECENTER1F_NURSE
	const ROUTE32POKECENTER1F_COOLTRAINER_F
	const ROUTE32POKECENTER1F_COOLTRAINER_M

Route106Pokecenter1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Route106Pokecenter1FNurseScript:
	jumpstd pokecenternurse


Route106Pokecenter1FCooltrainerFScript:
	;setflag ENGINE_FOREST_IS_RESTLESS
	jumptextfaceplayer Route106Pokecenter1FCooltrainerFText
	
Route106Pokecenter1FCooltrainerMScript:
	jumptextfaceplayer Route106Pokecenter1FCooltrainerMText


Route106Pokecenter1FCooltrainerFText:
	text "What should I make"
	line "my #MON hold?"

	para "Maybe an item that"
	line "increases ATTACK"
	cont "power…"
	done
	
Route106Pokecenter1FCooltrainerMText:
	text "It's so convenient"
	line "that this #MON"
	cont "CENTER is here."
	para "JADE FOREST is"
	line "a tough trek and"
	para "I'm glad my #-"
	line "MON can rest."
	done

Route106Pokecenter1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  5,  7, ROUTE_106, 9
	warp_event  6,  7, ROUTE_106, 9
	warp_event  0,  7, POKECENTER_2F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  5,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route106Pokecenter1FNurseScript, -1
	object_event  8,  2, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route106Pokecenter1FCooltrainerFScript, -1
	object_event  3,  4, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route106Pokecenter1FCooltrainerMScript, -1
