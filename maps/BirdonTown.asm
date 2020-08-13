	const_def 2 ; object constants
	const AZALEATOWN_GRAMPS
	const AZALEATOWN_TEACHER
	const AZALEATOWN_YOUNGSTER

BirdonTown_MapScripts:
	db 3 ; scene scripts
	scene_script .DummyScene0 ; SCENE_AZALEATOWN_NOTHING
	scene_script .DummyScene1 ; SCENE_AZALEATOWN_RIVAL_BATTLE
	scene_script .DummyScene2 ; SCENE_AZALEATOWN_KURT_RETURNS_GS_BALL

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .Flypoint

.DummyScene0:
	end

.DummyScene1:
	end

.DummyScene2:
	end

.Flypoint:
	setflag ENGINE_FLYPOINT_AZALEA
	return

BirdonTownGrampsScript:
	jumptextfaceplayer BirdonTownGrampsTextBefore

BirdonTownTeacherScript:
	jumptextfaceplayer BirdonTownTeacherText

BirdonTownYoungsterScript:
	jumptextfaceplayer BirdonTownYoungsterText


BirdonTownSign:
	jumptext BirdonTownSignText


AzaleaGymSign:
	jumptext AzaleaGymSignText

SlowpokeWellSign:
	;setflag ENGINE_EEVEE_SWARM
	;swarm SWARM_EEVEE, ROUTE_31
	;giveitem HM_ROCK_SMASH
	;clearflag ENGINE_ZEPHYRBADGE
	;jumpstd radiotowerrockets
	;setevent EVENT_ROUTE_30_BATTLE
	;opentext
	;verbosegiveitem CLEAR_BELL
	;verbosegiveitem SILVER_WING
	;setevent EVENT_GOT_WATER_STONE_FROM_BILLS_GRANDPA
	;clearevent EVENT_GOLDENROD_DEPT_STORE_B1F_LAYOUT_1
	;clearevent EVENT_GOLDENROD_UNDERGROUND_WAREHOUSE_BLOCKED_OFF
	;setevent EVENT_GOLDENROD_DEPT_STORE_B1F_LAYOUT_1
	;setevent EVENT_GOLDENROD_DEPT_STORE_B1F_LAYOUT_2
	;setevent EVENT_GOLDENROD_DEPT_STORE_B1F_LAYOUT_3; makes lass disappear in yoron house
	;setevent EVENT_GOLDENROD_UNDERGROUND_WAREHOUSE_BLOCKED_OFF;
	;setevent EVENT_EXPLODING_TRAP_5
	;giveitem HM_SURF
	;givepoke BALLERINE, 5
	;givepoke ABRA, 5
	jumptext SlowpokeWellSignText


BirdonTownIlextForestSign:
	jumptext BirdonTownIlexForestSignText

BirdonTownPokecenterSign:
;	setevent EVENT_CLEARED_RADIO_TOWER
;	clearflag ENGINE_ROCKETS_IN_RADIO_TOWER
;	setevent EVENT_GOLDENROD_CITY_ROCKET_TAKEOVER
;	setevent EVENT_RADIO_TOWER_ROCKET_TAKEOVER
;	clearevent EVENT_GOLDENROD_CITY_CIVILIANS
;	clearevent EVENT_RADIO_TOWER_CIVILIANS_AFTER
;	setevent EVENT_TEAM_ROCKET_DISBANDED
;	clearevent EVENT_ILEX_FOREST_FARFETCHD
;	setevent EVENT_GOT_SHUCKIE
;	clearevent EVENT_TELEPORT_GUY
	jumpstd pokecentersign

BirdonTownMartSign:
	jumpstd martsign

WhiteApricornTree:
	fruittree FRUITTREE_AZALEA_TOWN

BirdonTownHiddenFullHeal:
	hiddenitem FULL_HEAL, EVENT_AZALEA_TOWN_HIDDEN_FULL_HEAL


BirdonTownGrampsTextBefore:
	text "ENOKI, the GYM"
	line "LEADER here, is a"
	cont "mysterious man."
	para "Not much is known"
	line "about him."
	para "However, it is"
	line "known that he"
	para "studies NIHON's"
	line "myths and legends."
	para "He is also, of"
	line "course, an"
	cont "excellent trainer."
	done

BirdonTownTeacherText:
	text "We get very little"
	line "rain here."
	para "The SLOWPOKE WELL"
	line "is an important"
	para "part of our"
	line "ecosystem."
	done

BirdonTownYoungsterText:
	text "EAST of here, a"
	line "far ways down the"
	para "road, is the JADE"
	line "FOREST."

	para "Past that is"
	line "ALLOY CITY."
	
	para "The journey there"
	line "is long."
	
	para "Rest here if you"
	line "plan on making"
	cont "your way there."
	done

BirdonTownSlowpokeText1:
	text "SLOWPOKE: …"

	para "<……> <……> <……>"
	done

BirdonTownSlowpokeText2:
	text "<……> <……>Yawn?"
	done


BirdonTownSignText:
	text "BIRDON TOWN"
	para "Desolate in plant"
	line "growth, but not"
	cont "in friendship."
	done


AzaleaGymSignText:
	text "AZALEA TOWN"
	line "#MON GYM"
	cont "LEADER: BUGSY"

	para "The Walking"
	line "Bug #MON"
	cont "Encyclopedia"
	done

SlowpokeWellSignText:
	text "SLOWPOKE WELL"

	para "An oasis for"
	line "SLOWPOKE in an"
	para "otherwise arid"
	line "environment."
	done


BirdonTownIlexForestSignText:
	text "ILEX FOREST"

	para "Enter through the"
	line "gate."
	done

BirdonTown_MapEvents:
	db 0, 0 ; filler

	db 10 ; warp events
	warp_event 15,  4, BIRDON_POKECENTER_1F, 1
	warp_event  3, 13, BIRDON_CAFE, 1
	warp_event  3,  4, BIRDON_MART, 1
	warp_event  4,  9, BIRDON_ELDERS_HOUSE, 1
	warp_event 14, 15, BIRDON_GYM, 1
	warp_event  9,  9, SLOWPOKE_WELL_B1F, 1
	;warp_event  9,  9, AMAMI_POKECENTER_1F, 1
	warp_event  8,  5, ROUTE_116_GATE, 3
	warp_event  9,  5, ROUTE_116_GATE, 4
	warp_event 15, 15, BIRDON_GYM, 2
	warp_event  9, 13, BIRDON_SPEECH_HOUSE, 1

	db 0 ; coord events

	db 7 ; bg events
	bg_event  6, 14, BGEVENT_READ, BirdonTownSign
	bg_event 13, 14, BGEVENT_READ, AzaleaGymSign
	bg_event 11, 10, BGEVENT_READ, SlowpokeWellSign
	bg_event 16,  4, BGEVENT_READ, BirdonTownPokecenterSign
	bg_event  4,  4, BGEVENT_READ, BirdonTownMartSign
	bg_event  0,  0, BGEVENT_READ, BirdonTownIlextForestSign
	bg_event  2,  7, BGEVENT_ITEM, BirdonTownHiddenFullHeal

	db 4 ; object events
	object_event 14, 11, SPRITE_GRAMPS, SPRITEMOVEDATA_WANDER, 1, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BirdonTownGrampsScript, -1
	object_event  6,  6, SPRITE_TEACHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, 1, 1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BirdonTownTeacherScript, -1
	object_event  3, 11, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, BirdonTownYoungsterScript, -1
	object_event 14,  8, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WhiteApricornTree, -1
