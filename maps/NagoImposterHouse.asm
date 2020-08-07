	const_def 2 ; object constants
	const NagoImposterHouse_FISHING_GURU
	const NagoImposterHouse_DIGLETT

NagoImposterHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

NagoImposterHouseFishingGuruScript:
	jumptextfaceplayer NagoImposterHouseFishingGuruText

CeruleanDiglett:
	opentext
	writetext CeruleanDiglettText
	cry DIGLETT
	waitbutton
	closetext
	end

NagoImposterHouseFishingGuruText:
	text "IMPOSTER OAK: Oh."
	para "It's you."
	para "…"
	para "I'm not here to"
	line "fight or to take"
	para "part in some evil"
	line "scheme."
	para "I was wrong to"
	line "work with TEAM"
	cont "ROCKET."
	para "Maybe I was"
	line "blinded by the"
	cont "promise of power."
	para "But TEAM ROCKET is"
	line "no team."
	para "I meant nothing to"
	line "any of them, and"
	para "as soon as they"
	line "no longer needed"
	para "to try to fool the"
	line "public, they"
	para "forced me out"
	line "immediately."
	para "I see them for"
	line "what they are,"
	para "and I'm trying to"
	line "leave that life"
	cont "behind."
	para "You don't have to"
	line "forgive me, but"
	para "this is where I'm"
	line "at."
	done


CeruleanDiglettText:
	text "DIGLETT: Dug dug."
	done

NagoImposterHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, NAGO_VILLAGE, 2
	warp_event  5,  7, NAGO_VILLAGE, 2

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  7,  4, SPRITE_SURGE, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, NagoImposterHouseFishingGuruScript, EVENT_TELEPORT_GUY
	object_event  3,  5, SPRITE_DIGLETT, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, CeruleanDiglett, EVENT_TELEPORT_GUY
