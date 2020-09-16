	const_def 2
	const CM_B1F_EXEC
	const CM_B1F_DRAGONITE
	const CM_B1F_ITEMBALL1
	const CM_B1F_ITEMBALL2

CastleMountainB1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

DragoniteSteps:
	slow_step DOWN
	slow_step DOWN
	slow_step DOWN
	step_end


ArianaDungeonScript:
	faceplayer
	opentext
	writetext OuchFallText
	waitbutton
	closetext
	playsound SFX_RAGE
	pause 15
	special FadeOutMusic
	turnobject CM_B1F_EXEC, UP
	opentext
	writetext DidYouHearThatText
	waitbutton
	closetext
	turnobject PLAYER, UP
	playsound SFX_SURF
	pause 10
	appear CM_B1F_DRAGONITE
	applymovement CM_B1F_DRAGONITE, DragoniteSteps
	pause 10
	opentext
	writetext DragoniteCryText
	cry DRAGONITE
	pause 15
	closetext
	opentext
	writetext IThinkHesAngryText
	waitbutton
	writetext DragoniteCryText
	cry DRAGONITE
	pause 15
	loadwildmon DRAGONITE, 60
	writecode VAR_BATTLETYPE, BATTLETYPE_SHINY
	startbattle
	disappear CM_B1F_DRAGONITE
	reloadmapafterbattle
	turnobject CM_B1F_EXEC, RIGHT
	turnobject PLAYER, LEFT
	opentext
	writetext DontForgetTRText
	waitbutton
	closetext
	special FadeOutPalettes
	disappear CM_B1F_EXEC
	playsound SFX_ESCAPE_ROPE
	pause 10
	special LoadMapPalettes
	special FadeInPalettes
	setevent EVENT_CASTLE_B1F_SPRITES_NOT_SHOWN
	setevent EVENT_CASTLE_MTN_EVENTS_COMPLETE
	setevent EVENT_CM3A_NUGGET1
	setevent EVENT_CM3A_NUGGET2
	setevent EVENT_CM3A_NUGGET3
	setevent EVENT_CM3A_NUGGET4
	setevent EVENT_CM3A_NUGGET5
	setevent EVENT_CM3A_NUGGET6
	setevent EVENT_CM3A_NUGGET7
	setevent EVENT_CM3A_NUGGET8
	clearevent EVENT_DESERTER_ROCKET_GRUNT
	end
	
OuchFallText:
	text "Ouch... I should"
	line "have looked at"
	cont "the trap door"
	cont "levers more"
	cont "carefully..."
	
	para "This is all"
	line "your fault!"
	
	para "If you hadn't"
	line "been there to"
	cont "blow the whole"
	cont "RADIO TOWER"
	cont "operation then"
	cont "my unit wouldn't"
	cont "be hiding out in"
	cont "this dump in the"
	cont "first place!"
	done

DidYouHearThatText:
	text "...Did you hear"
	line "something?"
	done


DragoniteCryText:
	text "DRAGONITE: KYUUUU!"
	done

	
IThinkHesAngryText:
	text "No way! That old"
	line "town legend was"
	cont "true! It's the"
	cont "GREEN DRAGON!"
	
	para "A-and it's looking"
	line "pretty angry!"
	done

DontForgetTRText:
	text "Whew..."
	
	para "Don't think I'll"
	line "just let what"
	cont "you've done here"
	cont "slide!"
	
	para "You saw the truth"
	line "for yourself at"
	cont "the NIHON LEAGUE!"
	
	para "GIOVANNI is still"
	line "just as much in"
	cont "power as ever!"
	
	para "TEAM ROCKET's got"
	line "operatives in"
	cont "places all over"
	cont "the world!"
	
	para "We'll be back!"
	line "Count on it you"
	cont "little twerp!"
	done

CMB1Itemball1:
	itemball KINGS_ROCK
	
CMB1Itemball2:
	itemball ESCAPE_ROPE

CastleMountainB1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event 25,  3, CASTLE_MOUNTAIN_1F_STAIRS, 5
	warp_event  4, 27, CASTLE_MOUNTAIN_3FB, 0
	warp_event 15,  7, CASTLE_MOUNTAIN_3FB, 0

	db 0 ; coord events

	db 0 ; bg events

	db 4 ; object events
	object_event 14,  7, SPRITE_ERIKA, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ArianaDungeonScript, EVENT_CASTLE_B1F_SPRITES_NOT_SHOWN
	object_event 14,  2, SPRITE_DRAGON, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_CASTLE_DRAGONITE_NOT_SHOWN
	object_event 26, 23, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, CMB1Itemball1, EVENT_CMB1_ITEMBALL1
	object_event 15, 15, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, CMB1Itemball2, EVENT_CMB1_ITEMBALL2
