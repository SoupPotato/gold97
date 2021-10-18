	const_def 2
	const RIC_HO_OH
	const RIC_LUGIA
	const RIC_BLUE

RainbowIslandCave_MapScripts:
	db 1 ; scene scripts
	scene_script .DummyScene ; SCENE_DEFAULT

	db 0 ; callbacks

.DummyScene:
	end


BlueScriptRIC:
	faceplayer
	checkevent EVENT_RAINBOW_ISLE_CAVE_BLUE_TOLD_LEGEND
	iftrue .secondpart
	opentext
	writetext BlueTellsLegendText
	waitbutton
	closetext
	setevent EVENT_RAINBOW_ISLE_CAVE_BLUE_TOLD_LEGEND
.secondpart
	opentext
	writetext BlueTellsYouToGoThereText
	waitbutton
	closetext
	end

StandingOnStartTile:
	checkevent EVENT_RAINBOW_ISLE_RESTORED
	iftrue .end
	checkevent EVENT_RAINBOW_ISLE_CAVE_BLUE_TOLD_LEGEND
	iffalse .end
	turnobject RIC_BLUE, LEFT
	writebyte HO_OH
	special FindPartyMonThatSpecies
	iffalse .notinparty
	writebyte LUGIA
	special FindPartyMonThatSpecies
	iffalse .notinparty
	
	opentext ; at this point it's confirmed you've got both and the event is a go
	writetext BlueHaveThemBothText
	waitbutton
	closetext
	playmusic MUSIC_NONE
	special FadeOutPalettes
	appear RIC_HO_OH
	appear RIC_LUGIA
	playsound SFX_BALL_POOF
	pause 10
	cry HO_OH
	pause 10
	playsound SFX_BALL_POOF
	pause 10
	cry LUGIA
	special LoadMapPalettes
	special FadeInPalettes
	pause 20
	playmusic MUSIC_GS_OPENING_2
	turnobject PLAYER, UP
	turnobject RIC_BLUE, UP
	follow RIC_HO_OH, RIC_LUGIA
	applymovement RIC_HO_OH, LegendsDanceStep1
	playsound SFX_RAIN_DANCE
	pause 20
	applymovement RIC_HO_OH, LegendsDanceStep2
	playsound SFX_EMBER
	pause 20
	applymovement RIC_HO_OH, LegendsDanceStep3
	playsound SFX_RAIN_DANCE
	pause 20
	applymovement RIC_HO_OH, LegendsDanceStep4
	playsound SFX_EMBER
	pause 20
	special FadeOutPalettes
	special LoadMapPalettes
	special FadeInPalettes
	applymovement RIC_HO_OH, LegendsDanceStep5
	stopfollow
	applymovement RIC_LUGIA, LegendsDanceStep6
	follow RIC_HO_OH, RIC_LUGIA
	applymovement RIC_HO_OH, LegendsDanceStep7
	special FadeOutPalettes
	special LoadMapPalettes
	special FadeInPalettes
	playsound SFX_SHINE
	stopfollow
	pause 25
	special FadeOutPalettes
	disappear RIC_HO_OH
	disappear RIC_LUGIA
	pause 10
	playsound SFX_BALL_POOF
	pause 10
	playsound SFX_BALL_POOF
	special LoadMapPalettes
	special FadeInPalettes
	
	setevent EVENT_RAINBOW_ISLE_CAVE_OBJECTS_HIDDEN
	setevent EVENT_RAINBOW_ISLE_RESTORED
	clearevent EVENT_RAINBOW_ISLE_BLUE_BATTLE_HIDDEN
	
	turnobject RIC_BLUE, LEFT
	turnobject PLAYER, RIGHT
	opentext
	writetext BlueAfterEventText
	waitbutton
	closetext
	special FadeOutPalettes
	pause 16
	warpsound
	disappear RIC_BLUE
	setevent EVENT_RAINBOW_ISLE_CAVE_BLUE_HIDDEN
	special LoadMapPalettes
	special FadeInPalettes
.end
	end

.notinparty
	opentext
	writetext BlueDontHaveMonsText
	waitbutton
	closetext
	turnobject RIC_BLUE, UP
	end


LegendsDanceStep1:
	step DOWN
	jump_step DOWN
	step_end

LegendsDanceStep2:
	jump_step RIGHT
	step_end

LegendsDanceStep3:
	step UP
	jump_step UP
	step_end

LegendsDanceStep4:
	jump_step LEFT
	step_end

LegendsDanceStep5:
	step DOWN
	jump_step DOWN
	step_end

LegendsDanceStep6:
	step DOWN
	step_end

LegendsDanceStep7:
	step RIGHT
	step_end


BlueAfterEventText:
	text "Quick! Outside!"
	
	para "Meet me on the"
	line "northmost point!"
	done

BlueDontHaveMonsText:
	text "If you can get"
	line "both LEGENDARY"
	cont "#MON somehow,"
	cont "stand there!"
	done

BlueHaveThemBothText:
	text "Woah!? You went"
	line "and actually got"
	cont "HO-OH and LUGIA!?"
	
	para "This is amazing!"
	
	para "Alright! Send em'"
	line "out and let's get"
	cont "things started!"
	done

BlueTellsLegendText:
	text "Alright, you made"
	line "it here!"
	
	para "So here's what I"
	line "found out…"
	
	para "This island used"
	line "to be home to a"
	cont "tribe of people"
	cont "that performed a"
	cont "ritual here to"
	cont "summon a pair"
	cont "of LEGENDARY"
	cont "#MON!"
	
	para "In the text it"
	line "said that the"
	cont "rainbows that"
	cont "cover the island"
	cont "were made when"
	cont "LUGIA's rains"
	cont "filled the sky,"
	cont "then were cleared"
	cont "by HO-OH's SACRED"
	cont "FIRE!"
	
	para "What the text"
	line "lacked was any"
	cont "description of"
	cont "how to perform"
	cont "the ritual!"
	
	para "So, I have no"
	line "idea how to get"
	cont "HO-OH and LUGIA"
	cont "here to perform."
	done
	
BlueTellsYouToGoThereText:
	text "This might be an"
	line "extra tall order,"
	cont "but if you can"
	cont "somehow get both"
	cont "HO-OH and LUGIA"
	cont "here, maybe we"
	cont "can restore the"
	cont "island!"
	
	para "If you do, stand"
	line "over on the other"
	cont "side of this"
	cont "waterfall!"
	done



RainbowIslandCave_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  8, 17, RAINBOW_ISLAND, 1

	db 1 ; coord events
	coord_event  6,  6, SCENE_DEFAULT, StandingOnStartTile

	db 0 ; bg events

	db 3 ; object events
	object_event  7,  2, SPRITE_HO_OH, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0,ObjectEvent, EVENT_RAINBOW_ISLE_CAVE_OBJECTS_HIDDEN
	object_event  7,  2, SPRITE_LUGIA, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_RAINBOW_ISLE_CAVE_OBJECTS_HIDDEN
	object_event  9,  6, SPRITE_BLUE, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BlueScriptRIC, EVENT_RAINBOW_ISLE_CAVE_BLUE_HIDDEN
	