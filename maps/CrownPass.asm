	const_def 2 ; object constants
	const CrownPass_SILVER

CrownPass_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

RivalBattleFinal:
	showemote EMOTE_SHOCK, PLAYER, 15
	special FadeOutMusic
	pause 15
	turnobject CrownPass_SILVER, DOWN
	pause 15
	applymovement CrownPass_SILVER, UndergroundSilverWalksToPlayer
	turnobject PLAYER, LEFT
	playmusic MUSIC_RIVAL_ENCOUNTER
	opentext
	writetext UndergroundSilverBeforeText
	waitbutton
	closetext
	checkevent EVENT_GOT_CRUIZE_FROM_ELM
	iftrue .cruise
	checkevent EVENT_GOT_CHIKORITA_FROM_ELM
	iftrue .CHIKORITA
	winlosstext UndergroundSilverWinText, UndergroundSilverLossText
	;setlasttalked SLOWPOKE_WELL_B1F_SILVER
	loadtrainer RIVAL1, RIVAL1_5_CRUIZE
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump .returnfrombattle

.cruise
	winlosstext UndergroundSilverWinText, UndergroundSilverLossText
	;setlasttalked SLOWPOKE_WELL_B1F_SILVER
	loadtrainer RIVAL1, RIVAL1_5_CHIKORITA
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump .returnfrombattle

.CHIKORITA
	winlosstext UndergroundSilverWinText, UndergroundSilverLossText
	;setlasttalked SLOWPOKE_WELL_B1F_SILVER
	loadtrainer RIVAL1, RIVAL1_5_FLAMBEAR
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump .returnfrombattle

.returnfrombattle
	playmusic MUSIC_RIVAL_AFTER
	opentext
	writetext UndergroundSilverAfterText
	waitbutton
	closetext
	applymovement PLAYER, UndergroundPlayer1StepToTheSide
	applymovement CrownPass_SILVER, UndergroundSilverLeavesMovement
	disappear CrownPass_SILVER
	setscene SCENE_UNDERGROUND_NOTHING
	setevent EVENT_EMERGENCY_SWITCH
	setmapscene CROWN_CITY, SCENE_CHERRYGROVECITY_MEET_RIVAL
	special HealParty
	special FadeOutMusic
	waitsfx
	playmapmusic
	pause 15
	end

CrownPassHiddenFullRestore:
	hiddenitem FULL_RESTORE, EVENT_UNDERGROUND_PATH_HIDDEN_FULL_RESTORE

CrownPassHiddenXSpecial:
	hiddenitem X_SPECIAL, EVENT_UNDERGROUND_PATH_HIDDEN_X_SPECIAL
	
UndergroundSilverWalksToPlayer:
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	turn_head RIGHT
	step_end
	
UndergroundPlayer1StepToTheSide:
	step RIGHT
	turn_head LEFT
	step_end
	
UndergroundSilverLeavesMovement:
	step RIGHT
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end
	
UndergroundSilverBeforeText:
	text "Hi, <PLAY_G>!"
	
	para "You're about to"
	line "climb MT.FUJI,"
	cont "right?"
	
	para "It's been a long"
	line "journey."
	
	para "We've both been"
	line "through a lot."
	
	para "Are your #MON"
	line "ready?"

	para "Let's face off,"
	line "right here!"
	
	para "A battle between"
	line "friends!"
	done
	
UndergroundSilverWinText:
	text "…"
	done
	
UndergroundSilverLossText:
	text "…"
	done
	
UndergroundSilverAfterText:
	text "You know what I've"
	line "realized?"
	
	para "I was so excited"
	line "to challenge the"
	cont "LEAGUE."
	
	para "I wanted to have"
	line "the strongest"
	cont "#MON."
	
	para "I wanted to be the"
	line "toughest trainer"
	cont "there is."
	
	para "But dealing with"
	line "TEAM ROCKET has"
	cont "made me think."

	para "I've realized I"
	line "need to treat my"
	cont "team with love."
	
	para "So, I don't think"
	line "I'm quite ready to"
	cont "face the LEAGUE"
	cont "until I've worked"
	cont "on that."
	
	para "<PLAY_G>,"
	line "good luck."
	
	para "I'll see you"
	line "around soon."
	done

CrownPass_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 10, 33, VICTORY_ROAD_GATE, 3
	warp_event 11,  1, CROWN_CITY, 1

	db 1 ; coord events
	coord_event 12,  7, SCENE_DEFAULT, RivalBattleFinal

	db 2 ; bg events
	bg_event  5, 16, BGEVENT_ITEM, CrownPassHiddenFullRestore
	bg_event 12, 14, BGEVENT_ITEM, CrownPassHiddenXSpecial

	db 1 ; object events
	object_event 11,  2, SPRITE_SILVER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_EMERGENCY_SWITCH
