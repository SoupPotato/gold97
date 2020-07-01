	const_def 2 ; object constants
	const ROUTE36_YOUNGSTER1
	const ROUTE36_YOUNGSTER2
	const ROUTE36_LASS1
	const ROUTE36_FRUIT_TREE
	const ROUTE36_ARTHUR
	const ROUTE36_SILVER
	const ROUTE36_YOUNGSTER3
	const ROUTE36_YOUNGSTER4


Route36_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_ROUTE36_NOTHING
	scene_script .DummyScene1 ; SCENE_ROUTE36_SILVER

	db 2 ; callbacks
	callback MAPCALLBACK_OBJECTS, .ArthurCallback
	callback MAPCALLBACK_NEWMAP, .CheckMomCall

.CheckMomCall:
	checkevent EVENT_TALKED_TO_MOM_AFTER_MYSTERY_EGG_QUEST
	iffalse .DoMomCall
	return

.DoMomCall:
	specialphonecall SPECIALCALL_WORRIED
	return

.DummyScene0:
	end

.DummyScene1:
	end

.ArthurCallback:
	checkcode VAR_WEEKDAY
	ifequal THURSDAY, .ArthurAppears
	disappear ROUTE36_ARTHUR
	return

.ArthurAppears:
	appear ROUTE36_ARTHUR
	return



;Route36RockSmashGuyScript:
;	faceplayer
;	opentext
;	checkevent EVENT_GOT_TM08_ROCK_SMASH
;	iftrue .AlreadyGotRockSmash
;	checkevent EVENT_FOUGHT_BIPETAL
;	iftrue .ClearedBipetal
;	writetext RockSmashGuyText1
;	waitbutton
;	closetext
;	end
;
;.ClearedBipetal:
;	writetext RockSmashGuyText2
;	buttonsound
;	verbosegiveitem HM_ROCK_SMASH
;	iffalse .NoRoomForTM
;	setevent EVENT_GOT_TM08_ROCK_SMASH
;.AlreadyGotRockSmash:
;	writetext RockSmashGuyText3
;	waitbutton
;.NoRoomForTM:
;	closetext
;	end


TrainerCamperSamuel:
	trainer CAMPER, SAMUEL, EVENT_BEAT_YOUNGSTER_SAMUEL, CamperSamuelSeenText, CamperSamuelBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CamperSamuelAfterText
	waitbutton
	closetext
	end

TrainerYoungsterIan:
	trainer YOUNGSTER, IAN, EVENT_BEAT_YOUNGSTER_IAN, YoungsterIanSeenText, YoungsterIanBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext YoungsterIanAfterText
	waitbutton
	closetext
	end


Route36LassScript:
	faceplayer
	opentext
	writetext Route36LassText
	waitbutton
	closetext
	end


TrainerSchoolboyAlan1:
	trainer SCHOOLBOY, ALAN1, EVENT_BEAT_SCHOOLBOY_ALAN, SchoolboyAlan1SeenText, SchoolboyAlan1BeatenText, 0, .Script

.Script:
	writecode VAR_CALLERID, PHONE_SCHOOLBOY_ALAN
	endifjustbattled
	opentext
	checkflag ENGINE_ALAN
	iftrue .ChooseRematch
	checkflag ENGINE_ALAN_HAS_FIRE_STONE
	iftrue .GiveFireStone
	checkcellnum PHONE_SCHOOLBOY_ALAN
	iftrue .NumberAccepted
	checkevent EVENT_ALAN_ASKED_FOR_PHONE_NUMBER
	iftrue .AskAgainForPhoneNumber
	writetext UnknownText_0x1947aa
	buttonsound
	setevent EVENT_ALAN_ASKED_FOR_PHONE_NUMBER
	scall .AskNumber1
	jump .ContinueAskForPhoneNumber

.AskAgainForPhoneNumber:
	scall .AskNumber2
.ContinueAskForPhoneNumber:
	askforphonenumber PHONE_SCHOOLBOY_ALAN
	ifequal PHONE_CONTACTS_FULL, .PhoneFull
	ifequal PHONE_CONTACT_REFUSED, .NumberDeclined
	trainertotext SCHOOLBOY, ALAN1, MEM_BUFFER_0
	scall .RegisteredNumber
	jump .NumberAccepted

.ChooseRematch:
	scall .Rematch
	winlosstext SchoolboyAlan1BeatenText, 0
	copybytetovar wAlanFightCount
	ifequal 4, .Fight4
	ifequal 3, .Fight3
	ifequal 2, .Fight2
	ifequal 1, .Fight1
	ifequal 0, .LoadFight0
.Fight4:
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .LoadFight4
.Fight3:
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .LoadFight3
.Fight2:
	checkevent EVENT_BEAT_PRYCE
	iftrue .LoadFight2
