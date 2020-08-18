	const_def 2 ; object constants
	const SPROUTTOWER2F_MEDIUM1
	const SPROUTTOWER2F_MEDIUM2
	const SPROUTTOWER2F_MEDIUM3
	const SPROUTTOWER2F_MEDIUM4
	const SPROUTTOWER2F_POKE_BALL

BrassTower2F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

BrassTower2FSign:
	setevent EVENT_READ_5F2F_SIGN
	jumptext BrassTower2FSignText

BrassTower2FXAccuracy:
	itemball X_ACCURACY
	
TrainerMediumMartha:
	trainer MEDIUM, MARTHA, EVENT_BEAT_MEDIUM_MARTHA, MediumMarthaSeenText, MediumMarthaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext MediumMarthaAfterBattleText
	waitbutton
	closetext
	end
	
BrassTower2FSignText:
	text "This is a statue"
	line "of a PIKACHU."
	para "PIKACHU reminds"
	line "us that even the"
	para "most popular of"
	line "#MON still"
	para "deserve to be"
	line "treated with honor"
	para "and respect, and"
	line "not just viewed"
	para "as some sort of"
	line "status symbol."
	done


MediumMarthaSeenText:
	text "What brings you"
	line "here?"
	done

MediumMarthaBeatenText:
	text "Your purpose is"
	line "clear."
	done

MediumMarthaAfterBattleText:
	text "Only the wisest"
	line "of trainers fully"
	para "grasp the full"
	line "importance of the"
	para "relationship"
	line "between people"
	cont "and #MON."
	done
	
TrainerMediumGrace:
	trainer MEDIUM, GRACE, EVENT_BEAT_MEDIUM_GRACE, MediumGraceSeenText, MediumGraceBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext MediumGraceAfterBattleText
	waitbutton
	closetext
	end


MediumGraceSeenText:
	text "When done in a"
	line "proper manner,"
	para "a #MON battle"
	line "can be a spiritual"
	cont "experience."
	done

MediumGraceBeatenText:
	text "I hope you sensed"
	line "it."
	done

MediumGraceAfterBattleText:
	text "In many ways,"
	line "humans depend on"
	para "#MON more than"
	line "they depend on us."
	done
	
TrainerMediumBethany:
	trainer MEDIUM, BETHANY, EVENT_BEAT_MEDIUM_BETHANY, MediumBethanySeenText, MediumBethanyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext MediumBethanyAfterBattleText
	waitbutton
	closetext
	end


MediumBethanySeenText:
	text "Do you sense an"
	line "otherworldly"
	para "presence in this"
	line "place?"
	done

MediumBethanyBeatenText:
	text "Hmmm."
	done

MediumBethanyAfterBattleText:
	text "In one way or"
	line "another, we"
	cont "all can feel it."
	done
	
TrainerMediumMargret:
	trainer MEDIUM, MARGRET, EVENT_BEAT_MEDIUM_MARGRET, MediumMargretSeenText, MediumMargretBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext MediumMargretAfterBattleText
	waitbutton
	closetext
	end


MediumMargretSeenText:
	text "Ah! You disturbed"
	line "me!"
	done

MediumMargretBeatenText:
	text "It is important to"
	line "keep focused."
	done

MediumMargretAfterBattleText:
	text "Focus on the"
	line "messages."
	done


BrassTower2F_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  0,  1, BRASS_TOWER_1F, 3
	warp_event 11,  5, BRASS_TOWER_3F, 1

	db 0 ; coord events

	db 1 ; bg events
	bg_event  4,  1, BGEVENT_READ, BrassTower2FSign

	db 5 ; object events
	object_event  9,  2, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerMediumMartha, EVENT_OLD_CITY_EARL
	object_event  1,  5, SPRITE_GRANNY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 2, TrainerMediumGrace, EVENT_OLD_CITY_EARL
	object_event  9,  6, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 2, TrainerMediumBethany, EVENT_OLD_CITY_EARL
	object_event  7,  9, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 2, TrainerMediumMargret, EVENT_OLD_CITY_EARL
	object_event 10,  1, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, BrassTower2FXAccuracy, EVENT_SPROUT_TOWER2F_X_ACCURACY
