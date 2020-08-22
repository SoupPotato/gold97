	const_def 2 ; object constants
	const MUSEUM_NPC_6
	const MUSEUM_NPC_7
	const MUSEUM_NPC_8
	const MUSEUM_NPC_9
	const MUSEUM_NPC_10

KantoMuseum2F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

MuseumYoungster:
	jumptextfaceplayer MuseumYoungsterText
	
MuseumYoungsterText:
	text "If MOON STONES"
	line "come from MT.MOON"
	cont "does that mean"
	cont "there's a MT.SUN"
	cont "somewhere full of"
	cont "SUN STONES?"
	done
	
MuseumUpstairGramps:
	jumptextfaceplayer MuseumUpstairGrampsText
	
MuseumUpstairGrampsText:
	text "Never take your"
	line "life for granted."
	
	para "One day they could"
	line "dig up your bones"
	cont "and put YOU in a"
	cont "museum!"
	done

MuseumUpstairScientist:
	jumptextfaceplayer MuseumUpstairScientistText
	
MuseumUpstairScientistText:
	text "Welcome to our"
	line "space exhibit!"
	done
	
MuseumKid:
	jumptextfaceplayer MuseumKidText
	
MuseumKidText:
	text "Aw, come on big"
	line "sis! If dad got"
	cont "you a PIKACHU"
	cont "then I can at"
	cont "least have a"
	cont "PICHU!"
	done


MuseumLass:
	jumptextfaceplayer MuseumLassText
	
MuseumLassText:
	text "Kids grow up"
	line "so fast…"
	done

Columbia:
	jumptext _Museum2FText6

_Museum2FText6:
	text "SPACE SHUTTLE"
	line "COLUMBIA"
	done

MoonStones:
	jumptext _Museum2FText7

_Museum2FText7:
	text "Meteorite that"
	line "fell on MT.MOON."
	cont "(MOON STONE?)"
	done

KantoMuseum2F_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  7,  7, KANTO_MUSEUM_1F, 5

	db 0 ; coord events

	db 2 ; bg events
	bg_event 11,  2, BGEVENT_READ, Columbia
	bg_event 2,  5, BGEVENT_READ, MoonStones

	db 5 ; object events
	object_event  $1, $7, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MuseumYoungster, -1
	object_event  $0, $5, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MuseumUpstairGramps, -1
	object_event  $7, $5, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MuseumUpstairScientist, -1
	object_event  $b, $5, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MuseumKid, -1
	object_event  $c, $5, SPRITE_LASS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MuseumLass, -1