.Fight1:
	checkevent EVENT_BEAT_MORTY
	iftrue .LoadFight1
.LoadFight0:
	loadtrainer SCHOOLBOY, ALAN1
	startbattle
	reloadmapafterbattle
	loadvar wAlanFightCount, 1
	clearflag ENGINE_ALAN
	end

.LoadFight1:
	loadtrainer SCHOOLBOY, ALAN2
	startbattle
	reloadmapafterbattle
	loadvar wAlanFightCount, 2
	clearflag ENGINE_ALAN
	end

.LoadFight2:
	loadtrainer SCHOOLBOY, ALAN3
	startbattle
	reloadmapafterbattle
	loadvar wAlanFightCount, 3
	clearflag ENGINE_ALAN
	end

.LoadFight3:
	loadtrainer SCHOOLBOY, ALAN4
	startbattle
	reloadmapafterbattle
	loadvar wAlanFightCount, 4
	clearflag ENGINE_ALAN
	end

.LoadFight4:
	loadtrainer SCHOOLBOY, ALAN5
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_ALAN
	end

.GiveFireStone:
	scall .Gift
	verbosegiveitem FIRE_STONE
	iffalse .BagFull
	clearflag ENGINE_ALAN_HAS_FIRE_STONE
	setevent EVENT_ALAN_GAVE_FIRE_STONE
	jump .NumberAccepted

.BagFull:
	jump .PackFull

.AskNumber1:
	jumpstd asknumber1m
	end

.AskNumber2:
	jumpstd asknumber2m
	end

.RegisteredNumber:
	jumpstd registerednumberm
	end

.NumberAccepted:
	jumpstd numberacceptedm
	end

.NumberDeclined:
	jumpstd numberdeclinedm
	end

.PhoneFull:
	jumpstd phonefullm
	end

.Rematch:
	jumpstd rematchm
	end

.Gift:
	jumpstd giftm
	end

.PackFull:
	jumpstd packfullm
	end

TrainerPsychicMark:
	trainer PSYCHIC_T, MARK, EVENT_BEAT_PSYCHIC_MARK, PsychicMarkSeenText, PsychicMarkBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PsychicMarkAfterBattleText
	waitbutton
	closetext
	end

ArthurScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_HARD_STONE_FROM_ARTHUR
	iftrue .AlreadyGotStone
	checkcode VAR_WEEKDAY
	ifnotequal THURSDAY, ArthurNotThursdayScript
	checkevent EVENT_MET_ARTHUR_OF_THURSDAY
	iftrue .MetArthur
	writetext MeetArthurText
	buttonsound
	setevent EVENT_MET_ARTHUR_OF_THURSDAY
.MetArthur:
	writetext ArthurGivesGiftText
	buttonsound
	verbosegiveitem HARD_STONE
	iffalse .BagFull
	setevent EVENT_GOT_HARD_STONE_FROM_ARTHUR
	writetext ArthurGaveGiftText
	waitbutton
	closetext
	end

.AlreadyGotStone:
	writetext ArthurThursdayText
	waitbutton
.BagFull:
	closetext
	end

ArthurNotThursdayScript:
	writetext ArthurNotThursdayText
	waitbutton
	closetext
	end

Route36SilverScript:
	applymovement PLAYER, Movement_36DownOne
	playsound SFX_EXIT_BUILDING
	moveobject ROUTE36_SILVER, 6, 5
	appear ROUTE36_SILVER
	applymovement ROUTE36_SILVER, Movement_36SilverDownOne
	special FadeOutMusic
	playmusic MUSIC_RIVAL_ENCOUNTER
	opentext
	writetext Route36RivalBeforeText
	waitbutton
	closetext
	checkevent EVENT_GOT_CRUISE_FROM_ELM
	iftrue .Cruise
	checkevent EVENT_GOT_CHIKORITA_FROM_ELM
	iftrue .CHIKORITA
	winlosstext Route36SilverWinText, Route36SilverLossText
	loadtrainer RIVAL1, RIVAL1_2_CRUISE
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump .AfterBattle

.Cruise:
	winlosstext Route36SilverWinText, Route36SilverLossText
	loadtrainer RIVAL1, RIVAL1_2_CHIKORITA
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump .AfterBattle

.CHIKORITA:
	winlosstext Route36SilverWinText, Route36SilverLossText
	loadtrainer RIVAL1, RIVAL1_2_FLAMBEAR
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump .AfterBattle

.AfterBattle:
	playmusic MUSIC_RIVAL_AFTER
	opentext
	writetext Route36RivalAfterText
	waitbutton
	closetext
	applymovement ROUTE36_SILVER, Route36RivalBattleExitMovement
	playsound SFX_ENTER_DOOR
	disappear ROUTE36_SILVER
	setscene SCENE_ROUTE36_NOTHING
	waitsfx
	playmapmusic
	end

