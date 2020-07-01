	const_def 2 ; object constants
	const MOUNTMORTAR1FOUTSIDE_POKE_BALL1
	const MOUNTMORTAR1FOUTSIDE_POKE_BALL2

MountMortar1FOutside_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

MountMortar1FOutsideEther:
	itemball ETHER

MountMortar1FOutsideRevive:
	itemball MAX_REVIVE

MountMortar1FOutsideHiddenHyperPotion:
	hiddenitem HYPER_POTION, EVENT_MOUNT_MORTAR_1F_OUTSIDE_HIDDEN_HYPER_POTION

MountMortar1FOutside_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  7, 33, EASTWARD_SUMMIT, 1
	warp_event 27,  5, EASTWARD_SUMMIT, 2


	db 0 ; coord events

	db 1 ; bg events
	bg_event 32, 29, BGEVENT_ITEM, MountMortar1FOutsideHiddenHyperPotion

	db 2 ; object events
	object_event  6,  7, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, MountMortar1FOutsideEther, EVENT_MOUNT_MORTAR_1F_OUTSIDE_ETHER
	object_event 33,  7, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, MountMortar1FOutsideRevive, EVENT_MOUNT_MORTAR_1F_OUTSIDE_REVIVE
