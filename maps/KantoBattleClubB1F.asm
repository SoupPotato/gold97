;It seems like the branching scripts for whether you win or lose are backwards. Apparently this is
;also the case for ones that were in the final game, like rival 1 in cherrygrove city. But it's not
;apparent there because the text is the same in either case
	const_def 2 ; object constants
	const BATTLECLUB_SUNDAY_FLEDGLING
	const BATTLECLUB_MONDAY_YOUNGSTER
	const BATTLECLUB_TUESDAY_LASS
	const BATTLECLUB_WEDNESDAY_SPORTSMAN
	const BATTLECLUB_THURSDAY_INSTRUCTOR
	const BATTLECLUB_FRIDAY_COOLTRAINERF
	const BATTLECLUB_SATURDAY_COOLTRAINERM
	const BATTLECLUB_RECEPTIONIST
	const BATTLECLUB_POKEFANM
	const BATTLECLUB_JANINE
	const BATTLECLUB_YOUNGSTER
	const BATTLECLUB_GENTLEMAN
	const BATTLECLUB_ROCKER
	const BATTLECLUB_LASS
	const BATTLECLUB_YOUNGSTER2
	const BATTLECLUB_GRANNY


KantoBattleClubB1F_MapScripts:
	db 0 ; scene scripts

	db 0  ; callbacks
	
BattleClubScriptSun:
	faceplayer
	opentext
	checkcode VAR_WEEKDAY
	ifequal SUNDAY, .SundayBattleContinue
	jump BattleClubOver
	end

.SundayBattleContinue
	checkflag ENGINE_FOUGHT_IN_TRAINER_HALL_TODAY
	iftrue .AlreadyBattledSunday
	writetext SundayTrainerGreeting
	yesorno
	iffalse .NoBattleNowSunday
	writetext TrainerAcceptsChallenge
	waitbutton
	closetext
	turnobject BATTLECLUB_SUNDAY_FLEDGLING, LEFT
	checkcode VAR_FACING
	ifequal LEFT, .SundayLeftWalk
	ifequal RIGHT, .SundayRightWalk
	ifequal UP, .SundayUpWalk
	ifequal DOWN, .SundayDownWalk

.SundayLeftWalk
	applymovement PLAYER, PlayerWalksToOtherSideLeft
	jump .SundayBattleContinue2
	end
	
.SundayRightWalk
	applymovement PLAYER, PlayerWalksToOtherSideRight
	jump .SundayBattleContinue2
	end
	
.SundayUpWalk
	applymovement PLAYER, PlayerWalksToOtherSideUp
	jump .SundayBattleContinue2
	end
	
.SundayDownWalk
	applymovement PLAYER, PlayerWalksToOtherSideDown
	jump .SundayBattleContinue2
	end
	
.NoBattleNowSunday
	writetext NoBattleNowSundayText
	waitbutton
	closetext
	end
	
.SundayBattleContinue2
	winlosstext SundayWinText, SundayLossText
	loadtrainer FLEDGLING, EARNEST
	writecode VAR_BATTLETYPE, BATTLETYPE_CANLOSE
	startbattle
	dontrestartmapmusic
	reloadmap
	iftrue .AfterVictoriousSunday
	jump .AfterYourDefeatSunday
	end
	
.AfterVictoriousSunday
	opentext
	writetext SundayAfterVictoriousText
	waitbutton
	closetext
	setflag ENGINE_FOUGHT_IN_TRAINER_HALL_TODAY
	special HealParty
	playmapmusic
	end
	
.AfterYourDefeatSunday
	opentext
	writetext SundayAfterYourDefeatText
	waitbutton
	closetext
	setflag ENGINE_FOUGHT_IN_TRAINER_HALL_TODAY
	special HealParty
	playmapmusic
	end
	
.AlreadyBattledSunday
	jump BattleClubOver
	end
	
BattleClubScriptMon:
	faceplayer
	opentext
	checkcode VAR_WEEKDAY
	ifequal MONDAY, .MondayBattleContinue
	jump BattleClubOver
	end

