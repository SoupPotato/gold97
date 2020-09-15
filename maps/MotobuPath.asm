	const_def 2
	const MOTOBU_SWIMMER1
	const MOTOBU_SWIMMER2
	const MOTOBU_SWIMMER3

MotobuPath_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks


TrainerSwimmerfJill:
	trainer SWIMMERF, JILL, EVENT_BEAT_SWIMMERF_JILL, SwimmerfJillSeenText, SwimmerfJillBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerfJillAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmerfMary:
	trainer SWIMMERF, MARY, EVENT_BEAT_SWIMMERF_MARY, SwimmerfMarySeenText, SwimmerfMaryBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerfMaryAfterBattleText
	waitbutton
	closetext
	end


TrainerSwimmerfKatie:
	trainer SWIMMERF, KATIE, EVENT_BEAT_SWIMMERF_KATIE, SwimmerfKatieSeenText, SwimmerfKatieBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerfKatieAfterBattleText
	waitbutton
	closetext
	end




SwimmerfJillSeenText:
	text "The water is so"
	line "nice and warm"
	cont "around here!"
	done

SwimmerfJillBeatenText:
	text "Kyah!"
	done

SwimmerfJillAfterBattleText:
	text "Going to the"
	line "#MON CENTER"
	cont "means I have to"
	cont "get out of the"
	cont "water, oh well."
	done

SwimmerfMarySeenText:
	text "I'll swim circles"
	line "around you!"
	done

SwimmerfMaryBeatenText:
	text "I'm dizzy!"
	done

SwimmerfMaryAfterBattleText:
	text "I think I'm"
	line "getting some heat"
	cont "stroke out here."
	done

SwimmerfKatieSeenText:
	text "Ka-splash!"
	done

SwimmerfKatieBeatenText:
	text "Washed out!"
	done

SwimmerfKatieAfterBattleText:
	text "Want to see how"
	line "long I can hold"
	cont "my breath?"
	done

MotobuPathSign:
	jumptext MotobuPathSignText
	
MotobuPathSignText:
	text "MOTOBU PATH -"
	line "NAGO VILLAGE to"
	cont "IE TOWN."
	done


MotobuPath_MapEvents:
	db 0, 0 ; filler

	db 0 ; warp events

	db 0 ; coord events

	db 1 ; bg events
	bg_event 57,  7, BGEVENT_READ, MotobuPathSign

	db 3 ; object events
	object_event 14,  7, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerSwimmerfJill, -1
	object_event 21,  9, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerSwimmerfMary, -1
	object_event 28,  7, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerSwimmerfKatie, -1
