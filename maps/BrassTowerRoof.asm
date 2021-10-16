	const_def 2 ; object constants
	const TINTOWERROOF_HO_OH

BrassTowerRoof_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TinTowerHoOh:
	faceplayer
	opentext
	writetext HoOhText
	cry HO_OH
	pause 15
	closetext
IF DEF(_GOLD)
	setevent EVENT_FOUGHT_HO_OH
	clearevent EVENT_ALLOY_CAPTAIN_AND_TOWER_SAGES_GONE
	setmapscene PAGOTA_CITY, SCENE_DEFAULT
	setevent EVENT_BRASS_TOWER_ELDER_SAGE_GONE
	clearevent EVENT_RIVAL_AZALEA_TOWN
	clearevent EVENT_RIVAL_TEAM_ROCKET_BASE
	clearevent EVENT_AMPARE_CAVERN_RAIKOU
	writecode VAR_BATTLETYPE, BATTLETYPE_FORCEITEM
	loadwildmon HO_OH, 45
	startbattle
	disappear TINTOWERROOF_HO_OH
	setevent EVENT_RELEASED_THE_BEASTS
	reloadmapafterbattle
	end
	
ELIF DEF(_SILVER)
	setevent EVENT_FOUGHT_HO_OH
	writecode VAR_BATTLETYPE, BATTLETYPE_FORCEITEM
	loadwildmon HO_OH, 70
	startbattle
	disappear TINTOWERROOF_HO_OH
	setevent EVENT_RELEASED_THE_BEASTS
	reloadmapafterbattle
	end
ENDC


HoOhText:
	text "Shaoooh!"
	done

BrassTowerRoof_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  9, 13, BRASS_TOWER_5F, 2

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  9,  7, SPRITE_HO_OH, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, TinTowerHoOh, EVENT_FOUGHT_HO_OH
