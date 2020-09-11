	const_def 2
	const APPLETREE1
	const APPLETREE2
	const APPLETREE3
	const APPLETREE4
	const APPLETREE5
	const APPLETREE6
	const APPLETREE7
	const APPLETREE8

DaitoAppleOrchard_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

AppleOrchardSign:
	jumptext AppleOrchardSignText
	
AppleOrchardSignText:
	text "DAITO APPLE"
	line "ORCHARD"
	done

Appletree1:
	fruittree FRUITTREE_ORCHARD1
	
Appletree2:
	fruittree FRUITTREE_ORCHARD2
	
Appletree3:
	fruittree FRUITTREE_ORCHARD3
	
Appletree4:
	fruittree FRUITTREE_ORCHARD4
	
Appletree5:
	fruittree FRUITTREE_ORCHARD5
	
Appletree6:
	fruittree FRUITTREE_ORCHARD6
	
Appletree7:
	fruittree FRUITTREE_ORCHARD7
	
Appletree8:
	fruittree FRUITTREE_ORCHARD8


DaitoAppleOrchard_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  3,  4, APPLE_ORCHARD_HOUSE, 1

	db 0 ; coord events

	db 1 ; bg events
	bg_event  8, 10, BGEVENT_READ, AppleOrchardSign

	db 8 ; object events
	object_event  8,  5, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Appletree1, -1
	object_event  9,  7, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Appletree2, -1
	object_event 11,  5, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Appletree3, -1
	object_event 12,  7, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Appletree4, -1
	object_event 14,  5, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Appletree5, -1
	object_event 15,  7, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Appletree6, -1
	object_event 17,  5, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Appletree7, -1
	object_event 18,  7, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Appletree8, -1
