	const_def 2 ; object constants
	const ROUTE10POKECENTER1F_NURSE
	const ROUTE10POKECENTER1F_GENTLEMAN
	const ROUTE10POKECENTER1F_GYM_GUY
	const ROUTE10POKECENTER1F_COOLTRAINER_F

Route10Pokecenter1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Route10Pokecenter1FNurseScript:
	jumpstd pokecenternurse

Route10Pokecenter1FGentlemanScript:
	jumptextfaceplayer Route10Pokecenter1FGentlemanText

Route10Pokecenter1FGymGuyScript:
	jumptextfaceplayer Route10Pokecenter1FGymGuyText


Route10Pokecenter1FCooltrainerFScript:
	jumptextfaceplayer Route10Pokecenter1FCooltrainerFText

Route10Pokecenter1FGentlemanText:
	text "A #MON CENTER"
	line "near a cave?"

	para "That's mighty"
	line "convenient."
	done

Route10Pokecenter1FGymGuyText:
	text "Have you ever been"
	line "to north NIHON?"
	para "The weather gets"
	line "very cold there."
	done


Route10Pokecenter1FCooltrainerFText:
	text "I don't feel like"
	line "dealing with"
	cont "AMPARE CAVERN."
	para "It doesn't even"
	line "lead anywhere."
	para "You can just"
	line "bypass it to get"
	cont "to BLUE FOREST."
	done


Route10Pokecenter1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  5,  7, ROUTE_39, 2
	warp_event  6,  7, ROUTE_39, 2
	warp_event  0,  7, POKECENTER_2F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 4 ; object events
	object_event  5,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route10Pokecenter1FNurseScript, -1
	object_event  9,  6, SPRITE_GENTLEMAN, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route10Pokecenter1FGentlemanScript, -1
	object_event  9,  2, SPRITE_GYM_GUY, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route10Pokecenter1FGymGuyScript, -1
	object_event  1,  3, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route10Pokecenter1FCooltrainerFScript, -1
