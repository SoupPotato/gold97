	const_def 2 ; object constants
	const ROUTE37_WEIRD_TREE1
	const ROUTE37_WEIRD_TREE2
	const ROUTE37_BUG_CATCHER
	const ROUTE37_BUG_CATCHER2
	const ROUTE37_FRUIT_TREE1
	const ROUTE37_SUNNY
	const ROUTE37_YOUNGSTER
	const ROUTE37_FRUIT_TREE2
	const ROUTE37_FRUIT_TREE3
	const ROUTE37_ROCKER
	const ROUTE37_POKEBALL

SilentHills_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .Sunny

.Sunny:
	checkcode VAR_WEEKDAY
	ifequal SUNDAY, .SunnyAppears
	disappear ROUTE37_SUNNY
	return

.SunnyAppears:
	appear ROUTE37_SUNNY
	return

TrainerBeautyVictoria:
	trainer LASS, VICTORIA, EVENT_BEAT_BEAUTY_VICTORIA, BeautyVictoriaSeenText, BeautyVictoriaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BeautyVictoriaAfterBattleText
	waitbutton
	closetext
	end

TrainerYoungsterAlbert:
	trainer YOUNGSTER, ALBERT, EVENT_BEAT_YOUNGSTER_ALBERT, YoungsterAlbertSeenText, YoungsterAlbertBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext YoungsterAlbertAfterBattleText
	waitbutton
	closetext
	end
	
TrainerFledglingClayton:
	trainer FLEDGLING, CLAYTON, EVENT_BEAT_FLEDGLING_CLAYTON, FledglingClaytonSeenText, FledglingClaytonBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FledglingClaytonAfterBattleText
	waitbutton
	closetext
	end

TrainerBugCatcherDon:
	trainer BUG_CATCHER, DON, EVENT_BEAT_BUG_CATCHER_DON, BugCatcherDonSeenText, BugCatcherDonBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BugCatcherDonAfterBattleText
	waitbutton
	closetext
	end

SunnyScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_MAGNET_FROM_SUNNY
	iftrue SunnySundayScript
	checkcode VAR_WEEKDAY
	ifnotequal SUNDAY, SunnyNotSundayScript
	checkevent EVENT_MET_SUNNY_OF_SUNDAY
	iftrue .MetSunny
	writetext MeetSunnyText
	buttonsound
	setevent EVENT_MET_SUNNY_OF_SUNDAY
.MetSunny:
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .Kris
	writetext SunnyGivesGiftText1
	buttonsound
	jump .next
.Kris:
	writetext SunnyGivesGiftText2
	buttonsound
.next
	verbosegiveitem MAGNET
	iffalse SunnyDoneScript
	setevent EVENT_GOT_MAGNET_FROM_SUNNY
	writetext SunnyGaveGiftText
	waitbutton
	closetext
	end

SunnySundayScript:
	writetext SunnySundayText
	waitbutton
SunnyDoneScript:
	closetext
	end

SunnyNotSundayScript:
	writetext SunnyNotSundayText
	waitbutton
	closetext
	end

SilentHillsSign:
	jumptext SilentHillsSignText

SilentHillsSign2:
	jumptext SilentHillsSign2Text

SilentHillsFruitTree1:
	fruittree FRUITTREE_ROUTE_37_1

SilentHillsFruitTree2:
	fruittree FRUITTREE_ROUTE_37_2

SilentHillsFruitTree3:
	fruittree FRUITTREE_ROUTE_37_3

SilentHillsHiddenEther:
	hiddenitem ETHER, EVENT_ROUTE_37_HIDDEN_ETHER
	
DarkCaveVioletEntrancePotion:
	itemball POTION
	
SilentHillsRockerScript:
	jumptextfaceplayer SilentHillsRockerText
	
SilentHillsRockerText:
	text "I'm not a trainer,"
	line "but there are a"
	cont "lot up ahead!"
	para "If they see you,"
	line "you'll have to"
	cont "battle."
	para "Make sure you're"
	line "ready!"
	done

BugCatcherDonSeenText:
	text "These hills seem"
	line "like a good place"
	cont "to find more bugs!"
	done

BugCatcherDonBeatenText:
	text "I lost. That's"
	line "no good…"
	done

