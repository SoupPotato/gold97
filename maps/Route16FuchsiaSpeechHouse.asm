	const_def 2 ; object constants
	const ROUTE16FUCHSIASPEECHHOUSE_SUPER_NERD
	const ROUTE16FUCHSIASPEECHHOUSE_COOLTRAINER_F
	const ROUTE16FUCHSIASPEECHHOUSE_COOLTRAINER_M
	const ROUTE16FUCHSIASPEECHHOUSE_ROCKER
	const ROUTE16FUCHSIASPEECHHOUSE_LASS

Route16FuchsiaSpeechHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Route16FuchsiaSpeechHouseSuperNerdScript:
	jumptextfaceplayer Route16FuchsiaSpeechHouseSuperNerdText
	
Route16FuchsiaSpeechHouseCooltrainerfScript:
	jumptextfaceplayer Route16FuchsiaSpeechHouseCooltrainerfText

Route16FuchsiaSpeechHouseCooltrainermScript:
	jumptextfaceplayer Route16FuchsiaSpeechHouseCooltrainermText
	
Route16FuchsiaSpeechHouseRockerScript:
	jumptextfaceplayer Route16FuchsiaSpeechHouseRockerText

Route16FuchsiaSpeechHouseBookshelf:
	jumpstd magazinebookshelf
	
Route16FuchsiaSpeechHouseLassScript:
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

	
Route16FuchsiaSpeechHouseRockerText:
	text "Which of my #-"
	line "MON are tough"
	para "enough to take on"
	line "the LEAGUE?"
	done
	
Route16FuchsiaSpeechHouseCooltrainermText:
	text "I'm ready!"
	para "I can do this!"
	para "Just psyching"
	line "myself up."
	done

Route16FuchsiaSpeechHouseSuperNerdText:
	text "I hear there are"
	line "trainers in the"
	para "LEAGUE that use"
	line "PSYCHIC, FIGHTING,"
	para "WATER, POISON, and"
	line "DRAGON #MON."
	done
	
Route16FuchsiaSpeechHouseCooltrainerfText:
	text "I had a tough time"
	line "getting eight"
	cont "BADGEs."
	para "I might need to"
	line "train more before"
	para "I take on the"
	line "LEAGUE."
	done

Route16FuchsiaSpeechHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  7,  7, CHERRYGROVE_CITY, 8
	warp_event  8,  7, CHERRYGROVE_CITY, 9

	db 0 ; coord events

	db 4 ; bg events
	bg_event  8,  1, BGEVENT_READ, Route16FuchsiaSpeechHouseBookshelf
	bg_event  9,  1, BGEVENT_READ, Route16FuchsiaSpeechHouseBookshelf
	bg_event 10,  1, BGEVENT_READ, Route16FuchsiaSpeechHouseBookshelf
	bg_event 11,  1, BGEVENT_READ, Route16FuchsiaSpeechHouseBookshelf

	db 5 ; object events
	object_event  2,  3, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route16FuchsiaSpeechHouseSuperNerdScript, -1
	object_event  1,  6, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route16FuchsiaSpeechHouseCooltrainerfScript, -1
	object_event  4,  5, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route16FuchsiaSpeechHouseCooltrainermScript, -1
	object_event 10,  3, SPRITE_ROCKER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route16FuchsiaSpeechHouseRockerScript, -1
	object_event 13,  6, SPRITE_LASS, SPRITEMOVEDATA_STANDING_RIGHT, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route16FuchsiaSpeechHouseLassScript, -1
