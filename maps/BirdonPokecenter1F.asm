	const_def 2 ; object constants
	const AZALEAPOKECENTER1F_NURSE
	const AZALEAPOKECENTER1F_GENTLEMAN
	const AZALEAPOKECENTER1F_FISHING_GURU
	const AZALEAPOKECENTER1F_POKEFAN_F

BirdonPokecenter1F_MapScripts:
	db 1 ; scene scripts
	scene_script .DummyScene

	db 0 ; callbacks

.DummyScene:
	end

BirdonPokecenter1FNurseScript:
	jumpstd pokecenternurse

BirdonPokecenter1FGentlemanScript:
	jumptextfaceplayer BirdonPokecenter1FGentlemanText

BirdonPokecenter1FFishingGuruScript:
	jumptextfaceplayer BirdonPokecenter1FFishingGuruText

BirdonPokecenter1FPokefanFScript:
	jumptextfaceplayer BirdonPokecenter1FPokefanFText

BirdonPokecenter1FGentlemanText:
	text "Do your #MON"
	line "know HM moves?"

	para "Those moves can"
	line "be used even if"

	para "your #MON has"
	line "fainted."
	done

BirdonPokecenter1FUnusedText:
; unreferenced
	text "This BILL guy"
	line "created the system"

	para "for storing"
	line "#MON in a PC."

	para "BILL's PC can"
	line "store up to 20"
	cont "#MON per BOX."
	done

BirdonPokecenter1FFishingGuruText:
	text "BILL's PC can"
	line "store up to 20"
	cont "#MON per BOX."
	done

BirdonPokecenter1FPokefanFText:
	text "Do you know about"
	line "APRICORNS?"

	para "Crack one open,"
	line "hollow it out and"

	para "fit it with a"
	line "special device."

	para "Then you can catch"
	line "#MON with it."

	para "Before # BALLS"
	line "were invented,"

	para "everyone used"
	line "APRICORNS."
	done

BirdonPokecenter1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  5,  7, BIRDON_TOWN, 1
	warp_event  6,  7, BIRDON_TOWN, 1
	warp_event  0,  7, POKECENTER_2F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 4 ; object events
	object_event  5,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BirdonPokecenter1FNurseScript, -1
	object_event  11,  6, SPRITE_FISHER, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BirdonPokecenter1FGentlemanScript, -1
	object_event  10,  1, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BirdonPokecenter1FFishingGuruScript, -1
	object_event  1,  4, SPRITE_GENTLEMAN, SPRITEMOVEDATA_WANDER, 1, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BirdonPokecenter1FPokefanFScript, -1
