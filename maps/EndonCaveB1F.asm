	const_def 2 ; object constants
	const ENDONCAVEB1F_SAILOR
	const ENDONCAVEB1F_GENTLEMAN
	const ENDONCAVEB1F_YOUNGSTER
	const ENDONCAVEB1F_POKE_BALL
	const ENDONCAVEB1F_POKE_BALL_2

EndonCaveB1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	

EndonCaveB1FElixer:
	itemball ELIXER


TrainerBirdKeeperTheo:
	trainer BIRD_KEEPER, THEO, EVENT_BEAT_BIRD_KEEPER_THEO, BirdKeeperTheoSeenText, BirdKeeperTheoBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BirdKeeperTheoAfterBattleText
	waitbutton
	closetext
	end



TrainerSailorTerrell:
	trainer SAILOR, TERRELL, EVENT_BEAT_SAILOR_TERRELL, SailorTerrellSeenText, SailorTerrellBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SailorTerrellAfterBattleText
	waitbutton
	closetext
	end
	
TrainerCooltrainermNick:
	trainer COOLTRAINERM, NICK, EVENT_BEAT_COOLTRAINERM_NICK, CooltrainermNickSeenText, CooltrainermNickBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainermNickAfterBattleText
	waitbutton
	closetext
	end
	

EndonCaveB1FSmokeBall:
	itemball SMOKE_BALL

BirdKeeperTheoSeenText:
	text "My beautiful birds"
	line "have no room to"
	cont "FLY in here!"
	done

BirdKeeperTheoBeatenText:
	text "Do you know the"
	line "way out of here?"
	done

BirdKeeperTheoAfterBattleText:
	text "How the heck do"
	line "you get out?"

	para "I want to FLY!"
	line "FLY, far away!"
	done

SailorTerrellSeenText:
	text "Sailors are both"
	line "kind and strong."
	cont "How about you?"
	done

SailorTerrellBeatenText:
	text "You are both kind"
	line "and strong…"
	done

SailorTerrellAfterBattleText:
	text "I hear there's a"
	line "new BOARDWALK open"
	para "south of SANSKRIT"
	line "TOWN."
	done
	
CooltrainermNickSeenText:
	text "Do your #MON"
	line "know the ability"
	para "to carry you over"
	line "water?"
	para "There's an old man"
	line "over in BIRDON who"
	cont "taught mine!"
	done

CooltrainermNickBeatenText:
	text "Have you met him?"
	done

CooltrainermNickAfterBattleText:
	text "Not many people"
	line "come through here"
	cont "to battle."
	done


EndonCaveB1F_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  3, 15, ENDON_CAVE_1F, 3
	warp_event 51, 11, ENDON_CAVE_1F, 4

	db 0 ; coord events

	db 0 ; bg events

	db 5 ; object events
	object_event 34, 13, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerSailorTerrell, -1
	object_event 48, 13, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 4, TrainerCooltrainermNick, -1
	object_event  8,  9, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerBirdKeeperTheo, -1
	object_event 21,  4, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, EndonCaveB1FSmokeBall, EVENT_ENDON_CAVE_B1F_SMOKE_BALL
	object_event  2,  6, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, EndonCaveB1FElixer, EVENT_ENDON_CAVE_B1F_ELIXER
