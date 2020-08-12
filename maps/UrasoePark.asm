	const_def 2 ; object constants
	const ROUTE10SOUTH_POKEFAN_M1
	const ROUTE10SOUTH_POKEFAN_M2
	const ROUTE10SOUTH_SUPER_NERD
	const ROUTE10SOUTH_LASS
	const ROUTE10SOUTH_ITEMBALL

UrasoePark_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TrainerHikerJim:
	trainer HIKER, JIM, EVENT_BEAT_HIKER_JIM, HikerJimSeenText, HikerJimBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext HikerJimAfterBattleText
	waitbutton
	closetext
	end

TrainerEngineerLandon:
	trainer ENGINEER, LANDON, EVENT_BEAT_ENGINEER_LANDON, EngineerLandonSeenText, EngineerLandonBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext EngineerLandonAfterBattleText
	waitbutton
	closetext
	end

TrainerPokefanmRobert:
	trainer POKEFANM, ROBERT, EVENT_BEAT_POKEFANM_ROBERT, PokefanmRobertSeenText, PokefanmRobertBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokefanmRobertAfterBattleText
	waitbutton
	closetext
	end
	
UrasoeParkLassScript:
	jumptextfaceplayer UrasoeParkLassText

Route10Sign:
	jumptext Route10SignText
	

UrasoeParkLeafstone:
	itemball LEAF_STONE

	
UrasoeParkLassText:
	text "The #MON here"
	line "are especially"
	cont "tough."
	para "This land was set"
	line "aside specifically"
	para "so RYUKYU CITY"
	line "couldn't expand"
	cont "into it."
	done

HikerJimSeenText:
	text "Hahahah!"
	done

HikerJimBeatenText:
	text "Hahaha-hachoo!"
	done

HikerJimAfterBattleText:
	text "All this grass is"
	line "making me sneeze!"
	cont "Ahahah-CHOO!"
	done

PokefanmRobertSeenText:
	text "You like #MON,"
	line "don't you?"

	para "Me too!"
	done

PokefanmRobertBeatenText:
	text "I'd have to say"
	line "that's my loss."
	done

PokefanmRobertAfterBattleText:
	text "Look what you did"
	line "to my #MON…"

	para "I won't forget"
	line "this…"
	done
	
EngineerLandonSeenText:
	text "I think I've got a"
	line "plan to win this"
	cont "battle!"
	done
	
EngineerLandonBeatenText:
	text "The plan needs"
	line "some work!"
	done
	
EngineerLandonAfterBattleText:
	text "The plan to win"
	line "was to have"
	cont "stronger #MON."
	done

Route10SignText:
	text "URASOE PARK"

	para "A nature reserve"
	line "for #MON"
	done

UrasoePark_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event 22,  1, RYUKYU_URASOE_GATE, 3
	warp_event 23,  1, RYUKYU_URASOE_GATE, 4
	warp_event 18, 13, URASOE_PARK_URASOE_TRAIL_GATE, 1
	warp_event 19, 13, URASOE_PARK_URASOE_TRAIL_GATE, 2

	db 0 ; coord events

	db 1 ; bg events
	bg_event 20,  2, BGEVENT_READ, Route10Sign

	db 5 ; object events
	object_event 30,  8, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerHikerJim, -1
	object_event 16,  6, SPRITE_POKEFAN_M, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerPokefanmRobert, -1
	object_event  4,  2, SPRITE_POKEFAN_M, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerEngineerLandon, -1
	object_event  3, 15, SPRITE_LASS, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, UrasoeParkLassScript, -1
	object_event 39,  4, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, UrasoeParkLeafstone, EVENT_PICKED_UP_GOLD_BERRY_FROM_HO_OH_ITEM_ROOM
