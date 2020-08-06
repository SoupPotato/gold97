	const_def 2 ; object constants
	const MAHOGANYPOKECENTER1F_NURSE
	const MAHOGANYPOKECENTER1F_POKEFAN_M
	const MAHOGANYPOKECENTER1F_YOUNGSTER
	const MAHOGANYPOKECENTER1F_COOLTRAINER_F

SanskritPokecenter1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

SanskritPokecenter1FNurseScript:
	jumpstd pokecenternurse

SanskritPokecenter1FPokefanMScript:
	jumptextfaceplayer SanskritPokecenter1FPokefanMText

SanskritPokecenter1FYoungsterScript:
	jumptextfaceplayer SanskritPokecenter1FYoungsterText

SanskritPokecenter1FCooltrainerFScript:
	jumptextfaceplayer SanskritPokecenter1FCooltrainerFText

SanskritPokecenter1FPokefanMText:
	text "What's this? TEAM"
	line "ROCKET has come"
	cont "back?"

	para "There's a house in"
	line "town that sure"
	para "seems to have"
	line "several members"
	cont "in it."
	para "I wonder what"
	line "they're up to…"
	done

SanskritPokecenter1FYoungsterText:
	text "I stop my #MON"
	line "from evolving too"
	cont "early."

	para "I make them learn"
	line "certain moves be-"
	cont "fore I let them"
	cont "evolve."
	done

SanskritPokecenter1FCooltrainerFText:
	text "#MON do become"
	line "stronger when they"

	para "evolve, but they"
	line "also learn moves"
	cont "more slowly."
	done

SanskritPokecenter1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  5,  7, SANSKRIT_TOWN, 4
	warp_event  6,  7, SANSKRIT_TOWN, 4
	warp_event  0,  7, POKECENTER_2F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 4 ; object events
	object_event  5,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SanskritPokecenter1FNurseScript, -1
	object_event  9,  2, SPRITE_GENTLEMAN, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, SanskritPokecenter1FPokefanMScript, -1
	object_event  1,  3, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, SanskritPokecenter1FYoungsterScript, -1
	object_event  2,  3, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SanskritPokecenter1FCooltrainerFScript, -1
