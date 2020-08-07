	const_def 2 ; object constants
	const MAHOGANYGYM_PRYCE
	const MAHOGANYGYM_BUENA1
	const MAHOGANYGYM_ROCKER1
	const MAHOGANYGYM_BUENA2
	const MAHOGANYGYM_ROCKER2
	const MAHOGANYGYM_ROCKER3
	const MAHOGANYGYM_GYM_GUY

BlueForestGym_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

BlueForestGymPryceScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_PRYCE
	iftrue .FightDone
	writetext PryceText_Intro
	waitbutton
	closetext
	winlosstext PryceText_Impressed, 0
	loadtrainer PRYCE, PRYCE1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_PRYCE
	opentext
	writetext Text_ReceivedGlacierBadge
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_GLACIERBADGE
	checkcode VAR_BADGES
	scall BlueForestGymActivateRockets
.FightDone:
	checkevent EVENT_GOT_TM16_ICY_WIND
	iftrue PryceScript_Defeat
	setevent EVENT_BEAT_SKIER_ROXANNE
	setevent EVENT_BEAT_BOARDER_BRAD
	setevent EVENT_BEAT_BOARDER_DOUGLAS
	setevent EVENT_BLACKTHORN_CITY_SUPER_NERD_BLOCKS_GYM; for workers south of town
	setevent EVENT_ILEX_FOREST_FARFETCHD; makes normal pokes in zoo disappear
	writetext PryceText_GlacierBadgeSpeech
	buttonsound
	verbosegiveitem TM_ICY_WIND
	iffalse BlueForestGym_NoRoomForIcyWind
	setevent EVENT_GOT_TM16_ICY_WIND
	writetext PryceText_IcyWindSpeech
	waitbutton
	closetext
	end

PryceScript_Defeat:
	writetext PryceText_CherishYourPokemon
	waitbutton
BlueForestGym_NoRoomForIcyWind:
	closetext
	end

BlueForestGymActivateRockets:
	ifequal 7, .RadioTowerRockets
	ifequal 6, .GoldenrodRockets
	end

.GoldenrodRockets:
	jumpstd goldenrodrockets

.RadioTowerRockets:
	jumpstd radiotowerrockets

TrainerSkierRoxanne:
	trainer SKIER, ROXANNE, EVENT_BEAT_SKIER_ROXANNE, SkierRoxanneSeenText, SkierRoxanneBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SkierRoxanneAfterBattleText
	waitbutton
	closetext
	end

TrainerSkierClarissa:
	trainer SKIER, CLARISSA, EVENT_BEAT_SKIER_CLARISSA, SkierClarissaSeenText, SkierClarissaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SkierClarissaAfterBattleText
	waitbutton
	closetext
	end

TrainerBoarderRonald:
	trainer BOARDER, RONALD, EVENT_BEAT_BOARDER_RONALD, BoarderRonaldSeenText, BoarderRonaldBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BoarderRonaldAfterBattleText
	waitbutton
	closetext
	end

TrainerBoarderBrad:
	trainer BOARDER, BRAD, EVENT_BEAT_BOARDER_BRAD, BoarderBradSeenText, BoarderBradBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BoarderBradAfterBattleText
	waitbutton
	closetext
	end

TrainerBoarderDouglas:
	trainer BOARDER, DOUGLAS, EVENT_BEAT_BOARDER_DOUGLAS, BoarderDouglasSeenText, BoarderDouglasBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BoarderDouglasAfterBattleText
	waitbutton
	closetext
	end

BlueForestGymGuyScript:
	faceplayer
	opentext
	checkevent EVENT_PRYCE_IN_GYM
	iftrue .PryceNotAround
	checkevent EVENT_BEAT_PRYCE
	iftrue .BlueForestGymGuyWinScript
	writetext BlueForestGymGuyText
	waitbutton
	closetext
	end
	
.PryceNotAround:
	writetext BlueForestGymGuyNotAroundText
	waitbutton
	closetext
	end

.BlueForestGymGuyWinScript:
	writetext BlueForestGymGuyWinText
	waitbutton
	closetext
	end

BlueForestGymStatue:
	checkflag ENGINE_GLACIERBADGE
	iftrue .Beaten
	jumpstd gymstatue1
.Beaten:
	trainertotext PRYCE, PRYCE1, MEM_BUFFER_1
	jumpstd gymstatue2

BlueForestGymGuyNotAroundText:
	text "Hey, kid!"
	
	para "PRYCE is an ice-"
	line "cold battler!"
	
	para "Unfortunatly, he's"
	line "away, training at"
	cont "DEEPWATER PASSAGE."
	
	para "It's a cave not"
	line "too far from here."
	
	para "Maybe you could go"
	line "ask him for a"
	cont "battle..."

PryceText_Intro:
	text "So nice to see"
	line "you again."
	
	para "#MON have many"
	line "experiences in"
	cont "their lives, just"
	cont "like we do. "

	para "I, too, have seen"
	line "and suffered much"
	cont "in my life."
	
	para "That is why family"
	line "is important."
	
	para "Make sure you make"
	line "time for things"
	cont "that you cherish."
	
	para "A good battle,"
	line "however, is also"
	cont "an important"
	cont "experience."
	
	para "Come child, we"
	line "shall do so..."
	done


