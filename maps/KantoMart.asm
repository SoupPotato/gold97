	const_def 2 ; object constants
	const KANTOMART_CLERK
	const KANTOMART_GRAMPS
	const KANTOMART_TWIN

KantoMart_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

KantoMartClerkScript:; uses same mart stock as stand city
	opentext
	pokemart MARTTYPE_STANDARD, MART_FUCHSIA
	closetext
	end

KantoMartGrampsScript:
	jumptextfaceplayer KantoMartGrampsText
	
KantoMartTwinScript:
	jumptextfaceplayer KantoMartTwinText
	
KantoMartGrampsText:
	text "Why is this MART"
	line "here with the big"
	para "DEPT. STORE right"
	line "next door?"
	done
	
KantoMartTwinText:
	text "I want to get toys"
	line "for my #MON!"
	done

KantoMart_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, KANTO_REGION, 22
	warp_event  5,  7, KANTO_REGION, 22

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  1,  3, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KantoMartClerkScript, -1
	object_event  4,  1, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KantoMartGrampsScript, -1
	object_event 10,  5, SPRITE_TWIN, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KantoMartTwinScript, -1
