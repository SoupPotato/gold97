	const_def 2 ; object constants
	const CELADONMANSIONROOF_FISHER

KantoCeladonMansionRoof_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

KantoCeladonMansionRoofFisherScript:
	jumptextfaceplayer KantoCeladonMansionRoofFisherText

KantoCeladonMansionRoofGraffiti:
	jumptext KantoCeladonMansionRoofGraffitiText

KantoCeladonMansionRoofFisherText:
	text "High places--I do"
	line "love them so!"

	para "I'd say the only"
	line "thing that loves"

	para "heights as much as"
	line "me is smoke!"
	done

KantoCeladonMansionRoofGraffitiText:
	text "There's graffiti"
	line "on the wall…"

	para "<PLAYER> added a"
	line "moustache!"
	done

KantoCeladonMansionRoof_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  2,  1, KANTO_CELADON_MANSION_3F, 1
	warp_event  6,  1, KANTO_CELADON_MANSION_3F, 4
	warp_event  2,  7, KANTO_CELADON_MANSION_ROOF_HOUSE, 1

	db 0 ; coord events

	db 1 ; bg events
	bg_event  0,  6, BGEVENT_LEFT, KantoCeladonMansionRoofGraffiti

	db 1 ; object events
	object_event  1,  3, SPRITE_FISHER, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, KantoCeladonMansionRoofFisherScript, -1
