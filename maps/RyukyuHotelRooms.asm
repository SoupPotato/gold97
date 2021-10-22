	const_def 2 ; object constants
	const RYUKYU_HOTEL_ROOMS_OAK
	const RYUKYU_HOTEL_ROOMS_SOLDIER
	const RYUKYU_HOTEL_ROOMS_CAMPER
	const RYUKYU_HOTEL_ROOMS_PSYCHIC
	const RYUKYU_HOTEL_ROOMS_COOLTRAINERF
	const RYUKYU_HOTEL_ROOMS_COOLTRAINERF2
	const RYUKYU_HOTEL_ROOMS_COOLTRAINERF3
	const RYUKYU_HOTEL_ROOMS_COOLTRAINERM
	const RYUKYU_HOTEL_ROOMS_LASS

RyukyuHotelRooms_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .CheckDayOfWeekOakBattle
	
.CheckDayOfWeekOakBattle:
	checkcode VAR_WEEKDAY
	ifequal SATURDAY, .ItsWeekendOak
	checkcode VAR_WEEKDAY
	ifequal SUNDAY, .ItsWeekendOak
	disappear RYUKYU_HOTEL_ROOMS_OAK
	return
	
.ItsWeekendOak
	appear RYUKYU_HOTEL_ROOMS_OAK
	return

RyukyuHotelRoomsOakScript:
	checkevent EVENT_BATTLED_OAK
	iftrue .TalkToOakAfterBattle
	faceplayer
	opentext
	writetext RyukyuHotelRoomsOakBefore
	yesorno
	iffalse .NoOakBattleYet
	writetext RyukyuHotelRoomsOakBefore2
	waitbutton
	closetext
	checkevent EVENT_GOT_CRUIZE_FROM_OAK
	iftrue .Cruise
	checkevent EVENT_GOT_CHIKORITA_FROM_OAK
	iftrue .Chikorita
	winlosstext RyukyuHotelRoomsOakTextWin, RyukyuHotelRoomsOakTextLoss
	loadtrainer POKEMON_PROF, OAK_HAS_CHIKORITA
	startbattle
	reloadmapafterbattle
	jump .FinishBattle

.Cruise:
	winlosstext RyukyuHotelRoomsOakTextWin, RyukyuHotelRoomsOakTextLoss
	loadtrainer POKEMON_PROF, OAK_HAS_FLAMBEAR
	startbattle
	reloadmapafterbattle
	jump .FinishBattle

.Chikorita:
	winlosstext RyukyuHotelRoomsOakTextWin, RyukyuHotelRoomsOakTextLoss
	loadtrainer POKEMON_PROF, OAK_HAS_CRUIZE
	startbattle
	reloadmapafterbattle
	jump .FinishBattle

.FinishBattle:
	opentext
	writetext RyukyuHotelRoomsOakAfter
	waitbutton
	closetext
	setevent EVENT_BATTLED_OAK
	end
	
.NoOakBattleYet
	writetext RyukyuHotelRoomsOakNoBattle
	waitbutton
	closetext
	end
	
.TalkToOakAfterBattle
	faceplayer
	opentext
	writetext RyukyuHotelRoomsOakAfter
	waitbutton
	closetext
	end
	

TrainerSoldierWarnell:
	trainer SOLDIER, WARNELL, EVENT_BEAT_SOLDIER_WARNELL, SoldierWarnellSeenText, SoldierWarnellBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SoldierWarnellAfterBattleText
	waitbutton
	closetext
	end
	

TrainerCamperQuentin:
	trainer CAMPER, QUENTIN, EVENT_BEAT_CAMPER_QUENTIN, CamperQuentinSeenText, CamperQuentinBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CamperQuentinAfterBattleText
	waitbutton
	closetext
	end
	

TrainerPsychicRaphael:
	trainer PSYCHIC_T, RAPHAEL, EVENT_BEAT_PSYCHIC_T_RAPHAEL, PsychicRaphaelSeenText, PsychicRaphaelBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PsychicRaphaelAfterBattleText
	waitbutton
	closetext
	end
	

