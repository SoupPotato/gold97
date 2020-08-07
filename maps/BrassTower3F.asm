	const_def 2 ; object constants
	const SPROUTTOWER3F_SAGE1
	const SPROUTTOWER3F_SAGE2
	const SPROUTTOWER3F_SAGE3


BrassTower3F_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_DEFAULT
	scene_script .DummyScene1 ; SCENE_FINISHED

	db 0 ; callbacks

.DummyScene0:
	end

.DummyScene1:
	end

BrassTower3FSign:
	setevent EVENT_READ_5F3F_SIGN
	jumptext BrassTower3FSignText
	
BrassTower3FSignText:
	text "This is a statue"
	line "of a TENTACRUEL."
	para "Despite its large"
	line "and intimidating"
	para "appearance,"
	line "TENTACRUEL teaches"
	para "us that all"
	line "#MON have pure"
	cont "hearts."
	para "This statue is"
	line "dedicated to a"
	para "TENTACRUEL that"
	line "used its tentacles"
	para "to lift a drowning"
	line "child out of the"
	para "river next to this"
	line "tower."
	done


TrainerSageJeffrey:
	trainer SAGE, JEFFREY, EVENT_BEAT_SAGE_JEFFREY, SageJeffreySeenText, SageJeffreyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SageJeffreyAfterBattleText
	waitbutton
	closetext
	end


SageJeffreySeenText:
	text "What does climbing"
	line "this tower mean to"
	cont "you?"
	done

SageJeffreyBeatenText:
	text "Well, then."
	done

SageJeffreyAfterBattleText:
	text "You should find"
	line "meaning in this"
	cont "journey."
	para "Both here in the"
	line "tower and whatever"
	cont "may come after."
	done
	
TrainerSagePing:
	trainer SAGE, PING, EVENT_BEAT_SAGE_PING, SagePingSeenText, SagePingBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SagePingAfterBattleText
	waitbutton
	closetext
	end


SagePingSeenText:
	text "Above the 5th"
	line "floor is access to"
	cont "the roof."
	para "But even we are"
	line "not granted to set"
	para "foot in that"
	line "sacred place."
	done

SagePingBeatenText:
	text "You appear to"
	line "treat your #MON"
	cont "well."
	done

SagePingAfterBattleText:
	text "We hope the roof"
	line "will one day again"
	para "be home to the"
	line "rainbow-winged"
	cont "bird of legend."
	done
	
TrainerSageNeal:
	trainer SAGE, NEAL, EVENT_BEAT_SAGE_NEAL, SageNealSeenText, SageNealBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SageNealAfterBattleText
	waitbutton
	closetext
	end


SageNealSeenText:
	text "You have done well"
	line "to make it this"
	cont "far."
	done

SageNealBeatenText:
	text "Please, continue."
	done

SageNealAfterBattleText:
	text "If KURT asked you"
	line "to make this"
	para "journey, he must"
	line "sense an important"
	para "destiny in your"
	line "future."
	done

BrassTower3F_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 11,  5, BRASS_TOWER_2F, 2
	warp_event 10,  1, BRASS_TOWER_4F, 1

	db 0 ; coord events


	db 1 ; bg events
	bg_event  4,  1, BGEVENT_READ, BrassTower3FSign

	db 3 ; object events
	object_event  1, 10, SPRITE_SAGE, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerSageJeffrey, EVENT_OLD_CITY_EARL
	object_event  7,  9, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerSagePing, EVENT_OLD_CITY_EARL
	object_event  7,  1, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerSageNeal, EVENT_OLD_CITY_EARL