BugCatcherDonAfterBattleText:
	text "I ran out of #"
	line "BALLS while I was"
	cont "catching #MON."

	para "I should've bought"
	line "some more…"
	done
	
YoungsterAlbertSeenText:
	text "I haven't seen you"
	line "around before."

	para "So you think you"
	line "are pretty tough?"
	done

YoungsterAlbertBeatenText:
	text "You're strong!"
	done

YoungsterAlbertAfterBattleText:
	text "I'm going to try"
	line "to be the best"
	cont "with my favorites."

	para "I'm not using the"
	line "same tough #MON"
	cont "as everyone else."
	done
	
FledglingClaytonSeenText:
	text "I'm… I'm pretty"
	line "new at this."
	para "Oh, are you too?"
	done

FledglingClaytonBeatenText:
	text "You're tough!"
	done

FledglingClaytonAfterBattleText:
	text "I like to think"
	line "that even losing"
	para "can help me grow"
	line "as a trainer."
	done
	
BeautyVictoriaSeenText:
	text "Oh, you are a cute"
	line "little trainer! "

	para "I like you, but I"
	line "won't hold back!"
	done

BeautyVictoriaBeatenText:
	text "Let's see… Oops,"
	line "it's over?"
	done

BeautyVictoriaAfterBattleText:
	text "Wow, you must be"
	line "good to beat me!"
	cont "Keep it up!"
	done

MeetSunnyText:
	text "SUNNY: Hi!"

	para "I'm SUNNY of Sun-"
	line "day, meaning it's"
	cont "Sunday today!"
	done

SunnyGivesGiftText1:
	text "I was told to give"
	line "you this if I saw"
	cont "you!"
	done

SunnyGivesGiftText2:
	text "I was told to give"
	line "you this if I saw"
	cont "you!"
	done

SunnyGaveGiftText:
	text "SUNNY: That thing…"

	para "Um…"

	para "… What was it now…"

	para "…"

	para "Oh! I remember"
	line "now!"

	para "A #MON that"
	line "knows electric"

	para "moves should hold"
	line "it."

	para "My sis MONICA said"
	line "it powers up"
	cont "electric moves!"
	done

SunnySundayText:
	text "SUNNY: My sisters"
	line "and brothers are"
	cont "MONICA, TUSCANY,"
	cont "WESLEY, ARTHUR,"
	cont "FRIEDA and SANTOS."

	para "They're all older"
	line "than me!"
	done

SunnyNotSundayText:
	text "SUNNY: Isn't today"
	line "Sunday?"
	cont "Um… I forgot!"
	done

SilentHillsSignText:
	text "SILENT HILLS"
	para "A gathering spot"
	line "for rising"
	cont "trainers!"
	done

SilentHillsSign2Text:
	text "SILENT HILLS"
	para "North to exit."
	para "Continue north to"
	line "PAGOTA CITY."
	done

SilentHills_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  6,  0, ROUTE_101, 1
	warp_event  7,  0, ROUTE_101, 2
	warp_event 49, 30, ROUTE_101, 3
	warp_event 49, 31, ROUTE_101, 4
	
	db 0 ; coord events

	db 3 ; bg events
	bg_event 45, 28, BGEVENT_READ, SilentHillsSign
	bg_event  7,  4, BGEVENT_READ, SilentHillsSign2
	bg_event 21, 14, BGEVENT_ITEM, SilentHillsHiddenEther

	db 10 ; object events
	object_event 34, 18, SPRITE_LASS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerBeautyVictoria, -1
	object_event  7, 19, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerYoungsterAlbert, -1
	object_event 41, 19, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerBugCatcherDon, -1
	object_event 15, 20, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, TrainerFledglingClayton, -1
	object_event 24,  9, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SilentHillsFruitTree1, -1
	object_event 26, 14, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SunnyScript, EVENT_ROUTE_37_SUNNY_OF_SUNDAY
	object_event 24, 26, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SilentHillsFruitTree2, -1
	object_event 27, 29, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SilentHillsFruitTree3, -1
	object_event 41, 28, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SilentHillsRockerScript, -1
	object_event 19,  5, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, DarkCaveVioletEntrancePotion, EVENT_DARK_CAVE_VIOLET_ENTRANCE_POTION
