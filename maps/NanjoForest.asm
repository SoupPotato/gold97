	const_def 2 ; object constants
	const SAFARI_ZONE_BETA_YOUNGSTER
	const SAFARI_ZONE_BETA_BUG_CATCHER
	const SAFARI_ZONE_BETA_SILVER
	const SAFARI_ZONE_BETA_ITEMBALL_1
	const SAFARI_ZONE_BETA_ITEMBALL_2
	const SAFARI_ZONE_BETA_ITEMBALL_3
	const SAFARI_ZONE_BETA_ITEMBALL_4

NanjoForest_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .CheckDayOfWeekSZ
	
.CheckDayOfWeekSZ:
	checkcode VAR_WEEKDAY
	ifequal WEDNESDAY, .WednesdaySZ
.disapearSZSilver
	disappear SAFARI_ZONE_BETA_SILVER
	return
	
.WednesdaySZ
	checkevent EVENT_EXPLODING_TRAP_16
	iftrue .disapearSZSilver
	appear SAFARI_ZONE_BETA_SILVER
	return

TriWingYoungsterScript:
	faceplayer
	checkevent EVENT_EXPLODING_TRAP_12
	iftrue .AlreadyGaveTriWing
	checkevent EVENT_FAST_SHIP_CABINS_SE_SSE_GENTLEMAN
	iftrue .TryGivingTriWing
.NoTriWingYet
	opentext
	writetext NoTriWingYetText
	waitbutton
	closetext
	turnobject SAFARI_ZONE_BETA_YOUNGSTER, RIGHT
	end
	
.TryGivingTriWing
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iftrue .NoTriWingYet
	checkevent EVENT_EXPLODING_TRAP_11
	iffalse .SetUpTriWing
	opentext
	writetext HeresTriWingText
	waitbutton
	verbosegiveitem RED_SCALE
	writetext WhatDoesTriWingDoText
	waitbutton
	closetext
	setevent EVENT_EXPLODING_TRAP_12
	turnobject SAFARI_ZONE_BETA_YOUNGSTER, RIGHT
	end
	
.SetUpTriWing
	opentext
	writetext NoTriWingYetText
	waitbutton
	closetext
	setevent EVENT_EXPLODING_TRAP_11
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	turnobject SAFARI_ZONE_BETA_YOUNGSTER, RIGHT
	end
	
.AlreadyGaveTriWing
	opentext
	writetext AlreadyGaveTriWingText
	waitbutton
	closetext
	turnobject SAFARI_ZONE_BETA_YOUNGSTER, RIGHT
	end
	
TriWingBugCatcherScript:
	faceplayer
	opentext
	writetext TriWingBugCatcherText
	waitbutton
	closetext
	turnobject SAFARI_ZONE_BETA_BUG_CATCHER, RIGHT
	end
	
NanjoForestSilverScript:
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	iftrue .TalkToSilverAfterBattle
	playmusic MUSIC_RIVAL_ENCOUNTER
	faceplayer
	opentext
	writetext NanjoForestSilverBefore
	waitbutton
	closetext
	checkevent EVENT_GOT_CRUIZE_FROM_ELM
	iftrue .Cruise
	checkevent EVENT_GOT_CHIKORITA_FROM_ELM
	iftrue .CHIKORITA
	winlosstext NanjoForestSilverTextWin, NanjoForestSilverTextLoss
	loadtrainer RIVAL2, RIVAL2_1_CRUIZE
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump .FinishBattle

.Cruise:
	winlosstext NanjoForestSilverTextWin, NanjoForestSilverTextLoss
	loadtrainer RIVAL2, RIVAL2_1_CHIKORITA
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump .FinishBattle

.CHIKORITA:
	winlosstext NanjoForestSilverTextWin, NanjoForestSilverTextLoss
	loadtrainer RIVAL2, RIVAL2_1_FLAMBEAR
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump .FinishBattle

.FinishBattle:
	playmusic MUSIC_RIVAL_AFTER
	opentext
	writetext NanjoForestSilverAfter
	waitbutton
	closetext
	setevent EVENT_EXPLODING_TRAP_16
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	playmapmusic
	end
	
