	const_def 2 ; object constants
	const LAVRADIOTOWER1F_RECEPTIONIST
	const LAVRADIOTOWER1F_OFFICER
	const LAVRADIOTOWER1F_SUPER_NERD1
	const LAVRADIOTOWER1F_GENTLEMAN
	const LAVRADIOTOWER1F_SUPER_NERD2

LavRadioTower1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

LavRadioTower1FReceptionistScript:
	faceplayer
	opentext
	checkevent EVENT_ROCKET_KEY_DIALOGUE
	iftrue .GiveKey
	writetext LavRadioTower1FReceptionistText
	waitbutton
	closetext
	end

.GiveKey:
	checkevent EVENT_MADE_WHITNEY_CRY
	iftrue .AlreadyGotKey
	writetext LavRadioTower1FReceptionistTextKeyTime
	waitbutton
	closetext
	winlosstext RocketKey_WinText, RocketKey_LossText
	loadtrainer GRUNTM, GRUNTM_23
	startbattle
	reloadmapafterbattle
	jump .returnfrombattlerocketkey
	
	
.returnfrombattlerocketkey
	opentext
	writetext RocketKey_AfterText
	waitbutton
	verbosegiveitem BASEMENT_KEY
	writetext RocketKey_AfterText2
	waitbutton
	closetext
	setevent EVENT_MADE_WHITNEY_CRY
	end
	
.AlreadyGotKey:
	writetext RocketKey_Afterwards
	waitbutton
	closetext
	end

LavRadioTower1FOfficerScript:
	faceplayer
	opentext
	writetext LavRadioTower1FOfficerText
	cry MURKROW
	waitbutton
	closetext
	end

LavRadioTower1FSuperNerd1Script:
	faceplayer
	opentext
	checkevent EVENT_ROCKET_KEY_DIALOGUE
	iftrue .SN1KeyScript
	writetext LavRadioTower1FSuperNerd1Text
	waitbutton
	closetext
	end

.SN1KeyScript:
	writetext LavRadioTower1FSuperNerd1TextKey
	waitbutton
	closetext
	end

LavRadioTower1FGentlemanScript:
	faceplayer
	opentext
	checkevent EVENT_ROCKET_KEY_DIALOGUE
	iftrue .GMKeyScript
	writetext LavRadioTower1FGentlemanText
	waitbutton
	closetext
	end

.GMKeyScript:
	writetext LavRadioTower1FGentlemanTextKey
	waitbutton
	closetext
	end


LavRadioTower1FSuperNerd2Script:
	faceplayer
	opentext
	checkevent EVENT_ROCKET_KEY_DIALOGUE
	iftrue .SN2KeyScript
	writetext LavRadioTower1FSuperNerd2Text
	waitbutton
	closetext
	end

.SN2KeyScript:
	writetext LavRadioTower1FSuperNerd2TextKey
	waitbutton
	closetext
	end


LavRadioTower1FDirectory:
	jumptext LavRadioTower1FDirectoryText

LavRadioTower1FPokeFluteSign:
	jumptext LavRadioTower1FPokeFluteSignText

LavRadioTower1FReferenceLibrary:
; unreferenced
	jumptext LavRadioTower1FReferenceLibraryText

LavRadioTower1FReceptionistText:
	text "Ha!"
	para "Supplies are"
	line "rolling in fast"
	para "over at the SOUTH"
	line "POINT DOCKS!"
	para "We've almost got"
	line "everything we need"
	para "to begin the next"
	line "phase of our plan!"
	para "The crew over in"
	line "STAND CITY will be"
	para "so impressed with"
	line "our work here!"
	done

LavRadioTower1FOfficerText:
	text "MURKROW: KRAWW!"
	done

LavRadioTower1FSuperNerd1Text:
	text "GAME CORNERs are"
	line "always reliable"
	cont "sources of income!"
	para "Remember that!"
	done
	
