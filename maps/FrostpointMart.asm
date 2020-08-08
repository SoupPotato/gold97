	const_def 2 ; object constants
	const LAVENDERMART_CLERK
	const LAVENDERMART_POKEFAN_M
	const LAVENDERMART_ROCKER

FrostpointMart_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

FrostpointMartClerkScript:
	opentext
	pokemart MARTTYPE_STANDARD, MART_LAVENDER
	closetext
	end

FrostpointMartPokefanMScript:
	jumptextfaceplayer FrostpointMartPokefanMText

FrostpointMartRockerScript:
	jumptextfaceplayer FrostpointMartRockerText

FrostpointMartPokefanMText:
	text "REPEL is a neces-"
	line "sity if you are"

	para "going to explore a"
	line "cave."

	para "Even though I like"
	line "exploring, I still"

	para "haven't made it to"
	line "all the caves."
	done

FrostpointMartRockerText:
	text "I heard about a"
	line "craftsman who"

	para "makes custom"
	line "#BALLS down in"
	cont "PAGOTA CITY."
	para "I've never used"
	line "any."
	para "I bet they work"
	line "better than even"
	para "an ULTRA BALL in"
	line "certain scenarios."
	done

FrostpointMart_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, FROSTPOINT_TOWN, 3
	warp_event  5,  7, FROSTPOINT_TOWN, 3

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  1,  3, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, FrostpointMartClerkScript, -1
	object_event  8,  6, SPRITE_POKEFAN_M, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, FrostpointMartPokefanMScript, -1
	object_event  9,  2, SPRITE_ROCKER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, FrostpointMartRockerScript, -1
