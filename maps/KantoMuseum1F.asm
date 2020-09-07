	const_def 2 ; object constants
	const MUSEUM_NPC_1
	const MUSEUM_NPC_2
	const MUSEUM_NPC_3
	const MUSEUM_NPC_4
	const MUSEUM_NPC_5

KantoMuseum1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

MuseumCounterScientist:
	jumptext MuseumCounterScientistText
	
MuseumCounterScientistText:
	text "Welcome to the"
	line "PEWTER MUSEUM OF"
	cont "SCIENCE! Enjoy"
	cont "your visit!"
	done
	
MuseumCounterScientistBehind:
	jumptextfaceplayer MuseumCounterScientistBehindText
	
MuseumCounterScientistBehindText:
	text "Erm… I would much"
	line "prefer if you"
	cont "would come in the"
	cont "front entrance."
	done
	
MuseumGramps:
	jumptextfaceplayer MuseumGrampsText
	
MuseumGrampsText:
	text "I'm just the"
	line "janitor here, but"
	cont "I spend so much"
	cont "time around bones"
	cont "that I might as"
	cont "well be a"
	cont "paleontologist!"
	done

MuseumScientistAmber:
	checkevent EVENT_PICKED_UP_OLD_AMBER
	iftrue .aftertext
	jumptextfaceplayer MuseumScientistAmberText
.aftertext
	jumptextfaceplayer ScientistAfterAmberTakenText
	
MuseumScientistAmberText:
	text "Hey! A #MON"
	line "trainer!"
	
	para "You're in luck"
	line "today kid!"
	
	para "I just got done"
	line "researching this"
	cont "OLD AMBER chunk"
	cont "and it most"
	cont "certainly holds"
	cont "ancient #MON"
	cont "DNA!"
	
	para "If you take this"
	line "down to the boys"
	cont "at CINNABAR LAB,"
	cont "you'll get an"
	cont "AERODACTYL!"
	
	para "How do I know?"
	line "I discovered it!"
	done

ScientistAfterAmberTakenText:
	text "Taking it huh?"
	
	para "Well good luck,"
	line "I hear raising"
	cont "an AERODACTYL is"
	cont "a handful!"
	
	para "They're quite"
	line "ferocious!"
	done

MuseumOtherScientist:
	jumptextfaceplayer MuseumOtherScientistText
	
MuseumOtherScientistText:
	text "What is it with"
	line "kids sneaking in"
	cont "around here?"
	
	para "Fine! Just don't"
	line "break or steal"
	cont "anything, got it?"
	done

OldAmberItemSprite:
	itemball OLD_AMBER

KabutopsFossil:
	jumptext KabutopsFossilText
	
KabutopsFossilText:
	text "Woah! It's a full"
	line "skeleton of a"
	cont "KABUTOPS!"
	done
	
AerodactylFossil:
	jumptext AerodactylFossilText
	
AerodactylFossilText:
	text "Wow! It's a full"
	line "skeleton of an"
	cont "AERODACTYL!"
	done


KantoMuseum1F_MapEvents:
	db 0, 0 ; filler

	db 5 ; warp events
	warp_event 10,  7, KANTO_REGION, 39
	warp_event 11,  7, KANTO_REGION, 39
	warp_event 16,  7, KANTO_REGION, 40
	warp_event 17,  7, KANTO_REGION, 40
	warp_event  7,  7, KANTO_MUSEUM_2F,1

	db 0 ; coord events

	db 3 ; bg events
	bg_event 2,  3, BGEVENT_READ, KabutopsFossil
	bg_event 2,  6, BGEVENT_READ, AerodactylFossil
	bg_event 11,  4, BGEVENT_READ, MuseumCounterScientist

	db 5 ; object events
	object_event  $c, $4, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MuseumCounterScientistBehind, -1
	object_event  $1, $4, SPRITE_GRAMPS, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MuseumGramps, -1
	object_event  $f, $2, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MuseumScientistAmber, -1
	object_event  $11, $4, SPRITE_SCIENTIST, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MuseumOtherScientist, -1
	object_event  $10, $2, SPRITE_OLD_AMBER, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, OldAmberItemSprite, EVENT_PICKED_UP_OLD_AMBER

