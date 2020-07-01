	const_def 2 ; object constants
	const WHIRLISLANDLUGIACHAMBER_LUGIA

WhirlIslandLugiaChamber_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks


Lugia:
	faceplayer
	opentext
	writetext LugiaText
	cry LUGIA
	pause 15
	closetext
	setevent EVENT_FOUGHT_LUGIA
	writecode VAR_BATTLETYPE, BATTLETYPE_FORCEITEM
	loadwildmon LUGIA, 6
	startbattle
	disappear WHIRLISLANDLUGIACHAMBER_LUGIA
	reloadmapafterbattle
	end

LugiaText:
	text "Gyaaas!"
	done

WhirlIslandLugiaChamber_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  9, 13, WHIRL_ISLAND_B2F, 3

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  9,  11, SPRITE_LUGIA, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Lugia, -1
