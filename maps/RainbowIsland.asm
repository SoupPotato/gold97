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
	changeblock $C, $6, $48 ; the rainbow
	changeblock $C, $4, $44
	changeblock $E, $6, $49
	changeblock $E, $4, $45
	changeblock $10, $2, $52
	changeblock $10, $4, $53
	changeblock $12, $2, $50
	changeblock $12, $4, $51
	changeblock $14, $2, $4E
	changeblock $14, $4, $4F
	changeblock $16, $2, $4E
	changeblock $16, $4, $4F
	changeblock $18, $2, $4D
	changeblock $1A, $2, $4D
	changeblock $1C, $2, $4D
	changeblock $1E, $2, $4D
	changeblock $20, $2, $4D
	changeblock $22, $2, $4D
	changeblock $24, $2, $4D
	changeblock $26, $2, $4D	
	changeblock $28, $2, $4E
	changeblock $28, $4, $4F	
	changeblock $2A, $2, $4E
	changeblock $2A, $4, $4F
	changeblock $2C, $2, $50
	changeblock $2C, $4, $51
	changeblock $2E, $2, $52
	changeblock $2E, $4, $53
	changeblock $30, $4, $46
	changeblock $30, $6, $4A
	changeblock $32, $6, $4B
	changeblock $32, $4, $47
	
	changeblock $1C, $4, $23 ;battle arena at top of map
	changeblock $1C, $6, $22
	changeblock $20, $4, $23
	changeblock $20, $6, $22
	
	changeblock $1E, $12, $8B ; palmtrees
	changeblock $26, $12, $8B
	changeblock $14, $14, $12
	changeblock $C, $18, $12
	changeblock $E, $1A, $12
	changeblock $C, $1C, $12
	changeblock $C, $22, $12
	changeblock $A, $26, $12
	changeblock $C, $26, $12
	changeblock $8, $28, $12
	changeblock $A, $28, $12
	changeblock $C, $28, $12
	changeblock $8, $2A, $12
	changeblock $A, $2A, $12
	changeblock $16, $2A, $12
	changeblock $18, $28, $12
	changeblock $1E, $26, $12
	changeblock $20, $26, $12
	changeblock $26, $28, $12
	changeblock $28, $2A, $12
	changeblock $32, $26, $12
	changeblock $34, $26, $12
	changeblock $32, $28, $12
	changeblock $34, $28, $12
	changeblock $36, $28, $12
	changeblock $34, $2A, $12
	changeblock $36, $2A, $12
	changeblock $34, $1E, $12
	changeblock $32, $1C, $12
	changeblock $30, $1A, $12
	changeblock $2E, $18, $12
	changeblock $2C, $18, $12
	changeblock $22, $1A, $8B
	changeblock $20, $1A, $8B
	
	changeblock $E, $26, $40 ; flowers
	changeblock $E, $28, $40
	changeblock $C, $2A, $40
	changeblock $E, $2A, $40
	changeblock $10, $2C, $40
	changeblock $A, $2C, $40
	changeblock $C, $2C, $40
	changeblock $E, $2C, $40
	changeblock $C, $2E, $40
	changeblock $E, $2E, $40
	changeblock $10, $2E, $40
	changeblock $16, $2C, $40
	changeblock $18, $2A, $40
	changeblock $1A, $28, $40
	changeblock $1C, $28, $40
	changeblock $1E, $28, $40
	changeblock $20, $28, $40
	changeblock $22, $28, $40
	changeblock $24, $28, $40
	changeblock $26, $2A, $40
	changeblock $28, $2C, $40
	changeblock $30, $26, $40
	changeblock $30, $28, $40
	changeblock $30, $2A, $40
	changeblock $32, $2A, $40
	changeblock $2E, $2C, $40
	changeblock $30, $2C, $40
	changeblock $32, $2C, $40
	changeblock $34, $2C, $40
	changeblock $2E, $2E, $40
	changeblock $30, $2E, $40
	changeblock $32, $2E, $40
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
	line "palms and grass,"
	cont "they're totally"
	cont "brown!"
	
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
	waitbutton ; added this just now
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
	checkevent EVENT_PACKAGE_TAKEN_NO_SHOW
	iffalse .skipPackages1 ; if package is sitting there unopened
	checkevent EVENT_TAKEN_GOLD_TROPHY
	iftrue .skipPackages1
	setevent EVENT_GOLD_TROPHY_IN_PACKAGE
	clearevent EVENT_PACKAGE_TAKEN_NO_SHOW
.skipPackages1:
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
	checkevent EVENT_PACKAGE_TAKEN_NO_SHOW
	iffalse .skipPackages2 ; if package is sitting there unopened
	checkevent EVENT_TAKEN_GOLD_TROPHY
	iftrue .skipPackages2
	setevent EVENT_GOLD_TROPHY_IN_PACKAGE
	clearevent EVENT_PACKAGE_TAKEN_NO_SHOW
.skipPackages2:
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
	