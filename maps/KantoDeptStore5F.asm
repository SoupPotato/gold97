	const_def 2 ; object constants
	const CELADONDEPTSTORE5F_CLERK1
	const CELADONDEPTSTORE5F_CLERK2
	const CELADONDEPTSTORE5F_GENTLEMAN
	const CELADONDEPTSTORE5F_SAILOR
	const CELADONDEPTSTORE5F_TEACHER

KantoDeptStore5F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

KantoDeptStore5FClerk1Script:
	faceplayer
	opentext
	pokemart MARTTYPE_STANDARD, MART_CELADON_5F_1
	closetext
	end

KantoDeptStore5FClerk2Script:
	faceplayer
	opentext
	pokemart MARTTYPE_STANDARD, MART_CELADON_5F_2
	closetext
	end

KantoDeptStore5FGentlemanScript:
	jumptextfaceplayer KantoDeptStore5FGentlemanText

KantoDeptStore5FSailorScript:
	jumptextfaceplayer KantoDeptStore5FSailorText

KantoDeptStore5FTeacherScript:
	faceplayer
	opentext
	writetext KantoDeptStore5FTeacherText
	cry SPEAROW
	waitbutton
	closetext
	end

KantoDeptStore5FDirectory:
	jumptext KantoDeptStore5FDirectoryText

KantoDeptStore5FElevatorButton:
	jumpstd elevatorbutton

KantoDeptStore5FGentlemanText:
	text "I want to buy some"
	line "items that raise"

	para "#MON stats, but"
	line "I don't have"
	cont "enough money…"
	done

KantoDeptStore5FSailorText:
	text "I want PP UP, so I"
	line "can raise the PP"

	para "of moves. But you"
	line "can't buy it…"
	done

KantoDeptStore5FTeacherText:
	text "SPEAROW:"
	line "Kwaaa!"
	done

KantoDeptStore5FDirectoryText:
	text "5F: DRUG STORE"
	done

KantoDeptStore5F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event 12,  0, KANTO_DEPT_STORE_4F, 1
	warp_event 15,  0, KANTO_DEPT_STORE_6F, 1
	warp_event  2,  0, KANTO_DEPT_STORE_ELEVATOR, 1

	db 0 ; coord events

	db 2 ; bg events
	bg_event 14,  0, BGEVENT_READ, KantoDeptStore5FDirectory
	bg_event  3,  0, BGEVENT_READ, KantoDeptStore5FElevatorButton

	db 5 ; object events
	object_event  7,  5, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, KantoDeptStore5FClerk1Script, -1
	object_event  8,  5, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, KantoDeptStore5FClerk2Script, -1
	object_event 13,  5, SPRITE_GENTLEMAN, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, KantoDeptStore5FGentlemanScript, -1
	object_event  3,  4, SPRITE_SAILOR, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, KantoDeptStore5FSailorScript, -1
	object_event  2,  5, SPRITE_BIRD, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, KantoDeptStore5FTeacherScript, -1
