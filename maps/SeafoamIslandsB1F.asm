	const_def 2
	const SEAFOAMITEM1
	const SEAFOAMITEM2
	const SEAFOAMITEM3
	const SEAFOAMITEM4

SeafoamIslandsB1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

SeafoamItem1:
	itemball WATER_STONE
	
SeafoamItem2:
	itemball PEARL
	
SeafoamItem3:
	itemball PEARL
	
SeafoamItem4:
	itemball HEART_STONE


SeafoamIslandsB1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  9, 23, SEAFOAM_ISLANDS_1F, 3
	warp_event 29, 21, SEAFOAM_ISLANDS_1F, 4
	warp_event 27, 31, SEAFOAM_ISLANDS_1F, 5

	db 0 ; coord events

	db 0 ; bg events

	db 4 ; object events
	object_event  3,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SeafoamItem1, EVENT_SEAFOAM_ITEM_1
	object_event 10,  2, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SeafoamItem2, EVENT_SEAFOAM_ITEM_2
	object_event  9, 33, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SeafoamItem3, EVENT_SEAFOAM_ITEM_3
	object_event 37,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SeafoamItem4, EVENT_SEAFOAM_ITEM_4
