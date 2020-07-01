	const_def 2 ; object constants
	const AZALEAMART_CLERK
	const AZALEAMART_COOLTRAINER_M
	const AZALEAMART_BUG_CATCHER

AzaleaMart_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

AzaleaMartClerkScript:
	opentext
	pokemart MARTTYPE_STANDARD, MART_AZALEA
	closetext
	end

AzaleaMartCooltrainerMScript:
	jumptextfaceplayer AzaleaMartCooltrainerMText

AzaleaMartBugCatcherScript:
	jumptextfaceplayer AzaleaMartBugCatcherText

AzaleaMartCooltrainerMText:
	text "There's no GREAT"
	line "BALL here. #"

	para "BALLS will have"
	line "to do."
	para "WEST CITY has a"
	line "much better"
	cont "selection."
	done

AzaleaMartBugCatcherText:
	text "An ESCAPE ROPE is"
	line "a handy tool if"
	para "you're deep in a"
	line "cave and need a"
	cont "quick escape."
	done

AzaleaMart_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, AZALEA_TOWN, 3
	warp_event  5,  7, AZALEA_TOWN, 3

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  1,  3, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AzaleaMartClerkScript, -1
	object_event  8,  5, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, AzaleaMartCooltrainerMScript, -1
	object_event  4,  1, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_UP, 2, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, AzaleaMartBugCatcherScript, -1