Route36SilverTalkScript:
	end

Route36Sign:
	jumptext Route36SignText

RuinsOfAlphNorthSign:
	jumptext RuinsOfAlphNorthSignText

Route36TrainerTips1:
	jumptext Route36TrainerTips1Text

Route36TrainerTips2:
	jumptext Route36TrainerTips2Text
	
Route36GameHouse:
	jumptext Route36GameHouseText

Route36FruitTree:
	fruittree FRUITTREE_ROUTE_36

BipetalShakeMovement:
	tree_shake ; shake
	step_end

WeirdTreeMovement_Flee:
	fast_jump_step UP
	fast_jump_step UP
	step_end
	
Movement_36DownOne:
	step DOWN
	turn_head UP
	step_end
	
Movement_36SilverDownOne
	step DOWN
	step_end

FloriaMovement1:
	step DOWN
	step DOWN
	step DOWN
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step_end

FloriaMovement2:
	step LEFT
	step DOWN
	step DOWN
	step DOWN
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step_end

Route36SuicuneMovement:
	set_sliding
	fast_jump_step DOWN
	fast_jump_step DOWN
	fast_jump_step DOWN
	fast_jump_step RIGHT
	fast_jump_step RIGHT
	fast_jump_step RIGHT
	remove_sliding
	step_end
	
Route36RivalBattleExitMovement:
	step UP
	step_end
	
Route36SilverWinText:
	text "Wow! Looks like"
	line "you've been"
	para "working hard to"
	line "raise your"
	cont "#MON!"
	done
	
Route36SilverLossText
	text "My team is the"
	line "best!"
	done
	
Route36RivalBeforeText:
	text "<PLAY_G>!"
	para "You gotta check"
	line "out WEST CITY!"
	para "There's a giant"
	line "MART and a RADIO"
	cont "TOWER, and…"
	para "Oh, yeah!"
	para "I've started the"
	line "LEAGUE challenge!"
	para "I heard you have,"
	line "too, <PLAY_G>!"
	para "This will be a"
	line "great way to show"
	para "the world how"
	line "my team is the"
	para "strongest there"
	line "is!"
	para "I've also been out"
	line "catching some"
	cont "#MON!"
	para "Have you? Let's"
	line "battle to see"
	cont "whose are better!"
	done
	
Route36RivalAfterText:
	text "Whew! It was good"
	line "catching up with"
	cont "you, <PLAY_G>!"
	para "I'm heading back"
	line "into the city!"
	para "See you around!"
	done

UseSquirtbottleText:
	text "It's a weird tree."
	line "Use SQUIRTBOTTLE?"
	done

UsedSquirtbottleText:
	text "<PLAYER> used the"
	line "SQUIRTBOTTLE."
	done

BipetalAttackedText:
	text "The weird tree"
	line "doesn't like the"
	cont "SQUIRTBOTTLE!"

	para "The weird tree"
	line "attacked!"
	done

FloriaText1:
	text "I'm the FLOWER"
	line "SHOP's FLORIA!"

	para "Listen, listen!"

	para "When I sprinkled"
	line "water on that"

	para "wiggly tree, it"
	line "jumped right up!"

	para "It just has to be"
	line "a #MON."

	para "I bet it would be"
	line "shocked out of its"

	para "disguise if you"
	line "soaked it!"

	para "I know! I'll tell"
	line "my sis and borrow"
	cont "her water bottle!"
	done

FloriaText2:
	text "When I told my sis"
	line "about the jiggly"

	para "tree, she said"
	line "it's dangerous."

	para "If I beat WHITNEY,"
	line "I wonder if she'll"

	para "lend me her water"
	line "bottle…"
	done

RockSmashGuyText1:
	text "Wa-hey!"

	para "I was going to"
	line "snap that tree"

	para "with my straight-"
	line "arm punch."

	para "But I couldn't!"
	line "I'm a failure!"
	done

RockSmashGuyText2:
	text "Did you clear that"
	line "wretched tree?"

	para "I'm impressed!"
	line "I want you to"
	cont "have this."
	done

UnknownText_0x19451a:
	text "<PLAYER> received"
	line "TM08."
	done

RockSmashGuyText3:
	text "That happens to be"
	line "ROCK SMASH."

	para "You can shatter"
	line "rocks with just a"

	para "single well-aimed"
	line "smack."

	para "If any rocks are"
	line "in your way, just"
	cont "smash 'em up!"
	done

