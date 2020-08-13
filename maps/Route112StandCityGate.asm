	const_def 2 ; object constants
	const ROUTE36RUINSOFALPHGATE_OFFICER
	const ROUTE36RUINSOFALPHGATE_GRAMPS
	const ROUTE36RUINSOFALPHGATE_RIVAL

Route112StandCityGate_MapScripts:
	db 2 ; scene scripts
	scene_script .SceneRoute112StandCityGateRival ; SCENE_DEFAULT
	scene_script .SceneRoute112StandCityGateNothing ;

	db 0 ; callbacks

.SceneRoute112StandCityGateRival
	end

.SceneRoute112StandCityGateNothing
	end
	
R36GateMoveIntoPlace1:
	applymovement PLAYER, R36M1
	jump Route36GateRivalScript
	end
	
R36GateMoveIntoPlace2:
	applymovement PLAYER, R36M2
	jump Route36GateRivalScript
	end
	
R36GateMoveIntoPlace3:
	applymovement PLAYER, R36M3
	jump Route36GateRivalScript
	end
	
R36GateMoveIntoPlace4:
	applymovement PLAYER, R36M4
	jump Route36GateRivalScript
	end
	
Route36GateRivalScript:
	disappear ROUTE36RUINSOFALPHGATE_RIVAL
	pause 10
	playsound SFX_EXIT_BUILDING
	waitsfx
	playmusic MUSIC_RIVAL_ENCOUNTER
	moveobject ROUTE36RUINSOFALPHGATE_RIVAL, 4, 7
	appear ROUTE36RUINSOFALPHGATE_RIVAL
	applymovement ROUTE36RUINSOFALPHGATE_RIVAL, R36DummyMove
	pause 20
	opentext
	writetext R36GSilverGreets
	waitbutton
	closetext
	applymovement ROUTE36RUINSOFALPHGATE_RIVAL, R36GSilverWalksToYou
	opentext
	writetext R36GSilverGreets2
	waitbutton
	closetext
	showemote EMOTE_SHOCK, ROUTE36RUINSOFALPHGATE_RIVAL, 15
	opentext
	writetext R36GSilverGreets3
	waitbutton
	closetext
	pause 5
	applymovement ROUTE36RUINSOFALPHGATE_RIVAL, SilverChecksGuard
	pause 25
	opentext
	writetext R36GSilverGreets3_5
	waitbutton
	closetext
	turnobject ROUTE36RUINSOFALPHGATE_RIVAL, RIGHT
	opentext
	writetext R36GSilverGreets4
	waitbutton
	closetext
	applymovement ROUTE36RUINSOFALPHGATE_RIVAL, SilverChecksGuard2
	pause 5
	checkevent EVENT_GOT_CRUIZE_FROM_ELM
	iftrue .R36GCruise
	checkevent EVENT_GOT_CHIKORITA_FROM_ELM
	iftrue .R36GCHIKORITA
	winlosstext Route36GSilverWinText, Route36GSilverLossText
	loadtrainer RIVAL1, RIVAL1_4_CRUIZE
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump .R36GAfterBattle

.R36GCruise:
	winlosstext Route36GSilverWinText, Route36GSilverLossText
	loadtrainer RIVAL1, RIVAL1_4_CHIKORITA
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump .R36GAfterBattle

.R36GCHIKORITA:
	winlosstext Route36GSilverWinText, Route36GSilverLossText
	loadtrainer RIVAL1, RIVAL1_4_FLAMBEAR
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump .R36GAfterBattle

.R36GAfterBattle:
	playmusic MUSIC_RIVAL_AFTER
	opentext
	writetext Route36GRivalAfterText
	waitbutton
	closetext
	applymovement ROUTE36RUINSOFALPHGATE_RIVAL, Route36GRivalBattleExitMovement
	playsound SFX_ENTER_DOOR
	disappear ROUTE36RUINSOFALPHGATE_RIVAL
	setscene SCENE_ROUTE_36_RUINS_OF_ALPH_GATE_NOTHING
	setevent EVENT_GAVE_KENYA
	waitsfx
	playmapmusic
	end

	
Route112StandCityGateOfficerScript:
;	clearevent EVENT_ILEX_FOREST_FARFETCHD
;	setevent EVENT_CLEARED_RADIO_TOWER
;	setevent EVENT_BEAT_CHUCK
;	setevent EVENT_ILEX_FOREST_APPRENTICE
;	setevent EVENT_BLACKTHORN_CITY_SUPER_NERD_DOES_NOT_BLOCK_GYM
	jumptextfaceplayer Route112StandCityGateOfficerText

