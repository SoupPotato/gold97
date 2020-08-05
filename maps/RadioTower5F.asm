	const_def 2 ; object constants
	const RADIOTOWER5F_ROCKER
	const RADIOTOWER5F_COOLTRAINER
	const RADIOTOWER5F_SCIENTIST
	const RADIOTOWER5F_GRUNTM30

RadioTower5F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	

RadioTower5fCooltrainer:
	faceplayer
	opentext
	checkflag ENGINE_ROCKETS_IN_RADIO_TOWER
	iftrue .MidRocketTakeover5fCooltrainer
	writetext RadioTower5fCooltrainerText
	waitbutton
	closetext
	end
.MidRocketTakeover5fCooltrainer
	writetext RadioTower5fCooltrainerTextTakeover
	waitbutton
	closetext
	end

RadioTower5fRocker:
	faceplayer
	opentext
	checkflag ENGINE_ROCKETS_IN_RADIO_TOWER
	iftrue .MidRocketTakeover5fRocker
	writetext RadioTower5fRockerText
	waitbutton
	closetext
	end
.MidRocketTakeover5fRocker
	writetext RadioTower5fRockerTextTakeover
	waitbutton
	closetext
	end
	
TrainerGruntM30:
	trainer GRUNTM, GRUNTM_30, EVENT_BEAT_ROCKET_GRUNTM_30, GruntM30SeenText, GruntM30BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM30AfterBattleText
	waitbutton
	closetext
	end
	

TrainerScientistRich:
	trainer SCIENTIST, RICH, EVENT_BEAT_SCIENTIST_RICH, ScientistRichSeenText, ScientistRichBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext ScientistRichAfterBattleText
	waitbutton
	closetext
	end

	
RadioTower5FStudiosSign:
	jumptext RadioTower5FStudiosSignText
	
GruntM30SeenText:
	text "Isn't our radio"
	line "broadcast so much"
	para "better than the"
	line "regular stuff?"
	done
	
GruntM30BeatenText:
	text "I actually kind"
	line "of like #MON"
	cont "music…"
	done
	
GruntM30AfterBattleText:
	text "Soon this tower"
	line "will broadcast"
	para "our mind control"
	line "signal!"
	done
	
ScientistRichSeenText:
	text "What happened to"
	line "IMPOSTER OAK?"
	para "Well, he wasn't"
	line "necessary to keep"
	para "around since we"
	line "aren't trying to"
	cont "fool anyone now!"
	para "So we got rid of"
	line "him!"
	done
	
ScientistRichBeatenText:
	text "You're too good"
	line "for me…"
	done
	
ScientistRichAfterBattleText:
	text "I never liked that"
	line "guy anyways."
	done
	
	
RadioTower5FStudiosSignText:
	text "5F STUDIO 3"
	done

RadioTower5fRockerText:
	text "BEN: You like"
	line "music made for"
	cont "#MON?"
	para "Tune into my"
	line "show!"
	done
	
RadioTower5fRockerTextTakeover:
	text "BEN: I don't think"
	line "TEAM ROCKET plans"
	para "to play music for"
	line "the benefit of"
	cont "#MON!"
	done
	
RadioTower5fCooltrainerText:
	text "REED: If you want"
	line "to try your luck,"
	para "tune into my"
	line "broadcast!"
	done
	
RadioTower5fCooltrainerTextTakeover:
	text "REED: I think"
	line "we're having a bit"
	cont "of bad luck here!"
	done
	

RadioTower5F_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  0,  0, RADIO_TOWER_4F, 1
	warp_event  7,  0, RADIO_TOWER_6F, 1

	db 0 ; coord events


	db 1 ; bg events
	bg_event  3,  0, BGEVENT_READ, RadioTower5FStudiosSign

	db 4 ; object events
	object_event  4,  6, SPRITE_ROCKER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, RadioTower5fRocker, -1
	object_event  0,  5, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, RadioTower5fCooltrainer, -1
	object_event  6,  1, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerScientistRich, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event  2,  1, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 1, TrainerGruntM30, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
