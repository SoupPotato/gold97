	const_def 2 ; object constants
	const STANDPOKE_NURSE1
	const STANDPOKE_FAIRY
	const STANDPOKE_NURSE2

StandPoke_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

StandPokeNurse1Script:
	faceplayer
	opentext
	writetext StandPokeNurse1Text
	waitbutton
	closetext
	turnobject STANDPOKE_NURSE1, RIGHT
	end
	

StandPokeClefairyScript:
	opentext
	writetext ClefairyWeakText
	writebyte CLEFAIRY
	special PlaySlowCry
	buttonsound
	writetext StandPokeItsCryIsWeakText
	waitbutton
	closetext
	end
	
StandPokeNurse2Script:
	jumptextfaceplayer StandPokeNurse2Text
	
StandPokeNurse2Text:
	text "This is the"
	line "medical center for"
	para "the STAND CITY"
	line "ZOO."
	para "Fortunately, all"
	line "of our #MON are"
	cont "feeling healthy!"
	done
	
	
ClefairyWeakText:
	text "CLEFAIRY: …Fairy…"
	done
	
StandPokeItsCryIsWeakText:
	text "Its cry is weak…"
	done


StandPokeNurse1Text:
	text "This CLEFAIRY"
	line "is feeling ill."
	para "We've got the"
	line "other #MON from"
	para "the ZOO in the"
	line "back."
	para "Hopefully they can"
	line "all feel better"
	cont "soon."
	done

StandPoke_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  3,  7, FUCHSIA_CITY, 13
	warp_event  4,  7, FUCHSIA_CITY, 13

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event 2,  3, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_RIGHT, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, StandPokeNurse1Script, EVENT_CLEARED_RADIO_TOWER
	object_event 3,  3, SPRITE_FAIRY, SPRITEMOVEDATA_STANDING_LEFT, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, StandPokeClefairyScript, EVENT_CLEARED_RADIO_TOWER
	object_event 2,  3, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, StandPokeNurse2Script, EVENT_ILEX_FOREST_FARFETCHD

