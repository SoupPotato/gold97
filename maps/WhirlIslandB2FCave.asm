	const_def 2 ; object constants
	const WHIRLISLAND_SUICUNE

WhirlIslandB2FCave_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

SuicuneEvent:
	faceplayer
	opentext
	writetext SuicuneText
	cry SUICUNE
	pause 15
	closetext
	setevent EVENT_RIVAL_TEAM_ROCKET_BASE
;	writecode VAR_BATTLETYPE, BATTLETYPE_ROAMING
	loadwildmon SUICUNE, 40
	startbattle
	disappear WHIRLISLAND_SUICUNE
	reloadmapafterbattle
	end
	
SuicuneText:
	text "Groroa!"
	done


WhirlIslandB2FCave_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  4, 15, WHIRL_ISLAND_B2F, 3

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  4,  2, SPRITE_GROWLITHE, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SuicuneEvent, EVENT_RIVAL_TEAM_ROCKET_BASE
