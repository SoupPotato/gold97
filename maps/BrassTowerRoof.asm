	const_def 2 ; object constants
	const TINTOWERROOF_HO_OH

BrassTowerRoof_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .HoOh

.HoOh:
	checkevent EVENT_FOUGHT_HO_OH
	iftrue .NoAppear
	jump .Appear

.Appear:
	appear TINTOWERROOF_HO_OH
	return

.NoAppear:
	disappear TINTOWERROOF_HO_OH
	return

TinTowerHoOh:
	faceplayer
	opentext
	writetext HoOhText
	cry HO_OH
	pause 15
	closetext
	setevent EVENT_FOUGHT_HO_OH
	clearevent EVENT_OLD_CITY_EARL
	setmapscene PAGOTA_CITY, SCENE_DEFAULT
	setevent EVENT_SLOWPOKE_WELL_SLOWPOKES
	clearevent EVENT_RIVAL_AZALEA_TOWN
	clearevent EVENT_RIVAL_TEAM_ROCKET_BASE
	clearevent EVENT_AZALEA_TOWN_SLOWPOKES
	writecode VAR_BATTLETYPE, BATTLETYPE_FORCEITEM
	loadwildmon HO_OH, 45
;	writecode VAR_BATTLETYPE, BATTLETYPE_LEGENDKANTO
	startbattle
	disappear TINTOWERROOF_HO_OH
	setevent EVENT_RELEASED_THE_BEASTS
	reloadmapafterbattle
	setevent EVENT_SET_WHEN_FOUGHT_HO_OH
	end

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
	object_event  9,  7, SPRITE_HO_OH, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, TinTowerHoOh, EVENT_TIN_TOWER_ROOF_HO_OH
