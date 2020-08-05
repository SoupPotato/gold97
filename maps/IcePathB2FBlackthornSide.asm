	const_def 2 ; object constants
	const ICEPATHB2FBLACKTHORNSIDE_POKE_BALL
	const ICEPATHB2FBLACKTHORNSIDE_ENTEI

IcePathB2FBlackthornSide_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

IcePathB2FBlackthornSideTMRest:
	itemball TM_REST

IcePathB2FBlackthornSideHiddenIceHeal:
	hiddenitem ICE_HEAL, EVENT_ICE_PATH_B2F_BLACKTHORN_SIDE_HIDDEN_ICE_HEAL
	

EnteiEvent:
	faceplayer
	opentext
	writetext EnteiText
	cry ENTEI
	pause 15
	closetext
	setevent EVENT_RIVAL_AZALEA_TOWN
;	writecode VAR_BATTLETYPE, BATTLETYPE_ROAMING
	loadwildmon ENTEI, 40
	startbattle
	disappear ICEPATHB2FBLACKTHORNSIDE_ENTEI
	reloadmapafterbattle
	end
	
EnteiText:
	text "Groroa!"
	done

IcePathB2FBlackthornSide_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  1, 17, CIANWOOD_CITY, 1
	warp_event  3,  5, ICE_PATH_B1F, 1
	warp_event 16, 17, ICE_PATH_B2F_MAHOGANY_SIDE, 8
	warp_event 17, 17, ICE_PATH_B2F_MAHOGANY_SIDE, 8

	db 0 ; coord events

	db 1 ; bg events
	bg_event  5, 16, BGEVENT_ITEM, IcePathB2FBlackthornSideHiddenIceHeal

	db 2 ; object events
	object_event  0, 12, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, IcePathB2FBlackthornSideTMRest, EVENT_ICE_PATH_B2F_BLACKTHORN_SIDE_TM_REST
	object_event 16,  2, SPRITE_GROWLITHE, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EnteiEvent, EVENT_RIVAL_AZALEA_TOWN
