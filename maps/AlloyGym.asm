	const_def 2 ; object constants
	const OLIVINEGYM_JASMINE
	const OLIVINEGYM_GYM_GUY
	const OLIVINEGYM_BOULDER1
	const OLIVINEGYM_BOULDER2
	const OLIVINEGYM_BOULDER3
	const OLIVINEGYM_GENTLEMAN
	const OLIVINEGYM_GENTLEMAN2
	const OLIVINEGYM_SUPERNERD

AlloyGym_MapScripts:
	db 0 ; scene scripts

	db 2 ; callbacks
	callback MAPCALLBACK_TILES, .BouldersOlivine
	callback MAPCALLBACK_CMDQUEUE, .SetUpStoneTable


.BouldersOlivine:
	checkevent EVENT_CHARCOAL_KILN_FARFETCH_D
	iffalse .skip1olivine
	changeblock 10, 12, $2f
.skip1olivine
	checkevent EVENT_CHARCOAL_KILN_APPRENTICE
	iffalse .skip2olivine
	changeblock 4, 14, $2f
.skip2olivine
	checkevent EVENT_CHARCOAL_KILN_BOSS
	iffalse .skip3olivine
	changeblock 4, 0, $2f
.skip3olivine
	return
	

.SetUpStoneTable:
	writecmdqueue .CommandQueue
	return

.CommandQueue:
	cmdqueue CMDQUEUE_STONETABLE, .StoneTable ; check if any stones are sitting on a warp

.StoneTable:
	stonetable 5, OLIVINEGYM_BOULDER1, .Boulder1
	stonetable 4, OLIVINEGYM_BOULDER2, .Boulder2
	stonetable 3, OLIVINEGYM_BOULDER3, .Boulder3
	db -1 ; end

.Boulder1:
	disappear OLIVINEGYM_BOULDER1
	pause 30
	playsound SFX_STRENGTH
	earthquake 80
	changeblock 10, 12, $2f
	opentext
	writetext AlloyGymBoulderFilled
	waitbutton
	closetext
	setevent EVENT_CHARCOAL_KILN_FARFETCH_D
	end

.Boulder2:
	disappear OLIVINEGYM_BOULDER2
	pause 30
	playsound SFX_STRENGTH
	earthquake 80
	changeblock 4, 14, $2f
	opentext
	writetext AlloyGymBoulderFilled
	waitbutton
	closetext
	setevent EVENT_CHARCOAL_KILN_APPRENTICE
	end

.Boulder3:
	disappear OLIVINEGYM_BOULDER3
	pause 30
	playsound SFX_STRENGTH
	earthquake 80
	changeblock 4, 0, $2f
	opentext
	writetext AlloyGymBoulderFilled
	waitbutton
	closetext
	setevent EVENT_CHARCOAL_KILN_BOSS
	end

AlloyGymJasmineScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_JASMINE
	iftrue .FightDone
	writetext Jasmine_SteelTypeIntro
	waitbutton
	closetext
	winlosstext Jasmine_BetterTrainer, 0
	loadtrainer JASMINE, JASMINE1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_JASMINE
	opentext
	writetext Text_ReceivedMineralBadge
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_MINERALBADGE
	checkcode VAR_BADGES
	scall AlloyGymActivateRockets
.FightDone:
	checkevent EVENT_GOT_TM23_IRON_TAIL
	iftrue .GotIronTail
	writetext Jasmine_BadgeSpeech
	buttonsound
	verbosegiveitem TM_IRON_TAIL
	iffalse .NoRoomForIronTail
	setevent EVENT_GOT_TM23_IRON_TAIL
	writetext Jasmine_IronTailSpeech
	waitbutton
	closetext
	end

.GotIronTail:
	writetext Jasmine_GoodLuck
	waitbutton
.NoRoomForIronTail:
	closetext
	end

AlloyGymActivateRockets:
	ifequal 7, .RadioTowerRockets
	ifequal 6, .GoldenrodRockets
	end

.GoldenrodRockets:
	jumpstd goldenrodrockets

.RadioTowerRockets:
	jumpstd radiotowerrockets

AlloyGymGuyScript:
	faceplayer
	checkevent EVENT_BEAT_JASMINE
	iftrue .AlloyGymGuyWinScript
	opentext
	writetext AlloyGymGuyText
	waitbutton
	closetext
	end

.AlloyGymGuyWinScript:
	opentext
	writetext AlloyGymGuyWinText
	waitbutton
	closetext
	end


AlloyGymStatue:
	checkflag ENGINE_MINERALBADGE
	iftrue .Beaten
	jumpstd gymstatue1
.Beaten:
	trainertotext JASMINE, JASMINE1, MEM_BUFFER_1
	jumpstd gymstatue2

AlloyGymBoulder:
	jumpstd strengthboulder
	

TrainerGentlemanPreston:
	trainer GENTLEMAN, PRESTON, EVENT_BEAT_GENTLEMAN_PRESTON, GentlemanPrestonSeenText, GentlemanPrestonBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GentlemanPrestonAfterBattleText
	waitbutton
	closetext
	end


