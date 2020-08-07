	const_def 2 ; object constants
	const UNIONCAVE1F_POKE_BALL1
	const UNIONCAVE1F_POKE_BALL2
	const UNIONCAVE1F_POKE_BALL3
	const UNIONCAVE1F_MINE_1
	const UNIONCAVE1F_MINE_2
	const UNIONCAVE1F_MINE_3
	const UNIONCAVE1F_TWIN
	const UNIONCAVE1F_COOLTRAINERF
	const UNIONCAVE1F_POKEMANIAC
	const UNIONCAVE1F_TWIN2

BoulderMines1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks


GirlInMineScript:
	setmapscene ROUTE_120, SCENE_ROUTE8_GIRL_AND_GRAMPS
	faceplayer
	opentext
	writetext Text_FoundMe
	waitbutton
	closetext
	setevent EVENT_WISE_TRIOS_ROOM_WISE_TRIO_1
	clearevent EVENT_MAHOGANY_TOWN_POKEFAN_M_BLOCKS_GYM
	clearevent EVENT_ECRUTEAK_GYM_GRAMPS
	clearevent EVENT_WISE_TRIOS_ROOM_WISE_TRIO_2
	clearevent EVENT_ROUTE8_GIRL_IN_CAVE
	special FadeOutPalettes
	wait 10
	warpfacing DOWN, BOULDER_MINES_1F, 2, 14
	opentext
	writetext Text_WayOut
	waitbutton
	closetext
	end
	
GirlInMineScript2:	
	opentext
	writetext Text_WayOut
	waitbutton
	closetext
	end

BoulderMines1FGreatBall:
	itemball GREAT_BALL

BoulderMines1FXAttack:
	itemball X_ATTACK

BoulderMines1FPotion:
	itemball POTION
	
TrainerCooltrainerfEmma:
	trainer COOLTRAINERF, EMMA, EVENT_BEAT_COOLTRAINERF_EMMA, CooltrainerFEmmaSeenText, CooltrainerFEmmaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainerFEmmaAfterBattleText
	waitbutton
	closetext
	end

TrainerPokemaniacLarry:
	trainer POKEMANIAC, LARRY, EVENT_BEAT_POKEMANIAC_LARRY, PokemaniacLarrySeenText, PokemaniacLarryBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokemaniacLarryAfterBattleText
	waitbutton
	closetext
	end
	
BoulderMines1FBoulder:
	jumpstd strengthboulder
	
CooltrainerFEmmaSeenText:
	text "This cave is very"
	line "confusing to"
	cont "navigate."
	done

CooltrainerFEmmaBeatenText:
	text "I couldn't cut it!"
	done
	
CooltrainerFEmmaAfterBattleText:
	text "I hope no one has"
	line "gotten lost in"
	cont "here."
	para "That could be"
	line "pretty scary."
	done

PokemaniacLarrySeenText:
	text "I wonder what"
	line "gets mined from"
	cont "this cave…"
	done

PokemaniacLarryBeatenText:
	text "How are you so"
	line "strong?"
	done
	
PokemaniacLarryAfterBattleText:
	text "I wonder if there"
	line "is anything worth"
	cont "any money…"
	done

Text_FoundMe:
	text "Oh, hi!"
	para "Um…"
	line "Do you happen to"
	para "know the way out"
	line "of here?"
	para "…"
	para "Oh! Grandpa is"
	line "looking for me?"
	para "I didn't mean to"
	line "make him worry…"
	para "Okay! You'll help"
	line "me get out of"
	cont "here?"
	para "Let's go!"
	done
	
Text_WayOut:
	text "Yay!"
	
	para "We found the way"
	line "out!"
	
	para "Let's go find"
	line "Grandpa!"
	done

BoulderMines1F_MapEvents:
	db 0, 0 ; filler

	db 7 ; warp events
	warp_event  2, 15, ROUTE_120, 1
	warp_event 31,  5, BOULDER_MINES_B1F, 3
	warp_event 43,  5, BOULDER_MINES_B1F, 4
	warp_event 53, 13, BOULDER_MINES_B1F, 7
	warp_event 51, 17, BOULDER_MINES_B1F, 8
	warp_event  3, 11, BOULDER_MINES_1F, 7
	warp_event 17,  3, BOULDER_MINES_1F, 6

	db 0 ; coord events

	db 0 ; bg events

	db 10 ; object events
	object_event 28,  2, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, BoulderMines1FGreatBall, EVENT_UNION_CAVE_1F_GREAT_BALL
	object_event 15, 10, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, BoulderMines1FXAttack, EVENT_UNION_CAVE_1F_X_ATTACK
	object_event 15, 18, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, BoulderMines1FPotion, EVENT_UNION_CAVE_1F_POTION
	object_event 37, 17, SPRITE_MINELR, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BoulderMines1FBoulder, -1
	object_event 49, 11, SPRITE_MINEUD, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BoulderMines1FBoulder, -1
	object_event 19, 12, SPRITE_MINEUD, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BoulderMines1FBoulder, -1
	object_event 22, 16, SPRITE_TWIN, SPRITEMOVEDATA_SPINRANDOM_FAST, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, GirlInMineScript, EVENT_WISE_TRIOS_ROOM_WISE_TRIO_1
	object_event 24, 10, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerCooltrainerfEmma, -1
	object_event 33,  8, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 5, TrainerPokemaniacLarry, -1
	object_event 2, 13, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, GirlInMineScript2,EVENT_ROUTE8_GIRL_IN_CAVE


