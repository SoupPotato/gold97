	const_def 2 ; object constants
	const CERULEANPOKECENTER1F_NURSE
	const CERULEANPOKECENTER1F_SUPER_NERD
	const CERULEANPOKECENTER1F_GYM_GUY

NagoPokecenter1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

NagoPokecenter1FNurseScript:
	jumpstd pokecenternurse

NagoPokecenter1FSuperNerdScript:
	jumptextfaceplayer NagoPokecenter1FSuperNerdText

NagoPokecenter1FGymGuyScript:
	jumptextfaceplayer NagoPokecenter1FGymGuyText

NagoPokecenter1FSuperNerdText:
	text "For battles, I'd"
	line "much rather use"

	para "#MON I've been"
	line "raising, even if"

	para "they're weaker"
	line "than some newly"
	cont "caught #MON."
	done


NagoPokecenter1FGymGuyText:
	text "Not many people"
	line "live in this town."
	para "RYUKYU CITY is a"
	line "much more busy"
	cont "place to be."
	done

NagoPokecenter1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  5,  7, NAGO_VILLAGE, 1
	warp_event  6,  7, NAGO_VILLAGE, 1
	warp_event  0,  7, POKECENTER_2F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  5,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, NagoPokecenter1FNurseScript, -1
	object_event  9,  4, SPRITE_SUPER_NERD, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, NagoPokecenter1FSuperNerdScript, -1
	object_event  1,  5, SPRITE_ROCKER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, NagoPokecenter1FGymGuyScript, -1