.TalkToSilverAfterBattle
	faceplayer
	opentext
	writetext NanjoForestSilverAfter
	waitbutton
	closetext
	end
	

NanjoForestMaxRevive:
	itemball MAX_REVIVE

NanjoForestUltraBall:
	itemball ULTRA_BALL

NanjoForestFullHeal:
	itemball FULL_HEAL

NanjoForestFullRestore:
	itemball FULL_RESTORE
	
NanjoForestSign:
	jumptext NanjoForestSignText
	
NanjoForestSignText:
	text "'NO LITTERING'"
	para "Please pick up"
	line "after yourself."
	done
	
NanjoForestSilverBefore:
	text "<RIVAL>: Hey,"
	line "<PLAY_G>!"
	para "It's been a while!"
	para "I'm here out on"
	line "the ISLANDS to"
	para "continue training"
	line "and bonding with"
	cont "my #MON."
	para "I've learned more"
	line "about how to work"
	para "with them as a"
	line "team."
	para "We've grown a lot"
	line "closer recently."
	para "But we've also"
	line "grown a lot"
	cont "stronger!"
	para "You know what that"
	line "means!"
	done
	
NanjoForestSilverTextWin:
	text "You got me!"
	done
	
NanjoForestSilverTextLoss:
	text "Alright!"
	done
	
NanjoForestSilverAfter:
	text "Whew, that was a"
	line "great battle."
	para "I think I'm about"
	line "done training"
	cont "here."
	para "Maybe I'll catch"
	line "you around some-"
	cont "place else!"
	done
	
WhatDoesTriWingDoText:
	text "I wonder what it"
	line "came from."
	para "Could it have been"
	line "a #MON?"
	done
	
HeresTriWingText:
	text "Hey, check this"
	line "out!"
	para "It's a weird,"
	line "three-colored"
	cont "wing!"
	para "It's kind of neat,"
	line "but it's all wet"
	cont "and gross."
	para "You can have it!"
	done
	
AlreadyGaveTriWingText:
	text "You never know"
	line "what you'll find"
	cont "here."
	done
	
NoTriWingYetText:
	text "I'm looking for"
	line "interesting things"
	para "that wash up on"
	line "the shore."
	para "I find lots of"
	line "items like POTIONS"
	cont "and FULL HEALS."
	para "Once I even found"
	line "a NUGGET!"
	para "You can find some"
	line "cool stuff here."
	para "Come back and"
	line "check with me"
	cont "sometime."
	para "I'll share some-"
	line "thing I find"
	cont "with you."
	done
	
TriWingBugCatcherText:
	text "My brother and I"
	line "find lots of cool"
	para "things that wash"
	line "up on the shore!"
	para "We don't think of"
	line "it as trash,"
	para "because sometimes"
	line "we find treasure!"
	done	

NanjoForest_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  0, 18, URASOE_TRAIL, 3
	warp_event  0, 19, URASOE_TRAIL, 4

	db 0 ; coord events

	db 1 ; bg events
	bg_event 29, 21, BGEVENT_READ, NanjoForestSign

	db 7 ; object events
	object_event 27,  7, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, TriWingYoungsterScript, -1
	object_event 27,  6, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, TriWingBugCatcherScript, -1
	object_event  6,  8, SPRITE_SILVER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, NanjoForestSilverScript, EVENT_EXPLODING_TRAP_15
	object_event 26, 30, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, NanjoForestMaxRevive, EVENT_PICKED_UP_BERRY_FROM_KABUTO_ITEM_ROOM
	object_event 15,  4, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, NanjoForestUltraBall, EVENT_PICKED_UP_PSNCUREBERRY_FROM_KABUTO_ITEM_ROOM
	object_event  8, 15, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, NanjoForestFullHeal, EVENT_PICKED_UP_HEAL_POWDER_FROM_KABUTO_ITEM_ROOM
	object_event 31, 11, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, NanjoForestFullRestore, EVENT_PICKED_UP_ENERGYPOWDER_FROM_KABUTO_ITEM_ROOM
