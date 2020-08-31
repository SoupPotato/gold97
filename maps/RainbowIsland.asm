	const_def 2
	const RI_BLUE1
	const RI_BLUE2

RainbowIsland_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .RainbowIslandRestored
	
.RainbowIslandRestored:
	checkevent EVENT_RI_RESTORED
	iffalse .Done
	changeblock $C, $6, $CA ; the rainbow
	changeblock $C, $4, $BF
	changeblock $E, $6, $BE
	changeblock $E, $2, $BF
	changeblock $E, $4, $BD
	changeblock $10, $2, $C0
	changeblock $10, $4, $BE
	changeblock $12, $2, $BC
	changeblock $14, $2, $BC
	changeblock $16, $2, $BC
	changeblock $18, $2, $BC
	changeblock $1A, $2, $BC
	changeblock $1C, $2, $BC
	changeblock $1E, $2, $BC
	changeblock $20, $2, $BC
	changeblock $22, $2, $BC
	changeblock $24, $2, $BC
	changeblock $26, $2, $BC
	changeblock $28, $2, $BC
	changeblock $2A, $2, $BC
	changeblock $2C, $2, $BC
	changeblock $2E, $2, $C1
	changeblock $2E, $4, $C4
	changeblock $30, $2, $C2
	changeblock $30, $4, $C3
	changeblock $30, $6, $C4
	changeblock $32, $4, $C2
	changeblock $32, $6, $CB
	
	changeblock $1C, $4, $D8 ;battle arena at top of map
	changeblock $1C, $6, $D9
	changeblock $20, $4, $D8
	changeblock $20, $6, $D9
	
	changeblock $1E, $12, $B9 ; palmtrees
	changeblock $26, $12, $B9
	changeblock $14, $14, $B9
	changeblock $C, $18, $B9
	changeblock $E, $1A, $B9
	changeblock $C, $1C, $B9
	changeblock $C, $22, $B9
	changeblock $A, $26, $B9
	changeblock $C, $26, $B9
	changeblock $8, $28, $B9
	changeblock $A, $28, $B9
	changeblock $C, $28, $B9
	changeblock $8, $2A, $B9
	changeblock $A, $2A, $B9
	changeblock $16, $2A, $B9
	changeblock $18, $28, $B9
	changeblock $1E, $26, $B9
	changeblock $20, $26, $B9
	changeblock $26, $28, $B9
	changeblock $28, $2A, $B9
	changeblock $32, $26, $B9
	changeblock $34, $26, $B9
	changeblock $32, $28, $B9
	changeblock $34, $28, $B9
	changeblock $36, $28, $B9
	changeblock $34, $2A, $B9
	changeblock $36, $2A, $B9
	changeblock $34, $1E, $B9
	changeblock $32, $1C, $B9
	changeblock $30, $1A, $B9
	changeblock $2E, $18, $B9
	changeblock $2C, $18, $B9
	changeblock $22, $1A, $B9
	changeblock $20, $1A, $B9
	
	changeblock $E, $26, $B8 ; flowers
	changeblock $E, $28, $B8
	changeblock $C, $2A, $B8
	changeblock $E, $2A, $B8
	changeblock $10, $2C, $B8
	changeblock $A, $2C, $B8
	changeblock $C, $2C, $B8
	changeblock $E, $2C, $B8
	changeblock $C, $2E, $B8
	changeblock $E, $2E, $B8
	changeblock $10, $2E, $B8
	changeblock $16, $2C, $B8
	changeblock $18, $2A, $B8
	changeblock $1A, $28, $B8
	changeblock $1C, $28, $B8
	changeblock $1E, $28, $B8
	changeblock $20, $28, $B8
	changeblock $22, $28, $B8
	changeblock $24, $28, $B8
	changeblock $26, $2A, $B8
	changeblock $28, $2C, $B8
	changeblock $30, $26, $B8
	changeblock $30, $28, $B8
	changeblock $30, $2A, $B8
	changeblock $32, $2A, $B8
	changeblock $2E, $2C, $B8
	changeblock $30, $2C, $B8
	changeblock $32, $2C, $B8
	changeblock $34, $2C, $B8
	changeblock $2E, $2E, $B8
	changeblock $30, $2E, $B8
	changeblock $32, $2E, $B8
.Done:
	return

	

BlueFirstScript:
	faceplayer
	opentext
	writetext BluePt1Text
	waitbutton
	closetext
	turnobject RI_BLUE1, UP
	opentext
	writetext BluePt2Text
	waitbutton
	closetext
	faceplayer
	opentext
	writetext BluePt3Text
	waitbutton
	closetext
	special FadeOutPalettes
	disappear RI_BLUE1
	pause 10
	special LoadMapPalettes
	special FadeInPalettes
	;event setting here
	clearevent EVENT_RIC_BLUE_HIDDEN
	setevent EVENT_RI_BLUEINTRO_HIDDEN
	end

