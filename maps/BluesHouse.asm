	const_def 2 ; object constants
	const DAISYSNOTE

BluesHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

DaisysLetter:
	jumptext DaisysLetterText
	
DaisysLetterText:
	text "It's a note left"
	line "by DAISY."
	
	para "Please stop by the"
	line "house every now"
	cont "and again while"
	cont "we're out at"
	cont "SILENT's LAB."
	
	para "It may be a while"
	line "before we're back"
	cont "but grandpa is"
	cont "very excited about"
	cont "his new project"
	cont "with the kids from"
	cont "town."
	
	para "If RED needs any-"
	line "thing, there's"
	cont "always food in"
	cont "the fridge."
	
	para "Thank you for"
	line "being a good"
	cont "neighbor!"
	
	para "-DAISY OAK"
	done


BluesHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, KANTO_REGION, 20
	warp_event  5,  7, KANTO_REGION, 20

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  5,  4, SPRITE_PAPER, 0, 0, 0, -1, -1, PAL_OW_SILVER, OBJECTTYPE_SCRIPT, 0, DaisysLetter, -1
