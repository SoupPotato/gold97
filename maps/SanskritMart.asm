	const_def 2 ; object constants
	const SanskritMart_CLERK
	const SanskritMart_LASS
	const SanskritMart_COOLTRAINER_M

SanskritMart_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

SanskritMartClerkScript:
	opentext
	pokemart MARTTYPE_STANDARD, MART_VIRIDIAN
	closetext
	end

SanskritMartLassScript:
	jumptextfaceplayer SanskritMartLassText

SanskritMartCooltrainerMScript:
	jumptextfaceplayer SanskritMartCooltrainerMText

SanskritMartLassText:
	text "I'm not really"
	line "interested in the"
	cont "RUINS."
	para "There's never been"
	line "much around town"
	cont "for me to do."
	para "That is, until the"
	line "new BOARDWALK and"
	para "GAME CORNER opened"
	line "south of town!"
	para "You should check"
	line "it out if you"
	cont "haven't been yet."
	done

SanskritMartCooltrainerMText:
	text "Have you been to"
	line "SUNPOINT CITY?"

	para "It's a major"
	line "shipping hub for"
	para "bringing in goods"
	line "that come from"
	para "countries north of"
	line "NIHON."
	done

SanskritMart_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, SANSKRIT_TOWN, 1
	warp_event  5,  7, SANSKRIT_TOWN, 1

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  1,  3, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SanskritMartClerkScript, -1
	object_event  9,  5, SPRITE_JANINE, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SanskritMartLassScript, -1
	object_event  4,  1, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SanskritMartCooltrainerMScript, -1