BluePt1Text:
	text "Hey! <PLAY_G>!"
	line "I'm surprised to"
	cont "see you all the"
	cont "way out here on"
	cont "RAINBOW ISLAND!"
	
	para "I came out here"
	line "to do #MON"
	cont "research, but I"
	cont "became intrigued"
	cont "by something else…"
	done

BluePt2Text:
	text "Look at these"
	line "flowers and palms,"
	cont "they're totally"
	cont "gray!"
	
	para "Old stories and"
	line "legends of this"
	cont "island suggest"
	cont "that it used to"
	cont "be an amazingly"
	cont "colorful place…"
	
	para "But now it looks"
	line "like this? What"
	cont "happened here?"
	done

BluePt3Text:
	text "So I did some"
	line "more research,"
	cont "and I think I"
	cont "might have a"
	cont "theory!"
	
	para "Although…"
	line "It's a long"
	cont "shot to say the"
	cont "least if I'm"
	cont "correct."
	
	para "Meet me in the"
	line "cave to the"
	cont "northeast of the"
	cont "island and I'll"
	cont "explain more!"
	
	para "You'll need"
	line "WATERFALL to get"
	cont "there!"
	done

BlueBattleScript:
	faceplayer
	checkevent EVENT_BEAT_BLUE_ONCE_BEFORE
	iftrue .bluerematch
	opentext
	writetext BlueCommendsText
	waitbutton
	closetext
	special FadeOutMusic
	opentext
	writetext BlueFirstChallengeText
	winlosstext BlueFirstWinText, 0
	loadtrainer BLUE, BLUE1
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	special FadeOutMusic
	opentext
	writetext BlueFirstAfterText
	waitbutton
	closetext
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	disappear RI_BLUE2
	setevent EVENT_BEAT_BLUE_ONCE_BEFORE
	setevent EVENT_RI_BLUEBATTLE_HIDDEN
	pause 15
	special FadeInQuickly
	pause 30
	special HealParty
	refreshscreen
	credits
	end
	
.bluerematch
	opentext
	writetext BlueSecondChallengeText
	winlosstext BlueSecondWinText, 0
	loadtrainer BLUE, BLUE1
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	special FadeOutMusic
	opentext
	writetext BlueSecondAfterText
	waitbutton
	closetext
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	disappear RI_BLUE2
	setevent EVENT_RI_BLUEBATTLE_HIDDEN
	pause 15
	special FadeInQuickly
	pause 30
	special HealParty
	refreshscreen
	credits
	end


BlueCommendsText:
	text "This is just"
	line "incredible…"
	
	para "<PLAY_G>, you've"
	line "really got a"
	cont "talent for making"
	cont "the impossible"
	cont "happen!"
	
	para "You've grown so"
	line "much as a trainer"
	cont "since me and"
	cont "gramps sent you"
	cont "out from SILENT"
	cont "TOWN…"
	
	para "But this HAS to"
	line "take the cake for"
	cont "the most amazing"
	cont "thing I've ever"
	cont "seen!"
	
	para "Truly it's been"
	line "an honor helping"
	cont "you get this far!"
	done

BlueFirstChallengeText:
	text "If I was to give"
	line "you a reward for"
	cont "an occasion like"
	cont "this…"

	para "Well… There's"
	line "only one thing"
	cont "I could imagine"
	cont "you'd want!"
	
	para "<PLAY_G>!"
	
	para "As the former"
	line "CHAMPION of the"
	cont "#MON LEAGUE,"
	cont "I challenge you!"
	done
	
BlueFirstWinText:
	text "It's all over!"
	
	para "That was a battle"
	line "for the history"
	cont "books, no doubt"
	cont "about it!"
	done

BlueFirstAfterText:
	text "Whew…"
	
	para "I haven't had"
	line "someone give me a"
	cont "run for my money"
	cont "like that since"
	cont "I fought my old"
	cont "pal at INDIGO"
	cont "PLATEAU!"
	
	para "Man… That still"
	line "feels like it was"
	cont "just yesterday…"
	
	para "Welp! I guess its"
	line "time for me to"
	cont "wrap up my"
	cont "research tour."
	
	para "What a time it's"
	line "been!"
	
	para "<PLAY_G>! I guess"
	line "I'll…"
	
	para "Smell ya later!"
	done


BlueSecondChallengeText:
	text "Hey <PLAY_G>!"
	
	para "Back for round"
	line "two huh?"
	
	para "Well, don't think"
	line "I'll go easy if"
	cont "you've beat me"
	cont "before!"
	
	para "Let's go!"
	done


BlueSecondAfterText:
	text "Whew! I'll be"
	line "doing some more"
	cont "training!"
	
	para "Until then, I'll"
	line "see you around!"
	done


BlueSecondWinText:
	text "You're no joke!"
	
	para "Keep on getting"
	line "stronger!"
	done


RainbowIsland_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event 49, 15, RAINBOW_ISLAND_CAVE, 1

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event 32, 42, SPRITE_BLUE, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BlueFirstScript, EVENT_RI_BLUEINTRO_HIDDEN ; one
	object_event 31,  5, SPRITE_BLUE, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BlueBattleScript, EVENT_RI_BLUEBATTLE_HIDDEN ; two
	