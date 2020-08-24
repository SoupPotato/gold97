	const_def 2 ; object constants
	const KD_SAILOR1
	const KD_SAILOR2
	const KD_SAILOR3
	const KD_TRUCKMAN
	const KD_ITEMBALL

KantoDock_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

KantoDockItemBall:
	itemball STAR_PIECE

;----------------------------------------------------------

TrainerKDOCK1:
	trainer SAILOR, KENT, EVENT_BEAT_KDOCKS_TRAINER1, SailorKentSeenText, SailorKentBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SailorKentAfterBattleText
	waitbutton
	closetext
	end

TrainerKDOCK2:
	trainer SAILOR, ERNEST, EVENT_BEAT_KDOCKS_TRAINER2, SailorErnestSeenText, SailorErnestBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SailorErnestAfterBattleText
	waitbutton
	closetext
	end

TrainerKDOCK3:
	trainer SAILOR, SVEN, EVENT_BEAT_KDOCKS_TRAINER3, SailorSvenSeenText, SailorSvenBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SailorSvenAfterBattleText
	waitbutton
	closetext
	end

;----------------------------------------------------------

SailorKentSeenText:
	text "It'll be a while"
	line "before the next"
	cont "ship sails, so"
	cont "let's kill some"
	cont "time together!"
	done

SailorKentBeatenText:
	text "I left my POTION"
	line "on the ship!"
	done

SailorKentAfterBattleText:
	text "It's no biggie,"
	line "I've got plenty"
	cont "of time to run to"
	cont "the #MON"
	cont "CENTER."
	done

SailorErnestSeenText:
	text "I'm the toughest"
	line "mudder on these"
	cont "docks!"
	done

SailorErnestBeatenText:
	text "Yarr! Outmuscled!"
	done

SailorErnestAfterBattleText:
	text "You ought to get"
	line "a job down here!"
	
	para "It takes toughness"
	line "to work at the"
	cont "docks!"
	done

SailorSvenSeenText:
	text "I just sailed in"
	line "from FROSTPOINT"
	cont "TOWN, it's far"
	cont "too hot here!"
	done

SailorSvenBeatenText:
	text "Oh I'm sweatin'!"
	done

SailorSvenAfterBattleText:
	text "I think I need to"
	line "find some shade,"
	cont "some water too…"
	done

KantoDockTruckMan:
	jumptextfaceplayer KantoDockTruckManText
	
KantoDockTruckManText:
	text "Kids are always"
	line "snooping around"
	cont "near my work"
	cont "vehicle."
	
	para "They must be"
	line "impressed with"
	cont "the impeccable"
	cont "condition I keep"
	cont "it in."
	
	para "Look, not a spot"
	line "of rust!"
	done

TruckBGEvent:
	jumptext TruckText
	
TruckText:
	text "A late 80's model"
	line "pickup, polished"
	cont "fender to bumper."
	
	para "Very nice…"
	done


KantoDock_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event 14,  0, KANTO_REGION, 44

	db 0 ; coord events

	db 2 ; bg events
	bg_event 22,  0, BGEVENT_READ, TruckBGEvent
	bg_event 23,  0, BGEVENT_READ, TruckBGEvent

	db 5 ; object events
	object_event  7,  0, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 1, TrainerKDOCK1, -1
	object_event 27,  4, SPRITE_SAILOR, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 1, TrainerKDOCK2, -1
	object_event 26,  7, SPRITE_SAILOR, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 1, TrainerKDOCK3, -1
	object_event 21,  0, SPRITE_FISHING_GURU, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KantoDockTruckMan, -1
	object_event  2,  0, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, KantoDockItemBall, EVENT_KANTO_DOCK_STARPIECE
