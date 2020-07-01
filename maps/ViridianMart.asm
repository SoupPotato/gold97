	const_def 2 ; object constants
	const VIRIDIANMART_CLERK
	const VIRIDIANMART_LASS
	const VIRIDIANMART_COOLTRAINER_M

ViridianMart_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

ViridianMartClerkScript:
	opentext
	pokemart MARTTYPE_STANDARD, MART_VIRIDIAN
	closetext
	end

ViridianMartLassScript:
	jumptextfaceplayer ViridianMartLassText

ViridianMartCooltrainerMScript:
	jumptextfaceplayer ViridianMartCooltrainerMText

ViridianMartLassText:
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

ViridianMartCooltrainerMText:
	text "Have you been to"
	line "SOUTH POINT?"

	para "It's a major"
	line "shipping hub for"
	para "bringing in goods"
	line "that come from"
	para "countries north of"
	line "NIHON."
	done

ViridianMart_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, MAHOGANY_TOWN, 1
	warp_event  5,  7, MAHOGANY_TOWN, 1

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  1,  3, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ViridianMartClerkScript, -1
	object_event  9,  5, SPRITE_JANINE, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ViridianMartLassScript, -1
	object_event  4,  1, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ViridianMartCooltrainerMScript, -1
