	const_def 2 ; object constants
	const MOUNTMORTAR2FINSIDE_POKE_BALL1
	const MOUNTMORTAR2FINSIDE_POKE_BALL2
	const MOUNTMORTAR2FINSIDE_POKE_BALL3
	const MOUNTMORTAR2FINSIDE_POKE_BALL4
	const MOUNTMORTAR2FINSIDE_POKE_BALL5
	const MOUNTMORTAR2FINSIDE_POKE_BALL6
	const MOUNTMORTAR2FINSIDE_SUPER_NERD

IcedCavern1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TrainerSupernerdHugh:
	trainer SUPER_NERD, HUGH, EVENT_BEAT_SUPER_NERD_HUGH, SupernerdHughSeenText, SupernerdHughBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SupernerdHughAfterBattleText
	waitbutton
	closetext
	end

IcedCavern1FMaxPotion:
	itemball MAX_POTION

IcedCavern1FRareCandy:
	itemball RARE_CANDY

IcedCavern1FTMDefenseCurl:
	itemball TM_DEFENSE_CURL

IcedCavern1FDragonScale:
	itemball DRAGON_SCALE

IcedCavern1FElixer:
	itemball ELIXER

IcedCavern1FEscapeRope:
	itemball ESCAPE_ROPE

IcedCavern1FHiddenFullRestore:
	hiddenitem FULL_RESTORE, EVENT_MOUNT_MORTAR_2F_INSIDE_HIDDEN_FULL_RESTORE

SupernerdHughSeenText:
	text "Ah!"
	done

SupernerdHughBeatenText:
	text "Sorry, I was"
	line "startled."
	done

SupernerdHughAfterBattleText:
	text "I'm looking for"
	line "rare #MON, but"
	para "I haven't found"
	line "any."
	done

IcedCavern1F_MapEvents:
	db 0, 0 ; filler

	db 8 ; warp events
	warp_event  7, 21, ICED_CAVERN_B1F, 1
	warp_event  5,  7, ICED_CAVERN_B1F, 2
	warp_event 23,  3, ICED_CAVERN_B1F, 3
	warp_event 37,  5, ICED_CAVERN_B1F, 4
	warp_event 37, 33, ICED_CAVERN_B1F, 5
	warp_event 19, 31, ICED_CAVERN_B1F, 6
	warp_event 27, 29, ICED_CAVERN_B1F, 7
	warp_event  4, 33, YORON_CITY, 6

	db 0 ; coord events

	db 1 ; bg events
	bg_event  6, 15, BGEVENT_ITEM, IcedCavern1FHiddenFullRestore

	db 7 ; object events
	object_event 37, 24, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, IcedCavern1FMaxPotion, EVENT_MOUNT_MORTAR_2F_INSIDE_MAX_POTION
	object_event 34, 32, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, IcedCavern1FRareCandy, EVENT_MOUNT_MORTAR_2F_INSIDE_RARE_CANDY
	object_event  2, 26, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, IcedCavern1FTMDefenseCurl, EVENT_MOUNT_MORTAR_2F_INSIDE_TM_DEFENSE_CURL
	object_event 18,  2, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, IcedCavern1FDragonScale, EVENT_MOUNT_MORTAR_2F_INSIDE_DRAGON_SCALE
	object_event  2,  2, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, IcedCavern1FElixer, EVENT_MOUNT_MORTAR_2F_INSIDE_ELIXER
	object_event 32,  4, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, IcedCavern1FEscapeRope, EVENT_MOUNT_MORTAR_2F_INSIDE_ESCAPE_ROPE
	object_event 17, 32, SPRITE_SUPER_NERD, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 2, TrainerSupernerdHugh, -1
