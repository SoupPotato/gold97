	const_def 2 ; object constants
	const UNIONCAVEB1F_POKE_BALL1
	const UNIONCAVEB1F_BOULDER
	const UNIONCAVEB1F_POKE_BALL2
	const UNIONCAVEB1F_POKEMANIAC
	const UNIONCAVEB1F_HIKER
	const UNIONCAVEB1F_ITEMBALL

BoulderMinesB1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

BoulderMinesB1FTMSwift:
	itemball TM_SWIFT

BoulderMinesB1FXDefend:
	itemball X_DEFEND



BoulderMinesB1FBoulder:
	jumpstd strengthboulder

TrainerPokemaniacAndrew:
	trainer POKEMANIAC, ANDREW, EVENT_BEAT_POKEMANIAC_ANDREW, PokemaniacAndrewSeenText, PokemaniacAndrewBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokemaniacAndrewAfterBattleText
	waitbutton
	closetext
	end
	
TrainerHikerPhillip:
	trainer HIKER, PHILLIP, EVENT_BEAT_HIKER_PHILLIP, HikerPhillipSeenText, HikerPhillipBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext HikerPhillipAfterBattleText
	waitbutton
	closetext
	end
	
BoulderMinesB1FMoonStone:
	itemball MOON_STONE
	
HikerPhillipSeenText:
	text "Hiking up"
	line "mountains is fun,"
	para "but exploring"
	line "caves is fun in"
	cont "a different way."
	done

HikerPhillipBeatenText:
	text "Don't get lost!"
	done
	
HikerPhillipAfterBattleText:
	text "My ROCK #MON"
	line "feel right at home"
	cont "here."
	done
	
PokemaniacAndrewSeenText:
	text "I hear a rare"
	line "#MON sometimes"
	para "appears deep under"
	line "these mines."
	done

PokemaniacAndrewBeatenText:
	text "I've been clubbed!"
	done
	
PokemaniacAndrewAfterBattleText:
	text "Have you seen this"
	line "rare #MON?"
	done

BoulderMinesB1F_MapEvents:
	db 0, 0 ; filler

	db 8 ; warp events
	warp_event  3,  3, BOULDER_MINES_B2F, 1
	warp_event  9,  5, BOULDER_MINES_B2F, 2
	warp_event 21,  5, BOULDER_MINES_1F, 2
	warp_event 37,  3, BOULDER_MINES_1F, 3
	warp_event 33,  5, BOULDER_MINES_B2F, 3
	warp_event 33, 13, BOULDER_MINES_B2F, 8
	warp_event 39, 11, BOULDER_MINES_1F, 4
	warp_event 39, 17, BOULDER_MINES_1F, 5

	db 0 ; coord events

	db 0 ; bg events

	db 6 ; object events
	object_event 38,  8, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, BoulderMinesB1FTMSwift, EVENT_UNION_CAVE_B1F_TM_SWIFT
	object_event 22, 10, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BoulderMinesB1FBoulder, -1
	object_event 29, 17, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, BoulderMinesB1FXDefend, EVENT_UNION_CAVE_B1F_X_DEFEND
	object_event 35,  8, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 5, TrainerPokemaniacAndrew, -1
	object_event  7, 10, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerHikerPhillip, -1
	object_event  2, 10, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, BoulderMinesB1FMoonStone, EVENT_PICKED_UP_MOON_STONE_FROM_AERODACTYL_ITEM_ROOM

