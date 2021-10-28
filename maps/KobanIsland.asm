	const_def 2 ; object constants
	const KOBANISLAND_GRANNY
	const KOBANISLAND_TWIN
	const KOBANISLAND_GRAMPS
	const KOBANISLAND_CLAIR

KobanIsland_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint

.FlyPoint:
	setflag ENGINE_FLYPOINT_KOBAN
	return

KobanIslandTeacherScript:
	jumptextfaceplayer KobanIslandTeacherText

KobanIslandGrampsScript:
	jumptextfaceplayer KobanIslandGrampsText

KobanIslandFisherScript:
	jumptextfaceplayer KobanIslandFisherText

KobanPokecenterSign:
	jumpstd pokecentersign

KobanMartSign:
	jumpstd martsign

KobanIslandSign:
	jumptext KobanIslandSignText

DragonsMawSign:
	jumptext DragonsMawSignText
	
KobanIslandClairScript:
	faceplayer
	opentext
	writetext ClairGreetingsText
	waitbutton
	closetext
	wait 2
	checkcode VAR_FACING
	ifequal RIGHT, .ClairWalksAroundPlayer
	applymovement KOBANISLAND_CLAIR, ClairLeavesMovement
	disappear KOBANISLAND_CLAIR
	setevent EVENT_KOBAN_ISLAND_CLAIR_BLOCKING_DRAGONS_MAW
	clearevent EVENT_CLAIRS_HOUSE_HIDE_CLAIR
	end

.ClairWalksAroundPlayer
	applymovement KOBANISLAND_CLAIR, ClairLeavesMovement2
	disappear KOBANISLAND_CLAIR
	setevent EVENT_KOBAN_ISLAND_CLAIR_BLOCKING_DRAGONS_MAW
	clearevent EVENT_CLAIRS_HOUSE_HIDE_CLAIR
	end

KobanIslandTeacherText:
	text "Water currents"
	line "help keep this"
	para "island slightly"
	line "warmer than BLUE"
	para "FOREST, which is"
	line "just east of here."
	done

KobanIslandGrampsText:
	text "The trainers of"
	line "this town have a"
	para "longstanding"
	line "tradition of"
	cont "raising DRAGONs."
	done

KobanIslandFisherText:
	text "One day I want"
	line "to raise a DRAGON!"
	done

KobanIslandSignText:
	text "KOBAN ISLAND"
	para "A small island"
	line "with big history."
	done

DragonsMawSignText:
	text "DRAGON'S MAW"
	done
	
ClairGreetingsText:
	text "Greetings."
	para "Who might you be?"
	para "…"
	para "Well, <PLAY_G>,"
	line "my name is CLAIR."
	para "I am NIHON's most"
	line "notable DRAGON"
	cont "MASTER."
	para "…Well, the"
	line "second most."
	para "But what matters"
	line "here is that"
	para "behind me is the"
	line "DRAGON'S MAW."
	para "It is a mystical"
	line "place where it"
	para "is said DRAGON"
	line "#MON first came"
	cont "to live."
	para "Do you have any"
	line "DRAGON #MON?"
	para "If you want to"
	line "be respected among"
	para "DRAGON trainers,"
	line "you should train"
	cont "in the cave."
	para "Inside are several"
	line "DRAGON trainers."
	para "One of them holds"
	line "the DRAGON ORB."
	para "Find which trainer"
	line "has the ORB, and"
	cont "bring it to me."
	para "This is your first"
	line "step to being a"
	para "respected DRAGON"
	line "TRAINER."
	para "I'll be waiting in"
	line "my house."
	done

ClairLeavesMovement:
	step LEFT
	step DOWN
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step_end
	
ClairLeavesMovement2:
	step DOWN
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step_end

KobanIsland_MapEvents:
	db 0, 0 ; filler

	db 5 ; warp events
	warp_event  5,  5, KOBAN_CLAIRS_HOUSE, 1
	warp_event  5, 10, KOBAN_MART, 1
	warp_event  9, 10, KOBAN_POKECENTER_1F, 1
	warp_event 15,  9, KOBAN_FISHER_HOUSE, 1
	warp_event 13,  5, DRAGONS_MAW, 1

	db 0 ; coord events

	db 4 ; bg events
	bg_event 10, 10, BGEVENT_READ, KobanPokecenterSign
	bg_event  6, 10, BGEVENT_READ, KobanMartSign
	bg_event 10, 14, BGEVENT_READ, KobanIslandSign
	bg_event 14,  6, BGEVENT_READ, DragonsMawSign

	db 4 ; object events
	object_event  9,  6, SPRITE_GRANNY, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KobanIslandTeacherScript, -1
	object_event  8, 12, SPRITE_TWIN, SPRITEMOVEDATA_SPINRANDOM_SLOW, 2, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, KobanIslandFisherScript, -1
	object_event 13, 11, SPRITE_GRAMPS, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KobanIslandGrampsScript, -1
	object_event 13,  6, SPRITE_CLAIR, SPRITEMOVEDATA_STANDING_DOWN, 0, 0 , -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, KobanIslandClairScript, EVENT_KOBAN_ISLAND_CLAIR_BLOCKING_DRAGONS_MAW
