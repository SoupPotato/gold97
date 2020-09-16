CastleMountain1FDiningHall_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .UnblockLongHall
	
.UnblockLongHall:
	checkevent EVENT_DANCE_HALL_ROCKETS_ESCAPED
	iffalse .Done
	changeblock $8, $2, $46
.Done:
	return

LeftoverFoodScript:
	opentext
	checkevent EVENT_TOOK_DINING_HALL_LEFTOVERS
	iftrue .aftertaken
	writetext SuspiciousFoodText
	waitbutton
	writetext TakeSomeAnywayText
	waitbutton
	verbosegiveitem LEFTOVERS
	iffalse .NoRoom
	setevent EVENT_TOOK_DINING_HALL_LEFTOVERS
.NoRoom:
	closetext
	end
.aftertaken:
	writetext SuspiciousFoodText
	waitbutton
	closetext
	end

SuspiciousFoodText:
	text "This food is"
	line "suspiciously fresh"
	cont "for being in an"
	cont "abandoned castle."
	done

TakeSomeAnywayText:
	text "Can't hurt to"
	line "take some right?"
	done

CastleMountain1FDiningHall_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event 14,  8, CASTLE_MOUNTAIN_1F, 5
	warp_event 14,  9, CASTLE_MOUNTAIN_1F, 6
	warp_event  8,  1, CASTLE_MOUNTAIN_1F_LONG_HALL, 5
	warp_event  9,  1, CASTLE_MOUNTAIN_1F_LONG_HALL, 6

	db 0 ; coord events

	db 1 ; bg events
	bg_event  4, 11, BGEVENT_READ, LeftoverFoodScript

	db 0 ; object events
