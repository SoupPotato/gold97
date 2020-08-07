	const_def 2 ; object constants
	const SUGARMART_CLERK
	const SUGARMART_GRANNY
	const SUGARMART_COOLTRAINER_M

KobanMart_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

KobanMartClerkScript:
	opentext
	pokemart MARTTYPE_STANDARD, MART_SUGAR
	closetext
	end

KobanMartGrannyScript:
	jumptextfaceplayer KobanMartGrannyText

KobanMartCooltrainerMScript:
	jumptextfaceplayer KobanMartCooltrainerMText

KobanMartGrannyText:
	text "I wish this MART"
	line "had a better"
	cont "selection."
	para "It's hard to go"
	line "elsewhere to shop."
	done

KobanMartCooltrainerMText:
	text "I'm going to get"
	line "some HYPER POTIONs"
	para "to use on my"
	line "#MON when I go"
	para "train them in the"
	line "CAVE OF DRAGONS."
	done

KobanMart_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, KOBAN_ISLAND, 2
	warp_event  5,  7, KOBAN_ISLAND, 2

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  1,  3, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KobanMartClerkScript, -1
	object_event  7,  6, SPRITE_JANINE, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KobanMartGrannyScript, -1
	object_event  4,  1, SPRITE_POKEFAN_M, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, KobanMartCooltrainerMScript, -1
