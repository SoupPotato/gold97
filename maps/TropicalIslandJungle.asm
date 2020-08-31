	const_def 2
	const MEW_SPOT_1
	const MEW_SPOT_5

TropicalIslandJungle_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

MewTextCommon1:
	text "MEW!"
	done

MewSpot1Script:
	opentext
	writetext MewTextCommon1
	cry MEW
	waitbutton
	closetext
	special FadeOutPalettes
	playsound SFX_WARP_TO
	pause 10
	special LoadMapPalettes
	special FadeInPalettes
	disappear MEW_SPOT_1
	setevent EVENT_MEW_SPOT_1_FOUND
	setevent EVENT_SLOWKING_HINT_2
	clearevent EVENT_MEW_SPOT_2_FOUND
	end
	
	
MewSpot5Script:
	opentext
	writetext MewTextCommon1
	cry MEW
	waitbutton
	closetext
	special FadeOutPalettes
	playsound SFX_WARP_TO
	pause 10
	special LoadMapPalettes
	special FadeInPalettes
	disappear MEW_SPOT_5
	setevent EVENT_MEW_SPOT_5_FOUND
	setevent EVENT_SLOWKING_HINT_6
	clearevent EVENT_MEW_SPOT_6_FOUND
	end

TropicalIslandJungle_MapEvents:
	db 0, 0 ; filler

	db 6 ; warp events
	warp_event 13, 38, TROPICAL_ISLAND, 1
	warp_event 14, 38, TROPICAL_ISLAND, 2
	warp_event 26,  5, TROPICAL_ISLAND, 3
	warp_event 26,  6, TROPICAL_ISLAND, 4
	warp_event  3, 27, TROPICAL_ISLAND, 5
	warp_event  3, 28, TROPICAL_ISLAND, 6

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event 13, 33, SPRITE_JYNX, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, MewSpot1Script, EVENT_MEW_SPOT_1_FOUND
	object_event  6,  6, SPRITE_JYNX, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, MewSpot5Script, EVENT_MEW_SPOT_5_FOUND
	