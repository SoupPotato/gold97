	const_def 2 ; object constants
	const WHIRLISLANDB3F_POKE_BALL
	const WHIRLISLANDB3F_SAGE
	const WHIRLISLANDB3F_KURT
	const WHIRLISLANDB3F_CAPTAIN

WhirlIslandB3F_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .AddStairs

.AddStairs:
	checkevent EVENT_LUGIA_CAVE_OPEN
	iffalse .DoneCave
	changeblock   7, 25, $37 ; cave
.DoneCave:
	return
	
	
LugiaEventSceneLeft:
	jump LugiaEventMainScene
	end
	
LugiaEventSceneRight:
	applymovement PLAYER, PlayerWalksToLugiaGroup
	jump LugiaEventMainScene
	end
	
LugiaEventMainScene:
	showemote EMOTE_SHOCK, WHIRLISLANDB3F_KURT, 15
	turnobject PLAYER, RIGHT
	opentext
	writetext KurtKnewItSilver
	waitbutton
	closetext
	showemote EMOTE_SHOCK,WHIRLISLANDB3F_CAPTAIN, 15
	turnobject PLAYER, LEFT
	opentext
	writetext CaptainCantBelieveSilver
	waitbutton
	closetext
	opentext
	writetext SageTellsYouToSeeBirdSilver
	waitbutton
	closetext
	setscene SCENE_DEFAULT
	end
	
	
SageScriptSilver:
	checkevent EVENT_LUGIA_CAVE_OPEN
	iftrue .DuringLugia
	setevent EVENT_GOT_5F_SAGE_BLESSING
	faceplayer
	opentext
	writetext Text_5FSage
	waitbutton
	closetext
	end
	
.DuringLugia
	faceplayer
	opentext
	writetext Text_5FSageDuringLugia
	waitbutton
	closetext
	end
	
PlayerWalksToLugiaGroup:
	step LEFT
	step_end

KurtScriptSilver:
	jumptext KurtKnewItSilver
	
CaptainScriptSilver:
	jumptext CaptainCantBelieveSilver

KurtKnewItSilver:
	text "KURT: I knew I was"
	line "right when I"
	para "sensed something"
	line "about you."
	done
	
CaptainCantBelieveSilver:
	text "I can't believe"
	line "it!"
	para "The return of the"
	line "bird!"
	para "It's happening!"
	done
	
SageTellsYouToSeeBirdSilver:
	text "<PLAY_G>."
	para "LUGIA roosts"
	line "inside this cave."
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
	line "the cave."
	done
	
Text_5FSageDuringLugia:
	text "The bird awaits."
	done
	
WhirlIslandsB3FEscapeRope:
	itemball ESCAPE_ROPE

WhirlIslandB3F_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 11,  5, WHIRL_ISLAND_B2F, 4
	warp_event  7, 25, WHIRL_ISLAND_LUGIA_CHAMBER, 1

	db 2 ; coord events
	coord_event  7, 27, SCENE_LUGIA_EVENT, LugiaEventSceneLeft
	coord_event  8, 27, SCENE_LUGIA_EVENT, LugiaEventSceneRight

	db 0 ; bg events

	db 4 ; object events
	object_event 13, 31, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, WhirlIslandsB3FEscapeRope, EVENT_WHIRL_ISLANDS_B3F_ESCAPE_ROPE
	object_event  6, 27, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SageScriptSilver, EVENT_WHIRL_ISLANDS_SAGE_GONE
	object_event  8, 26, SPRITE_KURT, SPRITEMOVEDATA_STANDING_LEFT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KurtScriptSilver, EVENT_WHIRL_ISLANDS_SAGE_GONE
	object_event  6, 26, SPRITE_CAPTAIN, SPRITEMOVEDATA_STANDING_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CaptainScriptSilver, EVENT_WHIRL_ISLANDS_SAGE_GONE