.MondayBattleContinue
	checkflag ENGINE_FOUGHT_IN_TRAINER_HALL_TODAY
	iftrue .AlreadyBattledMonday
	writetext MondayTrainerGreeting
	yesorno
	iffalse .NoBattleNowMonday
	writetext TrainerAcceptsChallenge
	waitbutton
	closetext
	turnobject BATTLECLUB_MONDAY_YOUNGSTER, LEFT
	checkcode VAR_FACING
	ifequal LEFT, .MondayLeftWalk
	ifequal RIGHT, .MondayRightWalk
	ifequal UP, .MondayUpWalk
	ifequal DOWN, .MondayDownWalk

.MondayLeftWalk
	applymovement PLAYER, PlayerWalksToOtherSideLeft
	jump .MondayBattleContinue2
	end
	
.MondayRightWalk
	applymovement PLAYER, PlayerWalksToOtherSideRight
	jump .MondayBattleContinue2
	end
	
.MondayUpWalk
	applymovement PLAYER, PlayerWalksToOtherSideUp
	jump .MondayBattleContinue2
	end
	
.MondayDownWalk
	applymovement PLAYER, PlayerWalksToOtherSideDown
	jump .MondayBattleContinue2
	end
	
.NoBattleNowMonday
	writetext NoBattleNowMondayText
	waitbutton
	closetext
	end
	
.MondayBattleContinue2
	winlosstext MondayWinText, MondayLossText
	loadtrainer YOUNGSTER, JIMMY
	writecode VAR_BATTLETYPE, BATTLETYPE_CANLOSE
	startbattle
	dontrestartmapmusic
	reloadmap
	iftrue .AfterVictoriousMonday
	jump .AfterYourDefeatMonday
	end
	
.AfterVictoriousMonday
	opentext
	writetext MondayAfterVictoriousText
	waitbutton
	closetext
	setflag ENGINE_FOUGHT_IN_TRAINER_HALL_TODAY
	special HealParty
	playmapmusic
	end
	
.AfterYourDefeatMonday
	opentext
	writetext MondayAfterYourDefeatText
	waitbutton
	closetext
	setflag ENGINE_FOUGHT_IN_TRAINER_HALL_TODAY
	special HealParty
	playmapmusic
	end
	
.AlreadyBattledMonday
	jump BattleClubOver
	end
	
BattleClubScriptTues:
	faceplayer
	opentext
	checkcode VAR_WEEKDAY
	ifequal TUESDAY, .TuesdayBattleContinue
	jump BattleClubOver
	end

.TuesdayBattleContinue
	checkflag ENGINE_FOUGHT_IN_TRAINER_HALL_TODAY
	iftrue .AlreadyBattledTuesday
	writetext TuesdayTrainerGreeting
	yesorno
	iffalse .NoBattleNowTuesday
	writetext TrainerAcceptsChallenge
	waitbutton
	closetext
	turnobject BATTLECLUB_TUESDAY_LASS, LEFT
	checkcode VAR_FACING
	ifequal LEFT, .TuesdayLeftWalk
	ifequal RIGHT, .TuesdayRightWalk
	ifequal UP, .TuesdayUpWalk
	ifequal DOWN, .TuesdayDownWalk

.TuesdayLeftWalk
	applymovement PLAYER, PlayerWalksToOtherSideLeft
	jump .TuesdayBattleContinue2
	end
	
.TuesdayRightWalk
	applymovement PLAYER, PlayerWalksToOtherSideRight
	jump .TuesdayBattleContinue2
	end
	
.TuesdayUpWalk
	applymovement PLAYER, PlayerWalksToOtherSideUp
	jump .TuesdayBattleContinue2
	end
	
.TuesdayDownWalk
	applymovement PLAYER, PlayerWalksToOtherSideDown
	jump .TuesdayBattleContinue2
	end
	
.NoBattleNowTuesday
	writetext NoBattleNowTuesdayText
	waitbutton
	closetext
	end
	
.TuesdayBattleContinue2
	winlosstext TuesdayWinText, TuesdayLossText
	loadtrainer LASS, MICHELLE
	writecode VAR_BATTLETYPE, BATTLETYPE_CANLOSE
	startbattle
	dontrestartmapmusic
	reloadmap
	iftrue .AfterVictoriousTuesday
	jump .AfterYourDefeatTuesday
	end
	
