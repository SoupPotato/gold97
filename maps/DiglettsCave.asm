	const_def 2 ; object constants
	const DIGLETTSCAVE_POKEFAN_M_NEW

DiglettsCave_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

DiglettsCavePokefanMScript:
	jumptextfaceplayer DiglettsCavePokefanMText

DiglettsCaveHiddenMaxRevive:
	hiddenitem MAX_REVIVE, EVENT_DIGLETTS_CAVE_HIDDEN_MAX_REVIVE_NEW

DiglettsCavePokefanMText:
	text "A bunch of DIGLETT"
	line "popped out of the"

	para "ground! That was"
	line "shocking."
	done

DiglettsCave_MapEvents:
	db 0, 0 ; filler

	db 6 ; warp events
	warp_event  4, 33, KANTO_REGION, 4 ; vermillion exit
	warp_event  5, 31, DIGLETTS_CAVE, 5
	warp_event 16,  5, KANTO_REGION, 13 ; route 2 exit
	warp_event 17,  3, DIGLETTS_CAVE, 6
	warp_event 17, 33, DIGLETTS_CAVE, 2
	warp_event  3,  3, DIGLETTS_CAVE, 4

	db 0 ; coord events

	db 1 ; bg events
	bg_event  6, 11, BGEVENT_ITEM, DiglettsCaveHiddenMaxRevive

	db 1 ; object events
	object_event  3, 31, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DiglettsCavePokefanMScript, -1
