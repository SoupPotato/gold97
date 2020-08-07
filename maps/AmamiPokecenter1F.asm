	const_def 2 ; object constants
	const VERMILIONPOKECENTER1F_NURSE
	const VERMILIONPOKECENTER1F_FISHING_GURU
	const VERMILIONPOKECENTER1F_SAILOR
	const VERMILIONPOKECENTER1F_BUG_CATCHER

AmamiPokecenter1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

AmamiPokecenter1FNurseScript:
	jumpstd pokecenternurse

AmamiPokecenter1FFishingGuruScript:
	jumptextfaceplayer AmamiPokecenter1FFishingGuruText

AmamiPokecenter1FSailorScript:
	jumptextfaceplayer AmamiPokecenter1FSailorText

AmamiPokecenter1FBugCatcherScript:
	jumptextfaceplayer AmamiPokecenter1FBugCatcherText

AmamiPokecenter1FFishingGuruText:
	text "It has been said"
	line "that a legendary"
	para "trio of elemental"
	line "birds will reveal"
	para "themselves to he"
	line "who holds the key."
	para "I wonder what that"
	line "key is?"
	para "And who are those"
	line "#MON?"
	done


AmamiPokecenter1FSailorText:
	text "The FAST SHIP is a"
	line "great place to"

	para "meet and battle"
	line "trainers."
	done

AmamiPokecenter1FBugCatcherText:
	text "Oh? You have many"
	line "badges."
	para "You say you"
	line "beat the LEAGUE?"
	done

AmamiPokecenter1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  5,  7, AMAMI_TOWN, 3
	warp_event  6,  7, AMAMI_TOWN, 3
	warp_event  0,  7, POKECENTER_2F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 4 ; object events
	object_event  5,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AmamiPokecenter1FNurseScript, -1
	object_event 10,  1, SPRITE_FISHING_GURU, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, AmamiPokecenter1FFishingGuruScript, -1
	object_event  8,  5, SPRITE_SAILOR, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, AmamiPokecenter1FSailorScript, -1
	object_event  1,  5, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, AmamiPokecenter1FBugCatcherScript, -1
