	const_def 2 ; object constants
	const AMAMIFISHINGSPEECHHOUSE_FISHING_GURU

AmamiFishingSpeechHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

FishingDude:
	jumptextfaceplayer FishingDudeText

FishingDudesHousePhoto:
	jumptext FishingDudesHousePhotoText

FishingDudeText:
	text "I am the FISHING"
	line "DUDE, the elder of"
	cont "the FISHING BROS."

	para "Have you met the"
	line "FISHING GURU at"
	cont "LAKE OF RAGE?"

	para "He dreams about"
	line "seeing the world's"
	cont "greatest MAGIKARP."

	para "If you don't mind,"
	line "could you show him"

	para "any MAGIKARP you"
	line "catch?"

	para "Who knows, you may"
	line "catch the MAGIKARP"
	cont "of his dreams."
	done

FishingDudesHousePhotoText:
	text "It's a photo of"
	line "people fishing…"

	para "They're having a"
	line "great time…"
	done

AmamiFishingSpeechHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, AMAMI_TOWN, 8
	warp_event  5,  7, AMAMI_TOWN, 8

	db 0 ; coord events

	db 1 ; bg events
	bg_event  3,  0, BGEVENT_READ, FishingDudesHousePhoto

	db 1 ; object events
	object_event  2,  4, SPRITE_FISHING_GURU, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, FishingDude, -1
