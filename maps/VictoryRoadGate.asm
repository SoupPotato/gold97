	const_def 2 ; object constants
	const VICTORYROADGATE_OFFICER
	const VICTORYROADGATE_COOLTRAINERM
	const VICTORYROADGATE_COOLTRAINERF

VictoryRoadGate_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_DEFAULT
	scene_script .DummyScene1 ; SCENE_FINISHED

	db 0 ; callbacks

.DummyScene0:
	end

.DummyScene1:
	end

VictoryRoadGateBadgeCheckScene:
	turnobject PLAYER, LEFT
	jump VictoryRoadGateBadgeCheckScript

VictoryRoadGateOfficerScript:
	faceplayer
VictoryRoadGateBadgeCheckScript:
	opentext
	writetext VictoryRoadGateOfficerText
	buttonsound
	checkevent EVENT_GOT_A_POKEMON_FROM_OAK
	iffalse .NoPokemonEvenYet
	checkcode VAR_BADGES
	ifgreater NUM_JOHTO_BADGES - 1, .AllEightBadges
	writetext VictoryRoadGateNotEnoughBadgesText
	waitbutton
	closetext
	applymovement PLAYER, VictoryRoadGateStepDownMovement
	end

.NoPokemonEvenYet
	writetext VictoryRoadGateNotEvenATrainer
	waitbutton
	closetext
	applymovement PLAYER, VictoryRoadGateStepDownMovement
	end

.AllEightBadges:
	writetext VictoryRoadGateEightBadgesText
	waitbutton
	closetext
	setscene SCENE_FINISHED
	end

VictoryRoadGateStepDownMovement:
	step DOWN
	step_end
	
VictoryRoadGateCooltrainerMScript:
	jumptextfaceplayer VictoryRoadGateCooltrainerMText
	
VictoryRoadGateCooltrainerFScript:
	jumptextfaceplayer VictoryRoadGateCooltrainerFText
	
VictoryRoadGateCooltrainerMText:
	text "I can't believe"
	line "it!"
	para "It's almost time"
	line "for me to take on"
	cont "the LEAGUE!"
	para "I've been waiting"
	line "my whole life for"
	cont "this!"
	done
	
VictoryRoadGateCooltrainerFText:
	text "PRINCELY PATH may"
	line "be a cakewalk, but"
	para "the real challenge"
	line "is making it to"
	para "the top of MT.FUJI"
	line "from PRINCE CITY."
	done
	
VictoryRoadGateNotEvenATrainer:
	text "You don't even"
	line "appear to be a"
	cont "#MON trainer."
	para "Sorry, kid. But I"
	line "can only let"
	para "qualified trainers"
	line "pass through."
	done

VictoryRoadGateOfficerText:
	text "Only trainers who"
	line "have proven them-"
	cont "selves may pass."
	done

VictoryRoadGateNotEnoughBadgesText:
	text "You don't have"
	line "eight badges."
	para "I'm sorry, but"
	line "only trainers with"
	para "enough badges are"
	line "permitted to enter"
	para "PRINCE CITY and"
	line "climb MT.FUJI."
	done

VictoryRoadGateEightBadgesText:
	text "Ah! Eight badges!"

	para "You have proven"
	line "yourself worthy."
	para "Please, go on"
	line "through!"
	done

VictoryRoadGate_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  9, 17, SILENT_TOWN, 7
	warp_event 10, 17, SILENT_TOWN, 7
	warp_event  9,  0, CROWN_PASS, 1
	warp_event 10,  0, CROWN_PASS, 1

	db 1 ; coord events
	coord_event 10, 11, SCENE_DEFAULT, VictoryRoadGateBadgeCheckScene

	db 0 ; bg events

	db 3 ; object events
	object_event  8, 11, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VictoryRoadGateOfficerScript, -1
	object_event 12,  3, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VictoryRoadGateCooltrainerMScript, -1
	object_event  7,  2, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VictoryRoadGateCooltrainerFScript, -1
