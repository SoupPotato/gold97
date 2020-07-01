	const_def 2 ; object constants
	const ROUTE2NUGGETHOUSE_FISHER

Route2NuggetHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
Route2NuggetouseFisherScript
	end
	

Route2NuggetHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, ROUTE_2, 1
	warp_event  3,  7, ROUTE_2, 1

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  2,  4, SPRITE_FISHER, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 2, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route2NuggetouseFisherScript, -1
