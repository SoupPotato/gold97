	const_def 2 ; object constants
	const RUINSOFALPHOUTSIDE_YOUNGSTER1
	const RUINSOFALPHOUTSIDE_SCIENTIST
	const RUINSOFALPHOUTSIDE_FISHER
	const RUINSOFALPHOUTSIDE_YOUNGSTER2
	const RUINSOFALPHOUTSIDE_YOUNGSTER3

RuinsOfAlphOutside_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_RUINSOFALPHOUTSIDE_NOTHING
	scene_script .DummyScene1 ; SCENE_RUINSOFALPHOUTSIDE_GET_UNOWN_DEX

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .ScientistCallback

.DummyScene0:
	end

.DummyScene1:
	end

.ScientistCallback:
	checkflag ENGINE_UNOWN_DEX
	iftrue .NoScientist
	checkevent EVENT_MADE_UNOWN_APPEAR_IN_RUINS
	iftrue .MaybeScientist
	jump .NoScientist

.MaybeScientist:
	checkcode VAR_UNOWNCOUNT
	ifgreater 2, .YesScientist
	jump .NoScientist

.YesScientist:
	checkevent EVENT_TALKED_TO_OUTSIDE_SCIENTIST
	iftrue .ActuallyNoScientist
	appear RUINSOFALPHOUTSIDE_SCIENTIST
	setscene SCENE_RUINSOFALPHOUTSIDE_GET_UNOWN_DEX
	return

.ActuallyNoScientist
	disappear RUINSOFALPHOUTSIDE_SCIENTIST
	setscene SCENE_RUINSOFALPHOUTSIDE_NOTHING
	return

.NoScientist:
	disappear RUINSOFALPHOUTSIDE_SCIENTIST
	setscene SCENE_RUINSOFALPHOUTSIDE_NOTHING
	return

RuinsOfAlphOutsideScientistScene1:
	turnobject RUINSOFALPHOUTSIDE_SCIENTIST, UP
	turnobject PLAYER, DOWN
	jump RuinsOfAlphOutsideScientistSceneContinue

RuinsOfAlphOutsideScientistScript:
	faceplayer
RuinsOfAlphOutsideScientistSceneContinue:
	opentext
	writetext RuinsOfAlphOutsideScientistText
	waitbutton
	closetext
	applymovement RUINSOFALPHOUTSIDE_SCIENTIST, MovementData_0x580ba
	disappear RUINSOFALPHOUTSIDE_SCIENTIST
	setevent EVENT_TALKED_TO_OUTSIDE_SCIENTIST
	setscene SCENE_RUINSOFALPHOUTSIDE_NOTHING
	setmapscene RUINS_OF_ALPH_RESEARCH_CENTER, SCENE_RUINSOFALPHRESEARCHCENTER_GET_UNOWN_DEX
	warpcheck
	end

RuinsOfAlphOutsideFisherScript:
	faceplayer
	opentext
	checkevent EVENT_TALKED_TO_RUINS_COWARD
	iftrue .Next
	setevent EVENT_TALKED_TO_RUINS_COWARD
	writetext RuinsOfAlphOutsideFisherText1
	buttonsound
.Next:
	writetext RuinsOfAlphOutsideFisherText2
	waitbutton
	closetext
	end

RuinsOfAlphOutsideYoungster1Script:
	faceplayer
	opentext
	writetext RuinsOfAlphOutsideYoungster1Text
	waitbutton
	closetext
	end

RuinsOfAlphOutsideYoungster2Script:
	faceplayer
	opentext
	writetext RuinsOfAlphOutsideYoungster2Text
	waitbutton
	closetext
	turnobject RUINSOFALPHOUTSIDE_YOUNGSTER3, UP
	end

TrainerPsychicNathan:
	trainer PSYCHIC_T, NATHAN, EVENT_BEAT_PSYCHIC_NATHAN, PsychicNathanSeenText, PsychicNathanBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PsychicNathanAfterBattleText
	waitbutton
	closetext
	end

TrainerSuperNerdStan:
	trainer SUPER_NERD, STAN, EVENT_BEAT_SUPER_NERD_STAN, SuperNerdStanSeenText, SuperNerdStanBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SuperNerdStanAfterBattleText
	waitbutton
	closetext
	end

RuinsOfAlphFruitTree:
	fruittree FRUITTREE_RUINS_OF_ALPH

