	const_def 2 ; object constants
	const VictoryRoadOutside_POKEFAN_M
	const VictoryRoadOutside_SPORTSMAN
	const VictoryRoadOutside_LASS

VictoryRoadOutside_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks


TrainerHikerBenjamin:
	trainer HIKER, BENJAMIN, EVENT_BEAT_HIKER_BENJAMIN, HikerBenjaminSeenText, HikerBenjaminBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext HikerBenjaminAfterBattleText
	waitbutton
	closetext
	end
	
TrainerSportsmanArthur:
	trainer SPORTSMAN, ARTHUR, EVENT_BEAT_SPORTSMAN_ARTHUR, SportsmanArthurSeenText, SportsmanArthurBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SportsmanArthurAfterBattleText
	waitbutton
	closetext
	end

HealerLassScript:
	faceplayer
	opentext
	checkevent EVENT_SWITCH_9
	iftrue .LassHealSequence
	writetext LassIntroText
	setevent EVENT_SWITCH_9
	waitbutton
	jump .LassHealSequence
	end

.LassHealSequence
	writetext LassAsksToHeal
	yesorno
	iftrue .LassHealTime
	writetext NoHealThisTime
	waitbutton
	closetext
	end
	
.LassHealTime
	writetext LassHealTimeText
	waitbutton
	closetext
	special FadeOutPalettes
	playmusic MUSIC_HEAL
	pause 60
	special HealParty
	special FadeInPalettes
	special RestartMapMusic
	opentext
	writetext LassHealTimeText2
	waitbutton
	closetext
	end
	
LassIntroText:
	text "We're already"
	line "pretty high up the"
	cont "mountain."
	para "Hm? Yes, I'm a"
	line "trainer, but I'm"
	cont "taking a break."
	para "I've brought"
	line "plenty of medicine"
	cont "with me."
	para "If your #MON"
	line "need restored, let"
	para "me know, and I can"
	line "help you out."
	done
	
LassAsksToHeal:
	text "How about it?"
	para "Your #MON need"
	line "healed?"
	done
	
NoHealThisTime:
	text "Well, okay."
	para "I'll be here a"
	line "while, so stop by"
	cont "if you need to."
	done
	
LassHealTimeText:
	text "Okay, let me see"
	line "your #MON for"
	cont "just a second…"
	done
	
LassHealTimeText2:
	text "There we are!"
	para "Your team looks"
	line "ready to go!"
	done

SportsmanArthurSeenText:
	text "I think I can jog"
	line "my way to the top."
	done

SportsmanArthurBeatenText:
	text "Out of breath!"
	done

SportsmanArthurAfterBattleText:
	text "I'm not much of a"
	line "HIKER, after all."
	done

HikerBenjaminSeenText:
	text "Ah, it's good to"
	line "be outside!"
	cont "I feel so free!"
	done

HikerBenjaminBeatenText:
	text "Gahahah!"
	done

HikerBenjaminAfterBattleText:
	text "It takes a long"
	line "time to reach the"
	cont "summit."
	para "Stepping outside"
	line "is a breath of"
	cont "fresh air!"
	done

VictoryRoadOutside_MapEvents:
	db 0, 0 ; filler

	db 8 ; warp events
	warp_event 11, 15, VICTORY_ROAD, 2
	warp_event  5, 13, VICTORY_ROAD, 3
	warp_event 15, 11, VICTORY_ROAD, 4
	warp_event 11,  9, VICTORY_ROAD, 5
	warp_event  1,  7, VICTORY_ROAD, 6
	warp_event 17,  5, VICTORY_ROAD_2F, 1
	warp_event 11,  3, VICTORY_ROAD_2F, 2
	warp_event  7,  1, VICTORY_ROAD_2F, 3

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  3, 14, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 2, TrainerHikerBenjamin, -1
	object_event  3,  6, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerSportsmanArthur, -1
	object_event  7,  8, SPRITE_LASS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 1, HealerLassScript, -1