.AfterVictoriousTuesday
	opentext
	writetext TuesdayAfterVictoriousText
	waitbutton
	closetext
	setflag ENGINE_FOUGHT_IN_TRAINER_HALL_TODAY
	special HealParty
	playmapmusic
	end
	
.AfterYourDefeatTuesday
	opentext
	writetext TuesdayAfterYourDefeatText
	waitbutton
	closetext
	setflag ENGINE_FOUGHT_IN_TRAINER_HALL_TODAY
	special HealParty
	playmapmusic
	end
	
.AlreadyBattledTuesday
	jump BattleClubOver
	end

	
BattleClubScriptWed:
	faceplayer
	opentext
	checkcode VAR_WEEKDAY
	ifequal WEDNESDAY, .WednesdayBattleContinue
	jump BattleClubOver
	end

.WednesdayBattleContinue
	checkflag ENGINE_FOUGHT_IN_TRAINER_HALL_TODAY
	iftrue .AlreadyBattledWednesday
	writetext WednesdayTrainerGreeting
	yesorno
	iffalse .NoBattleNowWednesday
	writetext TrainerAcceptsChallenge
	waitbutton
	closetext
	turnobject BATTLECLUB_WEDNESDAY_SPORTSMAN, LEFT
	checkcode VAR_FACING
	ifequal LEFT, .WednesdayLeftWalk
	ifequal RIGHT, .WednesdayRightWalk
	ifequal UP, .WednesdayUpWalk
	ifequal DOWN, .WednesdayDownWalk

.WednesdayLeftWalk
	applymovement PLAYER, PlayerWalksToOtherSideLeft
	jump .WednesdayBattleContinue2
	end
	
.WednesdayRightWalk
	applymovement PLAYER, PlayerWalksToOtherSideRight
	jump .WednesdayBattleContinue2
	end
	
.WednesdayUpWalk
	applymovement PLAYER, PlayerWalksToOtherSideUp
	jump .WednesdayBattleContinue2
	end
	
.WednesdayDownWalk
	applymovement PLAYER, PlayerWalksToOtherSideDown
	jump .WednesdayBattleContinue2
	end
	
.NoBattleNowWednesday
	writetext NoBattleNowWednesdayText
	waitbutton
	closetext
	end
	
.WednesdayBattleContinue2
	winlosstext WednesdayWinText, WednesdayLossText
	loadtrainer SPORTSMAN, MANNY
	writecode VAR_BATTLETYPE, BATTLETYPE_CANLOSE
	startbattle
	dontrestartmapmusic
	reloadmap
	iftrue .AfterVictoriousWednesday
	jump .AfterYourDefeatWednesday
	end
	
.AfterVictoriousWednesday
	opentext
	writetext WednesdayAfterVictoriousText
	waitbutton
	closetext
	setflag ENGINE_FOUGHT_IN_TRAINER_HALL_TODAY
	special HealParty
	playmapmusic
	end
	
.AfterYourDefeatWednesday
	opentext
	writetext WednesdayAfterYourDefeatText
	waitbutton
	closetext
	setflag ENGINE_FOUGHT_IN_TRAINER_HALL_TODAY
	special HealParty
	playmapmusic
	end
	
.AlreadyBattledWednesday
	jump BattleClubOver
	end

BattleClubScriptThurs:
	faceplayer
	opentext
	checkcode VAR_WEEKDAY
	ifequal THURSDAY, .ThursdayBattleContinue
	jump BattleClubOver
	end

.ThursdayBattleContinue
	checkflag ENGINE_FOUGHT_IN_TRAINER_HALL_TODAY
	iftrue .AlreadyBattledThursday
	writetext ThursdayTrainerGreeting
	yesorno
	iffalse .NoBattleNowThursday
	writetext TrainerAcceptsChallenge
	waitbutton
	closetext
	turnobject BATTLECLUB_THURSDAY_INSTRUCTOR, LEFT
	checkcode VAR_FACING
	ifequal LEFT, .ThursdayLeftWalk
	ifequal RIGHT, .ThursdayRightWalk
	ifequal UP, .ThursdayUpWalk
	ifequal DOWN, .ThursdayDownWalk

