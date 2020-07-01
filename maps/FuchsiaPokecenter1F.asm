	const_def 2 ; object constants
	const FUCHSIAPOKECENTER1F_NURSE
	const FUCHSIAPOKECENTER1F_COOLTRAINER_M
	const FUCHSIAPOKECENTER1F_COOLTRAINER_F
	const FUCHSIAPOKECENTER1F_JANINE_IMPERSONATOR

FuchsiaPokecenter1F_MapScripts:
	db 1 ; scene scripts
	scene_script .DummyScene

	db 0 ; callbacks

.DummyScene:
	end

FuchsiaPokecenter1FNurseScript:
	jumpstd pokecenternurse

FuchsiaPokecenter1FCooltrainerMScript:
	faceplayer
	opentext
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .FuchsiaPokecenter1FCooltrainerMRocketsGone
	writetext FuchsiaPokecenter1FCooltrainerMText
	waitbutton
	closetext
	end
	
.FuchsiaPokecenter1FCooltrainerMRocketsGone
	writetext FuchsiaPokecenter1FCooltrainerMText2
	waitbutton
	closetext
	end

FuchsiaPokecenter1FCooltrainerFScript:
	faceplayer
	opentext
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .FuchsiaPokecenter1FCooltrainerFRocketsGone
	writetext FuchsiaPokecenter1FCooltrainerFText
	waitbutton
	closetext
	end
	
.FuchsiaPokecenter1FCooltrainerFRocketsGone
	writetext FuchsiaPokecenter1FCooltrainerFText2
	waitbutton
	closetext
	end

FuchsiaPokecenter1FJanineImpersonatorScript:
	faceplayer
	opentext
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .FuchsiaPokecenter1FJanineImpersonatorRocketsGone
	writetext FuchsiaPokecenter1FJanineImpersonatorText1
	waitbutton
	closetext
	end
	
.FuchsiaPokecenter1FJanineImpersonatorRocketsGone
	writetext FuchsiaPokecenter1FJanineImpersonatorText2
	waitbutton
	closetext
	end

FuchsiaPokecenter1FCooltrainerMText:
	text "I'm worried about"
	line "my #MON getting"
	cont "sick."
	done
	
FuchsiaPokecenter1FCooltrainerMText2:
	text "The staff for the"
	line "STAND CITY ZOO do"
	para "a lot of work"
	line "making sure the"
	para "#MON are"
	line "healthy."
	done

FuchsiaPokecenter1FCooltrainerFText:
	text "What's going on in"
	line "this town right"
	cont "now?"
	para "Things are usually"
	line "so peaceful."
	done
	
FuchsiaPokecenter1FCooltrainerFText2:
	text "You have a lot of"
	line "GYM BADGES!"
	para "Have you taken on"
	line "the LEAGUE?"
	para "One day I want to"
	line "climb MT.FUJI"
	cont "myself."
	done

FuchsiaPokecenter1FJanineImpersonatorText1:
	text "I came to visit"
	line "STAND CITY to see"
	para "the NATIONAL PARK"
	line "and all of the"
	cont "#MON."
	para "I'm kind of upset"
	line "I can't do any of"
	cont "that right now…"
	done

FuchsiaPokecenter1FJanineImpersonatorText2:
	text "STAND CITY has so"
	line "many interesting"
	cont "things to see!"
	done

FuchsiaPokecenter1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  5,  7, FUCHSIA_CITY, 5
	warp_event  6,  7, FUCHSIA_CITY, 5
	warp_event  0,  7, POKECENTER_2F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 4 ; object events
	object_event  5,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, FuchsiaPokecenter1FNurseScript, -1
	object_event  2,  4, SPRITE_GENTLEMAN, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, FuchsiaPokecenter1FCooltrainerMScript, -1
	object_event 13,  6, SPRITE_JANINE, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, FuchsiaPokecenter1FCooltrainerFScript, -1
	object_event 10,  1, SPRITE_LASS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, FuchsiaPokecenter1FJanineImpersonatorScript, -1
