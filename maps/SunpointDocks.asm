	const_def 2 ; object constants
	const DOCK_ROCKET_1
	const DOCK_ROCKET_2
	const DOCK_ROCKET_3
	const DOCK_ROCKET_4
	const DOCK_ROCKET_5
	const DOCK_ROCKET_6
	const DOCK_ROCKET_7
	const DOCK_GURU_1
	const DOCK_SAILOR
	const DOCK_FISHER
	const DOCK_GURU_2

SunpointDocks_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .ClearPortBoat

.ClearPortBoat:
	checkevent EVENT_ROUTE_5_6_POKEFAN_M_BLOCKS_UNDERGROUND_PATH
	iffalse .Done
	changeblock 11, 7, $0A ; water
	changeblock 13, 7, $0A ; water
	changeblock 15, 7, $0A ; water
	changeblock 17, 7, $0A ; water
	changeblock 11, 9, $0A ; water
	changeblock 13, 9, $0A ; water
	changeblock 15, 9, $0A ; water
	changeblock 17, 9, $0A ; water
	changeblock 13, 5, $08 ; dock
.Done:
	return


TrainerGruntM29:
	trainer GRUNTM, GRUNTM_29, EVENT_BEAT_ROCKET_GRUNTM_29, GruntM29SeenText, GruntM29BeatenText, 0, .Script

.Script:
	opentext
	writetext GruntM29AfterBattleText
	waitbutton
	closetext
	turnobject DOCK_ROCKET_7, DOWN
	pause 10
	playsound SFX_EXIT_BUILDING
	disappear DOCK_ROCKET_7
	pause 15
	setevent EVENT_CLEARED_SLOWPOKE_WELL
	end

DocksRocket1Script:
	jumptextfaceplayer DocksRocket1Text
	
DocksRocket2Script:
	jumptextfaceplayer DocksRocket2Text
	
DocksRocket3Script:
	jumptextfaceplayer DocksRocket3Text
	
DocksRocket4Script:
	jumptextfaceplayer DocksRocket4Text
	
DocksRocket5Script:
	jumptextfaceplayer DocksRocket5Text
	
DocksRocket6Script:
	jumptextfaceplayer DocksRocket6Text
	
DocksGuruScript:
	jumptextfaceplayer DocksGuruText
	
DocksGuru2Script:
	jumptextfaceplayer DocksGuruText2
	
DocksFisherScript:
	jumptextfaceplayer DocksFisherText
	
DocksSailorScript:
	jumptextfaceplayer DocksSailorText
	
DocksRocket1Text:
	text "Just an innocent"
	line "dock worker bring"
	cont "-ing in some"
	cont "cargo!"
	
	para "Nothing weird"
	line "going on here!"
	done
	
DocksRocket2Text:
	text "The final shipment"
	line "was just loaded."

	para "We're almost ready"
	line "to ditch this"
	cont "place!"
	done
	
DocksRocket3Text:
	text "Finally, our"
	line "operations here"
	cont "are almost done!"
	
	para "Maybe now we can"
	line "go someplace less"
	cont "hot."
	done
	
DocksRocket4Text:
	text "Don't bother me!"
	line "I'm working!"
	done
	
DocksRocket5Text:
	text "I'm a-working on"
	line "the railroad…"
	para "…"
	para "Hm, wrong song."
	done
	
DocksRocket6Text:
	text "Being a DOCK"
	line "worker is hard!"
	done

GruntM29SeenText:
	text "What do you want,"
	line "kid?"
	para "Authorized"
	line "personnel only!"
	para "Get lost, or face"
	line "my wrath!"
	done
	
GruntM29BeatenText:
	text "Aieee!"
	done
	
GruntM29AfterBattleText:
	text "You could be a"
	line "problem."
	para "And I don't want"
	line "to deal with it!"
	done

DocksGuruText:
	text "There aren't any"
	line "ships in the"
	cont "harbor right now."
	para "It's a slow day."
	done
	
DocksGuruText2:
	text "There's a cafe"
	line "over in ALLOY"
	para "CITY that has"
	line "the best food!"
	para "I wish I didn't"
	line "work so far from"
	cont "it…"
	done

DocksFisherText:
	text "I'm not a worker."
	line "I just like"
	para "watching ships"
	line "come and go."
	done
	
DocksSailorText:
	text "I set sail in"
	line "a few weeks."
	para "It's been a while"
	line "since I've been"
	cont "out at sea!"
	done

SunpointDocks_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  6, 31, SUNPOINT_DOCKS_SUNPOINT_GATE, 1
	warp_event  7, 31, SUNPOINT_DOCKS_SUNPOINT_GATE, 2
	warp_event 13,  5, ROCKET_SHIP_BASE, 1

	db 0 ; coord events

	db 0 ; bg events

	db 11 ; object events
	object_event  8,  2, SPRITE_ROCKET, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DocksRocket1Script, EVENT_ROUTE_5_6_POKEFAN_M_BLOCKS_UNDERGROUND_PATH
	object_event  5, 15, SPRITE_ROCKET, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DocksRocket2Script, EVENT_ROUTE_5_6_POKEFAN_M_BLOCKS_UNDERGROUND_PATH
	object_event 14, 13, SPRITE_ROCKET, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DocksRocket3Script, EVENT_ROUTE_5_6_POKEFAN_M_BLOCKS_UNDERGROUND_PATH
	object_event  4,  8, SPRITE_ROCKET, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DocksRocket4Script, EVENT_ROUTE_5_6_POKEFAN_M_BLOCKS_UNDERGROUND_PATH
	object_event  5, 24, SPRITE_ROCKET, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DocksRocket5Script, EVENT_ROUTE_5_6_POKEFAN_M_BLOCKS_UNDERGROUND_PATH
	object_event 12, 19, SPRITE_ROCKET, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DocksRocket6Script, EVENT_ROUTE_5_6_POKEFAN_M_BLOCKS_UNDERGROUND_PATH
	object_event 13,  5, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 0, TrainerGruntM29, EVENT_CLEARED_SLOWPOKE_WELL
	object_event  5, 22, SPRITE_FISHING_GURU, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, DocksGuruScript, EVENT_FLORIA_AT_FLOWER_SHOP
	object_event 14, 19, SPRITE_SAILOR, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, DocksSailorScript, EVENT_FLORIA_AT_FLOWER_SHOP
	object_event  8, 13, SPRITE_FISHER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, DocksFisherScript, EVENT_FLORIA_AT_FLOWER_SHOP
	object_event  7,  5, SPRITE_FISHING_GURU, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, DocksGuru2Script, EVENT_FLORIA_AT_FLOWER_SHOP

