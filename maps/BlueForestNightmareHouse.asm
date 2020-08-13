	const_def 2 ; object constants
	const BLUEFORESTHOUSE_1_GRANNY
	const BLUEFORESTHOUSE_1_METTO

BlueForestNightmareHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

BlueForestNightmareHouseGrannyScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_TM50_NIGHTMARE
	iftrue .AlreadyGotNightmare
	writetext Text_NightmareIntro
	buttonsound
	verbosegiveitem TM_NIGHTMARE
	iffalse .BagFull
	setevent EVENT_GOT_TM50_NIGHTMARE
.AlreadyGotNightmare:
	writetext Text_NightmareOutro
	waitbutton
.BagFull:
	closetext
	end	

BlueForestNightmareHouseAnimonScript:
	faceplayer
	opentext
	writetext BlueForestNightmareHouseMonText
	cry METTO
	waitbutton
	closetext
	end
	
BlueForestNightmareHouseMonText:
	text "METTO:"
	line "Uoi!"
	done

Text_NightmareIntro:
	text "I had a terrible"
	line "nightmare last"
	para "night that my"
	line "METTO had dis-"
	cont "appeared."
	para "I was so heart-"
	line "broken."
	para "Fortunately it was"
	line "not real."
	para "But I did find"
	line "this in my house"
	cont "today."
	para "I don't want it."
	line "Take it, please."
	done
	
Text_NightmareOutro:
	text "TM50 teaches"
	line "NIGHTMARE."
	para "It can do great"
	line "damage to #MON"
	cont "that are asleep."
	done

BlueForestNightmareHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, BLUE_FOREST, 7
	warp_event  5,  7, BLUE_FOREST, 7

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  8, 3, SPRITE_GRANNY, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BlueForestNightmareHouseGrannyScript, -1
	object_event  9, 6, SPRITE_GRIMER, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BlueForestNightmareHouseAnimonScript, -1