UnknownText_0x1945b8:
	text "An odd tree is"
	line "blocking the way"
	cont "to GOLDENROD CITY."

	para "I wanted to go see"
	line "the huge #MON"

	para "CENTER they just"
	line "opened…"
	done

Route36LassText:
	text "A small tree is"
	line "blocking the way"
	cont "to WEST CITY."

	para "If you need to"
	line "get through, a"
	para "#MON could"
	line "probably CUT the"
	cont "tree."
	done

PsychicMarkSeenText:
	text "I'm going to read"
	line "your thoughts!"
	done

PsychicMarkBeatenText:
	text "I misread you!"
	done

PsychicMarkAfterBattleText:
	text "I'd be strong if"
	line "only I could tell"

	para "what my opponent"
	line "was thinking."
	done

SchoolboyAlan1SeenText:
	text "Thanks to my stud-"
	line "ies, I'm ready for"
	cont "any #MON!"
	done

SchoolboyAlan1BeatenText:
	text "Oops! Computation"
	line "error?"
	done

UnknownText_0x1947aa:
	text "Darn. I study five"
	line "hours a day too."

	para "There's more to"
	line "learning than just"
	cont "reading books."
	done

MeetArthurText:
	text "ARTHUR: Who are"
	line "you?"

	para "I'm ARTHUR of"
	line "Thursday."
	done

ArthurGivesGiftText:
	text "Here. You can have"
	line "this."
	done

ArthurGaveGiftText:
	text "ARTHUR: A #MON"
	line "that uses rock-"

	para "type moves should"
	line "hold on to that."

	para "It pumps up rock-"
	line "type attacks."
	done

ArthurThursdayText:
	text "ARTHUR: I'm ARTHUR"
	line "of Thursday. I'm"

	para "the second son out"
	line "of seven children."
	done

ArthurNotThursdayText:
	text "ARTHUR: Today's"
	line "not Thursday. How"
	cont "disappointing."
	done

Route36SignText:
	text "ROUTE 102"
	para "OLD CITY -"
	line "WEST CITY"
	done

RuinsOfAlphNorthSignText:
	text "RUINS OF ALPH"
	line "NORTH ENTRANCE"
	done

Route36TrainerTips1Text:
	text "TRAINER TIPS"

	para "#MON stats"
	line "vary--even within"
	cont "the same species."

	para "Their stats may be"
	line "similar at first."

	para "However, differ-"
	line "ences will become"

	para "pronounced as the"
	line "#MON grow."
	done

Route36TrainerTips2Text:
	text "TRAINER TIPS"

	para "Use DIG to return"
	line "to the entrance of"
	cont "any place."

	para "It is convenient"
	line "for exploring"

	para "caves and other"
	line "landmarks."
	done
	
Route36GameHouseText:
	text "Come and take a"
	line "break!"
	para "GAME HOUSE"
	done
	
CamperSamuelSeenText:
	text "This is where I do"
	line "my training!"
	done

CamperSamuelBeatenText:
	text "Beaten by a"
	line "passing stranger!"
	done

CamperSamuelAfterText:
	text "I'm going to train"
	line "even harder."

	para "After all, I'm"
	line "trying to become"
	cont "a GYM LEADER."
	done

YoungsterIanSeenText:
	text "I'm the best in my"
	line "class at #MON."
	para "It's honestly not"
	line "even close."
	done

YoungsterIanBeatenText:
	text "No! There are bet-"
	line "ter trainers…"
	done

YoungsterIanAfterText:
	text "I guess I gotta"
	line "try even harder."
	done


Route36_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  6,  5, NEW_VIOLET_GATE_NORTH, 4
	warp_event 16,  4, GOLDENROD_FLOWER_SHOP, 1

	db 1 ; coord events
	coord_event  6,  6, SCENE_ROUTE36_SILVER, Route36SilverScript

	db 4 ; bg events
	bg_event 22, 10, BGEVENT_READ, Route36TrainerTips2
	bg_event 50, 10, BGEVENT_READ, Route36Sign
	bg_event 32, 10, BGEVENT_READ, Route36TrainerTips1
	bg_event 18,  4, BGEVENT_READ, Route36GameHouse

	db 8 ; object events
	object_event  8, 9, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerPsychicMark, -1
	object_event 29,  6, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 5, TrainerSchoolboyAlan1, -1
	object_event 50,  7, SPRITE_LASS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route36LassScript, -1
	object_event 39,  5, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route36FruitTree, -1
	object_event 40,  8, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ArthurScript, EVENT_ROUTE_36_ARTHUR_OF_THURSDAY
	object_event  1,  1, SPRITE_SILVER, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route36SilverTalkScript, EVENT_ROUTE_36_SILVER
	object_event 12, 11, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerCamperSamuel, -1
	object_event 20,  8, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerYoungsterIan, -1
