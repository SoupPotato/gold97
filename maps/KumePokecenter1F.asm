	const_def 2 ; object constants
	const KUMEPOKECENTER1F_NURSE
	const KUMEPOKECENTER1F_TEACHER
	const KUMEPOKECENTER1F_JIGGLYPUFF
	const KUMEPOKECENTER1F_BUG_CATCHER
	const KUMEPOKECENTER1F_CHRIS

KumePokecenter1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

KumePokecenter1FNurseScript:
	jumpstd pokecenternurse

KumePokecenter1FTeacherScript:
	jumptextfaceplayer KumePokecenter1FTeacherText

KumeJigglypuff:
	opentext
	writetext KumeJigglypuffText
	cry JIGGLYPUFF
	waitbutton
	closetext
	end

KumePokecenter1FBugCatcherScript:
	jumptextfaceplayer KumePokecenter1FBugCatcherText

Chris:
	faceplayer
	opentext
	trade NPC_TRADE_CHRIS
	waitbutton
	closetext
	end

KumePokecenter1FTeacherText:
	text "…Yeah, and he's"
	line "not even a real"
	cont "GYM LEADER!"

	para "…Yes? I'm on the"
	line "phone. Go away!"
	done

KumeJigglypuffText:
	text "JIGGLYPUFF: Puu"
	line "pupuu."
	done

KumePokecenter1FBugCatcherText:
	text "Most #MON get"
	line "drowsy if they"

	para "hear a JIGGLYPUFF"
	line "singing."

	para "There are several"
	line "moves that can be"

	para "used only while a"
	line "#MON is asleep."
	done

KumePokecenter1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  5,  7, KUME_CITY, 2
	warp_event  6,  7, KUME_CITY, 2
	warp_event  0,  7, POKECENTER_2F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 5 ; object events
	object_event  5,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KumePokecenter1FNurseScript, -1
	object_event 10,  6, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, KumePokecenter1FTeacherScript, -1
	object_event  2,  3, SPRITE_JIGGLYPUFF, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KumeJigglypuff, -1
	object_event  3,  3, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, KumePokecenter1FBugCatcherScript, -1
	object_event 10,  1, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Chris, -1
