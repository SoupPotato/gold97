	const_def 2 ; object constants
	const BIRDON_ELDER

BirdonEldersHouse_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .Elder
	
	
	
.Elder
	checkevent EVENT_GOT_HM03_SURF
	iffalse .gone
	appear BIRDON_ELDER
	return
	
.gone
	disappear BIRDON_ELDER
	return
	

BirdonElderScript:
	faceplayer
	opentext
	writetext ElderStandardText
	waitbutton
	closetext
	end

BirdonEldersHouseBookshelf:
	jumpstd picturebookshelf
	
ElderStandardText:
	text "The SLOWPOKE of"
	line "the WELL deserve"
	cont "to be protected."
	done


BirdonEldersHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  3,  7, BIRDON_TOWN, 4
	warp_event  4,  7, BIRDON_TOWN, 4

	db 0 ; coord events

	db 1 ; bg events
	bg_event  1,  1, BGEVENT_READ, BirdonEldersHouseBookshelf

	db 1 ; object events
	object_event  2,  3, SPRITE_ELDER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BirdonElderScript, 0