LavRadioTower1FSuperNerd1TextKey:
	text "Hm? A key?"
	para "Nah, I don't have"
	line "that."
	para "But why would you"
	line "want it?"
	para "Stay out of TEAM"
	line "ROCKET's way, kid!"
	done

LavRadioTower1FGentlemanText:
	text "Some kid has been"
	line "messing with our"
	cont "plans."
	para "First the AQUARIUM"
	line "heist, then the"
	cont "SLOWPOKE WELL…"
	para "But it doesn't"
	line "matter!"
	para "Minor setbacks,"
	line "those were!"
	para "HA!"
	done

LavRadioTower1FGentlemanTextKey:
	text "What key?"
	line "I don't have any"
	cont "keys."
	para "Hey!"
	para "I hope you're not"
	line "that kid that's"
	para "been messing with"
	line "our plans!"
	para "Cut it out, if"
	line "you know what's"
	cont "good for you!"
	done


LavRadioTower1FSuperNerd2Text:
	text "Just a bit longer"
	line "until we can show"
	para "the world what"
	line "TEAM ROCKET is"
	cont "truly capable of!"
	done

LavRadioTower1FSuperNerd2TextKey:
	text "Nah, I don't have"
	line "any keys."
	para "The CAPTAIN"
	line "doesn't trust me"
	cont "with any of those."
	done

LavRadioTower1FSuperNerd2Text_GotExpnCard:
	text "Hey there!"

	para "I am the super"
	line "MUSIC DIRECTOR!"

	para "I'm responsible"
	line "for the gorgeous"

	para "melodies that go"
	line "out over the air."

	para "Don't be square."
	line "Grab your music"
	cont "off the air!"
	done

LavRadioTower1FDirectoryText:
	text "All #MON exist"
	line "for the glory of"
	cont "TEAM ROCKET!"
	done

LavRadioTower1FPokeFluteSignText:
	text "It's a rerun…"
	done

LavRadioTower1FReferenceLibraryText:
	text "Wow! A full rack"
	line "of #MON CDs and"
	cont "videos."

	para "This must be the"
	line "reference library."
	done
	
LavRadioTower1FReceptionistTextKeyTime:
	text "A SHIP KEY?"
	para "Maybe I have it."
	line "What's it to you?"
	done

RocketKey_WinText:
	text "What!?"
	done
	
RocketKey_LossText:
	text "Ha!"
	done
	
RocketKey_AfterText:
	text "Oh no, the CAPTAIN"
	line "will have my head"
	cont "for this!"
	done

RocketKey_AfterText2:
	text "Get out of here!"
	done
	
RocketKey_Afterwards:
	text "Don't talk to me!"
	done

LavRadioTower1F_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 16,  7, MAHOGANY_TOWN, 5
	warp_event 17,  7, MAHOGANY_TOWN, 5

	db 0 ; coord events

	db 2 ; bg events
	bg_event 16,  2, BGEVENT_READ, LavRadioTower1FDirectory
	bg_event  6,  1, BGEVENT_READ, LavRadioTower1FPokeFluteSign

	db 5 ; object events
	object_event  9,  4, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, LavRadioTower1FReceptionistScript, EVENT_ROUTE_5_6_POKEFAN_M_BLOCKS_UNDERGROUND_PATH
	object_event 17,  4, SPRITE_BIRD, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, LavRadioTower1FOfficerScript, EVENT_ROUTE_5_6_POKEFAN_M_BLOCKS_UNDERGROUND_PATH
	object_event 11,  2, SPRITE_ROCKET, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, LavRadioTower1FSuperNerd1Script, EVENT_ROUTE_5_6_POKEFAN_M_BLOCKS_UNDERGROUND_PATH
	object_event 19,  4, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, LavRadioTower1FGentlemanScript, EVENT_ROUTE_5_6_POKEFAN_M_BLOCKS_UNDERGROUND_PATH
	object_event 15,  4, SPRITE_ROCKET_GIRL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, LavRadioTower1FSuperNerd2Script, EVENT_ROUTE_5_6_POKEFAN_M_BLOCKS_UNDERGROUND_PATH
