	const_def 2 ; object constants
	const GOLDENRODGYM_WHITNEY
	const GOLDENRODGYM_LASS1
	const GOLDENRODGYM_LASS2
	const GOLDENRODGYM_BUENA1
	const GOLDENRODGYM_GYM_GUY

TeknosGym_MapScripts:
	db 0 ; scene scripts
	
	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .whitneynothere
	
.whitneynothere
	checkevent EVENT_WHITNEY_BACK_IN_GYM
	iffalse .gone
	return
	
.gone
	disappear GOLDENRODGYM_WHITNEY
	disappear GOLDENRODGYM_LASS1
	disappear GOLDENRODGYM_LASS2
	disappear GOLDENRODGYM_BUENA1
	return


TeknosGymWhitneyScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_WHITNEY
	iftrue .FightDone
	writetext WhitneyBeforeText
	waitbutton
	closetext
	winlosstext WhitneyShouldntBeSoSeriousText, 0
	loadtrainer WHITNEY, WHITNEY1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_WHITNEY
	setevent EVENT_BEAT_LASS_CARRIE
	setevent EVENT_BEAT_LASS_BRIDGET
	setevent EVENT_BEAT_BEAUTY_SAMANTHA
	specialphonecall SPECIALCALL_ROBBED
	setmapscene OAKS_LAB_ENTRANCE, SCENE_DEFAULT
	opentext
	writetext PlayerReceivedPlainBadgeText
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_PLAINBADGE
	checkcode VAR_BADGES
	scall TeknosGymActivateRockets
.FightDone:
	checkevent EVENT_GOT_TM45_ATTRACT
	iftrue .GotAttract
	writetext Whitney_BadgeSpeech
	buttonsound
	verbosegiveitem TM_ATTRACT
	iffalse .NoRoomForAttract
	setevent EVENT_GOT_TM45_ATTRACT
	writetext WhitneyAttractText
	waitbutton
	closetext
	end

.GotAttract:
	writetext Whitney_GoodLuck
	waitbutton
.NoRoomForAttract
	closetext
	end

TeknosGymActivateRockets:
	ifequal 7, .RadioTowerRockets
	ifequal 6, .GoldenrodRockets
	end

.GoldenrodRockets:
	jumpstd goldenrodrockets

.RadioTowerRockets:
	jumpstd radiotowerrockets

TrainerLassCarrie:
	trainer LASS, CARRIE, EVENT_BEAT_LASS_CARRIE, LassCarrieSeenText, LassCarrieBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext LassCarrieAfterBattleText
	waitbutton
	closetext
	end



TrainerLassBridget:
	trainer LASS, BRIDGET, EVENT_BEAT_LASS_BRIDGET, LassBridgetSeenText, LassBridgetBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext LassBridgetAfterBattleText
	waitbutton
	closetext
	end



TrainerBeautySamantha:
	trainer BEAUTY, SAMANTHA, EVENT_BEAT_BEAUTY_SAMANTHA, BeautySamanthaSeenText, BeautySamanthaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BeautySamanthaAfterBattleText
	waitbutton
	closetext
	end



TeknosGymGuyScript:
	faceplayer
	opentext
	checkevent EVENT_WHITNEY_BACK_IN_GYM
	iffalse .whitneynothere
	checkevent EVENT_BEAT_WHITNEY
	iftrue .TeknosGymGuyWinScript
	writetext TeknosGymGuyText
	waitbutton
	closetext
	end
	
.whitneynothere
	writetext TeknosGymGuyTextNotHere
	waitbutton
	closetext
	end
	
.TeknosGymGuyWinScript:
	writetext TeknosGymGuyWinText
	waitbutton
	closetext
	end

TeknosGymStatue:
;	setmapscene OAKS_LAB_ENTRANCE, SCENE_DEFAULT
;	specialphonecall SPECIALCALL_ROBBED
	checkflag ENGINE_PLAINBADGE
	iftrue .Beaten
	jumpstd gymstatue1
.Beaten:
	trainertotext WHITNEY, WHITNEY1, MEM_BUFFER_1
	jumpstd gymstatue2

BridgetWalksUpMovement:
	step LEFT
	turn_head UP
	step_end

BridgetWalksAwayMovement:
	step RIGHT
	turn_head LEFT
	step_end