.ThursdayLeftWalk
	applymovement PLAYER, PlayerWalksToOtherSideLeft
	jump .ThursdayBattleContinue2
	end
	
.ThursdayRightWalk
	applymovement PLAYER, PlayerWalksToOtherSideRight
	jump .ThursdayBattleContinue2
	end
	
.ThursdayUpWalk
	applymovement PLAYER, PlayerWalksToOtherSideUp
	jump .ThursdayBattleContinue2
	end
	
.ThursdayDownWalk
	applymovement PLAYER, PlayerWalksToOtherSideDown
	jump .ThursdayBattleContinue2
	end
	
.NoBattleNowThursday
	writetext NoBattleNowThursdayText
	waitbutton
	closetext
	end
	
.ThursdayBattleContinue2
	winlosstext ThursdayWinText, ThursdayLossText
	loadtrainer INSTRUCTOR, MORGAN
	writecode VAR_BATTLETYPE, BATTLETYPE_CANLOSE
	startbattle
	dontrestartmapmusic
	reloadmap
	iftrue .AfterVictoriousThursday
	jump .AfterYourDefeatThursday
	end
	
.AfterVictoriousThursday
	opentext
	writetext ThursdayAfterVictoriousText
	waitbutton
	closetext
	setflag ENGINE_FOUGHT_IN_TRAINER_HALL_TODAY
	special HealParty
	playmapmusic
	end
	
.AfterYourDefeatThursday
	opentext
	writetext ThursdayAfterYourDefeatText
	waitbutton
	closetext
	setflag ENGINE_FOUGHT_IN_TRAINER_HALL_TODAY
	special HealParty
	playmapmusic
	end
	
.AlreadyBattledThursday
	jump BattleClubOver
	end


BattleClubScriptFri:
	faceplayer
	opentext
	checkcode VAR_WEEKDAY
	ifequal FRIDAY, .FridayBattleContinue
	jump BattleClubOver
	end

.FridayBattleContinue
	checkflag ENGINE_FOUGHT_IN_TRAINER_HALL_TODAY
	iftrue .AlreadyBattledFriday
	writetext FridayTrainerGreeting
	yesorno
	iffalse .NoBattleNowFriday
	writetext TrainerAcceptsChallenge
	waitbutton
	closetext
	turnobject BATTLECLUB_FRIDAY_COOLTRAINERF, LEFT
	checkcode VAR_FACING
	ifequal LEFT, .FridayLeftWalk
	ifequal RIGHT, .FridayRightWalk
	ifequal UP, .FridayUpWalk
	ifequal DOWN, .FridayDownWalk

.FridayLeftWalk
	applymovement PLAYER, PlayerWalksToOtherSideLeft
	jump .FridayBattleContinue2
	end
	
.FridayRightWalk
	applymovement PLAYER, PlayerWalksToOtherSideRight
	jump .FridayBattleContinue2
	end
	
.FridayUpWalk
	applymovement PLAYER, PlayerWalksToOtherSideUp
	jump .FridayBattleContinue2
	end
	
.FridayDownWalk
	applymovement PLAYER, PlayerWalksToOtherSideDown
	jump .FridayBattleContinue2
	end
	
.NoBattleNowFriday
	writetext NoBattleNowFridayText
	waitbutton
	closetext
	end
	
.FridayBattleContinue2
	winlosstext FridayWinText, FridayLossText
	loadtrainer COOLTRAINERF, KATE
	writecode VAR_BATTLETYPE, BATTLETYPE_CANLOSE
	startbattle
	dontrestartmapmusic
	reloadmap
	iftrue .AfterVictoriousFriday
	jump .AfterYourDefeatFriday
	end
	
.AfterVictoriousFriday
	opentext
	writetext FridayAfterVictoriousText
	waitbutton
	closetext
	setflag ENGINE_FOUGHT_IN_TRAINER_HALL_TODAY
	special HealParty
	playmapmusic
	end
	
