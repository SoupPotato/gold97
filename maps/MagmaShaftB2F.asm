	const_def 2 ; object constants
	const ICEPATHB2FMAHOGANYSIDE_BOULDER1
	const ICEPATHB2FMAHOGANYSIDE_BOULDER2
	const ICEPATHB2FMAHOGANYSIDE_BOULDER3
	const ICEPATHB2FMAHOGANYSIDE_BOULDER4
	const ICEPATHB2FMAHOGANYSIDE_POKE_BALL1
	const ICEPATHB2FMAHOGANYSIDE_POKE_BALL2

MagmaShaftB2F_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .BouldersCave

.BouldersCave:
	checkevent EVENT_BOULDER_IN_ICE_PATH_1
	iffalse .skip1
	changeblock 11,  7, $67 ; fallen boulder 1
	changeblock 13,  7, $6F ; fallen boulder 1
.skip1
	checkevent EVENT_BOULDER_IN_ICE_PATH_2
	iffalse .skip2
	changeblock 19, 11, $67 ; fallen boulder 2
	changeblock 21, 11, $6F ; fallen boulder 2
.skip2
	checkevent EVENT_BOULDER_IN_ICE_PATH_3
	iffalse .skip3
	changeblock 29, 13, $67 ; fallen boulder 3
	changeblock 31, 13, $6F ; fallen boulder 3
.skip3
	checkevent EVENT_BOULDER_IN_ICE_PATH_4
	iffalse .skip4
;	changeblock 21, 16, $47 ; fallen boulder 4
.skip4
	return

MagmaShaftB2FBoulder:
	jumptext MagmaShaftB2FBoulderText

MagmaShaftB2FFullHeal:
	itemball CHARCOAL

MagmaShaftB2FMaxPotion:
	itemball MAX_POTION

MagmaShaftB2FHiddenCarbos:
	hiddenitem CARBOS, EVENT_ICE_PATH_B2F_MAHOGANY_SIDE_HIDDEN_CARBOS

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
;	object_event 11,  3, SPRITE_BOULDER, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MagmaShaftB2FBoulder, EVENT_BOULDER_IN_ICE_PATH_1A
;	object_event  4,  7, SPRITE_BOULDER, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MagmaShaftB2FBoulder, EVENT_BOULDER_IN_ICE_PATH_2A
;	object_event  3, 12, SPRITE_BOULDER, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MagmaShaftB2FBoulder, EVENT_BOULDER_IN_ICE_PATH_3A
;	object_event 12, 13, SPRITE_BOULDER, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MagmaShaftB2FBoulder, EVENT_BOULDER_IN_ICE_PATH_4A
	object_event 18, 22, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, MagmaShaftB2FFullHeal, EVENT_ICE_PATH_B2F_MAHOGANY_SIDE_FULL_HEAL
	object_event  2, 35, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, MagmaShaftB2FMaxPotion, EVENT_ICE_PATH_B2F_MAHOGANY_SIDE_MAX_POTION
