	const_def 2 ; object constants
	const LAVENDERPOKECENTER1F_NURSE
	const LAVENDERPOKECENTER1F_GENTLEMAN
	const LAVENDERPOKECENTER1F_TEACHER
	const LAVENDERPOKECENTER1F_YOUNGSTER

LavenderPokecenter1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

LavenderPokecenter1FNurseScript:
	jumpstd pokecenternurse

LavenderPokecenter1FGentlemanScript:
	jumptextfaceplayer LavenderPokecenter1FGentlemanText

LavenderPokecenter1FTeacherScript:
	jumptextfaceplayer LavenderPokecenter1FTeacherText

LavenderPokecenter1FYoungsterScript:
	jumptextfaceplayer LavenderPokecenter1FYoungsterText
	

LavenderPokecenter1FGentlemanText:
	text "This town doesn't"
	line "get too many"
	cont "visitors."
	para "Mainly just people"
	line "wanting to train"
	cont "in the cave."
	done

LavenderPokecenter1FTeacherText:
	text "I've lived on this"
	line "island my whole"
	para "life and I've not"
	line "seen you before."
	para "I assume you're"
	line "here to learn of"
	cont "DRAGON #MON."
	done

LavenderPokecenter1FYoungsterText:
	text "I'm not too"
	line "interested in"
	cont "DRAGON #MON."
	para "There isn't much"
	line "for me to do here."
	para "I might move away"
	line "someday."
	done



LavenderPokecenter1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  5,  7, PALLET_TOWN, 3
	warp_event  6,  7, PALLET_TOWN, 3
	warp_event  0,  7, POKECENTER_2F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 4 ; object events
	object_event  5,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, LavenderPokecenter1FNurseScript, -1
	object_event  2,  4, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, LavenderPokecenter1FGentlemanScript, -1
	object_event 10,  1, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, LavenderPokecenter1FTeacherScript, -1
	object_event 14,  6, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, LavenderPokecenter1FYoungsterScript, -1
