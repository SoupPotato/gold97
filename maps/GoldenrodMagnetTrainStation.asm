	const_def 2 ; object constants
	const KANTO_HOSPITAL_NURSE
	const KANTO_HOSPITAL_ROCKER
	const KANTO_HOSPITAL_JANINE

GoldenrodMagnetTrainStation_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

KantoHospitalJanine:
	jumptextfaceplayer KantoHospitalJanineText

KantoHospitalNurse:
	jumptextfaceplayer KantoHospitalNurseText

KantoHospitalRocker:
	jumptextfaceplayer KantoHospitalRockerText
	
KantoHospitalJanineText:
	text "Me and my boy-"
	line "friend are on"
	cont "vacation!"
	done
	
KantoHospitalRockerText:
	text "I've never been to"
	line "KANTO before."
	para "There's a lot to"
	line "see here."
	done

KantoHospitalNurseText:
	text "#MON? No, this"
	line "is a hotel for"
	cont "people."
	para "We're full up."
	done

GoldenrodMagnetTrainStation_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  1,  7, CELADON_CITY, 16
	warp_event  2,  7, CELADON_CITY, 16

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  5,  1, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KantoHospitalNurse, -1
	object_event 10,  5, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KantoHospitalRocker, -1
	object_event 12,  5, SPRITE_JANINE, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KantoHospitalJanine, -1
