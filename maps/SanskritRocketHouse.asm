	const_def 2 ; object constants
	const HONDO_ROCKETBASE_KEY_GRUNT
	const LAVRADIOTOWER1F_OFFICER
	const LAVRADIOTOWER1F_SUPER_NERD1
	const LAVRADIOTOWER1F_GENTLEMAN
	const LAVRADIOTOWER1F_SUPER_NERD2
	const HONDO_ROCKETBASE_POKEBALL

SanskritRocketHouse_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .Key
	
.Key
	checkevent EVENT_HONDO_ROCKET_RUNS_AWAY
	iftrue .keydropped
	disappear HONDO_ROCKETBASE_POKEBALL
	return
	
.keydropped
	checkevent EVENT_HONDO_ROCKET_SHIP_KEY
	iftrue .keyobtained
	appear HONDO_ROCKETBASE_POKEBALL
	return
	
.keyobtained
	disappear HONDO_ROCKETBASE_POKEBALL
	return

SanskritRocketHouseReceptionistScript:
	faceplayer
	opentext
	checkevent EVENT_ROCKET_KEY_DIALOGUE
	iftrue .GiveKey
	writetext SanskritRocketHouseReceptionistText
	waitbutton
	closetext
	end

.GiveKey:
	writetext SanskritRocketHouseReceptionistTextKeyTime
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
	closetext
	setevent EVENT_HONDO_ROCKET_RUNS_AWAY
	appear HONDO_ROCKETBASE_POKEBALL
	applymovement HONDO_ROCKETBASE_KEY_GRUNT, Runforyourlife
	disappear HONDO_ROCKETBASE_KEY_GRUNT
	end
	
Runforyourlife:
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step DOWN
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	step_end
	
HondoBaseKey:
	itemball BASEMENT_KEY

SanskritRocketHouseOfficerScript:
	faceplayer
	opentext
	writetext SanskritRocketHouseOfficerText
	cry MURKROW
	waitbutton
	closetext
	end

SanskritRocketHouseSuperNerd1Script:
	faceplayer
	opentext
	checkevent EVENT_ROCKET_KEY_DIALOGUE
	iftrue .SN1KeyScript
	writetext SanskritRocketHouseSuperNerd1Text
	waitbutton
	closetext
	end

.SN1KeyScript:
	writetext SanskritRocketHouseSuperNerd1TextKey
	waitbutton
	closetext
	end

SanskritRocketHouseGentlemanScript:
	faceplayer
	opentext
	checkevent EVENT_ROCKET_KEY_DIALOGUE
	iftrue .GMKeyScript
	writetext SanskritRocketHouseGentlemanText
	waitbutton
	closetext
	end

.GMKeyScript:
	writetext SanskritRocketHouseGentlemanTextKey
	waitbutton
	closetext
	end


SanskritRocketHouseSuperNerd2Script:
	faceplayer
	opentext
	checkevent EVENT_ROCKET_KEY_DIALOGUE
	iftrue .SN2KeyScript
	writetext SanskritRocketHouseSuperNerd2Text
	waitbutton
	closetext
	end

.SN2KeyScript:
	writetext SanskritRocketHouseSuperNerd2TextKey
	waitbutton
	closetext
	end


SanskritRocketHouseDirectory:
	jumptext SanskritRocketHouseDirectoryText

SanskritRocketHousePokeFluteSign:
	jumptext SanskritRocketHousePokeFluteSignText

SanskritRocketHouseReferenceLibrary:
; unreferenced
	jumptext SanskritRocketHouseReferenceLibraryText

SanskritRocketHouseReceptionistText:
	text "Ha!"
	para "Supplies are"
	line "rolling in fast"
	para "over at the"
	line "SUNPOINT DOCKS!"
	para "We've almost got"
	line "everything we need"
	para "to begin the next"
	line "phase of our plan!"
	para "The crew over in"
	line "STAND CITY will be"
	para "so impressed with"
	line "our work here!"
	done

SanskritRocketHouseOfficerText:
	text "MURKROW: KRAWW!"
	done

SanskritRocketHouseSuperNerd1Text:
	text "GAME CORNERs are"
	line "always reliable"
	cont "sources of income!"
	para "Remember that!"
	done
	
SanskritRocketHouseSuperNerd1TextKey:
	text "Hm? A key?"
	para "Nah, I don't have"
	line "that."
	para "But why would you"
	line "want it?"
	para "Stay out of TEAM"
	line "ROCKET's way, kid!"
	done

SanskritRocketHouseGentlemanText:
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

SanskritRocketHouseGentlemanTextKey:
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


SanskritRocketHouseSuperNerd2Text:
	text "Just a bit longer"
	line "until we can show"
	para "the world what"
	line "TEAM ROCKET is"
	cont "truly capable of!"
	done

SanskritRocketHouseSuperNerd2TextKey:
	text "Nah, I don't have"
	line "any keys."
	para "The CAPTAIN"
	line "doesn't trust me"
	cont "with any of those."
	done

SanskritRocketHouseSuperNerd2Text_GotExpnCard:
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

SanskritRocketHouseDirectoryText:
	text "All #MON exist"
	line "for the glory of"
	cont "TEAM ROCKET!"
	done

SanskritRocketHousePokeFluteSignText:
	text "It's a rerun…"
	done

SanskritRocketHouseReferenceLibraryText:
	text "Wow! A full rack"
	line "of #MON CDs and"
	cont "videos."

	para "This must be the"
	line "reference library."
	done
	
SanskritRocketHouseReceptionistTextKeyTime:
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
	
RocketKey_Afterwards:
	text "Don't talk to me!"
	done

SanskritRocketHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 16,  7, SANSKRIT_TOWN, 5
	warp_event 17,  7, SANSKRIT_TOWN, 5

	db 0 ; coord events

	db 2 ; bg events
	bg_event 16,  2, BGEVENT_READ, SanskritRocketHouseDirectory
	bg_event  6,  1, BGEVENT_READ, SanskritRocketHousePokeFluteSign

	db 6 ; object events
	object_event  9,  4, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SanskritRocketHouseReceptionistScript, EVENT_HONDO_ROCKET_RUNS_AWAY
	object_event 17,  4, SPRITE_BIRD, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SanskritRocketHouseOfficerScript, EVENT_ROUTE_5_6_POKEFAN_M_BLOCKS_UNDERGROUND_PATH
	object_event 11,  2, SPRITE_ROCKET, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SanskritRocketHouseSuperNerd1Script, EVENT_ROUTE_5_6_POKEFAN_M_BLOCKS_UNDERGROUND_PATH
	object_event 19,  4, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SanskritRocketHouseGentlemanScript, EVENT_ROUTE_5_6_POKEFAN_M_BLOCKS_UNDERGROUND_PATH
	object_event 15,  4, SPRITE_ROCKET_GIRL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, SanskritRocketHouseSuperNerd2Script,EVENT_ROUTE_5_6_POKEFAN_M_BLOCKS_UNDERGROUND_PATH
	object_event  9, 4, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, HondoBaseKey, EVENT_HONDO_ROCKET_SHIP_KEY
