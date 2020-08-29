	const_def 2
	const FS_FISHER1
	const FS_FISHER2
	const FS_ITEMBALL

ForkedStrait_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

FSItemball:
	itemball LURE_BALL

TrainerFS1:
	trainer FISHER, STIRNER, EVENT_BEAT_FS_STIRNER, FisherStirnerSeenText, FisherStirnerBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FisherStirnerAfterBattleText
	waitbutton
	closetext
	end

FisherStirnerSeenText:
	text "I want to go"
	line "fishing in the"
	cont "SOUTHERN ISLANDS,"
	cont "but they only let"
	cont "scientists go"
	cont "there!"
	done
	
FisherStirnerBeatenText:
	text "Philosophy is"
	line "a science! Let"
	cont "me in!"
	done
	
FisherStirnerAfterBattleText:
	text "Legality is a"
	line "spook!"
	
	para "I'll fish where"
	line "I please!"
	done


TrainerFS2:
	trainer FISHER, EDGAR, EVENT_BEAT_FS_EDGAR, FisherEdgarSeenText, FisherEdgarBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FisherEdgarAfterBattleText
	waitbutton
	closetext
	end

FisherEdgarSeenText:
	text "I am the strongest"
	line "angler in the"
	cont "world! Challenge"
	cont "me… If you dare!"
	done

FisherEdgarBeatenText:
	text "You are worthy of"
	line "your SUPER ROD…"
	done
	
FisherEdgarAfterBattleText:
	text "I have nothing to"
	line "teach you, young"
	cont "one. You are the"
	cont "fish master now…"
	done

CheckpointSignpost:
	jumptext CheckpointSignpostText
	
CheckpointSignpostText:
	text "SOUTHERN ISLANDS"
	line "ACCESS CHECKPOINT"
	
	para "OFFICIAL CLEARANCE"
	line "REQUIRED TO ENTER"
	done


ForkedStrait_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  9, 41,  FORKED_STRAIT_GATE, 1
	warp_event 10, 41,  FORKED_STRAIT_GATE, 2
	warp_event  8, 41,  FORKED_STRAIT_GATE, 1
	warp_event 11, 41,  FORKED_STRAIT_GATE, 2

	db 0 ; coord events

	db 1 ; bg events
	bg_event 12, 41, BGEVENT_READ, CheckpointSignpost

	db 3 ; object events
	object_event  6,  5, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 0, TrainerFS1, -1
	object_event  4, 26, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 0, TrainerFS2, -1
	object_event 15, 13, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, FSItemball, EVENT_FS_LUREBALL_ITEM
	