Whitney_GoodLuck:
	text "Good luck on your"
	line "LEAGUE challenge!"
	done

WhitneyBeforeText:
	text "Yay!"

	para "You came after"
	line "all!"

	para "Thanks again for"
	line "help at the"
	cont "AQUARIUM."
	
	para "But now it's"
	line "different!"
	
	para "So..."
	
	para "Ahem..."
	
	para "I am WHITNEY."
	
	para "Everyone was into"
	line "#MON so I"
	cont "got into them too!"
	
	para "My cute #MON"
	line "will stomp you"
	cont "flat!"
	
	para "...giggle.."

	para "Think you can"
	line "beat me?"
	done

WhitneyShouldntBeSoSeriousText:
	text "Wowie!"
	para "You're even"
	line "stronger than I"
	cont "thought!"
	done

PlayerReceivedPlainBadgeText:
	text "<PLAYER> received"
	line "PLAINBADGE."
	done

Whitney_BadgeSpeech:
	text "PLAINBADGE boosts"
	line "your #MON's"
	cont "SPEED."

	para "Oh, you can have"
	line "this too!"
	done

WhitneyAttractText:
	text "It's ATTRACT!"
	line "It makes full use"

	para "of a #MON's"
	line "charm."

	para "Isn't it just per-"
	line "fect for a cutie"
	cont "like me?"
	done

LassCarrieSeenText:
	text "Don't let my"
	line "#MON's cute"

	para "looks fool you."
	line "They can whip you!"
	done

LassCarrieBeatenText:
	text "Darn… I thought"
	line "you were weak…"
	done

LassCarrieAfterBattleText:
	text "Do my #MON"
	line "think I'm cute?"
	done

LassBridgetSeenText:
	text "I like cute #-"
	line "MON better than"
	cont "strong #MON."

	para "But I have strong"
	line "and cute #MON!"
	done

LassBridgetBeatenText:
	text "Oh, no, no, no!"
	done

LassBridgetAfterBattleText:
	text "I'm trying to beat"
	line "WHITNEY, but…"
	cont "It's depressing."

	para "I'm okay! If I"
	line "lose, I'll just"

	para "try harder next"
	line "time!"
	done

BridgetWhitneyCriesText:
	text "Oh, no. You made"
	line "WHITNEY cry."

	para "It's OK. She'll"
	line "stop soon. She"

	para "always cries when"
	line "she loses."
	done



BeautySamanthaSeenText:
	text "Give it your best"
	line "shot, or I'll take"
	cont "you down!"
	done

BeautySamanthaBeatenText:
	text "No! Oh, MEOWTH,"
	line "I'm so sorry!"
	done

BeautySamanthaAfterBattleText:
	text "I taught MEOWTH"
	line "moves for taking"
	cont "on any type…"
	done
	
TeknosGymGuyTextNotHere:
	text "Yo! CHAMP in"
	line "making!"
	
	para "WHITNEY isn't here"
	line "right now."
	
	para "She's always busy"
	line "helping with local"
	cont "issues."

	para "Something must be"
	line "going down around"
	cont "town."
	done

TeknosGymGuyText:
	text "Yo! CHAMP in"
	line "making!"

	para "This GYM is home"
	line "to normal-type"
	cont "#MON trainers."

	para "I recommend you"
	line "use fighting-type"
	cont "#MON."
	done

TeknosGymGuyWinText:
	text "You won? Great! I"
	line "was busy admiring"
	cont "the ladies here."
	done

TeknosGym_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2, 17, TEKNOS_CITY, 11
	warp_event  3, 17, TEKNOS_CITY, 12

	db 0 ; coord events

	db 2 ; bg events
	bg_event 10, 14, BGEVENT_READ, TeknosGymStatue
	bg_event  4, 15, BGEVENT_READ, TeknosGymStatue

	db 5 ; object events
	object_event 16, 13, SPRITE_WHITNEY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, TeknosGymWhitneyScript, 0
	object_event  4,  8, SPRITE_LASS, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerLassCarrie, 0
	object_event 11,  3, SPRITE_LASS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerLassBridget, 0
	object_event 17,  8, SPRITE_BUENA, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerBeautySamantha, 0
	object_event  5, 15, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, TeknosGymGuyScript, -1