.AfterYourDefeatFriday
	opentext
	writetext FridayAfterYourDefeatText
	waitbutton
	closetext
	setflag ENGINE_FOUGHT_IN_TRAINER_HALL_TODAY
	special HealParty
	playmapmusic
	end
	
.AlreadyBattledFriday
	jump BattleClubOver
	end
	

BattleClubScriptSat:
	faceplayer
	opentext
	checkcode VAR_WEEKDAY
	ifequal SATURDAY, .SaturdayBattleContinue
	jump BattleClubOver
	end

.SaturdayBattleContinue
	checkflag ENGINE_FOUGHT_IN_TRAINER_HALL_TODAY
	iftrue .AlreadyBattledSaturday
	writetext SaturdayTrainerGreeting
	yesorno
	iffalse .NoBattleNowSaturday
	writetext TrainerAcceptsChallenge
	waitbutton
	closetext
	turnobject BATTLECLUB_SATURDAY_COOLTRAINERM, LEFT
	checkcode VAR_FACING
	ifequal LEFT, .SaturdayLeftWalk
	ifequal RIGHT, .SaturdayRightWalk
	ifequal UP, .SaturdayUpWalk
	ifequal DOWN, .SaturdayDownWalk

.SaturdayLeftWalk
	applymovement PLAYER, PlayerWalksToOtherSideLeft
	jump .SaturdayBattleContinue2
	end
	
.SaturdayRightWalk
	applymovement PLAYER, PlayerWalksToOtherSideRight
	jump .SaturdayBattleContinue2
	end
	
.SaturdayUpWalk
	applymovement PLAYER, PlayerWalksToOtherSideUp
	jump .SaturdayBattleContinue2
	end
	
.SaturdayDownWalk
	applymovement PLAYER, PlayerWalksToOtherSideDown
	jump .SaturdayBattleContinue2
	end
	
.NoBattleNowSaturday
	writetext NoBattleNowSaturdayText
	waitbutton
	closetext
	end
	
.SaturdayBattleContinue2
	winlosstext SaturdayWinText, SaturdayLossText
	loadtrainer COOLTRAINERM, ALLEN
	writecode VAR_BATTLETYPE, BATTLETYPE_CANLOSE
	startbattle
	dontrestartmapmusic
	reloadmap
	iftrue .AfterVictoriousSaturday
	jump .AfterYourDefeatSaturday
	end
	
.AfterVictoriousSaturday
	opentext
	writetext SaturdayAfterVictoriousText
	waitbutton
	closetext
	setflag ENGINE_FOUGHT_IN_TRAINER_HALL_TODAY
	special HealParty
	playmapmusic
	end
	
.AfterYourDefeatSaturday
	opentext
	writetext SaturdayAfterYourDefeatText
	waitbutton
	closetext
	setevent EVENT_BEAT_COOLTRAINERM_ALLEN
	setflag ENGINE_FOUGHT_IN_TRAINER_HALL_TODAY
	special HealParty
	playmapmusic
	end
	
.AlreadyBattledSaturday
	jump BattleClubOver
	end

BattleClubOver:
	writetext TrainerClubDone
	waitbutton
	closetext
	end
	
BattleClubReceptionistScript:
	jumptextfaceplayer BattleClubReceptionistText
	
BattleClubPokefanMScript:
	jumptextfaceplayer BattleClubPokefanMText

BattleClubJanineScript:
	jumptextfaceplayer BattleClubJanineText
	
BattleClubYoungsterScript:
	checkevent EVENT_BEAT_COOLTRAINERM_ALLEN
	iftrue .WowYouBeatAllen
	faceplayer
	opentext
	writetext BattleClubYoungsterText
	waitbutton
	closetext
	end

.WowYouBeatAllen
	faceplayer
	opentext
	checkevent EVENT_EXPLODING_TRAP_22
	iftrue .AlreadyGotTogepi
	writetext IHaveAWeirdEggText
	yesorno
	iffalse .DontTakeTogepi
	checkcode VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .PartyFullTogepi
	writetext PlayerGotTogepiText
	playsound SFX_CAUGHT_MON
	waitsfx
	givepoke TOGEPI, 5
	writetext GiveTogepiText
	waitbutton
	closetext
	setevent EVENT_EXPLODING_TRAP_22
	end
	
