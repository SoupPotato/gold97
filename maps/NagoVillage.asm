	const_def 2 ; object constants
	const CERULEAN_CITY_TEACHER
	const CERULEAN_CITY_FISHING_GURU

NagoVillage_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint

.FlyPoint:
	setflag ENGINE_FLYPOINT_CERULEAN
	return

NagoVillagePokecenterSign:
	jumpstd pokecentersign
	
NagoVillageSign:
	jumptext NagoVillageSignText

NagoVillageHiddenBerserkGene:
	hiddenitem BERSERK_GENE, EVENT_FOUND_BERSERK_GENE_IN_CERULEAN_CITY
	
NagoVillageTeacherScript:
	jumptextfaceplayer NagoVillageTeacherText
	
NagoVillageFishingGuruScript:
	jumptextfaceplayer NagoVillageFishingGuruText
	
NagoVillageFishingGuruText:
	text "If nothing else,"
	line "this town is great"
	cont "for fishing!"
	done
	
NagoVillageTeacherText:
	text "And just as soon"
	line "as you get to this"
	para "town, you can pass"
	line "through it."
	para "There's really not"
	line "much here, but I"
	para "hope you at least"
	line "find it charming."
	done
	
NagoVillageSignText:
	text "NAGO VILLAGE -"
	para "A quiet seaside"
	line "settlement."
	done

NagoVillage_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  5,  4, NAGO_POKECENTER_1F, 1
	warp_event 10, 15, NAGO_IMPOSTER_HOUSE, 1
	warp_event  5, 21, NAGO_CHARMANDER_HOUSE, 1

	db 0 ; coord events

	db 3 ; bg events
	bg_event  6,  4, BGEVENT_READ, NagoVillagePokecenterSign
	bg_event 16,  5, BGEVENT_ITEM, NagoVillageHiddenBerserkGene
	bg_event  7, 11, BGEVENT_READ, NagoVillageSign

	db 2 ; object events
	object_event  7,  9, SPRITE_TEACHER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, NagoVillageTeacherScript, -1
	object_event 17, 20, SPRITE_FISHING_GURU, SPRITEMOVEDATA_STANDING_RIGHT, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, NagoVillageFishingGuruScript, -1
