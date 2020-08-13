	const_def 2 ; object constants
	const HONTO_COOLTRAINER
	const HONTO_MONSTER
	const HONTO_YOUNGSTER
	const HONTO_LASS

SanskritTown_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_DEFAULT
	scene_script .DummyScene1 ; SCENE_FINISHED

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint

.DummyScene0:
	end

.DummyScene1:
	end

.FlyPoint:
	setflag ENGINE_FLYPOINT_MAHOGANY
	return


HontoTownCooltrainermScript:
	faceplayer
	opentext
	writetext HontoTownCooltrainermText
	waitbutton
	closetext
	turnobject HONTO_COOLTRAINER, DOWN
	end

HontoTownLassScript:
	jumptextfaceplayer HontoTownLassText

HontoTownMonsterScript:
	faceplayer
	opentext
	writetext HontoTownMonsterText
	cry DONPHAN
	waitbutton
	closetext
	turnobject HONTO_MONSTER, UP
	end

HontoTownYoungsterScript:
	jumptextfaceplayer HontoTownYoungsterText

SanskritTownSign:
	jumptext SanskritTownSignText

SanskritTownRagecandybarSign:
	jumpstd martsign

MahoganyGymSign:
	jumptext MahoganyGymSignText

SanskritTownPokecenterSign:
	jumpstd pokecentersign
	
HontoTownLassText:
	text "I love the"
	line "atmosphere of this"
	cont "town."
	para "It almost makes me"
	line "feel as though"
	para "I've traveled back"
	line "in time."
	done
	
HontoTownYoungsterText:
	text "This fountain is"
	line "so mysterious."
	para "No one knows who"
	line "built it."
	para "But it's clear"
	line "that it's from the"
	para "same era as the"
	line "RUINS just north"
	cont "of town."
	done

HontoTownMonsterText:
	text "DONPHAN: PHYUUU!"
	done

HontoTownCooltrainermText:
	text "My DONPHAN doesn't"
	line "listen to me."
	para "I got him in a"
	line "trade from a pal,"
	para "but I don't have"
	line "enough BADGEs for"
	cont "him to obey me."
	done

SanskritTownSignText:
	text "SANSKRIT TOWN"

	para "A link to NIHON's"
	line "past."
	done

SanskritTownRagecandybarSignText:
	text "While visiting"
	line "MAHOGANY TOWN, try"
	cont "a RAGECANDYBAR!"
	done

MahoganyGymSignText:
	text "SANSKRIT TOWN"
	line "RUINS RESEARCH"
	cont "CENTER"
	done

SanskritTown_MapEvents:
	db 0, 0 ; filler

	db 5 ; warp events
	warp_event 15,  4, SANSKRIT_MART, 1
	warp_event  1,  7, SANSKRIT_COIN_CASE_SPEECH_HOUSE, 1
	warp_event 16, 11, RUINS_OF_ALPH_RESEARCH_CENTER, 1
	warp_event  3, 12, SANSKRIT_POKECENTER_1F, 1
	warp_event  4,  3, SANSKRIT_ROCKET_HOUSE, 1

	db 0 ; coord events

	db 4 ; bg events
	bg_event  6, 12, BGEVENT_READ, SanskritTownSign
	bg_event 16,  4, BGEVENT_READ, SanskritTownRagecandybarSign
	bg_event 14, 12, BGEVENT_READ, MahoganyGymSign
	bg_event  4, 12, BGEVENT_READ, SanskritTownPokecenterSign

	db 4 ; object events
	object_event  2,  4, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, HontoTownCooltrainermScript, -1
	object_event  2,  5, SPRITE_MONSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, HontoTownMonsterScript, -1
	object_event 11, 11, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, HontoTownYoungsterScript, -1
	object_event 14,  8, SPRITE_LASS, SPRITEMOVEDATA_WALK_UP_DOWN, 2, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, HontoTownLassScript, -1
