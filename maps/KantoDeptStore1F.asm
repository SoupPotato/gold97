	const_def 2 ; object constants
	const CELADONDEPTSTORE1F_RECEPTIONIST
	const CELADONDEPTSTORE1F_GENTLEMAN
	const CELADONDEPTSTORE1F_TEACHER

KantoDeptStore1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

KantoDeptStore1FReceptionistScript:
	jumptextfaceplayer KantoDeptStore1FReceptionistText

KantoDeptStore1FGentlemanScript:
	jumptextfaceplayer KantoDeptStore1FGentlemanText

KantoDeptStore1FTeacherScript:
	jumptextfaceplayer KantoDeptStore1FTeacherText

KantoDeptStore1FDirectory:
	jumptext KantoDeptStore1FDirectoryText

KantoDeptStore1FElevatorButton:
	jumpstd elevatorbutton

KantoDeptStore1FReceptionistText:
	text "Hello! Welcome to"
	line "KANTO DEPT.STORE!"

	para "The directory is"
	line "on the wall."
	done

KantoDeptStore1FGentlemanText:
	text "This DEPT.STORE is"
	line "part of the same"

	para "chain as the one"
	line "in WESTPORT CITY."

	para "They were both"
	line "renovated at the"
	cont "same time."
	done

KantoDeptStore1FTeacherText:
	text "This is my first"
	line "time here."

	para "It's so big…"

	para "I'm afraid I'll"
	line "get lost."
	done

KantoDeptStore1FDirectoryText:
	text "1F: SERVICE"
	line "    COUNTER"

	para "2F: TRAINER'S"
	line "    MARKET"

	para "3F: TM SHOP"

	para "4F: WISEMAN GIFTS"

	para "5F: DRUG STORE"

	para "6F: ROOFTOP"
	line "    SQUARE"
	done

KantoDeptStore1F_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event 13,  7, KANTO_REGION, 1
	warp_event 14,  7, KANTO_REGION, 13
	warp_event 15,  0, KANTO_DEPT_STORE_2F, 2
	warp_event  2,  0, KANTO_DEPT_STORE_ELEVATOR, 1

	db 0 ; coord events

	db 2 ; bg events
	bg_event 14,  0, BGEVENT_READ, KantoDeptStore1FDirectory
	bg_event  3,  0, BGEVENT_READ, KantoDeptStore1FElevatorButton

	db 3 ; object events
	object_event  7,  1, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, KantoDeptStore1FReceptionistScript, -1
	object_event 11,  4, SPRITE_GENTLEMAN, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KantoDeptStore1FGentlemanScript, -1
	object_event  5,  6, SPRITE_TEACHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, KantoDeptStore1FTeacherScript, -1
