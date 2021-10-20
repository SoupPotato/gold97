	const_def 2 ; object constants
	const BLACKTHORN_GYM_1F_MEWTWO
	const BLACKTHORN_GYM_1F_MEW

ResearchFacilityBackRoom_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks


MewtwoScript:
	faceplayer
	opentext
	writetext MewtwoText
	cry MEWTWO
	pause 15
	closetext
	setevent EVENT_FOUGHT_MEWTWO
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	;setflag ENGINE_GOT_SHUCKIE_TODAY (this is never checked anywhere why is it used? Removed to free up a wDailyFlags1 flag)
	writecode VAR_BATTLETYPE, BATTLETYPE_LEGENDKANTO
	loadwildmon MEWTWO, 70
	startbattle
	disappear BLACKTHORN_GYM_1F_MEWTWO
	reloadmapafterbattle
	end

	
MewtwoText:
	text "Mew!"
	done


ResearchFacilityBackRoom_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, RESEARCH_FACILITY_ENTRANCE, 3
	warp_event  5,  7, RESEARCH_FACILITY_ENTRANCE, 4

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  5,  2, SPRITE_MONSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, MewtwoScript, EVENT_FOUGHT_MEWTWO
