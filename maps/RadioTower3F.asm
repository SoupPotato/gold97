	const_def 2 ; object constants
	const RADIOTOWER3F_ROCKER
	const RADIOTOWER3F_TEACHER
	const RADIOTOWER3F_SUPER_NERD
	const RADIOTOWER3F_JANINE
	const RADIOTOWER3F_GRUNTF5
	const RADIOTOWER3F_SCIENTIST

RadioTower3F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	
RadioTower3FPersonnelSign:
	jumptext RadioTower3FPersonelSignText

RadioTower3fRocker:
	faceplayer
	opentext
	checkflag ENGINE_ROCKETS_IN_RADIO_TOWER
	iftrue .MidRocketTakeover3fRocker
	writetext RadioTower3fRockerText
	waitbutton
	closetext
	end
.MidRocketTakeover3fRocker
	writetext RadioTower3fRockerTextTakeover
	waitbutton
	closetext
	end
	

RadioTower3fTeacher:
	faceplayer
	opentext
	checkflag ENGINE_ROCKETS_IN_RADIO_TOWER
	iftrue .MidRocketTakeover3fTeacher
	writetext RadioTower3fTeacherText
	waitbutton
	closetext
	end
.MidRocketTakeover3fTeacher
	writetext RadioTower3fTeacherTextTakeover
	waitbutton
	closetext
	end


RadioTower3fJanine:
	faceplayer
	opentext
	checkflag ENGINE_ROCKETS_IN_RADIO_TOWER
	iftrue .MidRocketTakeover3fJanine
	writetext RadioTower3fJanineText
	waitbutton
	closetext
	end
.MidRocketTakeover3fJanine
	writetext RadioTower3fJanineTextTakeover
	waitbutton
	closetext
	end


RadioTower3fSuperNerd:
	faceplayer
	opentext
	checkflag ENGINE_ROCKETS_IN_RADIO_TOWER
	iftrue .MidRocketTakeover3fSuperNerd
	writetext RadioTower3fSuperNerdText
	waitbutton
	closetext
	end
.MidRocketTakeover3fSuperNerd
	writetext RadioTower3fSuperNerdTextTakeover
	waitbutton
	closetext
	end
	

TrainerGruntF5:
	trainer GRUNTF, GRUNTF_5, EVENT_BEAT_ROCKET_GRUNTF_5, GruntF5SeenText, GruntF5BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntF5AfterBattleText
	waitbutton
	closetext
	end
	

TrainerScientistJed:
	trainer SCIENTIST, JED, EVENT_BEAT_SCIENTIST_JED, ScientistJedSeenText, ScientistJedBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext ScientistJedAfterBattleText
	waitbutton
	closetext
	end
	

ScientistJedSeenText:
	text "It shouldn't be"
	line "too much work to"
	para "get our mind"
	line "control signal to"
	cont "broadcast here!"
	done
	
ScientistJedBeatenText:
	text "#MON battles"
	line "are more difficult"
	cont "than science…"
	done
	
ScientistJedAfterBattleText:
	text "How about you stop"
	line "interfering in our"
	cont "business?"
	done
	
GruntF5SeenText:
	text "These employees"
	line "didn't know what"
	cont "hit them!"
	done
	
GruntF5BeatenText:
	text "Oof, I know what"
	line "hit me!"
	done
	
GruntF5AfterBattleText:
	text "Looks like all"
	line "these people will"
	para "be out of a job"
	line "soon!"
	done

	
RadioTower3fRockerText:
	text "We have recordings"
	line "of the cries of"
	para "all #MON that"
	line "have been found."
	para "We must have about"
	line "200 kinds."
	done
	
RadioTower3fRockerTextTakeover:
	text "What is going on"
	line "here!? I can't do"
	para "my job with all of"
	line "these criminals"
	cont "in my workspace!"
	done
	
RadioTower3fJanineText:
	text "KEN is probably"
	line "the most popular"
	cont "DJ here."
	done
	
RadioTower3fJanineTextTakeover:
	text "Help! What does"
	line "TEAM ROCKET plan"
	para "to do with our"
	line "radio antenna?"
	done
	
RadioTower3fSuperNerdText:
	text "We run 24 hours a"
	line "day to broadcast"
	para "entertaining pro-"
	line "grams."
	para "I'll do my best to"
	line "run around the"
	cont "clock too!"
	done
	
RadioTower3fSuperNerdTextTakeover:
	text "This can't be a"
	line "good thing!"
	para "TEAM ROCKET will"
	line "hurt #MON if"
	para "they keep control"
	line "of this tower!"
	done
	
RadioTower3fTeacherText:
	text "Lullabies on the"
	line "radio may make"
	cont "#MON sleep."
	done
	
RadioTower3fTeacherTextTakeover:
	text "What do we do"
	line "about this?"
	done
	
RadioTower3FPersonelSignText:
	text "3F PERSONNEL"
	done

RadioTower3F_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  0,  0, RADIO_TOWER_2F, 1
	warp_event  7,  0, RADIO_TOWER_4F, 2

	db 0 ; coord events

	db 1 ; bg events
	bg_event  5,  0, BGEVENT_READ, RadioTower3FPersonnelSign

	db 6 ; object events
	object_event  1,  6, SPRITE_ROCKER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, RadioTower3fRocker, -1
	object_event  3,  1, SPRITE_TEACHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, RadioTower3fTeacher, -1
	object_event  4,  6, SPRITE_SUPER_NERD, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, RadioTower3fSuperNerd, -1
	object_event  6,  5, SPRITE_JANINE, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, RadioTower3fJanine, -1
	object_event  1,  3, SPRITE_ROCKET_GIRL, SPRITEMOVEDATA_STANDING_UP, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 2, TrainerGruntF5, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event  6,  2, SPRITE_SCIENTIST, SPRITEMOVEDATA_SPINRANDOM_FAST, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerScientistJed, EVENT_RADIO_TOWER_ROCKET_TAKEOVER

