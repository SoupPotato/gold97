	const_def 2
	const TRAINERMEDIUM1TOWER2
	const TRAINERMEDIUM2TOWER2
	const TRAINERMEDIUM3TOWER2
	const TOWER2ITEMBALL

PokemonTower2F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Tower2Itemball:
	itemball MAX_REPEL


TrainerMediumEthel:
	trainer MEDIUM, ETHEL, EVENT_BEAT_MEDIUM_ETHEL, MediumEthelSeenText, MediumEthelBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext MediumEthelAfterBattleText
	waitbutton
	closetext
	end

MediumEthelSeenText:
	text "GAAH! COME TO ME!"
	done

MediumEthelBeatenText:
	text "Hmm?! Wha?!"
	done

MediumEthelAfterBattleText:
	text "Oh dearie me, it"
	line "seems I was taken"
	cont "control of by an"
	cont "evil spirit!"
	done


TrainerMediumMuriel:
	trainer MEDIUM, MURIEL, EVENT_BEAT_MEDIUM_MURIEL, MediumMurielSeenText, MediumMurielBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext MediumMurielAfterBattleText
	waitbutton
	closetext
	end

MediumMurielSeenText:
	text "OH! OOOOOOOH!"
	done

MediumMurielBeatenText:
	text "Kyah! Freedom!"
	done

MediumMurielAfterBattleText:
	text "Run while you can!"
	
	para "This place is"
	line "beleaguered with"
	cont "cursed souls!"
	done


TrainerMediumEsther:
	trainer MEDIUM, ESTHER, EVENT_BEAT_MEDIUM_ESTHER, MediumEstherSeenText, MediumEstherBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext MediumEstherAfterBattleText
	waitbutton
	closetext
	end

MediumEstherSeenText:
	text "ABRA!"
	done

MediumEstherBeatenText:
	text "KADABRA!"
	done

MediumEstherAfterBattleText:
	text "ALAKA…"
	
	para "ACHOO!"
	
	para "It's too dusty"
	line "in here to chant"
	cont "incantations!"
	done



PokemonTower2F_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 18,  9, POKEMON_TOWER_1F, 3
	warp_event  3,  9, POKEMON_TOWER_3F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 4 ; object events
	object_event  3,  7, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerMediumEthel, EVENT_BEAT_TOWER_GENGAR
	object_event 13,  5, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 2, TrainerMediumMuriel, EVENT_BEAT_TOWER_GENGAR
	object_event  9, 14, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 1, TrainerMediumEsther, EVENT_BEAT_TOWER_GENGAR
	object_event  6, 14, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Tower2Itemball, EVENT_TOWER2_ITEMBALL
