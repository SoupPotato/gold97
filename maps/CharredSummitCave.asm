	const_def 2 ; object constants
	const MOUNTMORTAR1FOUTSIDE_POKE_BALL1
	const MOUNTMORTAR1FOUTSIDE_POKE_BALL2

CharredSummitCave_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

CharredSummitCaveEther:
	itemball ETHER

CharredSummitCaveRevive:
	itemball MAX_REVIVE

CharredSummitCaveHiddenHyperPotion:
	hiddenitem HYPER_POTION, EVENT_MOUNT_MORTAR_1F_OUTSIDE_HIDDEN_HYPER_POTION

CharredSummitCave_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  8, 33, CHARRED_SUMMIT, 1
	warp_event 27,  5, CHARRED_SUMMIT, 2


	db 0 ; coord events

	db 1 ; bg events
	bg_event 10, 22, BGEVENT_ITEM, CharredSummitCaveHiddenHyperPotion

	db 2 ; object events
	object_event 30, 18, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, CharredSummitCaveEther, EVENT_MOUNT_MORTAR_1F_OUTSIDE_ETHER
	object_event 35,  4, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, CharredSummitCaveRevive, EVENT_MOUNT_MORTAR_1F_OUTSIDE_REVIVE
