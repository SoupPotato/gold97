	const_def 2 ; object constants
	const FROSTPOINT_TWIN
	const FROSTPOINT_ROCKER
	const FROSTPOINT_TEACHER
	const FROSTPOINT_FRUIT_TREE

FrostpointTown_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint

.FlyPoint:
	setflag ENGINE_FLYPOINT_CINNABAR
	return

FrostpointTownFruitTree:
	fruittree FRUITTREE_FROSTPOINT_TOWN
	
FrostpointTownGymSign:
	jumptext FrostpointTownGymSignText

FrostpointTownSign:
	jumptext FrostpointTownSignText

FrostpointTownPokecenterSign:
	jumpstd pokecentersign
	
FrostpointTownMartSign:
	jumpstd martsign

FrostpointTownHiddenRareCandy:
	hiddenitem RARE_CANDY, EVENT_CINNABAR_ISLAND_HIDDEN_RARE_CANDY

FrostpointTownBlueTeleport:
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

FrostpointTownGymSignText:
	text "DEEPWATER PASSAGE"
	line "North Entrance"
	done

FrostpointTownSignText:
	text "FROSTPOINT TOWN"

	para "The frigid land"
	line "of hardy people"
	done

FrostpointTown_MapEvents:
	db 0, 0 ; filler

	db 5 ; warp events
	warp_event 13, 12, FROSTPOINT_POKECENTER_1F, 1
	warp_event 11,  5, DEEPWATER_PASSAGE_1F, 8
	warp_event 15,  8, FROSTPOINT_MART, 1
	warp_event  5,  7, PRYCES_FAMILY_HOUSE, 1
	warp_event  5, 11, FROSTPOINT_NAME_RATER, 1

	db 0 ; coord events

	db 5 ; bg events
	bg_event 14, 12, BGEVENT_READ, FrostpointTownPokecenterSign
	bg_event 16,  8, BGEVENT_READ, FrostpointTownMartSign
	bg_event 12,  6, BGEVENT_READ, FrostpointTownGymSign
	bg_event  8, 14, BGEVENT_READ, FrostpointTownSign
	bg_event  8,  6, BGEVENT_ITEM, FrostpointTownHiddenRareCandy

	db 4 ; object events
	object_event  8, 11, SPRITE_TWIN, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, NorthIslandTwinScript, -1
	object_event 13,  7, SPRITE_ROCKER, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, NorthIslandRockerScript, -1
	object_event  6,  9, SPRITE_TEACHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, NorthIslandTeacherScript, -1
	object_event 10,  9, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, FrostpointTownFruitTree, -1
