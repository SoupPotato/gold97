	const_def 2 ; object constants
	const VERMILIONMART_CLERK
	const VERMILIONMART_SUPER_NERD
	const VERMILIONMART_BUENA

AmamiMart_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

AmamiMartClerkScript:
	opentext
	pokemart MARTTYPE_STANDARD, MART_VERMILION
	closetext
	end

AmamiMartSuperNerdScript:
	jumptextfaceplayer AmamiMartSuperNerdText

AmamiMartBuenaScript:
	jumptextfaceplayer AmamiMartBuenaText

AmamiMartSuperNerdText:
	text "TEAM ROCKET had"
	line "made a return on"
	cont "the mainland?"
	para "I'm glad we didn't"
	line "have to see them"
	cont "around here!"
	done

AmamiMartBuenaText:
	text "I'm thinking about"
	line "going shopping"
	cont "in WESTPORT CITY."
	done

AmamiMart_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, AMAMI_TOWN, 7
	warp_event  5,  7, AMAMI_TOWN, 7

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  1,  3, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AmamiMartClerkScript, -1
	object_event  5,  1, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, AmamiMartSuperNerdScript, -1
	object_event  8,  6, SPRITE_LASS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, AmamiMartBuenaScript, -1
