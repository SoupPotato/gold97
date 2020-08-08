	const_def 2 ; object constants
	const ROUTE_10_NORTH_YOUNGSTER_1
	const ROUTE_10_NORTH_YOUNGSTER_2
	const ROUTE_10_NORTH_POKEFAN_M
	const ROUTE_10_NORTH_POKEFAN_M_2
	const ROUTE_10_NORTH_ITEMBALL
	
SeasidePath_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TrainerPsychicFidel:
	trainer PSYCHIC_T, FIDEL, EVENT_BEAT_PSYCHIC_FIDEL, PsychicFidelSeenText, PsychicFidelBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PsychicFidelAfterBattleText
	waitbutton
	closetext
	end

TrainerBirdKeeperPeter:
	trainer BIRD_KEEPER, PETER, EVENT_BEAT_BIRD_KEEPER_PETER, BirdKeeperPeterSeenText, BirdKeeperPeterBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BirdKeeperPeterAfterText
	waitbutton
	closetext
	end
	
TrainerPokefanmJoshua:
	trainer POKEFANM, JOSHUA, EVENT_BEAT_POKEFANM_JOSHUA, PokefanmJoshuaSeenText, PokefanmJoshuaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokefanmJoshuaAfterBattleText
	waitbutton
	closetext
	end
	

TrainerHikerTimothy:
	trainer HIKER, TIMOTHY, EVENT_BEAT_HIKER_TIMOTHY, HikerTimothySeenText, HikerTimothyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext HikerTimothyAfterBattleText
	waitbutton
	closetext
	end
	
SeasidePathCleanseTag:
	itemball CLEANSE_TAG


SeasidePathSign:
	jumptext SeasidePathSignText
	
MtMonwalSign:
	jumptext MtMonwalSignText
	
SeasidePathSignText:
	text "SEASIDE PATH"
	para "AMAMI TOWN -"
	line "NAGO VILLAGE"
	done
	
MtMonwalSignText:
	text "MT.MONWAL"
	line "ENTRANCE"
	done

HikerTimothySeenText:
	text "Why do I climb"
	line "mountains?"

	para "Because they're"
	line "there."

	para "Why do I train"
	line "#MON?"

	para "Because they're"
	line "there!"
	done

HikerTimothyBeatenText:
	text "Losses…"
	line "They're there too!"
	done

HikerTimothyAfterBattleText:
	text "The best thing to"
	line "ever happen to me"

	para "was discovering"
	line "#MON."
	done

PsychicFidelSeenText:
	text "I can see it…"

	para "Everything to see"
	line "about you…"
	done

PsychicFidelBeatenText:
	text "I couldn't foresee"
	line "your power…"
	done

PsychicFidelAfterBattleText:
	text "You know, where"
	line "I'm standing is"
	para "technically its"
	line "own small island."
	done

BirdKeeperPeterSeenText:
	text "My birds can't fly"
	line "far enough to"
	para "bring me back to"
	line "the mainland."
	done

BirdKeeperPeterBeatenText:
	text "I know what my"
	line "weaknesses are."
	done

BirdKeeperPeterAfterText:
	text "I wish I could"
	line "fly…"
	done
	
PokefanmJoshuaSeenText:
	text "Nihihi! Would you"
	line "like to battle my"
	cont "PIKACHU gang?"
	done

PokefanmJoshuaBeatenText:
	text "PI-PIKACHU!"
	done

PokefanmJoshuaAfterBattleText:
	text "You look like you"
	line "have many #MON,"

	para "but PIKACHU is"
	line "still the best."
	done

SeasidePath_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4, 11, ISEN_STRAIT_SEASIDE_PATH_GATE, 4
	warp_event 53, 11, JOULE_CAVE, 1

	db 0 ; coord events

	db 2 ; bg events
	bg_event 26,  4, BGEVENT_READ, SeasidePathSign
	bg_event 52, 12, BGEVENT_READ, MtMonwalSign

	db 5 ; object events
	object_event 15, 10, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerBirdKeeperPeter, -1
	object_event 43, 11, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerPsychicFidel, -1
	object_event 21,  5, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerPokefanmJoshua, -1
	object_event 30,  9, SPRITE_POKEFAN_M, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 4, TrainerHikerTimothy, -1
	object_event 50,  5, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SeasidePathCleanseTag, EVENT_PICKED_UP_STAR_PIECE_FROM_OMANYTE_ITEM_ROOM