TrainerCooltrainerfAyano:
	trainer COOLTRAINERF, AYANO, EVENT_BEAT_COOLTRAINERF_AYANO, CooltrainerfAyanoSeenText, CooltrainerfAyanoBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainerfAyanoAfterBattleText
	waitbutton
	closetext
	end
	

TrainerCooltrainerfYuka:
	trainer COOLTRAINERF, YUKA, EVENT_BEAT_COOLTRAINERF_YUKA, CooltrainerfYukaSeenText, CooltrainerfYukaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainerfYukaAfterBattleText
	waitbutton
	closetext
	end
	
TrainerCooltrainerfAyaka:
	trainer COOLTRAINERF, AYAKA, EVENT_BEAT_COOLTRAINERF_AYAKA, CooltrainerfAyakaSeenText, CooltrainerfAyakaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainerfAyakaAfterBattleText
	waitbutton
	closetext
	end
	
TrainerCooltrainermWozniak:
	trainer COOLTRAINERM, WOZNIAK, EVENT_BEAT_COOLTRAINERM_WOZNIAK, CooltrainermWozniakSeenText, CooltrainermWozniakBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainermWozniakAfterBattleText
	waitbutton
	closetext
	end
	

TrainerLassEliza:
	trainer LASS, ELIZA, EVENT_BEAT_LASS_ELIZA, LassElizaSeenText, LassElizaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext LassElizaAfterBattleText
	waitbutton
	closetext
	end
	
LassElizaSeenText:
	text "Just because I'm"
	line "on vacation"
	para "doesn't mean I'm"
	line "not up for a good"
	cont "battle!"
	done

LassElizaBeatenText:
	text "Still a good"
	line "battle!"
	done

LassElizaAfterBattleText:
	text "Even if I lose,"
	line "every battle is a"
	cont "good experience."
	done
	
	
CooltrainermWozniakSeenText:
	text "Time for my daily"
	line "battle victory!"
	done

CooltrainermWozniakBeatenText:
	text "Doesn't count!"
	done

CooltrainermWozniakAfterBattleText:
	text "I'll find someone"
	line "else to defeat"
	cont "today."
	done

CooltrainerfAyakaSeenText:
	text "Sure, I'll battle"
	line "you!"
	done

CooltrainerfAyakaBeatenText:
	text "I lost this one!"
	done

CooltrainerfAyakaAfterBattleText:
	text "I need to spend"
	line "more time raising"
	cont "my #MON."
	done

CooltrainerfYukaSeenText:
	text "A battle?"
	para "I'll never turn"
	line "that down!"
	done

CooltrainerfYukaBeatenText:
	text "No good!"
	done

CooltrainerfYukaAfterBattleText:
	text "My #MON and I"
	line "should go train."
	done

CooltrainerfAyanoSeenText:
	text "Oh, a battle?"
	para "I'm pretty good at"
	line "those."
	done

CooltrainerfAyanoBeatenText:
	text "Not good enough!"
	done

CooltrainerfAyanoAfterBattleText:
	text "Where do you train"
	line "your #MON?"
	done
	
PsychicRaphaelSeenText:
	text "I can read your"
	line "mind!"
	done

PsychicRaphaelBeatenText:
	text "I know why you're"
	line "here!"
	done

PsychicRaphaelAfterBattleText:
	text "You're here"
	line "because you're"
	cont "on vacation!"
	done
	

CamperQuentinSeenText:
	text "Does a hotel count"
	line "as camping?"
	done

CamperQuentinBeatenText:
	text "Smacked down!"
	done

CamperQuentinAfterBattleText:
	text "If I say that I'm"
	line "camping, then I'm"
	cont "camping!"
	done
	
SoldierWarnellSeenText:
	text "This ISLAND is"
	line "my official post!"
	done

SoldierWarnellBeatenText:
	text "Nothing to report!"
	done

SoldierWarnellAfterBattleText:
	text "I really am"
	line "stationed here,"
	cont "believe it or not."
	done
	
	
RyukyuHotelRoomsOakBefore2:
	text "Let's both give"
	line "it our best!"
	done
	
