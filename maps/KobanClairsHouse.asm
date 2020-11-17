	const_def 2 ; object constants
	const KOBANHOUSE_1_CLAIR

KobanClairsHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

KobanClairsHouseClairScript:
	faceplayer
	checkevent EVENT_SWITCH_14
	iftrue .AfterDratiniGift
	checkitem MACHINE_PART
	iffalse .NoOrbYet
	checkevent EVENT_GOT_DRATINI
	iffalse .GiveDratiniClair
.AfterDratiniGift
	checkevent EVENT_BATTLE_AVAILABLE_CLAIR
	iftrue rematchscriptClair
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue postrematchscriptClair
	
	opentext
	writetext DragonsAreGreatText
	waitbutton
	closetext
	end
	
.NoOrbYet
	opentext
	writetext GoGetTheOrbText
	waitbutton
	closetext
	end
	
.GiveDratiniClair
	opentext
	writetext ClairTakeThisDratiniText
	waitbutton
	checkcode VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .PartyFullClair
	writetext ClairPlayerReceivedDratiniText
	playsound SFX_CAUGHT_MON
	waitsfx
	givepoke DRATINI, 15
;	checkevent EVENT_ANSWERED_DRAGON_MASTER_QUIZ_WRONG
	special GiveDratini
	setevent EVENT_GOT_DRATINI
	setevent EVENT_SWITCH_14
	takeitem MACHINE_PART
;	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_7
	writetext ClairSymbolicDragonText
	waitbutton
	closetext
	end	
	
.PartyFullClair:
	writetext DragonShrinePartyFullTextClair
	waitbutton
	closetext
	end
	
	
rematchscriptClair:
	opentext
	writetext ClairRematchText
	waitbutton
	closetext
	winlosstext ClairRematchWinText, 0
	loadtrainer CLAIR, CLAIR1
	startbattle
	reloadmapafterbattle
	clearevent EVENT_BATTLE_AVAILABLE_CLAIR
	opentext
	writetext ClairAfterRematchText
	waitbutton
	closetext
	end

postrematchscriptClair:
	opentext
	writetext ClairAfterRematchText
	waitbutton
	closetext
	end

ClairRematchText:
	text "So you've met my"
	line "cousin, LANCE."
	
	para "And that means"
	line "you've beaten"
	cont "the #MON"
	cont "LEAGUE!"
	
	para "Both LANCE and I"
	line "come from a long"
	cont "line of powerful"
	cont "DRAGON trainers."
	
	para "Oblige me the"
	line "honor of showing"
	cont "you my own skill!"
	done

ClairRematchWinText:
	text "I lost?"
	
	para "Well, I cannot"
	line "say it surprises"
	cont "me much!"
	
	para "You wear your"
	line "CHAMPION's title"
	cont "with honor!"
	done

ClairAfterRematchText:
	text "If it weren't"
	line "for my duties"
	cont "here at KOBAN"
	cont "ISLAND, I could"
	cont "be a GYM LEADER."
	
	para "Perhaps I'll"
	line "consider it if"
	cont "the LEAGUE ever"
	cont "chooses to build"
	cont "one here."
	
	para "Next time you"
	line "see LANCE, give"
	cont "him a reckoning"
	cont "for my sake!"
	done
	
	
	
ClairPlayerReceivedDratiniText:
	text "<PLAYER> received"
	line "DRATINI!"
	done
	
ClairSymbolicDragonText:
	text "DRAGON #MON are"
	line "difficult to"
	para "raise, but their"
	line "majesty and"
	para "strength make it"
	line "worth it."
	para "I trust you can"
	line "raise that DRATINI"
	cont "properly."
	done
	
DragonShrinePartyFullTextClair:
	text "You have no room"
	line "in your party for"
	cont "this!"
	done
	
ClairTakeThisDratiniText:
	text "Ah, the DRAGON"
	line "ORB!"
	para "I see you have"
	line "learned of the"
	para "power of DRAGON"
	line "#MON!"
	para "I would like to"
	line "reward you with"
	para "a special #MON"
	line "that deserves to"
	para "be raised by a"
	line "worthy TRAINER!"
	done
	
GoGetTheOrbText:
	text "Retreive the"
	line "DRAGON ORB from"
	para "a TRAINER in the"
	line "cave, and bring it"
	cont "to me."
	done
	
DragonsAreGreatText:
	text "Being a DRAGON"
	line "TRAINER requires"
	para "more dedication"
	line "than most types."
	para "It is very much a"
	line "way of life."
	done

KobanClairsHouseClairText:
	text "yo sup"
	done

KobanClairsHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, KOBAN_ISLAND, 1
	warp_event  5,  7, KOBAN_ISLAND, 1

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  7, 4, SPRITE_CLAIR, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, KobanClairsHouseClairScript, EVENT_BLACKTHORN_CITY_GRAMPS_NOT_BLOCKING_DRAGONS_DEN
