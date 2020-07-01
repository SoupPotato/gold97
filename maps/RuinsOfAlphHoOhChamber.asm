RuinsOfAlphHoOhChamber_MapScripts:
	db 2 ; scene scripts
	scene_script .CheckWall ; SCENE_DEFAULT
	scene_script .DummyScene ; SCENE_FINISHED

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .HiddenDoors

.CheckWall:
	end


.DummyScene:
	end

.HiddenDoors:
	checkevent EVENT_WALL_OPENED_IN_HO_OH_CHAMBER
	iftrue .WallOpen
.WallOpen:
	checkevent EVENT_SOLVED_HO_OH_PUZZLE
	iffalse .FloorClosed
	return

.FloorClosed:
	changeblock 2, 2, $01 ; left floor
	changeblock 4, 2, $02 ; right floor
	return

.WallOpenScript:
	end

RuinsOfAlphHoOhChamberPuzzle:
	refreshscreen
	writebyte UNOWNPUZZLE_HO_OH
	special UnownPuzzle
	closetext
	iftrue .PuzzleComplete
	end

.PuzzleComplete:
	setevent EVENT_RUINS_OF_ALPH_INNER_CHAMBER_TOURISTS
	setevent EVENT_SOLVED_HO_OH_PUZZLE
	setflag ENGINE_UNLOCKED_UNOWNS_X_TO_Z
	setmapscene RUINS_OF_ALPH_INNER_CHAMBER, SCENE_RUINSOFALPHINNERCHAMBER_STRANGE_PRESENCE
	earthquake 30
	showemote EMOTE_SHOCK, PLAYER, 15
	changeblock 2, 2, $18 ; left hole
	changeblock 4, 2, $19 ; right hole
	reloadmappart
	playsound SFX_STRENGTH
	earthquake 80
	applymovement PLAYER, RuinsOfAlphHoOhChamberSkyfallTopMovement
	playsound SFX_KINESIS
	waitsfx
	pause 20
	warpcheck
	end

RuinsOfAlphHoOhChamberAncientReplica:
	jumptext RuinsOfAlphHoOhChamberAncientReplicaText

RuinsOfAlphHoOhChamberDescriptionSign:
	jumptext RuinsOfAlphHoOhChamberDescriptionText

RuinsOfAlphHoOhChamberWallPatternLeft:
	opentext
	writetext RuinsOfAlphHoOhChamberWallPatternLeftText
	writebyte UNOWNWORDS_HO_OH
	special DisplayUnownWords
	closetext
	end

RuinsOfAlphHoOhChamberWallPatternRight:
	checkevent EVENT_WALL_OPENED_IN_HO_OH_CHAMBER
	iftrue .WallOpen
	opentext
	writetext RuinsOfAlphHoOhChamberWallPatternRightText
	writebyte UNOWNWORDS_HO_OH
	special DisplayUnownWords
	closetext
	end

.WallOpen:
	opentext
	writetext RuinsOfAlphHoOhChamberWallHoleText
	waitbutton
	closetext
	end

RuinsOfAlphHoOhChamberSkyfallTopMovement:
	skyfall_top
	step_end

RuinsOfAlphHoOhChamberWallPatternLeftText:
	text "Patterns appeared"
	line "on the walls…"
	done

RuinsOfAlphHoOhChamberUnownText:
; unused
	text "It's UNOWN text!"
	done

RuinsOfAlphHoOhChamberWallPatternRightText:
	text "Patterns appeared"
	line "on the walls…"
	done

RuinsOfAlphHoOhChamberWallHoleText:
	text "There's a big hole"
	line "in the wall!"
	done

RuinsOfAlphHoOhChamberAncientReplicaText:
	text "It's a replica of"
	line "an ancient #-"
	cont "MON."
	done

RuinsOfAlphHoOhChamberDescriptionText:
	text "A #MON that"
	line "flew gracefully on"

	para "rainbow-colored"
	line "wings."
	done

RuinsOfAlphHoOhChamber_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  3,  9, RUINS_OF_ALPH_OUTSIDE, 1
	warp_event  4,  9, RUINS_OF_ALPH_OUTSIDE, 1
	warp_event  3,  3, RUINS_OF_ALPH_INNER_CHAMBER, 2
	warp_event  4,  3, RUINS_OF_ALPH_INNER_CHAMBER, 3

	db 0 ; coord events

	db 4 ; bg events
	bg_event  2,  3, BGEVENT_READ, RuinsOfAlphHoOhChamberAncientReplica
	bg_event  5,  3, BGEVENT_READ, RuinsOfAlphHoOhChamberAncientReplica
	bg_event  3,  2, BGEVENT_UP, RuinsOfAlphHoOhChamberPuzzle
	bg_event  4,  2, BGEVENT_UP, RuinsOfAlphHoOhChamberDescriptionSign

	db 0 ; object events
