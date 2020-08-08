	const_def 2 ; object constants
	const ROCKTUNNEL1F_POKE_BALL1
	const ROCKTUNNEL1F_POKE_BALL2
	const ROCKTUNNEL1F_BOULDER
	const ROCKTUNNEL1F_WHITNEY
	const ROCKTUNNEL1F_ITEMBALL

BoulderMinesB2F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

BoulderMinesB2FElixer:
	itemball ELIXER

BoulderMinesB2FTMSteelWing:
	itemball TM_STEEL_WING

BoulderMinesB2FHiddenXAccuracy:
	hiddenitem X_ACCURACY, EVENT_ROCK_TUNNEL_1F_HIDDEN_X_ACCURACY

BoulderMinesB2FHiddenXDefend:
	hiddenitem X_DEFEND, EVENT_ROCK_TUNNEL_1F_HIDDEN_X_DEFEND
	
BoulderMinesB2FHeartStone:
	itemball HEART_STONE

	
BoulderMinesB2FBoulder:
	jumpstd strengthboulder
	
RockTunnelWhitneyScript:
	jumptextfaceplayer RockTunnelWhitneyText
	end

RockTunnelWhitneyText:
	text "WHITNEY: Hi, I'm"
	line "WHITNEY, leader of"
	cont "the TEKNOS CITY"
	cont "GYM."
	para "I heard rumor that"
	line "there could be a"
	para "missing girl lost"
	line "somewhere in here."
	para "I'm doing my best"
	line "to help locate"
	cont "her."
	para "Making sure she's"
	line "safe is more"
	para "important than GYM"
	line "battles right now."
	done

BoulderMinesB2F_MapEvents:
	db 0, 0 ; filler

	db 8 ; warp events
	warp_event  5,  5, BOULDER_MINES_B1F, 1
	warp_event 15,  5, BOULDER_MINES_B1F, 2
	warp_event 33,  5, BOULDER_MINES_B1F, 5
	warp_event 23,  7, BOULDER_MINES_B3F, 2
	warp_event 39,  7, BOULDER_MINES_B3F, 3
	warp_event  5, 17, BOULDER_MINES_B3F, 4
	warp_event 37, 15, BOULDER_MINES_B3F, 6
	warp_event 37, 13, BOULDER_MINES_B1F, 6

	db 0 ; coord events

	db 2 ; bg events
	bg_event 31,  3, BGEVENT_ITEM, BoulderMinesB2FHiddenXAccuracy
	bg_event 28, 10, BGEVENT_ITEM, BoulderMinesB2FHiddenXDefend

	db 5 ; object events
	object_event 10, 19, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, BoulderMinesB2FElixer, EVENT_ROCK_TUNNEL_1F_ELIXER
	object_event 41,  8, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, BoulderMinesB2FTMSteelWing, EVENT_ROCK_TUNNEL_1F_TM_STEEL_WING
	object_event 18, 18, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BoulderMinesB2FBoulder, -1
	object_event 17,  3, SPRITE_WHITNEY, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, RockTunnelWhitneyScript, EVENT_BURNED_TOWER_MORTY
	object_event 39, 18, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, BoulderMinesB2FHeartStone, EVENT_PICKED_UP_GOLD_BERRY_FROM_AERODACTYL_ITEM_ROOM

