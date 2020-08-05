	const_def 2 ; object constants
	const ROUTE12_FISHER1
	const ROUTE12_FISHER2

YoronPoint_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TrainerFisherKyle:
	trainer FISHER, KYLE, EVENT_BEAT_FISHER_KYLE, FisherKyleSeenText, FisherKyleBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FisherKyleAfterBattleText
	waitbutton
	closetext
	end

TrainerFisherMartin:
	trainer FISHER, MARTIN, EVENT_BEAT_FISHER_MARTIN, FisherMartinSeenText, FisherMartinBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FisherMartinAfterBattleText
	waitbutton
	closetext
	end
	
	
FisherMartinSeenText:
	text "Patience is the"
	line "key to both fish-"
	cont "ing and #MON."
	done

FisherMartinBeatenText:
	text "Gwaaah!"
	done

FisherMartinAfterBattleText:
	text "I'm too impatient"
	line "for fishing…"
	done
	

FisherKyleSeenText:
	text "This is the best"
	line "fishing spot, I"
	cont "promise!"
	done

FisherKyleBeatenText:
	text "You ever fish"
	line "here?"
	done

FisherKyleAfterBattleText:
	text "There's more"
	line "FISHERS on the"
	para "other side of the"
	line "STRAIT that claim"
	para "that side is a"
	line "better fishing"
	cont "spot."
	para "But they're wrong!"
	para "I know this side"
	line "is better."
	done

YoronPoint_MapEvents:
	db 0, 0 ; filler

	db 0 ; warp events

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event 10, 11, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 0, TrainerFisherMartin, -1
	object_event  6, 11, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 0, TrainerFisherKyle, -1
