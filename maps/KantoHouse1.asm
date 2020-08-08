	const_def 2 ; object constants
	const KANTOHOUSE_1_TWIN
	const KANTOHOUSE_1_BUGCATCHER
	const KANTOHOUSE_1_TEACHER

KantoHouse1_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

KantoHouse1Twin:
	jumptextfaceplayer KantoHouse1TwinText
	
KantoHouse1BugCatcher:
	jumptextfaceplayer KantoHouse1BugCatcherText
	
KantoHouse1Teacher:
	jumptextfaceplayer KantoHouse1TeacherText
	
KantoHouse1TwinText:
	text "One day, I'll be"
	line "stronger than RED!"
	done
	
KantoHouse1BugCatcherText:
	text "Maybe I could"
	line "beat the LEAGUE"
	para "with just BUG"
	line "#MON…"
	done
	
KantoHouse1TeacherText:
	text "Both of my young"
	line "children just love"
	cont "#MON."
	para "I was never a"
	line "trainer, so some-"
	para "times I'm not sure"
	line "what to tell them"
	para "about raising"
	line "#MON."
	done

KantoHouse1_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, KANTO_REGION, 24
	warp_event  5,  7, KANTO_REGION, 24

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  1,  5, SPRITE_TWIN, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KantoHouse1Twin, -1
	object_event  7,  3, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KantoHouse1BugCatcher, -1
	object_event  4,  3, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KantoHouse1Teacher, -1
