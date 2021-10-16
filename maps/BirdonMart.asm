	const_def 2 ; object constants
	const BIRDONMART_CLERK
	const BIRDONMART_COOLTRAINER_M
	const BIRDONMART_BUG_CATCHER

BirdonMart_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

BirdonMartClerkScript:
	opentext
	pokemart MARTTYPE_STANDARD, MART_BIRDON
	closetext
	end

BirdonMartYoungsterScript:
	jumptextfaceplayer BirdonMartYoungsterText

BirdonMartTeacherScript:
	jumptextfaceplayer BirdonMartTeacherText

BirdonMartYoungsterText:
	text "There's no GREAT"
	line "BALL here. #"

	para "BALLS will have"
	line "to do."

	para "WESTPORT CITY has"
	line "a much better"
	cont "selection."
	done

BirdonMartTeacherText:
	text "An ESCAPE ROPE is"
	line "a handy tool if"

	para "you're deep in a"
	line "cave and need a"
	cont "quick escape."
	done

BirdonMart_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, BIRDON_TOWN, 3
	warp_event  5,  7, BIRDON_TOWN, 3

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  1,  3, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BirdonMartClerkScript, -1
	object_event  8,  5, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BirdonMartYoungsterScript, -1
	object_event  4,  1, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_UP, 2, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BirdonMartTeacherScript, -1
