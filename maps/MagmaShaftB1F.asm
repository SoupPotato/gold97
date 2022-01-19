	const_def 2 ; object constants
	const MAGMARSHAFTB1F_BOULDER1
	const MAGMARSHAFTB1F_BOULDER2
	const MAGMARSHAFTB1F_BOULDER3
	const MAGMARSHAFTB1F_BOULDER4
	const MAGMARSHAFTB1F_POKE_BALL
	const MAGMARSHAFTB1F_POKE_BALL_2
	const MAGMARSHAFTB1F_POKE_BALL_3

MagmaShaftB1F_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_CMDQUEUE, .SetUpStoneTable

.SetUpStoneTable:
	writecmdqueue .CommandQueue
	return

.CommandQueue:
	cmdqueue CMDQUEUE_STONETABLE, .StoneTable ; check if any stones are sitting on a warp

.StoneTable:
	stonetable 3, MAGMARSHAFTB1F_BOULDER1, .Boulder1
	stonetable 4, MAGMARSHAFTB1F_BOULDER2, .Boulder2
	stonetable 5, MAGMARSHAFTB1F_BOULDER3, .Boulder3
	stonetable 6, MAGMARSHAFTB1F_BOULDER4, .Boulder4
	db -1 ; end

.Boulder1:
	disappear MAGMARSHAFTB1F_BOULDER1
	setevent EVENT_MAGMA_SHAFT_B1F_BOULDER_1
	setevent EVENT_MAGMA_SHAFT_B1F_BOULDER_4
	jump .FinishBoulder

.Boulder2:
	disappear MAGMARSHAFTB1F_BOULDER2
	setevent EVENT_MAGMA_SHAFT_B1F_BOULDER_2
	jump .FinishBoulder

.Boulder3:
	disappear MAGMARSHAFTB1F_BOULDER3
	setevent EVENT_MAGMA_SHAFT_B1F_BOULDER_3
	jump .FinishBoulder

.Boulder4:
	disappear MAGMARSHAFTB1F_BOULDER4
	setevent EVENT_MAGMA_SHAFT_B1F_BOULDER_4
	jump .FinishBoulder

.FinishBoulder:
	pause 30
	scall .BoulderFallsThrough
	opentext
	writetext IcePathBoulderFellThroughText
	waitbutton
	closetext
	end

.BoulderFallsThrough:
	playsound SFX_STRENGTH
	earthquake 80
	end

MagmaShaftB1FBoulder:
	jumpstd strengthboulder

MagmaShaftB1FIron:
	itemball IRON
	
MagmaShaftB1FHyperPotion:
	itemball HYPER_POTION

MagmaShaftB1FSmokeBall:
	itemball SMOKE_BALL


MagmaShaftB1FHiddenMaxPotion:
	hiddenitem MAX_POTION, EVENT_MAGMA_SHAFT_B1F_HIDDEN_MAX_POTION

IcePathBoulderFellThroughText:
	text "The boulder fell"
	line "through."
	done

MagmaShaftB1F_MapEvents:
	db 0, 0 ; filler

	db 8 ; warp events
	warp_event  3,  3, MAGMA_SHAFT_1F, 2
	warp_event 11,  1, MAGMA_SHAFT_B2F, 1
	warp_event 16,  7, MAGMA_SHAFT_B2F, 2 ; hole
	warp_event 26, 13, MAGMA_SHAFT_B2F, 3 ; hole
	warp_event 34, 17, MAGMA_SHAFT_B2F, 4 ; hole
	warp_event 38, 10, MAGMA_SHAFT_B2F, 5 ; hole
	warp_event 19,  9, MAGMA_SHAFT_B2F, 6
	warp_event 21,  7, MAGMA_SHAFT_B2F, 7

	db 0 ; coord events

	db 1 ; bg events
	bg_event 25, 16, BGEVENT_ITEM, MagmaShaftB1FHiddenMaxPotion

	db 7 ; object events
	object_event  5, 13, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MagmaShaftB1FBoulder, EVENT_MAGMA_SHAFT_B1F_BOULDER_1
	object_event 22, 10, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MagmaShaftB1FBoulder, EVENT_MAGMA_SHAFT_B1F_BOULDER_2
	object_event 20,  5, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MagmaShaftB1FBoulder, EVENT_MAGMA_SHAFT_B1F_BOULDER_3
	object_event 38,  9, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MagmaShaftB1FBoulder, EVENT_MAGMA_SHAFT_B1F_BOULDER_4
	object_event  1, 12, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, MagmaShaftB1FIron, EVENT_ICE_PATH_B1F_IRON
	object_event 23,  0, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, MagmaShaftB1FHyperPotion, EVENT_MAGMA_SHAFT_B1F_HYPER_POTION
	object_event 39, 16, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, MagmaShaftB1FSmokeBall, EVENT_MAGMA_SHAFT_B1F_SMOKE_BALL
