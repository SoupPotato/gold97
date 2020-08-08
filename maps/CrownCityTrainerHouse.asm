	const_def 2 ; object constants
	const ROUTE16FUCHSIASPEECHHOUSE_SUPER_NERD
	const ROUTE16FUCHSIASPEECHHOUSE_COOLTRAINER_F
	const ROUTE16FUCHSIASPEECHHOUSE_COOLTRAINER_M
	const ROUTE16FUCHSIASPEECHHOUSE_ROCKER
	const ROUTE16FUCHSIASPEECHHOUSE_LASS

CrownCityTrainerHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

CrownCityTrainerHouseSuperNerdScript:
	jumptextfaceplayer CrownCityTrainerHouseSuperNerdText
	
CrownCityTrainerHouseCooltrainerfScript:
	jumptextfaceplayer CrownCityTrainerHouseCooltrainerfText

CrownCityTrainerHouseCooltrainermScript:
	jumptextfaceplayer CrownCityTrainerHouseCooltrainermText
	
CrownCityTrainerHouseRockerScript:
	jumptextfaceplayer CrownCityTrainerHouseRockerText

CrownCityTrainerHouseBookshelf:
	jumpstd magazinebookshelf
	
CrownCityTrainerHouseLassScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_TM42_DREAM_EATER
	iftrue .GotDreamEater
	writetext ViridianCityDreamEaterFisherText
	buttonsound
	verbosegiveitem TM_DREAM_EATER
	iffalse .NoRoomForDreamEater
	setevent EVENT_GOT_TM42_DREAM_EATER
.GotDreamEater:
	writetext ViridianCityDreamEaterFisherGotDreamEaterText
	waitbutton
.NoRoomForDreamEater:
	closetext
	end
	

ViridianCityDreamEaterFisherText:
	text "Yawn!"

	para "I've been training"
	line "so much lately…"
	para "I'm so tired, I"
	line "could fall asleep."
	
	para "Did you know"
	line "there's a move"
	para "that's only"
	line "effective against"
	cont "sleeping #MON?"
	para "Here, check this"
	line "out."
	done

ViridianCityDreamEaterFisherGotDreamEaterText:
	text "TM42 contains"
	line "DREAM EATER…"

	para "…Zzzzz…"
	done

	
CrownCityTrainerHouseRockerText:
	text "Which of my #-"
	line "MON are tough"
	para "enough to take on"
	line "the LEAGUE?"
	done
	
CrownCityTrainerHouseCooltrainermText:
	text "I'm ready!"
	para "I can do this!"
	para "Just psyching"
	line "myself up."
	done

CrownCityTrainerHouseSuperNerdText:
	text "I hear there are"
	line "trainers in the"
	para "LEAGUE that use"
	line "PSYCHIC, FIGHTING,"
	para "WATER, POISON, and"
	line "DRAGON #MON."
	done
	
CrownCityTrainerHouseCooltrainerfText:
	text "I had a tough time"
	line "getting eight"
	cont "BADGEs."
	para "I might need to"
	line "train more before"
	para "I take on the"
	line "LEAGUE."
	done

CrownCityTrainerHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  7,  7, CROWN_CITY, 8
	warp_event  8,  7, CROWN_CITY, 9

	db 0 ; coord events

	db 4 ; bg events
	bg_event  8,  1, BGEVENT_READ, CrownCityTrainerHouseBookshelf
	bg_event  9,  1, BGEVENT_READ, CrownCityTrainerHouseBookshelf
	bg_event 10,  1, BGEVENT_READ, CrownCityTrainerHouseBookshelf
	bg_event 11,  1, BGEVENT_READ, CrownCityTrainerHouseBookshelf

	db 5 ; object events
	object_event  2,  3, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CrownCityTrainerHouseSuperNerdScript, -1
	object_event  1,  6, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CrownCityTrainerHouseCooltrainerfScript, -1
	object_event  4,  5, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CrownCityTrainerHouseCooltrainermScript, -1
	object_event 10,  3, SPRITE_ROCKER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CrownCityTrainerHouseRockerScript, -1
	object_event 13,  6, SPRITE_LASS, SPRITEMOVEDATA_STANDING_RIGHT, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CrownCityTrainerHouseLassScript, -1
