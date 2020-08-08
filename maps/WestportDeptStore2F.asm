	const_def 2 ; object constants
	const GOLDENRODDEPTSTORE2F_CLERK1
	const GOLDENRODDEPTSTORE2F_CLERK2
	const GOLDENRODDEPTSTORE2F_YOUNGSTER
	const GOLDENRODDEPTSTORE2F_COOLTRAINER_F
	const GOLDENRODDEPTSTORE2F_GENTLEMAN

WestportDeptStore2F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

WestportDeptStore2FClerk1Script:
	faceplayer
	opentext
	pokemart MARTTYPE_STANDARD, MART_GOLDENROD_2F_1
	closetext
	end

WestportDeptStore2FClerk2Script:
	faceplayer
	opentext
	pokemart MARTTYPE_STANDARD, MART_GOLDENROD_2F_2
	closetext
	end

WestportDeptStore2FYoungsterScript:
	jumptextfaceplayer WestportDeptStore2FYoungsterText

WestportDeptStore2FCooltrainerFScript:
	jumptextfaceplayer WestportDeptStore2FCooltrainerFText

WestportDeptStore2FGentlemanScript:
	jumptextfaceplayer WestportDeptStore2FGentlemanText

WestportDeptStore2FDirectory:
	jumptext WestportDeptStore2FDirectoryText

WestportDeptStore2FElevatorButton:
	jumpstd elevatorbutton

WestportDeptStore2FUnusedText1:
; unused
	text "We intend to sell"
	line "items for #MON"
	cont "to hold."

	para "This is a free"
	line "gift. Have a #-"
	cont "MON hold it."
	done

WestportDeptStore2FUnusedText2:
; unused
	text "By giving #MON"
	line "items to hold, I"

	para "bet trainers will"
	line "develop new battle"
	cont "techniques."
	done

WestportDeptStore2FYoungsterText:
	text "#GEAR can store"
	line "up to ten phone"
	cont "numbers."

	para "It's hard to de-"
	line "cide which numbers"
	cont "to keep."
	done

WestportDeptStore2FCooltrainerFText:
	text "A # DOLL is"
	line "useful to have"
	para "when you're having"
	line "trouble escaping"
	cont "a wild #MON."
	done

WestportDeptStore2FGentlemanText:
	text "This DEPT.STORE"
	line "makes me realize"

	para "that WESTPORT CITY"
	line "is growing fast."

	para "The selection here"
	line "is unmatched any-"
	cont "where else."
	done

WestportDeptStore2FDirectoryText:
	text "Your Travel"
	line "Companion"

	para "2F TRAINER'S"
	line "   MARKET"
	done

WestportDeptStore2F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event 12,  0, WESTPORT_DEPT_STORE_3F, 1
	warp_event 15,  0, WESTPORT_DEPT_STORE_1F, 3
	warp_event  2,  0, WESTPORT_DEPT_STORE_ELEVATOR, 1

	db 0 ; coord events

	db 2 ; bg events
	bg_event 14,  0, BGEVENT_READ, WestportDeptStore2FDirectory
	bg_event  3,  0, BGEVENT_READ, WestportDeptStore2FElevatorButton

	db 5 ; object events
	object_event 13,  5, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WestportDeptStore2FClerk1Script, -1
	object_event 14,  5, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WestportDeptStore2FClerk2Script, -1
	object_event  9,  6, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WestportDeptStore2FYoungsterScript, -1
	object_event  6,  2, SPRITE_LASS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, WestportDeptStore2FCooltrainerFScript, -1
	object_event  2,  6, SPRITE_PHARMACIST, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WestportDeptStore2FGentlemanScript, -1