TrainerGentlemanAlfred:
	trainer GENTLEMAN, ALFRED, EVENT_BEAT_GENTLEMAN_ALFRED, GentlemanAlfredSeenText, GentlemanAlfredBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GentlemanAlfredAfterBattleText
	waitbutton
	closetext
	end


TrainerSuperNerdTom:
	trainer SUPER_NERD, TOM, EVENT_BEAT_SUPER_NERD_TOM, SuperNerdTomSeenText, SuperNerdTomBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SuperNerdTomAfterBattleText
	waitbutton
	closetext
	end


Jasmine_SteelTypeIntro:
	text "Only those who"
	line "have shown that"
	para "they can handle"
	line "the #MON of my"
	para "GYM TRAINERS have"
	line "proven themselves"
	para "to be worthy"
	line "opponents of the"
	para "incredible defense"
	line "of my STEEL"
	cont "#MON."
	para "You've done well"
	line "to defeat them."
	para "But are you ready"
	line "for me?"
	done

Jasmine_BetterTrainer:
	text "…You are a better"
	line "trainer than me,"

	para "and have proven"
	line "it in this battle."

	para "In accordance with"
	line "LEAGUE rules, I"

	para "confer upon you"
	line "this BADGE."
	done

Text_ReceivedMineralBadge:
	text "<PLAYER> received"
	line "MINERALBADGE."
	done

Jasmine_BadgeSpeech:
	text "MINERALBADGE"
	line "raises #MON's"
	cont "DEFENSE."
	
	para "It also lets you"
	line "use FLY outside"
	cont "of battle."

	para "You've earned this"
	line "too."
	done

Text_ReceivedTM09:
	text "<PLAYER> received"
	line "TM09."
	done

Jasmine_IronTailSpeech:
	text "You could use"
	line "that TM to teach"
	cont "IRON TAIL."
	done

Jasmine_GoodLuck:
	text "Good luck with"
	line "the rest of your"
	cont "LEAGUE challenge."
	para "I expect you to"
	line "make it to the"
	cont "end."
	done

AlloyGymGuyText:
	text "JASMINE uses the"
	line "newly discovered"
	cont "steel-type."

	para "I don't know very"
	line "much about it."
	done

AlloyGymGuyWinText:
	text "That was awesome."

	para "The steel-type,"
	line "huh?"

	para "That was a close"
	line "encounter of an"
	cont "unknown kind!"
	done


	
AlloyGymBoulderFilled:
	text "The boulder filled"
	line "the hole!"
	done


GentlemanPrestonSeenText:
	text "Have you ever"
	line "faced off against"
	para "the defenses of"
	line "STEEL #MON?"
	done

GentlemanPrestonBeatenText:
	text "A good trainer is"
	line "ready to face all"
	cont "types."
	done

GentlemanPrestonAfterBattleText:
	text "STEEL #MON have"
	line "high DEFENSE."
	para "But they're not"
	line "impenetrable."
	done


GentlemanAlfredSeenText:
	text "This GYM used to"
	line "use ROCK #MON."
	para "But JASMINE found"
	line "the new STEEL type"
	cont "more appealing."
	done

GentlemanAlfredBeatenText:
	text "Good show!"
	done

GentlemanAlfredAfterBattleText:
	text "ONIX wasn't known"
	line "to have an evolved"
	para "form until"
	line "recently."
	done
	
SuperNerdTomSeenText:
	text "The STEEL type"
	line "is rare!"
	para "Which means of"
	line "course I have to"
	cont "use it!"
	done

SuperNerdTomBeatenText:
	text "Victories are also"
	line "rare…"
	done

SuperNerdTomAfterBattleText:
	text "I only am"
	line "interested in"
	cont "rare things."
	done

AlloyGym_MapEvents:
	db 0, 0 ; filler

	db 5 ; warp events
	warp_event 16, 15, ALLOY_CITY, 2
	warp_event 17, 15, ALLOY_CITY, 13
	warp_event  4,  1, ALLOY_CITY, 1; boulder 3
	warp_event  4, 15, ALLOY_CITY, 1; boulder 2
	warp_event 10, 13, ALLOY_CITY, 1; boulder 1

	db 0 ; coord events

	db 2 ; bg events
	bg_event 15, 13, BGEVENT_READ, AlloyGymStatue
	bg_event 18, 13, BGEVENT_READ, AlloyGymStatue

	db 8 ; object events
	object_event  1,  4, SPRITE_JASMINE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, AlloyGymJasmineScript, -1
	object_event 19, 13, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, AlloyGymGuyScript, -1
	object_event 16,  9, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AlloyGymBoulder, EVENT_CHARCOAL_KILN_FARFETCH_D
	object_event 10, 10, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AlloyGymBoulder, EVENT_CHARCOAL_KILN_APPRENTICE
	object_event 12,  3, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AlloyGymBoulder, EVENT_CHARCOAL_KILN_BOSS
	object_event 18,  7, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerGentlemanPreston, -1
	object_event 16,  1, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerGentlemanAlfred, -1
	object_event 11,  7, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 1, TrainerSuperNerdTom, -1

