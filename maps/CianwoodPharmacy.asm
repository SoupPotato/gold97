	const_def 2 ; object constants
	const CIANWOOD_PHARMACY_POKEFAN_M

CianwoodPharmacy_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
CianwoodPharmacyPokefanMScript:
	jumptextfaceplayer CianwoodPharmacyPokefanMText
	
CianwoodPharmacyPokefanMText:
	text "It's interesting"
	line "seeing all of the"
	para "challengers who"
	line "pass through this"
	cont "town."
	para "The LEAGUE brings"
	line "through a lot of"
	cont "tough trainers."
	done
	
CianwoodPharmacy_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, CHERRYGROVE_CITY, 7
	warp_event  5,  7, CHERRYGROVE_CITY, 7

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  4,  4, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CianwoodPharmacyPokefanMScript, -1
