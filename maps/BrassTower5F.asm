	const_def 2 ; object constants
	const TINTOWER5F_SAGE1
	const TINTOWER5F_KURT
	const TINTOWER5F_CAPTAIN

BrassTower5F_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .AddStairs

.AddStairs:
	checkevent EVENT_EARLS_ACADEMY_EARL
	iffalse .DoneStairs
	changeblock   0,  5, $3C ; ladder
.DoneStairs:
	return

BrassTower5FSageScript:
	checkevent EVENT_FOUGHT_HO_OH
	iftrue .AfterHoOh
	checkevent EVENT_EARLS_ACADEMY_EARL
	iftrue .DuringHoOh
	setevent EVENT_GOT_5F_SAGE_BLESSING
	faceplayer
	opentext
	writetext Text_5FSage
	waitbutton
	closetext
	end
	
.AfterHoOh
	faceplayer
	opentext
	writetext Text_5FSageAfterHoOh
	waitbutton
	closetext
	end
	
.DuringHoOh
	faceplayer
	opentext
	writetext Text_5FSageDuringHoOh
	waitbutton
	closetext
	end
	
HoOhEventSceneUp:
	applymovement PLAYER, PlayerWalksToHoOhGroup1
	jump HoOhEventMainScene
	end
	
HoOhEventSceneLeft:
	applymovement PLAYER, PlayerWalksToHoOhGroup2
	jump HoOhEventMainScene
	end
	
HoOhEventMainScene:
	showemote EMOTE_SHOCK, TINTOWER5F_KURT, 15
	opentext
	writetext KurtKnewIt
	waitbutton
	closetext
	showemote EMOTE_SHOCK, TINTOWER5F_CAPTAIN, 15
	opentext
	writetext CaptainCantBelieve
	waitbutton
	closetext
	applymovement TINTOWER5F_SAGE1, SageOneStepDown
	opentext
	writetext SageTellsYouToSeeBird
	waitbutton
	closetext
	setscene SCENE_DEFAULT
	end
	
SageOneStepDown:
	step DOWN
	step_end
	
PlayerWalksToHoOhGroup2:
	step LEFT
	step LEFT
	turn_head UP
	step_end
	
PlayerWalksToHoOhGroup1:
	step LEFT
	step LEFT
	step DOWN
	step LEFT
	turn_head UP
	step_end
	
KurtKnewIt:
	text "KURT: I knew I was"
	line "right when I"
	para "sensed something"
	line "about you."
	done
	
CaptainCantBelieve:
	text "I can't believe"
	line "it!"
	para "The return of the"
	line "bird!"
	para "It's happening!"
	done
	
SageTellsYouToSeeBird:
	text "<PLAY_G>."
	para "Ho-Oh roosts above"
	line "our heads."
	para "The bird has"
	line "returned, as"
	para "predicted in"
	line "legend."
	para "I sense that it"
	line "wants to meet"
	cont "you."
	para "It has determined"
	line "that actions you"
	para "have taken have"
	line "shown that you are"
	para "worthy of"
	line "approaching it."
	para "Make your way to"
	line "the roof."
	done
	
Text_5FSageDuringHoOh:
	text "The bird awaits."
	done

Text_5FSageAfterHoOh:
	text "Such an encounter"
	line "with the bird is"
	cont "a legendary event."
	done
	
Text_5FSage:
	text "Welcome to the top"
	line "of the BRASS"
	cont "TOWER."
	
	para "This is a sacred"
	line "place that should"
	cont "only be visited by"
	cont "those willing to"
	cont "show proper re"
	cont "-spect."
	
	para "I understand that"
	line "FALKNER has asked"
	cont "you to scale its"
	cont "floors."
	
	para "I hope you can go"
	line "forward with the"
	cont "knowledge and"
	cont "understanding of"
	cont "how to properly"
	cont "treat #MON."
	
	para "You may return to"
	line "FALKNER."
	
	para "You have my"
	line "blessing."
	done

SproutTower5FSign:
	setevent EVENT_READ_5F5F_SIGN
	jumptext SproutTower5FSignText

	
SproutTower5FSignText:
	text "This is a statue"
	line "of an ABRA."
	para "ABRA are easily"
	line "startled and quick"
	para "to flee when"
	line "encountered in the"
	cont "wild."
	para "Be sure to honor"
	line "and respect all"
	para "#MON in their"
	line "natural habitats."
	done
	
SproutTower5FIncense:
	jumptext SproutTower5FIncenseText

SproutTower5FIncenseText:
	text "What is this?"
	para "Oh, it's an"
	line "incense burner!"
	done

BrassTower5F_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  5,  5, BRASS_TOWER_4F, 2
	warp_event  0,  5, BRASS_TOWER_ROOF, 1

	db 2 ; coord events
	coord_event  5,  4, SCENE_HO_OH_EVENT, HoOhEventSceneUp
	coord_event  4,  5, SCENE_HO_OH_EVENT, HoOhEventSceneLeft

	db 2 ; bg events
	bg_event 4, 1, BGEVENT_READ, SproutTower5FSign
	bg_event 3, 0, BGEVENT_READ, SproutTower5FIncense


	db 3 ; object events
	object_event  2,  3, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_DOWN, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BrassTower5FSageScript, -1
	object_event  1,  3, SPRITE_KURT, SPRITEMOVEDATA_STANDING_DOWN, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BrassTower5FSageScript, EVENT_SLOWPOKE_WELL_SLOWPOKES
	object_event  3,  3, SPRITE_CAPTAIN, SPRITEMOVEDATA_STANDING_DOWN, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BrassTower5FSageScript, EVENT_SLOWPOKE_WELL_SLOWPOKES
