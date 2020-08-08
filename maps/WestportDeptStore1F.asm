	const_def 2 ; object constants
	const GOLDENRODDEPTSTORE1F_RECEPTIONIST
	const GOLDENRODDEPTSTORE1F_POKEFAN_F
	const GOLDENRODDEPTSTORE1F_BUG_CATCHER
	const GOLDENRODDEPTSTORE1F_GENTLEMAN

WestportDeptStore1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

WestportDeptStore1FReceptionistScript:
	jumptextfaceplayer WestportDeptStore1FReceptionistText

WestportDeptStore1FGentlemanScript:
	jumptextfaceplayer WestportDeptStore1FGentlemanText

WestportDeptStore1FPokefanFScript:
	jumptextfaceplayer WestportDeptStore1FPokefanFText

WestportDeptStore1FBugCatcherScript:
	jumptextfaceplayer WestportDeptStore1FBugCatcherText

WestportDeptStore1FDirectory:
	jumptext WestportDeptStore1FDirectoryText

WestportDeptStore1FElevatorButton:
	jumpstd elevatorbutton

WestportDeptStore1FReceptionistText:
	text "Welcome to the"
	line "WESTPORT CITY"
	cont "DEPT. STORE."
	done

WestportDeptStore1FGentlemanText:
	text "The DEPT.STORE"
	line "has a decent se-"
	cont "lection."

	para "But some items"
	line "are only available"

	para "in the vendor"
	line "shops in the"
	cont "basement."
	done

WestportDeptStore1FPokefanFText:
	text "I'm raring to shop"
	line "again today!"
	done

WestportDeptStore1FBugCatcherText:
	text "Mom's good at"
	line "bargain hunting."

	para "She always buys"
	line "stuff at lower"
	cont "prices."
	done

WestportDeptStore1FDirectoryText:
	text "1F SERVICE COUNTER"

	para "2F TRAINER'S"
	line "   MARKET"

	para "3F BATTLE"
	line "   COLLECTION"

	para "4F MEDICINE BOX"

	para "5F TM CORNER"

	para "6F TRANQUIL SQUARE"
	done

WestportDeptStore1F_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event 13,  7, WESTPORT_CITY, 5
	warp_event 14,  7, WESTPORT_CITY, 9
	warp_event 15,  0, WESTPORT_DEPT_STORE_2F, 2
	warp_event  2,  0, WESTPORT_DEPT_STORE_ELEVATOR, 1

	db 0 ; coord events

	db 2 ; bg events
	bg_event 14,  0, BGEVENT_READ, WestportDeptStore1FDirectory
	bg_event  3,  0, BGEVENT_READ, WestportDeptStore1FElevatorButton

	db 4 ; object events
	object_event  7,  1, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WestportDeptStore1FReceptionistScript, -1
	object_event  6,  5, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WestportDeptStore1FPokefanFScript, -1
	object_event  6,  6, SPRITE_LASS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, WestportDeptStore1FBugCatcherScript, -1
	object_event 11,  5, SPRITE_GENTLEMAN, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WestportDeptStore1FGentlemanScript, -1