PryceText_Impressed:
	text "Ah, I am impressed"
	line "by your prowess."

	para "With your strong"
	line "will, I know you"

	para "will overcome all"
	line "life's obstacles."

	para "You are worthy of"
	line "this BADGE!"
	done

Text_ReceivedGlacierBadge:
	text "<PLAYER> received"
	line "GLACIERBADGE."
	done

PryceText_GlacierBadgeSpeech:
	text "That BADGE will"
	line "raise the SPECIAL"
	cont "stats of #MON."

	para "It also lets your"
	line "#MON use WHIRL-"
	cont "POOL to get across"
	cont "real whirlpools."

	para "And this… This is"
	line "a gift from me!"
	done

PryceText_IcyWindSpeech:
	text "That TM contains"
	line "ICY WIND."

	para "It inflicts damage"
	line "and lowers speed."

	para "It demonstrates"
	line "the harshness of"
	cont "winter."
	done

PryceText_CherishYourPokemon:
	text "When the ice and"
	line "snow melt, spring"
	cont "arrives."

	para "You and your #-"
	line "MON will be to-"

	para "gether for many"
	line "years to come."

	para "Cherish your time"
	line "together!"
	done

BoarderBradSeenText:
	text "This GYM has a"
	line "slippery floor."

	para "It's fun, isn't"
	line "it?"

	para "But hey--we're"
	line "not playing games"
	cont "here!"
	done

BoarderBradBeatenText:
	text "Do you see how"
	line "serious we are?"
	done

BoarderBradAfterBattleText:
	text "This GYM is great."
	line "I love boarding"
	cont "with my #MON!"
	done

BoarderDouglasSeenText:
	text "I know PRYCE's"
	line "secret."
	done

BoarderDouglasBeatenText:
	text "OK. I'll tell you"
	line "PRYCE's secret."
	done

BoarderDouglasAfterBattleText:
	text "The secret behind"
	line "PRYCE's power…"

	para "He trains in"
	line "the harsh"
	
	para "conditions of the"
	line "DEEPWATER PASSAGE."
	done

SkierRoxanneSeenText:
	text "To get to PRYCE,"
	line "our GYM LEADER,"

	para "you need to think"
	line "before you skate."
	done

SkierRoxanneBeatenText:
	text "I wouldn't lose to"
	line "you in skiing!"
	done

SkierRoxanneAfterBattleText:
	text "If you don't skate"
	line "with precision,"

	para "you won't get far"
	line "in this GYM."
	done


BlueForestGymGuyText:
	text "PRYCE is a veteran"
	line "who has trained"

	para "#MON for some"
	line "50 years."

	para "He's said to be"
	line "good at freezing"

	para "opponents with"
	line "ice-type moves."

	para "That means you"
	line "should melt him"

	para "with your burning"
	line "ambition!"
	done

BlueForestGymGuyWinText:
	text "PRYCE is some-"
	line "thing, but you're"
	cont "something else!"

	para "That was a hot"
	line "battle that"

	para "bridged the gen-"
	line "eration gap!"
	done
	
SkierClarissaSeenText:
	text "Check out my"
	line "parallel turn!"
	done

SkierClarissaBeatenText:
	text "No! You made me"
	line "wipe out!"
	done

SkierClarissaAfterBattleText:
	text "I shouldn't have"
	line "been bragging"
	cont "about my skiing…"
	done
	
BoarderRonaldSeenText:
	text "I'll freeze your"
	line "#MON, so you"
	cont "can't do a thing!"
	done

BoarderRonaldBeatenText:
	text "Darn. I couldn't"
	line "do a thing."
	done

BoarderRonaldAfterBattleText:
	text "I think there's a"
	line "move a #MON"

	para "can use while it's"
	line "frozen."
	done

BlueForestGym_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4, 17, BLUE_FOREST, 1
	warp_event  5, 17, BLUE_FOREST, 11

	db 0 ; coord events

	db 2 ; bg events
	bg_event  3, 15, BGEVENT_READ, BlueForestGymStatue
	bg_event  6, 15, BGEVENT_READ, BlueForestGymStatue

	db 7 ; object events
	object_event  3,  2, SPRITE_PRYCE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, BlueForestGymPryceScript, EVENT_PRYCE_IN_GYM
	object_event  9,  9, SPRITE_BUENA, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerSkierRoxanne, EVENT_PRYCE_IN_GYM
	object_event  9,  2, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerBoarderRonald, EVENT_PRYCE_IN_GYM
	object_event  0, 17, SPRITE_BUENA, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerSkierClarissa, EVENT_PRYCE_IN_GYM
	object_event  5,  7, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerBoarderBrad, EVENT_PRYCE_IN_GYM
	object_event  0,  2, SPRITE_ROCKER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerBoarderDouglas, EVENT_PRYCE_IN_GYM
	object_event  7, 15, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BlueForestGymGuyScript, -1
