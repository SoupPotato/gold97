	const_def 2 ; object constants
	const WHIRLISLAND_SUICUNE

TidalGrotto1F_MapScripts:
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
	writecode VAR_BATTLETYPE, BATTLETYPE_ROAMING
	loadwildmon SUICUNE, 40
	startbattle
	disappear WHIRLISLAND_SUICUNE
	reloadmapafterbattle
	end

SuicuneText:
	text "Groroa!"
	done

TidalGrotto1F_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  3,  2, TIDAL_GROTTO_B1F, 1
	warp_event 18, 33, TIDAL_GROTTO_B1F, 2

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event 19, 24, SPRITE_GROWLITHE, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SuicuneEvent, EVENT_RIVAL_TEAM_ROCKET_BASE
