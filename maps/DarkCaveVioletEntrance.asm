	const_def 2 ; object constants
	const DARKCAVEVIOLETENTRANCE_ROCK1
	const DARKCAVEVIOLETENTRANCE_ROCK2
	const DARKCAVEVIOLETENTRANCE_ROCK3
	const DARKCAVEVIOLETENTRANCE_ROCK4
	const DARKCAVEVIOLETENTRANCE_POKE_BALL2
	const DARKCAVEVIOLETENTRANCE_POKE_BALL3
	const DARKCAVEVIOLETENTRANCE_POKE_BALL4
	const DARKCAVEVIOLETENTRANCE_RAIKOU
	const DARKCAVEVIOLETENTRANCE_POKE_BALL5

DarkCaveVioletEntrance_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

RaikouEvent:
	faceplayer
	opentext
	writetext RaikouText
	cry RAIKOU
	pause 15
	closetext
	setevent EVENT_AZALEA_TOWN_SLOWPOKES
;	writecode VAR_BATTLETYPE, BATTLETYPE_ROAMING
	loadwildmon RAIKOU, 40
	startbattle
	disappear DARKCAVEVIOLETENTRANCE_RAIKOU
	reloadmapafterbattle
	end
	
RaikouText:
	text "Groroa!"
	done


Route26MaxElixer:
	itemball TM_ZAP_CANNON


DarkCaveVioletEntranceFullHeal:
	itemball FULL_HEAL

DarkCaveVioletEntranceHyperPotion:
	itemball HYPER_POTION

DarkCaveVioletEntranceDireHit:
	itemball DIRE_HIT

DarkCaveVioletEntranceRock:
	jumpstd smashrock

DarkCaveVioletEntranceHiddenElixer:
	hiddenitem ELIXER, EVENT_DARK_CAVE_VIOLET_ENTRANCE_HIDDEN_ELIXER

DarkCaveVioletEntrance_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  2, 31, DARK_CAVE_VIOLET_ENTRANCE, 3
	warp_event  3, 21, DARK_CAVE_BLACKTHORN_ENTRANCE, 2
	warp_event 29,  5, DARK_CAVE_VIOLET_ENTRANCE, 1

	db 0 ; coord events

	db 1 ; bg events
	bg_event 23,  6, BGEVENT_ITEM, DarkCaveVioletEntranceHiddenElixer

	db 9 ; object events
	object_event 31,  8, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DarkCaveVioletEntranceRock, -1
	object_event 28,  8, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DarkCaveVioletEntranceRock, -1
	object_event 34, 10, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DarkCaveVioletEntranceRock, -1
	object_event 29,  7, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DarkCaveVioletEntranceRock, -1
	object_event 18,  6, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, DarkCaveVioletEntranceFullHeal, EVENT_DARK_CAVE_VIOLET_ENTRANCE_FULL_HEAL
	object_event 10, 14, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, DarkCaveVioletEntranceHyperPotion, EVENT_DARK_CAVE_VIOLET_ENTRANCE_HYPER_POTION
	object_event 18, 16, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, DarkCaveVioletEntranceDireHit, EVENT_DARK_CAVE_VIOLET_ENTRANCE_DIRE_HIT
	object_event 10, 27, SPRITE_GROWLITHE, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RaikouEvent, EVENT_AZALEA_TOWN_SLOWPOKES
	object_event  2,  4, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route26MaxElixer, EVENT_ROUTE_26_MAX_ELIXER
