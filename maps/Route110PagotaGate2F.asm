	const_def 2 ; object constants
	const ROUTE31VIOLETGATE2F_LASS
	const ROUTE31VIOLETGATE2F_TWIN

Route110PagotaGate2F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

	
Route110PagotaGate2FLassScript:
	jumptextfaceplayer Route110PagotaGate2FLassText

Route110PagotaGate2FLassText:
	text "Have you heard of"
	line "a man named KURT?"
	para "If KURT takes an"
	line "interest in you,"
	cont "that's a big deal."
	done
	
Route110PagotaGate2FTwinScript:
	jumptextfaceplayer Route110PagotaGate2FTwinText

Route110PagotaGate2FTwinText:
	text "Are you a tourist?"
	para "If so, that's too"
	line "bad… Not just"
	para "anyone can enter"
	line "the 5 FLOOR TOWER."
	done
	
Route110PagotaGate2FSign:
	jumptext Route110PagotaGate2FSignText
	
Route110PagotaGate2FSignText:
	text "<PLAY_G> peeked"
	line "through the"
	cont "telescope!"
	para "Whoa! A tall tower"
	line "can be seen!"
	done

Route110PagotaGate2FSign2:
	jumptext Route110PagotaGate2FSign2Text
	
Route110PagotaGate2FSign2Text:
	text "<PLAY_G> peeked"
	line "through the"
	cont "telescope!"
	para "A river stretches"
	line "into the distance."
	done
	
Route110PagotaGate2F_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  5,  0, ROUTE_31_VIOLET_GATE, 5

	db 0 ; coord events

	db 2 ; bg events
	bg_event 1,  0, BGEVENT_READ, Route110PagotaGate2FSign
	bg_event 3,  0, BGEVENT_READ, Route110PagotaGate2FSign2

	db 2 ; object events
	object_event  1,  3, SPRITE_LASS, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route110PagotaGate2FLassScript, -1
	object_event  5,  4, SPRITE_TWIN, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route110PagotaGate2FTwinScript, -1
	