	const_def 2
	const FSG_COP
	const FSG_SCIENTIST1
	const FSG_SCIENTIST2
	const FSG_SCIENTIST3

ForkedStraitGate_MapScripts:
	db 1 ; scene scripts
	scene_script .DummyScene ; SCENE_DEFAULT

	db 0 ; callbacks

.DummyScene:
	end

NeedToWalkOverOneTile:
	step LEFT
	step_end

CredCheckLeft:
	checkevent EVENT_DONE_FS_GATE_CHECK
	iftrue .finish
	opentext
	writetext EventCopHALT
	waitbutton
	closetext
	turnobject PLAYER, LEFT
	opentext
	writetext EventCopText
	waitbutton
	closetext
	setevent EVENT_DONE_FS_GATE_CHECK
	setevent EVENT_MEW_SPOT_2_FOUND ; islands events initializing
	setevent EVENT_MEW_SPOT_3_FOUND
	setevent EVENT_MEW_SPOT_4_FOUND
	setevent EVENT_MEW_SPOT_5_FOUND
	setevent EVENT_MEW_SPOT_6_FOUND
	setevent EVENT_MEW_SPOT_7_FOUND
	setevent EVENT_MEW_SPOT_8_FOUND
	setevent EVENT_INIT_RIC_OBJECTS_HIDDEN
	setevent EVENT_RIC_BLUE_HIDDEN
	setevent EVENT_RI_BLUEBATTLE_HIDDEN
.finish
	end

CredCheckRight:
	checkevent EVENT_DONE_FS_GATE_CHECK
	iftrue .finish
	opentext
	writetext EventCopHALT
	waitbutton
	closetext
	turnobject PLAYER, LEFT
	applymovement PLAYER, NeedToWalkOverOneTile
	opentext
	writetext EventCopText
	waitbutton
	closetext
	setevent EVENT_DONE_FS_GATE_CHECK
	setevent EVENT_MEW_SPOT_2_FOUND ; islands events initializing
	setevent EVENT_MEW_SPOT_3_FOUND
	setevent EVENT_MEW_SPOT_4_FOUND
	setevent EVENT_MEW_SPOT_5_FOUND
	setevent EVENT_MEW_SPOT_6_FOUND
	setevent EVENT_MEW_SPOT_7_FOUND
	setevent EVENT_MEW_SPOT_8_FOUND
	setevent EVENT_INIT_RIC_OBJECTS_HIDDEN
	setevent EVENT_RIC_BLUE_HIDDEN
	setevent EVENT_RI_BLUEBATTLE_HIDDEN
.finish
	end


EventCopHALT:
	text "HALT!"
	done

EventCopText:
	text "This is a"
	line "restricted area!"
	
	para "No #MON"
	line "trainers are"
	cont "allowed past this"
	cont "poin-"
	
	para "Wait."
	
	para "… … …"
	line "… … …"
	
	para "Are you…"
	
	para "<PLAY_G>, the"
	line "NIHON LEAGUE's"
	cont "new CHAMPION?"
	
	para "You are!"
	line "My apologies!"
	
	para "The two SOUTHERN"
	line "ISLANDS are off"
	cont "limits to members"
	cont "of the general"
	cont "public, but"
	cont "someone of your"
	cont "high level of"
	cont "clearance I'll"
	cont "allow through."
	
	para "These islands are"
	line "natural #MON"
	cont "paradises, fully"
	cont "unspoiled by man."
	
	para "As such they are"
	line "highly valuable"
	cont "for scientific"
	cont "research."
	
	para "I assume you"
	line "must have been"
	cont "informed by BLUE."
	
	para "He passed through"
	line "on his way to"
	cont "conduct research"
	cont "on RAINBOW ISLAND"
	cont "to the west."
	
	para "Now, carry on!"
	done

FSGCopScript:
	jumptextfaceplayer FSGCopNormalText
	
FSGCopNormalText:
	text "<PLAY_G>!"
	line "You may proceed!"
	done


FSGScientist1Script:
	jumptextfaceplayer FSGScientist1Text
	
FSGScientist1Text:
	text "TROPICAL ISLAND"
	line "to the east is"
	cont "full of rare"
	cont "#MON species!"
	
	para "I'm researching"
	line "the potential"
	cont "of a NEW SPECIES"
	cont "on the island."
	done

FSGScientist2Script:
	jumptextfaceplayer FSGScientist2Text
	
FSGScientist2Text:
	text "I'm one of the"
	line "lucky few that"
	cont "could obtain the"
	cont "clearance needed"
	cont "to study the"
	cont "SOUTHERN ISLANDS."
	
	para "They're even"
	line "printing a promo"
	cont "card set with"
	cont "the incredible"
	cont "#MON photos"
	cont "taken during our"
	cont "research tour!"
	done


FSGScientist3Script:
	jumptextfaceplayer FSGScientist3Text
	
FSGScientist3Text:
	text "There's ancient"
	line "manuscripts that"
	cont "describe RAINBOW"
	cont "ISLAND as a"
	cont "miraculous site"
	cont "cloaked always in"
	cont "rainbow light."
	
	para "I wonder if that"
	line "was just a legend"
	cont "or if the island"
	cont "really had some"
	cont "special power…"
	done

TropicalSign:
	jumptext TropicalSignText
	
RainbowSign:
	jumptext RainbowSignText
	
TropicalSignText:
	text "TROPICAL ISLAND"
	line "AHEAD TO EAST"
	done
	
RainbowSignText:
	text "RAINBOW ISLAND"
	line "AHEAD TO WEST"
	done


ForkedStraitGate_MapEvents:
	db 0, 0 ; filler

	db 6 ; warp events
	warp_event 10,  0,  FORKED_STRAIT, 1
	warp_event 11,  0,  FORKED_STRAIT, 2
	warp_event 21, 10,  FORKED_STRAIT_EAST_EXIT, 1
	warp_event 21, 11,  FORKED_STRAIT_EAST_EXIT, 2
	warp_event  0, 10, FORKED_STRAIT_WEST_EXIT, 1
	warp_event  0, 11, FORKED_STRAIT_WEST_EXIT, 2

	db 2 ; coord events
	coord_event 10,  3, SCENE_DEFAULT, CredCheckLeft
	coord_event 11,  3, SCENE_DEFAULT, CredCheckRight

	db 2 ; bg events
	bg_event 20,  8, BGEVENT_READ, TropicalSign
	bg_event  0,  8, BGEVENT_READ, RainbowSign

	db 4 ; object events
	object_event  8,  3, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, FSGCopScript, -1
	object_event 16,  9, SPRITE_SCIENTIST, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, FSGScientist1Script, -1
	object_event  9, 11, SPRITE_SCIENTIST, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, FSGScientist2Script, -1
	object_event  4,  9, SPRITE_SCIENTIST, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, FSGScientist3Script, -1
	