.AlreadyGotTogepi
	writetext BattleClubYoungsterTextBeat
	waitbutton
	closetext
	end
	
.DontTakeTogepi
	writetext NoTogepiText
	waitbutton
	closetext
	end
	
.PartyFullTogepi
	writetext PartyFullTogepiText
	waitbutton
	closetext
	end


BattleClubGentlemanScript:
	jumptextfaceplayer BattleClubGentlemanText
	
BattleClubRockerScript:
	jumptextfaceplayer BattleClubRockerText
	
BattleClubLassScript:
	jumptextfaceplayer BattleClubLassText
	
BattleClubYoungster2Script:
	jumptextfaceplayer BattleClubYoungster2Text
	
BattleClubGrannyScript:
	jumptextfaceplayer BattleClubGrannyText
	
PlayerWalksToOtherSideLeft:
	step UP
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step DOWN
	turn_head RIGHT
	step_end
	
PlayerWalksToOtherSideRight:
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	turn_head RIGHT
	step_end
	
PlayerWalksToOtherSideUp:
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step UP
	turn_head RIGHT
	step_end
	
PlayerWalksToOtherSideDown:
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step DOWN
	turn_head RIGHT
	step_end
	
PartyFullTogepiText:
	text "Oh, wait!"
	para "You gotta make"
	line "room!"
	done
	
NoTogepiText:
	text "You sure?"
	para "I'd have thought"
	line "you'd like this."
	done
	
GiveTogepiText:
	text "I'm sure you're"
	line "the best person to"
	cont "take care of it."
	done
	
IHaveAWeirdEggText:
	text "Wow! I heard you"
	line "beat that super"
	cont "tough COOLTRAINER!"
	para "That's incredible!"
	para "Hey, listen. I had"
	line "this weird #MON"
	cont "EGG."
	para "It hatched the"
	line "other day, but"
	para "it still looks"
	line "like an EGG!"
	para "It's a very odd"
	line "#MON."
	para "I think an expert"
	line "trainer such as"
	para "yourself would be"
	line "better suited to"
	cont "take care of it."
	para "You want it?"
	done
	
PlayerGotTogepiText:
	text "<PLAYER> received"
	line "TOGEPI."
	done
	
BattleClubYoungsterTextBeat:
	text "Seriously, how did"
	line "you beat that guy?"
	para "It's incredible!"
	done
	
	
BattleClubGrannyText:
	text "I was once a"
	line "strong trainer."
	para "I don't battle so"
	line "much myself,"
	cont "anymore."
	para "But it's always a"
	line "good time to come"
	para "here and watch"
	line "today's strong"
	cont "trainers battle."
	done
	
BattleClubYoungster2Text:
	text "I'm here to"
	line "support my younger"
	cont "brother."
	para "He's new at this."
	para "Maybe if you have"
	line "some weaker"
	para "#MON, you could"
	line "battle him with"
	cont "those?"
	done
	
BattleClubLassText:
	text "This place has"
	line "different trainers"
	para "stop by every day"
	line "of the week."
	para "Stronger trainers"
	line "tend to show up"
	cont "late in the week."
	done
	
BattleClubRockerText:
	text "I'm all tired from"
	line "all of these"
	cont "battles."
	para "If you want a"
	line "challenge now, I"
	para "think there's a"
	line "SPORTSMAN over"
	cont "there."
	done
	
BattleClubGentlemanText:
	text "I say, this"
	line "establishment is"
	para "great for the"
	line "trainer who"
	para "doesn't like to"
	line "travel much but"
	para "still wants new"
	line "challenges."
	done
	
BattleClubYoungsterText:
	text "There was a"
	line "COOLTRAINER here"
	cont "the other day."
	para "His #MON were"
	line "incredibly tough."
	para "I didn't stand a"
	line "chance."
	para "I think he comes"
	line "by on Saturdays."
	para "Could you beat"
	line "him?"
	done
	
