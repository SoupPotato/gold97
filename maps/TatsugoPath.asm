	const_def 2
	const TP_TEACHER
	const TP_INSTR
	const TP_SNERD
	const TP_SAILOR
	const TP_ITEMBALL

TatsugoPath_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TrainerSailorEugene:
	trainer SAILOR, EUGENE, EVENT_BEAT_SAILOR_EUGENE, SailorEugeneSeenText, SailorEugeneBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SailorEugeneAfterBattleText
	waitbutton
	closetext
	end
	

SailorEugeneSeenText:
	text "I just got back"
	line "from sea."

	para "So how about a"
	line "#MON battle?"
	done

SailorEugeneBeatenText:
	text "Awaaargh!"
	done

SailorEugeneAfterBattleText:
	text "My #MON were"
	line "caught and raised"
	cont "overseas."

	para "They're my compan-"
	line "ions on those long"
	cont "voyages."
	done


TrainerTeacherHolly:
	trainer TEACHER, HOLLY, EVENT_BEAT_TEACHER_HOLLY, TeacherHollySeenText, TeacherHollyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext TeacherHollyAfterBattleText
	waitbutton
	closetext
	end
	

TeacherHollySeenText:
	text "Um, excuse me"
	line "but this is a"
	cont "private date!"
	done

TeacherHollyBeatenText:
	text "Buzz off twerp!"
	done

TeacherHollyAfterBattleText:
	text "As if I don't"
	line "have to deal"
	cont "with enough kids"
	cont "at work already!"
	done


TrainerInstrMoshe:
	trainer INSTRUCTOR, MOSHE, EVENT_BEAT_INSTRUCTOR_MOSHE, InstrMosheSeenText, InstrMosheBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext InstrMosheAfterBattleText
	waitbutton
	closetext
	end
	

InstrMosheSeenText:
	text "If you're looking"
	line "for tutoring then"
	cont "you've come at"
	cont "the wrong time!"
	done

InstrMosheBeatenText:
	text "Ah come on!"
	done

InstrMosheAfterBattleText:
	text "Us schoolteachers"
	line "can't even have"
	cont "a cute date with-"
	cont "out some kids"
	cont "showing up to"
	cont "pester us!"
	done

TrainerSNNorton:
	trainer SUPER_NERD, NORTON, EVENT_BEAT_SUPERNERD_NORTON, SNNortonSeenText, SNNortonBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SNNortonAfterBattleText
	waitbutton
	closetext
	end
	

SNNortonSeenText:
	text "I hang around at"
	line "HEART POND every"
	cont "day but I still"
	cont "don't have a"
	cont "girlfriend!"
	done

SNNortonBeatenText:
	text "It's a tough"
	line "life of a nerd."
	done

SNNortonAfterBattleText:
	text "Would bathing in"
	line "the HEART POND"
	cont "help my chances"
	cont "at all?"
	done

TPItemball:
	itemball ULTRA_BALL

HeartPondSign:
	jumptext HeartPondSignText
	
HeartPondSignText:
	text "HEART POND"
	line "A place where"
	cont "lovers meet."
	done

KikaiStraitSign:
	jumptext KikaiStraitSignText
	
KikaiStraitSignText:
	text "TATSUGO PATH -"
	line "KIKAI STRAIT"
	
	para "KIKAI VILLAGE"
	line "AHEAD"
	done

TatsugoPath_MapEvents:
	db 0, 0 ; filler

	db 0 ; warp events

	db 0 ; coord events

	db 2 ; bg events
	bg_event 20,  6, BGEVENT_READ, HeartPondSign
	bg_event 54,  6, BGEVENT_READ, KikaiStraitSign

	db 5 ; object events
	object_event 19,  9, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, TrainerTeacherHolly, -1
	object_event 19, 10, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 1, TrainerInstrMoshe, -1
	object_event 27,  7, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerSNNorton, -1
	object_event 52,  9, SPRITE_SAILOR, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerSailorEugene, -1
	object_event 51, 15, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, TPItemball, EVENT_TATSUGO_PATH_ITEMBALL