RyukyuHotelRoomsOakNoBattle:
	text "Not a problem!"
	para "Some other time,"
	line "then."
	done
	
RyukyuHotelRoomsOakBefore:
	text "PROF.OAK: Why,"
	line "<PLAYER>!"
	para "How good to see"
	line "you here!"
	para "It seems like"
	line "you've had an"
	para "exciting and ful-"
	line "filling adventure"
	cont "with #MON!"
	para "I've been so in-"
	line "spired by you and"
	cont "<RIVAL>!"
	para "I've taken up"
	line "raising some #-"
	cont "MON."
	para "It's something I"
	line "haven't done in"
	cont "quite some time!"
	para "If you would like,"
	line "we could battle!"
	para "I'm sure both of"
	line "our #MON would"
	cont "enjoy it."
	para "How about it?"
	done
	
RyukyuHotelRoomsOakTextWin:
	text "That was so"
	line "exciting!"
	done
	
RyukyuHotelRoomsOakTextLoss:
	text "Oh, dear!"
	done
	
RyukyuHotelRoomsOakAfter:
	text "PROF.OAK: I can't"
	line "thank you enough"
	cont "for your help!"
	para "I've reached new"
	line "hights in my"
	para "research and love"
	line "of #MON that I"
	cont "never have before!"
	done

HotelBed:	
	opentext
	writetext HotelBedText1
	waitbutton
	closetext
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	special HealParty
	playmusic MUSIC_HEAL
	pause 60
	special RestartMapMusic
	special FadeInQuickly
	opentext
	writetext HotelBedText2
	waitbutton
	closetext
	end
	
HotelBedText1:
	text "It's your hotel"
	line "bed."
	para "Time for a rest…"
	done
	
HotelBedText2:
	text "Refreshed and"
	line "restored!"
	done


RyukyuHotelRooms_MapEvents:
	db 0, 0 ; filler


	db 16 ; warp events
	warp_event  1,  5, RYUKYU_HOTEL_2F, 4
	warp_event  2,  5, RYUKYU_HOTEL_2F, 4
	warp_event  1, 17, RYUKYU_HOTEL_2F, 5
	warp_event  2, 17, RYUKYU_HOTEL_2F, 5
	
	warp_event 12,  5, RYUKYU_HOTEL_3F, 4
	warp_event 13,  5, RYUKYU_HOTEL_3F, 4
	warp_event 12, 17, RYUKYU_HOTEL_3F, 5
	warp_event 13, 17, RYUKYU_HOTEL_3F, 5
	
	warp_event 24,  7, RYUKYU_HOTEL_4F, 4
	warp_event 25,  7, RYUKYU_HOTEL_4F, 4
	warp_event 24, 17, RYUKYU_HOTEL_4F, 5
	warp_event 25, 17, RYUKYU_HOTEL_4F, 5
	
	warp_event 36,  5, RYUKYU_HOTEL_5F, 3
	warp_event 37,  5, RYUKYU_HOTEL_5F, 3
	warp_event 36, 17, RYUKYU_HOTEL_5F, 4
	warp_event 37, 17, RYUKYU_HOTEL_5F, 4
	db 0 ; coord events

	db 2 ; bg events
	bg_event 39, 12, BGEVENT_READ, HotelBed
	bg_event 39, 13, BGEVENT_READ, HotelBed

	db 9 ; object events
	object_event 35,  1, SPRITE_OAK, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RyukyuHotelRoomsOakScript, EVENT_OAK_HERE_ON_WEEKENDS
	object_event  3,  3, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerSoldierWarnell, -1
	object_event 12,  1, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerCamperQuentin, -1
	object_event  0, 14, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerPsychicRaphael, -1
	object_event 14, 12, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 2, TrainerCooltrainerfAyano, -1
	object_event 10, 15, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 2, TrainerCooltrainerfYuka, -1
	object_event 15, 15, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 2, TrainerCooltrainerfAyaka, -1
	object_event 25,  3, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerCooltrainermWozniak, -1
	object_event 23, 15, SPRITE_LASS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerLassEliza, -1