RuinsOfAlphSign:
	jumptext RuinsOfAlphSignText

MovementData_0x580ba:
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end

MovementData_0x580c5:
	step UP
	step_end

RuinsOfAlphOutsideScientistText:
	text "Hm? That's a #-"
	line "DEX, isn't it?"
	cont "May I see it?"

	para "There are so many"
	line "kinds of #MON."

	para "Hm? What's this?"

	para "What is this"
	line "#MON?"

	para "It looks like the"
	line "strange writing on"

	para "the walls of the"
	line "RUINS."

	para "If those drawings"
	line "are really #-"
	cont "MON, there should"
	cont "be many more."

	para "I know! Let me up-"
	line "grade your #-"
	cont "DEX."
	
	para "Come visit me in"
	line "the lab just down"
	cont "in SANSKRIT TOWN."
	done

SuperNerdStanSeenText:
	text "What do you want?"
	line "I'm studying--"
	cont "don't disturb me!"
	done

SuperNerdStanBeatenText:
	text "Sorry…"
	line "I'm frustrated by"

	para "our lack of real"
	line "understanding…"
	done

SuperNerdStanAfterBattleText:
	text "The RUINS are from"
	line "about 1500 years"
	cont "ago."

	para "Nobody knows who"
	line "built them."

	para "It's also not"
	line "known if the #-"
	cont "MON statues have"
	cont "any meaning."

	para "It's all one big"
	line "mystery…"
	done

PsychicNathanSeenText:
	text "Hmmm… This is a"
	line "strange place."
	done

PsychicNathanBeatenText:
	text "…"
	done

PsychicNathanAfterBattleText:
	text "I like thinking"
	line "here."
	done


RuinsOfAlphSignText:
	text "RUINS OF ALPH"
	done

RuinsOfAlphOutsideFisherText1:
	text "While exploring"
	line "the RUINS, we"

	para "suddenly noticed"
	line "an odd presence."

	para "We all got scared"
	line "and ran away."

	para "You should be"
	line "careful too."
	done

RuinsOfAlphOutsideFisherText2:
	text "The RUINS hide a"
	line "huge secret!"

	para "…I think…"
	done

RuinsOfAlphOutsideYoungster1Text:
	text "There are many"
	line "kinds of UNOWN, so"

	para "we use them for"
	line "our secret codes."
	done

RuinsOfAlphOutsideYoungster2Text:
	text "A… H… E… A… D…"
	line "Hmm…"

	para "What?"

	para "I'm decoding this"
	line "message!"
	done

RuinsOfAlphOutside_MapEvents:
	db 0, 0 ; filler

	db 5 ; warp events
	warp_event 15,  9, RUINS_OF_ALPH_HO_OH_CHAMBER, 1
	warp_event  5, 27, RUINS_OF_ALPH_KABUTO_CHAMBER, 1
	warp_event  5,  3, RUINS_OF_ALPH_OMANYTE_CHAMBER, 1
	warp_event  3, 17, RUINS_OF_ALPH_AERODACTYL_CHAMBER, 1
	warp_event  9, 19, RUINS_OF_ALPH_INNER_CHAMBER, 1

	db 1 ; coord events
	coord_event  9, 20, SCENE_RUINSOFALPHOUTSIDE_GET_UNOWN_DEX, RuinsOfAlphOutsideScientistScene1

	db 1 ; bg events
	bg_event  8, 32, BGEVENT_READ, RuinsOfAlphSign

	db 6 ; object events
	object_event  9,  2, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 1, TrainerPsychicNathan, -1
	object_event  9, 21, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RuinsOfAlphOutsideScientistScript, EVENT_RUINS_OF_ALPH_OUTSIDE_SCIENTIST
	object_event 11, 26, SPRITE_FISHER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, RuinsOfAlphOutsideFisherScript, EVENT_RUINS_OF_ALPH_OUTSIDE_TOURIST_FISHER
	object_event  3, 29, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, RuinsOfAlphOutsideYoungster1Script, EVENT_RUINS_OF_ALPH_OUTSIDE_TOURIST_YOUNGSTERS
	object_event  8, 27, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, RuinsOfAlphOutsideYoungster2Script, EVENT_RUINS_OF_ALPH_OUTSIDE_TOURIST_YOUNGSTERS
	object_event 11,  9, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RuinsOfAlphFruitTree, -1
