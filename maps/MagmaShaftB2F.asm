	const_def 2 ; object constants
	const MAGMARSHAFTB2F_BOULDER1
	const MAGMARSHAFTB2F_BOULDER2
	const MAGMARSHAFTB2F_BOULDER3
	const MAGMARSHAFTB2F_BOULDER4
	const MAGMARSHAFTB2F_POKE_BALL1
	const MAGMARSHAFTB2F_POKE_BALL2

MagmaShaftB2F_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .BouldersCave

.BouldersCave:
	checkevent EVENT_MAGMA_SHAFT_B1F_BOULDER_1
	iffalse .skip1
	changeblock 11,  7, $67 ; fallen boulder 1
	changeblock 13,  7, $6F ; fallen boulder 1
.skip1
	checkevent EVENT_MAGMA_SHAFT_B1F_BOULDER_2
	iffalse .skip2
	changeblock 19, 11, $67 ; fallen boulder 2
	changeblock 21, 11, $6F ; fallen boulder 2
.skip2
	checkevent EVENT_MAGMA_SHAFT_B1F_BOULDER_3
	iffalse .skip3
	changeblock 29, 13, $67 ; fallen boulder 3
	changeblock 31, 13, $6F ; fallen boulder 3
.skip3
	checkevent EVENT_MAGMA_SHAFT_B1F_BOULDER_4
	iffalse .skip4
.skip4
	return

MagmaShaftB2FBoulder:
	jumptext MagmaShaftB2FBoulderText

MagmaShaftB2FCharcoal:
	itemball CHARCOAL

MagmaShaftB2FMaxPotion:
	itemball MAX_POTION

MagmaShaftB2FHiddenCarbos:
	hiddenitem CARBOS, EVENT_MAGMA_SHAFT_B2F_HIDDEN_CARBOS

MagmaShaftB2FBoulderText:
	text "It's immovably"
	line "imbedded in ice."
	done

MagmaShaftB2F_MapEvents:
	db 0, 0 ; filler

	db 8 ; warp events
	warp_event  1,  3, MAGMA_SHAFT_B1F, 2
	warp_event 10,  6, MAGMA_SHAFT_B1F, 3
	warp_event 18, 10, MAGMA_SHAFT_B1F, 4
	warp_event 28, 12, MAGMA_SHAFT_B1F, 5
	warp_event  0,  0, MAGMA_SHAFT_B1F, 6
	warp_event 15,  7, MAGMA_SHAFT_B1F, 7
	warp_event 17,  5, MAGMA_SHAFT_B1F, 8
	warp_event  5, 27, MAGMA_SHAFT_1F, 3

	db 0 ; coord events

	db 1 ; bg events
	bg_event  8, 28, BGEVENT_ITEM, MagmaShaftB2FHiddenCarbos

	db 2 ; object events
	object_event 18, 22, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, MagmaShaftB2FCharcoal, EVENT_MAGMA_SHAFT_B2F_CHARCOAL
	object_event  2, 35, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, MagmaShaftB2FMaxPotion, EVENT_MAGMA_SHAFT_B2F_MAX_POTION
