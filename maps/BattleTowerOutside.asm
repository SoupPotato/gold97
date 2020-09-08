	const_def 2 ; object constants
	const BATTLETOWEROUTSIDE_STANDING_YOUNGSTER
	const BATTLETOWEROUTSIDE_BUENA
	const BATTLETOWEROUTSIDE_SAILOR
	const BATTLETOWEROUTSIDE_LASS

BattleTowerOutside_MapScripts:
	db 0 ; scene scripts

	db 2 ; callbacks
	callback MAPCALLBACK_TILES, .Callback1
	callback MAPCALLBACK_OBJECTS, .Callback2

.Callback1:
	return

.Callback2:
	clearevent EVENT_BATTLE_TOWER_OUTSIDE_SAILOR
	return

BattleTowerOutsideYoungsterScript:
	jumptextfaceplayer BattleTowerOutsideYoungsterText

BattleTowerOutsideBuenaScript:
	jumptextfaceplayer BattleTowerOutsideBuenaText

BattleTowerOutsideSailorScript:
	jumptextfaceplayer BattleTowerOutsideSailorText

BattleTowerOutsideSign:
	jumptext BattleTowerOutsideSignText
	
TatsugoPathSign:
	jumptext TatsugoPathSignText
	
ThiefNewBTScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_EXTRA_THIEF_TM
	iftrue .afterwards
	writetext ThiefManIntroText
	waitbutton
	verbosegiveitem TM_THIEF
	setevent EVENT_GOT_EXTRA_THIEF_TM
.afterwards:
	writetext ThiefManSecondText
	waitbutton
	closetext
	end
	
ThiefManIntroText:
	text "Psst..."
	line "Hey kid..."
	
	para "Ya wanna know"
	line "how to win at"
	cont "the BATTLE TOWER?"
	
	para "You need items"
	line "to put on your"
	cont "#MON!"
	
	para "But held items are"
	line "hard to come by,"
	cont "right?"
	
	para "Here, I got a lil'"
	line "somethin' to make"
	cont "em' easier to get!"
	done

ThiefManSecondText:
	text "With THIEF, you"
	line "can snatch the"
	cont "held items right"
	cont "off trainers!"
	
	para "I bet if you go"
	line "and try this on"
	cont "the GYM LEADERS"
	cont "offering rematch"
	cont "battles, you'll"
	cont "find all kinds"
	cont "of things..."
	done


BattleTowerOutsideYoungsterText:
	text "Wow, the BATTLE"
	line "TOWER is huge!"

	para "There must be many"
	line "kinds of #MON"
	cont "in there!"
	done

BattleTowerOutsideBuenaText:
	text "You can use only"
	line "three #MON."

	para "It's so hard to"
	line "decide which three"

	para "should go into"
	line "battle…"
	done

BattleTowerOutsideSailorText:
	text "Hehehe, I snuck"
	line "out from work."

	para "I can't bail out"
	line "until I've won!"

	para "I have to win it"
	line "all. That I must!"
	done

BattleTowerOutsideSignText:
	text "BATTLE TOWER"

	para "Take the Ultimate"
	line "Trainer Challenge!"
	done

TatsugoPathSignText:
	text "TATSUGO PATH"
	
	para "AMAMI TOWN -"
	line "KIKAI VILLAGE"
	done

BattleTowerOutside_MapEvents:
	db 0, 0 ; filler

	db 6 ; warp events
	warp_event  8,  9, BATTLE_TOWER_1F, 1
	warp_event  9,  9, BATTLE_TOWER_1F, 2
	warp_event 10, 21, AMAMI_BATTLE_TOWER_GATE, 3
	warp_event 11, 21, AMAMI_BATTLE_TOWER_GATE, 4
	warp_event 12, 24, AMAMI_BATTLE_TOWER_GATE, 5
	warp_event 12, 25, AMAMI_BATTLE_TOWER_GATE, 6
	
	db 0 ; coord events

	db 2 ; bg events
	bg_event 12, 10, BGEVENT_READ, BattleTowerOutsideSign
	bg_event 18, 22, BGEVENT_READ, TatsugoPathSign

	db 4 ; object events
	object_event  6, 12, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BattleTowerOutsideYoungsterScript, -1
	object_event 13, 13, SPRITE_LASS, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, BattleTowerOutsideBuenaScript, -1
	object_event 12, 18, SPRITE_SAILOR, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BattleTowerOutsideSailorScript, EVENT_BATTLE_TOWER_OUTSIDE_SAILOR_NEW
	object_event  5, 17, SPRITE_PHARMACIST, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ThiefNewBTScript, -1
