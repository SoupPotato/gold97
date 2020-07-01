	const_def 2 ; object constants
	const CHERRYGROVEGYMSPEECHHOUSE_POKEFAN_M

CherrygroveGymSpeechHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

CherrygroveGymSpeechHousePokefanMScript:
	faceplayer
	opentext
	checkevent EVENT_RIVAL_BURNED_TOWER
	iftrue .GiveSurf
	writetext FujiSlowpokeProblem
	waitbutton
	closetext
	end
	

.GiveSurf
	checkevent EVENT_GOT_HM03_SURF
	iftrue .GotSurf
	writetext FujiTakeThisSurfText
	yesorno
	iffalse .Refused
	verbosegiveitem HM_SURF
	setevent EVENT_GOT_HM03_SURF
	writetext FujiSurfDescriptionText
	waitbutton
	closetext
	end

.NoRoom:
	writetext FujiNoSurf
	waitbutton
	closetext
	end

.Refused:
	writetext FujiNoSurf
	waitbutton
	closetext
	end

.GotSurf:
	writetext FujiStandardText
	waitbutton
	closetext
	end

CherrygroveGymSpeechHouseBookshelf:
	jumpstd picturebookshelf

FujiSlowpokeProblem:
	text "My old bones sense"
	line "trouble in the"
	para "WELL beneath the"
	line "town."
	para "It's always been"
	line "my job to make"
	para "sure the SLOWPOKE"
	line "stay safe."
	para "I don't know if I"
	line "have the strength"
	cont "to protect them."
	para "I hope they're"
	line "okay…"
	done

FujiTakeThisSurfText:
	text "Ah!"
	para "It was you!"
	line "You rescued the"
	cont "SLOWPOKE!"
	para "I am ever so"
	line "grateful."
	para "Here, let me"
	line "give you something"
	cont "for your troubles."
	done
	
FujiNoSurf:
	text "Are you sure?"
	line "You might need"
	cont "this."
	done
	
FujiSurfDescriptionText:
	text "This HM allows you"
	line "to teach your"
	para "#MON a move"
	line "that will let them"
	para "ferry you across"
	line "the water."
	para "There isn't much"
	line "water in this"
	para "town, but I'm sure"
	line "it'll be useful"
	cont "elsewhere."
	done
	
FujiStandardText:
	text "The SLOWPOKE of"
	line "the WELL deserve"
	cont "to be protected."
	done


CherrygroveGymSpeechHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  3,  7, AZALEA_TOWN, 4
	warp_event  4,  7, AZALEA_TOWN, 4

	db 0 ; coord events

	db 1 ; bg events
	bg_event  1,  1, BGEVENT_READ, CherrygroveGymSpeechHouseBookshelf

	db 1 ; object events
	object_event  2,  3, SPRITE_ELDER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CherrygroveGymSpeechHousePokefanMScript, -1
