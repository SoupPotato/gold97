	const_def 2 ; object constants
	const EASTWARD_SUMMIT_MOLTRES

CharredSummit_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .Moltres

.Moltres:
	checkevent EVENT_EXPLODING_TRAP_4
	iftrue .NoAppearM
	checkitem RED_SCALE; change this to whatever becomes the tri-wing
	iftrue .AppearM
	jump .NoAppearM

.AppearM:
	appear EASTWARD_SUMMIT_MOLTRES
	return

.NoAppearM:
	disappear EASTWARD_SUMMIT_MOLTRES
	return
	
MoltresScript:
	faceplayer
	opentext
	writetext MoltresText
	cry MOLTRES
	pause 15
	closetext
	setevent EVENT_EXPLODING_TRAP_4
	writecode VAR_BATTLETYPE, BATTLETYPE_LEGENDKANTO
	loadwildmon MOLTRES, 40
	startbattle
	disappear EASTWARD_SUMMIT_MOLTRES
	reloadmapafterbattle
	end
	
MoltresText:
	text "Moa!"
	done


CharredSummit_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 13, 35, CHARRED_SUMMIT_CAVE, 1
	warp_event  7, 21, CHARRED_SUMMIT_CAVE, 2

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event 10,  2, SPRITE_MOLTRES, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, MoltresScript, EVENT_EXPLODING_TRAP_7
