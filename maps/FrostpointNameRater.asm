	const_def 2 ; object constants
	const FrostpointNameRater_NAME_RATER

FrostpointNameRater_MapScripts:
	db 1 ; scene scripts
	scene_script .DummyScene

	db 0 ; callbacks

.DummyScene:
	end

FrostpointNameRater:
	jumptextfaceplayer FrostpointNameRaterText
	end
	
FrostpointNameRaterText:
	text "NORTH ISLAND is"
	line "cold and remote."
	para "We don't get many"
	line "visitors."
	para "But those who live"
	line "here are a close"
	cont "community."
	done


FrostpointNameRaterRadio:
	jumpstd radio2

FrostpointNameRater_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, FROSTPOINT_TOWN, 5
	warp_event  5,  7, FROSTPOINT_TOWN, 5

	db 0 ; coord events


	db 1 ; bg events
	bg_event  4,  1, BGEVENT_READ, FrostpointNameRaterRadio

	db 1 ; object events
	object_event  2,  3, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, FrostpointNameRater, -1
