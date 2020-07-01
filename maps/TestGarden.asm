	const_def 1 ; object constants
	const TESTGARDEN_OFFICER
	const TESTGARDEN_OFFICER2
	const TESTGARDEN_CLERK
	const TESTGARDEN_SHINY

TestGarden_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TestGardenClerkScript:
	faceplayer
	opentext
	pokemart MARTTYPE_STANDARD, MART_TEST_GARDEN
	closetext
	end

TestGardenOfficerScript:
	jumptextfaceplayer TestGardenOfficerText
	
TestGardenOfficer2Script:
	jumptextfaceplayer TestGardenOfficer2Text
	
	
ShinyPokeScript:
	faceplayer
	opentext
	writetext ShinyPokeText
	cry ZAPDOS
	pause 15
	closetext
	writecode VAR_BATTLETYPE, BATTLETYPE_SHINY
	loadwildmon SNORLAX, 1
	startbattle
	reloadmapafterbattle
	end
	
ShinyPokeText:
	text "Zyah!"
	done

TestGardenOfficerText:
	text "Welcome to the"
	line "Test Garden!"
	para "I don't know how"
	line "you got here, but"
	para "this is where"
	line "the developer"
	para "tested new #MON"
	line "encounters, along"
	para "with anything else"
	line "that might need"
	cont "testing!"
	done

TestGardenOfficer2Text:
	text "I made the #MON"
	line "storage system!"

	para "I truly hope you"
	line "find it useful."
	
	para "It's a great tool"
	line "if you want to"
	para "catch every single"
	line "#MON! Anyways,"

	para "I have to hurry on"
	line "back to GOLDENROD"
	cont "and see my folks."

	para "Buh-bye!"
	done

TestGarden_MapEvents:
	db 0, 0 ; filler

	db 5 ; warp events
	warp_event  5, 14, GOLDENROD_CITY, 18
	warp_event  4, 14, GOLDENROD_CITY, 18
	warp_event 13,  2, GOLDENROD_POKECENTER_1F, 1
	warp_event  3,  5, SILVER_CAVE_ROOM_1, 1
	warp_event 11, 13, OLD_CITY, 11

	db 0 ; coord events

	db 0 ; bg events

	db 4 ; object events
	object_event  7,  2, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, TestGardenOfficerScript, -1
	object_event  8,  2, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TestGardenClerkScript, -1
	object_event  6,  2, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TestGardenOfficer2Script, -1
	object_event  5, 12, SPRITE_LASS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ShinyPokeScript, -1
