	const_def 2 ; object constants
	const NORTH_ISLAND_TWIN
	const NORTH_ISLAND_ROCKER
	const NORTH_ISLAND_TEACHER

CinnabarIsland_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint

.FlyPoint:
	setflag ENGINE_FLYPOINT_CINNABAR
	return


CinnabarIslandGymSign:
	jumptext CinnabarIslandGymSignText

CinnabarIslandSign:
	jumptext CinnabarIslandSignText

CinnabarIslandPokecenterSign:
	jumpstd pokecentersign
	
CinnabarIslandMartSign:
	jumpstd martsign

CinnabarIslandHiddenRareCandy:
	hiddenitem RARE_CANDY, EVENT_CINNABAR_ISLAND_HIDDEN_RARE_CANDY

CinnabarIslandBlueTeleport:
	teleport_from
	step_end
	
NorthIslandTwinScript:
	jumptextfaceplayer NorthIslandTwinText

NorthIslandRockerScript:
	jumptextfaceplayer NorthIslandRockerText

NorthIslandTeacherScript:
	jumptextfaceplayer NorthIslandTeacherText
	
NorthIslandTwinText:
	text "I love the snow!"
	para "I also love"
	line "swimming, but it's"
	para "too cold here to"
	line "spend too long"
	cont "in the water."
	done
	
NorthIslandRockerText:
	text "The air is so"
	line "crisp and clean"
	cont "here."
	para "I could never live"
	line "in a smoggy city."
	done
	
NorthIslandTeacherText:
	text "Did you come"
	line "through the"
	cont "DEEPWATER PASSAGE?"
	para "It's difficult to"
	line "get here by water"
	para "because of the"
	line "whirlpools along"
	cont "the way."
	para "PRYCE's wife knows"
	line "a secret technique"
	para "that allows"
	line "#MON to cross"
	cont "whirlpools."
	done

CinnabarIslandGymSignText:
	text "DEEPWATER PASSAGE"
	line "North Entrance"
	done

CinnabarIslandSignText:
	text "NORTH ISLAND"

	para "The frigid land"
	line "of hardy people"
	done

CinnabarIsland_MapEvents:
	db 0, 0 ; filler

	db 5 ; warp events
	warp_event 13, 12, CINNABAR_POKECENTER_1F, 1
	warp_event 11,  5, DRAGONS_DEN_1F, 8
	warp_event 15,  8, LAVENDER_MART, 1
	warp_event  5,  7, LAVENDER_SPEECH_HOUSE, 1
	warp_event  5, 11, LAVENDER_NAME_RATER, 1

	db 0 ; coord events

	db 5 ; bg events
	bg_event 14, 12, BGEVENT_READ, CinnabarIslandPokecenterSign
	bg_event 16,  8, BGEVENT_READ, CinnabarIslandMartSign
	bg_event 12,  6, BGEVENT_READ, CinnabarIslandGymSign
	bg_event  8, 14, BGEVENT_READ, CinnabarIslandSign
	bg_event  8,  6, BGEVENT_ITEM, CinnabarIslandHiddenRareCandy

	db 3 ; object events
	object_event  8, 11, SPRITE_TWIN, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, NorthIslandTwinScript, -1
	object_event 13,  7, SPRITE_ROCKER, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, NorthIslandRockerScript, -1
	object_event  6,  9, SPRITE_TEACHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, NorthIslandTeacherScript, -1