Route112StandCityGateGrampsScript:
	faceplayer
	opentext
	checkflag EVENT_BLACKTHORN_CITY_SUPER_NERD_DOES_NOT_BLOCK_GYM
	iftrue .RocketsGoneRoute36Gate
	writetext StandCitySomethingIsUpText
	waitbutton
	closetext
	end
	
.RocketsGoneRoute36Gate
	writetext StandCityIsDoingBetterText
	waitbutton
	closetext
	end

SilverChecksGuard2:
	step RIGHT
	step RIGHT
	turn_head UP
	step_end

SilverChecksGuard:
	step LEFT
	step LEFT
	step_end

Route36GRivalBattleExitMovement:
	step RIGHT
	step UP
	step UP
	step UP
	step UP
	step_end

R36DummyMove:
	step_end
	
R36M1:
	step DOWN
	step RIGHT
	step DOWN
	step_end
	
R36M2:
	step DOWN
	step DOWN
	step_end
	
R36M3:
	step LEFT
	step DOWN
	step DOWN
	step_end
	
R36M4:
	step DOWN
	step LEFT
	step LEFT
	step DOWN
	step_end
	
R36GSilverWalksToYou:
	step UP
	step UP
	step UP
	step_end
	
Route36GSilverWinText:
	text "What? Again!?"
	done
	
Route36GSilverLossText:
	text "Haha! Yes!"
	done
	
Route36GRivalAfterText:
	text "Wow, you actually"
	line "seem to be raising"
	para "your #MON to be"
	line "pretty strong!"
	para "I gotta step it up"
	line "even more!"
	para "Also, be careful"
	line "if you're heading"
	cont "into STAND CITY."
	para "There seems to be"
	line "some sort of"
	para "#MON illness"
	line "going around."
	para "Don't want your"
	line "#MON getting"
	para "sick if you want"
	line "them to be strong!"
	para "Anyways, I'm off!"
	line "see you around!"
	done
	
R36GSilverGreets:
	text "<PLAY_G>!"
	done
	
R36GSilverGreets2:
	text "Long time no see!"
	para "How have your"
	line "travels been"
	cont "going?"
	para "Wait, hold on!"
	para "I don't really"
	line "care about that!"
	para "What I want to"
	line "know is how strong"
	para "your team has"
	line "gotten!"
	para "My #MON are so"
	line "strong!"
	para "I'm almost ready"
	line "to take on the"
	cont "LEAGUE!"
	para "Here, let me show"
	line "you!"
	done
	
R36GSilverGreets3:
	text "Oh, wait!"
	para "Let me make sure"
	line "we're okay to"
	cont "battle in here!"
	done
	
R36GSilverGreets3_5:
	text "…"
	done
	
R36GSilverGreets4:
	text "Okay!"
	para "He says we're good"
	line "as long as we're"
	cont "careful!"
	para "Here I come!"
	done
	
StandCityIsDoingBetterText:
	text "I'm glad all of"
	line "the #MON are"
	cont "feeling better."
	done

Route112StandCityGateOfficerText:
	text "STAND CITY is"
	line "known for its"
	para "beautiful greenery"
	line "and parks."
	done

StandCitySomethingIsUpText:
	text "Something is going"
	line "on in STAND CITY."
	para "I swear I've seen"
	line "men who look like"
	para "members of TEAM"
	line "ROCKET."
	done

Route112StandCityGate_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  4,  0, ROUTE_112, 1
	warp_event  5,  0, ROUTE_112, 2
	warp_event  4,  7, STAND_CITY, 7
	warp_event  5,  7, STAND_CITY, 8

	db 4 ; coord events
	coord_event 3, 1, SCENE_DEFAULT, R36GateMoveIntoPlace1
	coord_event 4, 1, SCENE_DEFAULT, R36GateMoveIntoPlace2
	coord_event 5, 1, SCENE_DEFAULT, R36GateMoveIntoPlace3
	coord_event 6, 1, SCENE_DEFAULT, R36GateMoveIntoPlace4

	db 0 ; bg events

	db 3 ; object events
	object_event  0,  4, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route112StandCityGateOfficerScript, -1
	object_event  7,  5, SPRITE_GRAMPS, SPRITEMOVEDATA_WANDER, 1, 2, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, Route112StandCityGateGrampsScript, -1
	object_event  4,  9, SPRITE_SILVER, SPRITEMOVEDATA_STANDING_UP, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_GAVE_KENYA
