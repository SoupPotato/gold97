	const_def 2 ; object constants
	const ECRUTEAKMART_CLERK
	const ECRUTEAKMART_SUPER_NERD
	const ECRUTEAKMART_GRANNY

TeknosMart_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TeknosMartClerkScript:
	opentext
	pokemart MARTTYPE_STANDARD, MART_ECRUTEAK
	closetext
	end

TeknosMartSuperNerdScript:
	jumptextfaceplayer TeknosMartSuperNerdText

TeknosMartGrannyScript:
	jumptextfaceplayer TeknosMartGrannyText

TeknosMartSuperNerdText:
	text "My EEVEE evolved"
	line "into a FLAREON."

	para "But my friend's"
	line "EEVEE turned into"
	cont "an UMBREON."
	
	para "EEVEE can become"
	line "many different"
	cont "types of #MON."
	done

TeknosMartGrannyText:
	text "If you use REVIVE,"
	line "a #MON that's"

	para "fainted will wake"
	line "right up."
	done

TeknosMart_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, TEKNOS_CITY, 7
	warp_event  5,  7, TEKNOS_CITY, 7

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  1,  3, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TeknosMartClerkScript, -1
	object_event  5,  2, SPRITE_SUPER_NERD, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, TeknosMartSuperNerdScript, -1
	object_event  6,  6, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TeknosMartGrannyScript, -1
