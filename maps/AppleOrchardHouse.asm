	const_def 2
	const DAITO_APPLEFARMER


AppleOrchardHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

AppleFarmerScript:
	jumptextfaceplayer AppleFarmerText
	
AppleFarmerText:
	text "Well lookie here!"
	
	para "A trainer who came"
	line "all the way here"
	cont "to my ORCHARD!"
	
	para "I could use your"
	line "help kid, my"
	cont "APPLEs sell for"
	cont "a pretty penny"
	cont "on the mainland"
	cont "for their crisp"
	cont "and fresh taste!"
	
	para "It's awfully hard"
	line "to sell them far"
	cont "though, so you"
	cont "take them and"
	cont "do it for me."
	
	para "You can keep some"
	line "of the profits!"
	cont "Don't worry, I'll"
	cont "get my cut back"
	cont "from the MART!"
	done


AppleOrchardHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, DAITO_APPLE_ORCHARD, 1
	warp_event  5,  7, DAITO_APPLE_ORCHARD, 1

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event 7, 4, SPRITE_FISHING_GURU, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, AppleFarmerScript, -1