BattleClubJanineText:
	text "Some of the"
	line "trainers here are"
	cont "too tough!"
	para "I gotta get"
	line "stronger."
	done
	
BattleClubPokefanMText:
	text "Everyone loves a"
	line "good battle!"
	para "Sometimes it's fun"
	line "to just watch!"
	done
	
BattleClubReceptionistText:
	text "Welcome to the"
	line "KANTO BATTLE CLUB."
	para "We attract serious"
	line "trainers of all"
	cont "skill levels."
	para "Some very tough"
	line "trainers frequent"
	cont "here."
	para "Don't be afraid to"
	line "challenge them!"
	done
	
NoBattleNowSundayText:
	text "Aw, man!"
	para "Maybe another"
	line "time."
	done
	
SundayAfterYourDefeatText:; backwards
	text "I'm not tough yet"
	line "but I'm working on"
	cont "it!"
	done
	
SundayAfterVictoriousText:; backwards
	text "My #MON get"
	line "stronger every"
	cont "day!"
	done
	
SundayWinText:
	text "Wow, you're tough!"
	done
	
SundayLossText:
	text "I won! Wow!"
	done

	
SundayTrainerGreeting:
	text "Hi there! I'm new"
	line "at #MON and I'm"
	cont "new at battling!"
	para "But it's my dream"
	line "to one day be a"
	cont "great trainer!"
	para "I use #MON"
	line "around level 10."
	para "Do you want to"
	line "battle?"
	done
	
NoBattleNowMondayText:
	text "I'll be here if"
	line "you change your"
	cont "mind!"
	done

MondayAfterYourDefeatText:; backwards
	text "Looks like I need"
	line "to keep training!"
	done
	
MondayAfterVictoriousText:; backwards
	text "My training is"
	line "paying off!"
	done
	
MondayWinText:
	text "Dude, you're good!"
	done
	
MondayLossText:
	text "Oh yeah!"
	done
	
MondayTrainerGreeting:
	text "Yo, you want to"
	line "battle?"
	para "I'm getting kind"
	line "of good at this,"
	cont "I think."
	para "I use #MON"
	line "around level 20."
	para "Wanna battle?"
	done
	
NoBattleNowTuesdayText:
	text "I guess I'm too"
	line "good, huh?"
	done
	
TuesdayAfterYourDefeatText:; backwards
	text "Wow, looks like"
	line "you're the tough"
	cont "one here!"
	done
	
TuesdayAfterVictoriousText:; backwards
	text "I'm getting good"
	line "at this!"
	done
	
TuesdayWinText:
	text "Woah, now!"
	done
	
TuesdayLossText:
	text "I got this!"
	done

	
TuesdayTrainerGreeting:
	text "Hi there!"
	para "I'm looking to"
	line "battle!"
	para "I think I'm pretty"
	line "tough."
	para "I use #MON"
	line "around level 30."
	para "Think you can take"
	line "me on?"
	done
	
	
NoBattleNowWednesdayText:
	text "That's okay!"
	para "I'll stick around"
	line "for a bit."
	done
	
WednesdayAfterYourDefeatText:; backwards
	text "Hey, looks like"
	line "you're good at"
	cont "this too!"
	done
	
WednesdayAfterVictoriousText:; backwards
	text "My #MON are"
	line "always up for a"
	cont "battle!"
	done
	
WednesdayWinText:
	text "Hey, good one!"
	done
	
WednesdayLossText:
	text "What a workout!"
	done

WednesdayTrainerGreeting:
	text "Hiya! I'm stopping"
	line "by here after a"
	para "run with my"
	line "#MON!"
	para "I'm pretty good at"
	line "battling."
	para "My #MON are"
	line "around level 40."
	para "Wanna send a"
	line "challenge my way?"
	done
	
	
NoBattleNowThursdayText:
	text "That's fine, then."
	done
	
ThursdayAfterYourDefeatText:; backwards
	text "This was a good"
	line "challenge."
	done
	
ThursdayAfterVictoriousText:; backwards
	text "My #MON prove"
	line "their strength."
	done
	
ThursdayWinText:
	text "Very good."
	done
	
ThursdayLossText:
	text "Ah, victory."
	done

	
