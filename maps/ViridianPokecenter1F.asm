	const_def 2 ; object constants
	const VIRIDIANPOKECENTER1F_NURSE
	const VIRIDIANPOKECENTER1F_COOLTRAINER_M
	const VIRIDIANPOKECENTER1F_COOLTRAINER_F
	const VIRIDIANPOKECENTER1F_BUG_CATCHER

ViridianPokecenter1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

ViridianPokecenter1FNurseScript:
	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	iffalse .NoPokemonScript
	jumpstd pokecenternurse
	
.NoPokemonScript
	opentext
	writetext NoPokemonText
	waitbutton
	closetext
	end

ViridianPokecenter1FCooltrainerMScript:
	checkevent EVENT_MET_BILL
	iftrue Script_TimeCapsuleClosed2
	faceplayer
	opentext
	writetext ViridianPokecenter1FCooltrainerMText
	waitbutton
	closetext
	end

Script_TimeCapsuleClosed2:
	faceplayer
	opentext
	writetext ViridianPokecenter1FCooltrainerMText2
	waitbutton
	closetext
	end

ViridianPokecenter1FCooltrainerFScript:
	jumptextfaceplayer ViridianPokecenter1FCooltrainerFText

ViridianPokecenter1FBugCatcherScript:
	jumptextfaceplayer ViridianPokecenter1FBugCatcherText
	
ViridianPokecenterMonScript:
	faceplayer
	opentext
	writetext ViridianPokecenterMonText
	cry HOUNDOOM
	waitbutton
	closetext
	end
	
NoPokemonText:
	text "Hello!"
	para "In order to use a"
	line "#MON CENTER,"
	para "you need at least"
	line "one #MON."
	done
	
ViridianPokecenterMonText:
	text "HOUNDOOM:"
	line "GRUFFF!"
	done
	
ViridianPokecenter1FCooltrainerMText:
	text "It's true!"
	para "The TIME CAPSULE"
	line "upstairs allows"
	para "you to trade"
	line "#MON with the"
	cont "past!"
	done

ViridianPokecenter1FCooltrainerMText2:
	text "I heard the"
	line "machine they're"
	
	para "in the middle of"
	line "setting up is"
	cont "really amazing!"
	
	para "Apparently it can"
	line "leap through time"
	cont "to trade #MON!"
	para "I wonder if it's"
	line "true?"
	done

ViridianPokecenter1FCooltrainerFText:
	text "If you're a"
	line "trainer, you can"
	para "use that PC over"
	line "there anytime for"
	cont "free!"
	para "Thoughtful of"
	line "them, isn't it?"
	done


ViridianPokecenter1FBugCatcherText:
	text "This is HOUNDOOM!"
	para "It's a #MON"
	line "of a completely"
	cont "new type."
	done

ViridianPokecenter1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  5,  7, SILENT_TOWN, 3
	warp_event  6,  7, SILENT_TOWN, 3
	warp_event  0,  7, POKECENTER_2F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 5 ; object events
	object_event  5,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ViridianPokecenter1FNurseScript, -1
	object_event  3,  4, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ViridianPokecenter1FCooltrainerMScript, -1
	object_event  12, 7, SPRITE_GENTLEMAN, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ViridianPokecenter1FCooltrainerFScript, -1
	object_event  9,  1, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, ViridianPokecenter1FBugCatcherScript, -1
	object_event  10, 1, SPRITE_GROWLITHE, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, ViridianPokecenterMonScript, -1
