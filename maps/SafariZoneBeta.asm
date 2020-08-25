	const_def 2 
	const SAFARIFATMAN
	const SAFARIPOKEFAN1
	const SAFARIPOKEFAN2
	const SAFARITRAINER
	const SAFARIITEM

SafariZoneBeta_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks


SafariFatman:
	jumptextfaceplayer SafariFatmanText
	
SafariFatmanText:
	text "Now that the"
	line "breeding program"
	cont "is finished, the"
	cont "park is totally"
	cont "open for free."
	
	para "The program here"
	line "helped bring some"
	cont "#MON such as"
	cont "RHYHORN and"
	cont "EXEGGCUTE back to"
	cont "their native"
	cont "habitats."
	done

SafariPokefan1:
	jumptextfaceplayer SafariPokefan1Text
	
SafariPokefan1Text:
	text "I heard that"
	line "WARDEN SLOWPOKE"
	cont "went to invest"
	cont "in other ventures"
	cont "throughout NIHON."
	
	para "STAND CITY's ZOO"
	line "is one of his"
	cont "latest investment"
	cont "plans apparently."
	done

SafariPokefan2:
	jumptextfaceplayer SafariPokefan2Text
	
SafariPokefan2Text:
	text "EXEGGUTOR is my"
	line "favorite #MON!"
	
	para "I hope I can"
	line "grow one tall"
	cont "enough to shade"
	cont "my whole backyard"
	cont "patio!"
	done


SafariCooltrainer:
	jumptextfaceplayer SafariCooltrainerText
	
SafariCooltrainerText:
	text "The SAFARI ZONE"
	line "is a great place"
	cont "to pick up a"
	cont "variety of strong"
	cont "team members."
	done
	
SafariItem:
	itemball ULTRA_BALL
	
SafarizoneSign:
	jumptext SafarizoneSignText
	
SafarizoneSignText:
	text "WELCOME TO THE"
	line "SAFARI ZONE!"
	
	para "PLEASE HAVE SOME"
	line "RESPECT: CARRY"
	cont "OUT WHAT YOU"
	cont "CARRY IN!"
	cont "NO LITTERING!"
	done

SafariTrash:
	jumptext SafariTrashtext
	
SafariTrashtext:
	text "The trash can"
	line "is thankfully"
	cont "not empty."
	done

SafariZoneBeta_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 10, 31, SAFARI_ZONE_FUCHSIA_GATE_BETA, 1
	warp_event 11, 31, SAFARI_ZONE_FUCHSIA_GATE_BETA, 2

	db 0 ; coord events

	db 2 ; bg events
	bg_event 11, 19, BGEVENT_READ, SafarizoneSign
	bg_event  8, 26, BGEVENT_READ, SafariTrash

	db 5 ; object events
	object_event  4, 20, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SafariFatman, -1
	object_event 11, 11, SPRITE_POKEFAN_M, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SafariPokefan1, -1
	object_event  3, 16, SPRITE_TEACHER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SafariPokefan2, -1
	object_event  6,  9, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, SafariCooltrainer, -1
	object_event 17, 25, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SafariItem, EVENT_SAFARI_ITEMBALL
