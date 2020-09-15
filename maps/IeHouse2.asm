	const_def 2
	const IENPCHOUSE2

IeHouse2_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Ie2NPCScript:
	jumptextfaceplayer Ie2NPCText
	
Ie2NPCText:
	text "There's an old"
	line "folktake in this"
	cont "village about a"
	cont "sad woman who"
	cont "climbed the peak"
	cont "at CASTLE MOUNT-"
	cont "AIN and fell to"
	cont "her death."
	
	para "Some say her"
	line "spirit is still"
	cont "haunting around"
	cont "the CASTLE to"
	cont "this day."
	done

IeHouse2_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, IE_TOWN, 5
	warp_event  5,  7, IE_TOWN, 5

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  4,  3, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Ie2NPCScript, -1
