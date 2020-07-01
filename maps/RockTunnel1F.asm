	const_def 2 ; object constants
	const ROCKTUNNEL1F_POKE_BALL1
	const ROCKTUNNEL1F_POKE_BALL2
	const ROCKTUNNEL1F_BOULDER
	const ROCKTUNNEL1F_WHITNEY
	const ROCKTUNNEL1F_ITEMBALL

RockTunnel1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

RockTunnel1FElixer:
	itemball ELIXER

RockTunnel1FTMSteelWing:
	itemball TM_STEEL_WING

RockTunnel1FHiddenXAccuracy:
	hiddenitem X_ACCURACY, EVENT_ROCK_TUNNEL_1F_HIDDEN_X_ACCURACY

RockTunnel1FHiddenXDefend:
	hiddenitem X_DEFEND, EVENT_ROCK_TUNNEL_1F_HIDDEN_X_DEFEND
	
RockTunnel1FHeartStone:
	itemball HEART_STONE

	
RockTunnel1FBoulder:
	jumpstd strengthboulder
	
RockTunnelWhitneyScript:
	jumptextfaceplayer RockTunnelWhitneyText
	end

RockTunnelWhitneyText:
	text "WHITNEY: Hi, I'm"
	line "WHITNEY, leader of"
	cont "the TEKU CITY GYM."
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

RockTunnel1F_MapEvents:
	db 0, 0 ; filler

	db 8 ; warp events
	warp_event  3,  3, UNION_CAVE_B1F, 1
	warp_event 13,  3, UNION_CAVE_B1F, 2
	warp_event 31,  3, UNION_CAVE_B1F, 5
	warp_event 21,  5, ROCK_TUNNEL_B1F, 2
	warp_event 37,  5, ROCK_TUNNEL_B1F, 3
	warp_event  3, 15, ROCK_TUNNEL_B1F, 4
	warp_event 35, 13, ROCK_TUNNEL_B1F, 6
	warp_event 35, 11, UNION_CAVE_B1F, 6

	db 0 ; coord events

	db 2 ; bg events
	bg_event 29,  1, BGEVENT_ITEM, RockTunnel1FHiddenXAccuracy
	bg_event 26,  8, BGEVENT_ITEM, RockTunnel1FHiddenXDefend

	db 5 ; object events
	object_event  8, 17, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, RockTunnel1FElixer, EVENT_ROCK_TUNNEL_1F_ELIXER
	object_event 39,  6, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, RockTunnel1FTMSteelWing, EVENT_ROCK_TUNNEL_1F_TM_STEEL_WING
	object_event 16, 16, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RockTunnel1FBoulder, -1
	object_event 15,  1, SPRITE_WHITNEY, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, RockTunnelWhitneyScript, EVENT_BURNED_TOWER_MORTY
	object_event 37, 16, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, RockTunnel1FHeartStone, EVENT_PICKED_UP_GOLD_BERRY_FROM_AERODACTYL_ITEM_ROOM