ThursdayTrainerGreeting:
	text "Good day."
	para "I am experienced"
	line "in battling."
	para "I have a party"
	line "of #MON around"
	cont "level 50."
	para "Want to have a go"
	line "at a battle?"
	done
	

NoBattleNowFridayText:
	text "It's okay, most"
	line "people can't."
	done
	
FridayAfterYourDefeatText:; backwards
	text "Wow, you beat me!"
	done
	
FridayAfterVictoriousText:; backwards
	text "Another victory"
	line "for my team!"
	done
	
FridayWinText:
	text "I'm shocked!"
	done
	
FridayLossText:
	text "Way to go, me!"
	done

	
FridayTrainerGreeting:
	text "Well, hello!"
	para "I try not to brag,"
	line "but I'm pretty"
	cont "darn good."
	para "I have #MON"
	line "around level 60."
	para "Think you can"
	line "handle them?"
	done
	

NoBattleNowSaturdayText:
	text "One day, you might"
	line "be strong enough"
	para "to accept my"
	line "challenge."
	done
	
SaturdayAfterYourDefeatText:; backwards
	text "You're among a"
	line "select few who"
	cont "have defeated me."
	para "Well done."
	done
	
SaturdayAfterVictoriousText:; backwards
	text "This was the"
	line "expected outcome."
	done
	
SaturdayWinText:
	text "Unbelievable!"
	done
	
SaturdayLossText:
	text "Victory for me"
	line "once more!"
	done

	
;SaturdayTrainerGreeting:
;	text "Hi I'm strong."
;	line "My #MON is at"
;	cont "level 70."
;	para "I am the bestest +"
;	para "Shall we battle?"
;	done

SaturdayTrainerGreeting:
	text "It's not often I"
	line "come across a"
	para "trainer to match"
	line "my skill."
	para "My #MON are"
	line "around level 70."
	para "So tell me, do you"
	line "think you're"
	para "someone who can"
	line "match me in"
	cont "battle?"
	done
	
	
TrainerAcceptsChallenge:
	text "Okay!"
	para "Just stand over on"
	line "the opposite side"
	cont "and we can begin!"
	done
	
TrainerClubDone:
	text "Whew!"
	para "I'm not up for any"
	line "more battles now."
	para "Come back tomorrow"
	line "and battle someone"
	cont "new!"
	done
	

KantoBattleClubB1F_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  7,  0, KANTO_BATTLE_CLUB_1F, 3

	db 0 ; coord events

	db 0 ; bg events

	db 16 ; object events
	object_event 16,  8, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, BattleClubScriptSun, EVENT_SWITCH_1
	object_event 14, 14, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, BattleClubScriptMon, EVENT_SWITCH_2
	object_event 16,  8, SPRITE_LASS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, BattleClubScriptTues, EVENT_SWITCH_3
	object_event 16,  8, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, BattleClubScriptWed, EVENT_SWITCH_4
	object_event  6, 10, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, BattleClubScriptThurs, EVENT_SWITCH_5
	object_event 14, 14, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, BattleClubScriptFri, EVENT_SWITCH_6
	object_event  6, 10, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, BattleClubScriptSat, EVENT_SWITCH_7
	object_event 11,  2, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, BattleClubReceptionistScript, -1
	object_event  3,  4, SPRITE_POKEFAN_M, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, BattleClubPokefanMScript, -1
	object_event  3, 15, SPRITE_JANINE, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, BattleClubJanineScript, -1
	object_event  9,  3, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, BattleClubYoungsterScript, EVENT_SWITCH_2
	object_event 13, 15, SPRITE_GENTLEMAN, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, BattleClubGentlemanScript, EVENT_SWITCH_3
	object_event  6, 10, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_LEFT, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, BattleClubRockerScript, EVENT_SWITCH_4
	object_event 15,  6, SPRITE_LASS, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, BattleClubLassScript, EVENT_SWITCH_5
	object_event  3, 10, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, BattleClubYoungster2Script, EVENT_SWITCH_1
	object_event 13,  6, SPRITE_GRANNY, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, BattleClubGrannyScript, EVENT_SWITCH_6
