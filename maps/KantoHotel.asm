	const_def 2 ; object constants
	const KANTO_HOSPITAL_NURSE
	const KANTO_HOSPITAL_ROCKER
	const KANTO_HOSPITAL_JANINE

KantoHotel_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

KantoHotelJanine:
	jumptextfaceplayer KantoHotelJanineText

KantoHotelNurse:
	jumptextfaceplayer KantoHotelNurseText

KantoHotelRocker:
	jumptextfaceplayer KantoHotelRockerText
	
KantoHotelJanineText:
	text "Me and my boy-"
	line "friend are on"
	cont "vacation!"
	done
	
KantoHotelRockerText:
	text "I've never been to"
	line "KANTO before."
	para "There's a lot to"
	line "see here."
	done

KantoHotelNurseText:
	text "#MON? No, this"
	line "is a hotel for"
	cont "people."
	para "We're full up."
	done

KantoHotel_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  1,  7, KANTO_REGION, 16
	warp_event  2,  7, KANTO_REGION, 16

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  5,  2, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KantoHotelNurse, -1
	object_event  8,  5, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KantoHotelRocker, -1
	object_event 10,  5, SPRITE_JANINE, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KantoHotelJanine, -1
