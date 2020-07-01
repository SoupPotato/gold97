	const_def 2 ; object constants
	const SAFFRONPOKECENTER1F_NURSE
	const SAFFRONPOKECENTER1F_TEACHER
	const SAFFRONPOKECENTER1F_FISHER
	const SAFFRONPOKECENTER1F_YOUNGSTER

SaffronPokecenter1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

SaffronPokecenter1FNurseScript:
	jumpstd pokecenternurse

SaffronPokecenter1FTeacherScript:
	jumptextfaceplayer SaffronPokecenter1FTeacherText

SaffronPokecenter1FFisherScript:
	faceplayer
	opentext
	checkevent EVENT_FAST_SHIP_CABINS_SE_SSE_GENTLEMAN
	iftrue .SolvedKantoPowerCrisis
	writetext SaffronPokecenter1FFisherText
	waitbutton
	closetext
	end

.SolvedKantoPowerCrisis:
	writetext SaffronPokecenter1FFisherReturnedMachinePartText
	waitbutton
	closetext
	end

SaffronPokecenter1FYoungsterScript:
	jumptextfaceplayer SaffronPokecenter1FYoungsterText

SaffronPokecenter1FTeacherText:
	text "What are the"
	line "mainland's #MON"
	cont "CENTERS like?"

	para "…Oh, I see. So"
	line "they're not much"

	para "different from the"
	line "ones here."

	para "I can take a trip"
	line "without worrying,"
	cont "then!"
	done



SaffronPokecenter1FFisherText:
	text "I just happened to"
	line "come from AMAMI"
	cont "TOWN."
	para "I heard something"
	line "was up with the"
	cont "S.S.AQUA?"
	done

SaffronPokecenter1FFisherReturnedMachinePartText:
	text "Looks like trips"
	line "from AMAMI TOWN"
	para "have resumed their"
	line "normal schedules."
	done

SaffronPokecenter1FYoungsterText:
	text "This city is a"
	line "popular tourist"
	cont "atttraction."
	done

SaffronPokecenter1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  5,  7, SAFFRON_CITY, 2
	warp_event  6,  7, SAFFRON_CITY, 2
	warp_event  0,  7, POKECENTER_2F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 4 ; object events
	object_event  5,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SaffronPokecenter1FNurseScript, -1
	object_event  9,  2, SPRITE_TEACHER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, SaffronPokecenter1FTeacherScript, -1
	object_event 10,  6, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, SaffronPokecenter1FFisherScript, -1
	object_event  3,  4, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SaffronPokecenter1FYoungsterScript, -1
