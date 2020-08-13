	const_def 2 ; object constants
	const SAFFRON_GYM_LASS_GRASS
	const SAFFRON_GYM_LASS_FIRE
	const SAFFRON_GYM_LASS_WATER
	const SAFFRON_GYM_YOUNGSTER_GRASS
	const SAFFRON_GYM_YOUNGSTER_FIRE
	const SAFFRON_GYM_YOUNGSTER_WATER
	const SAFFRON_GYM_POKEFAN_M
	const SAFFROM_GYM_GYM_GUY


RyukyuFakeGym_MapScripts:
	db 0 ; scene scripts

	db 2 ; callbacks
	callback MAPCALLBACK_OBJECTS, .Trainers
	
	callback MAPCALLBACK_TILES, .RyukyuFakeGymTypeChange
	
.Trainers
	checkevent EVENT_GOT_CRUIZE_FROM_ELM
	iftrue .GrassGym
	checkevent EVENT_GOT_CHIKORITA_FROM_ELM
	iftrue .FireGym
	checkevent EVENT_GOT_FLAMBEAR_FROM_ELM
	iftrue .WaterGym
	return
	
.GrassGym
	moveobject SAFFRON_GYM_LASS_FIRE, -4, -4 
	moveobject SAFFRON_GYM_LASS_WATER, -4, -4 
	moveobject SAFFRON_GYM_YOUNGSTER_FIRE, -4, -4 
	moveobject SAFFRON_GYM_YOUNGSTER_WATER, -4, -4 
	return
	
.FireGym
	moveobject SAFFRON_GYM_LASS_GRASS, -4, -4 
	moveobject SAFFRON_GYM_LASS_WATER, -4, -4 
	moveobject SAFFRON_GYM_YOUNGSTER_GRASS, -4, -4 
	moveobject SAFFRON_GYM_YOUNGSTER_WATER, -4, -4 
	return
	
.WaterGym
	moveobject SAFFRON_GYM_LASS_GRASS, -4, -4 
	moveobject SAFFRON_GYM_LASS_FIRE, -4, -4 
	moveobject SAFFRON_GYM_YOUNGSTER_GRASS, -4, -4 
	moveobject SAFFRON_GYM_YOUNGSTER_FIRE, -4, -4 
	return
	
.RyukyuFakeGymTypeChange:
	checkevent EVENT_GOT_CRUIZE_FROM_ELM
	iftrue .GrassGymBlocks
	checkevent EVENT_GOT_CHIKORITA_FROM_ELM
	iftrue .FireGymBlocks
	jump .doneGym
.GrassGymBlocks:
	changeblock  3, 1, $3F ; grass
	changeblock  5, 1, $7D ; grass
	changeblock  3, 3, $3F ; grass
	changeblock  5, 3, $3F ; grass
	changeblock  3, 5, $3F ; grass
	changeblock  5, 5, $7D ; grass
	changeblock  3, 7, $3F ; grass
	changeblock  5, 7, $3F ; grass
	changeblock  3, 9, $3F ; grass
	changeblock  5, 9, $7D ; grass
	changeblock  3, 11, $3F ; grass
	changeblock  5, 11, $3F ; grass
	changeblock  3, 13, $3F ; grass
	changeblock  5, 13, $7D ; grass
	changeblock  3, 15, $3F ; grass
	changeblock  5, 15, $3F ; grass
	changeblock  3, 17, $3F ; grass
	changeblock  5, 17, $7D ; grass
	changeblock  13, 1, $7D ; grass
	changeblock  15, 1, $3F ; grass
	changeblock  13, 3, $3F ; grass
	changeblock  15, 3, $3F ; grass
	changeblock  13, 5, $7D ; grass
	changeblock  15, 5, $3F ; grass
	changeblock  13, 7, $3F ; grass
	changeblock  15, 7, $3F ; grass
	changeblock  13, 9, $7D ; grass
	changeblock  15, 9, $3F ; grass
	changeblock  13, 11, $3F ; grass
	changeblock  15, 11, $3F ; grass
	changeblock  13, 13, $7D ; grass
	changeblock  15, 13, $3F ; grass
	changeblock  13, 15, $3F ; grass
	changeblock  15, 15, $3F ; grass
	changeblock  13, 17, $7D ; grass
	changeblock  15, 17, $3F ; grass
	return
	
.FireGymBlocks:
	changeblock  3, 1, $3B ; fire
	changeblock  5, 1, $59 ; fire
	changeblock  3, 3, $3B ; fire
	changeblock  5, 3, $3B ; fire
	changeblock  3, 5, $3B ; fire
	changeblock  5, 5, $59 ; fire
	changeblock  3, 7, $3B ; fire
	changeblock  5, 7, $3B ; fire
	changeblock  3, 9, $3B ; fire
	changeblock  5, 9, $59 ; fire
	changeblock  3, 11, $3B ; fire
	changeblock  5, 11, $3B ; fire
	changeblock  3, 13, $3B ; fire
	changeblock  5, 13, $59 ; fire
	changeblock  3, 15, $3B ; fire
	changeblock  5, 15, $3B ; fire
	changeblock  3, 17, $3B ; fire
	changeblock  5, 17, $59 ; fire
	changeblock  13, 1, $59 ; fire
	changeblock  15, 1, $3B ; fire
	changeblock  13, 3, $3B ; fire
	changeblock  15, 3, $3B ; fire
	changeblock  13, 5, $59 ; fire
	changeblock  15, 5, $3B ; fire
	changeblock  13, 7, $3B ; fire
	changeblock  15, 7, $3B ; fire
	changeblock  13, 9, $59 ; fire
	changeblock  15, 9, $3B ; fire
	changeblock  13, 11, $3B ; fire
	changeblock  15, 11, $3B ; fire
	changeblock  13, 13, $59 ; fire
	changeblock  15, 13, $3B ; fire
	changeblock  13, 15, $3B ; fire
	changeblock  15, 15, $3B ; fire
	changeblock  13, 17, $59 ; fire
	changeblock  15, 17, $3B ; fire
	return
	
.doneGym
	return
	

	
RyukyuFakeGymPokefanMScript:
	faceplayer
	opentext
	checkevent EVENT_EXPLODING_TRAP_19
	iftrue .AfterBattle
	writetext TrevorBeforeText
	waitbutton
	checkevent EVENT_GOT_CHIKORITA_FROM_ELM
	iftrue .TrevorFire
	checkevent EVENT_GOT_CRUIZE_FROM_ELM
	iftrue .TrevorGrass
	checkevent EVENT_GOT_CRUIZE_FROM_ELM
	iftrue .TrevorWater
	
.TrevorFire	
	writetext TrevorFireText
	closetext
	winlosstext TrevorWinTextFake, TrevorLossTextFake
	loadtrainer POKEFANM, TREVOR2
	startbattle
	reloadmapafterbattle
	setevent EVENT_EXPLODING_TRAP_19
	jump .AfterBattle
	end
	
.TrevorGrass	
	writetext TrevorGrassText
	closetext
	winlosstext TrevorWinTextFake, TrevorLossTextFake
	loadtrainer POKEFANM, TREVOR1
	startbattle
	reloadmapafterbattle
	setevent EVENT_EXPLODING_TRAP_19
	jump .AfterBattle
	end
	
.TrevorWater
	writetext TrevorWaterText
	closetext
	winlosstext TrevorWinTextFake, TrevorLossTextFake
	loadtrainer POKEFANM, TREVOR3
	startbattle
	reloadmapafterbattle
	setevent EVENT_EXPLODING_TRAP_19
.AfterBattle
	opentext
	checkevent EVENT_EXPLODING_TRAP_20
	iftrue .AlreadyGotEgg2Water
	writetext HaveStarter2Egg
	waitbutton
	checkevent EVENT_GOT_CHIKORITA_FROM_ELM
	iftrue .FireEgg
	checkevent EVENT_GOT_CRUIZE_FROM_ELM
	iftrue .GrassEgg
	checkevent EVENT_GOT_CRUIZE_FROM_ELM
	iftrue .WaterEgg

.GrassEgg
	checkcode VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .PartyFullStarter2
	giveegg CHIKORITA, 5
	jump .Egg2

.FireEgg
	checkcode VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .PartyFullStarter2
	giveegg FLAMBEAR, 5
	jump .Egg2
	
.WaterEgg
	checkcode VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .PartyFullStarter2
	giveegg CRUIZE, 5
.Egg2
	stringtotext .eggname2, MEM_BUFFER_1
	scall .GetStarter2Egg
	setevent EVENT_EXPLODING_TRAP_20
.AlreadyGotEgg2Water
	writetext TakeGoodCareOfStarter2
	waitbutton
	closetext
	end
	
.PartyFullStarter2
	writetext NoRoomForStarter2
	waitbutton
	closetext
	end
	
.GetStarter2Egg:
	jumpstd receivetogepiegg
	end
	
.eggname2
	db "EGG@"
	
TrainerLassLindaGrass:
	trainer LASS, LINDA1, EVENT_BEAT_LASS_LINDA, LindaSeenText, LindaWinText, 0, .Script	

.Script:
	endifjustbattled
	opentext
	writetext LindaAfterBattleText
	waitbutton
	closetext
	end
	
TrainerLassLindaFire:
	trainer LASS, LINDA2, EVENT_BEAT_LASS_LINDA, LindaSeenText, LindaWinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext LindaAfterBattleText
	waitbutton
	closetext
	end
	
TrainerLassLindaWater:
	trainer LASS, LINDA3, EVENT_BEAT_LASS_LINDA, LindaSeenText, LindaWinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext LindaAfterBattleText
	waitbutton
	closetext
	end

	
TrainerYoungsterJasonGrass:
	trainer YOUNGSTER, JASON1, EVENT_BEAT_YOUNGSTER_JASON, JasonSeenText, JasonWinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext JasonAfterBattleText
	waitbutton
	closetext
	end
	
TrainerYoungsterJasonFire:
	trainer YOUNGSTER, JASON2, EVENT_BEAT_YOUNGSTER_JASON, JasonSeenText, JasonWinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext JasonAfterBattleText
	waitbutton
	closetext
	end
	
TrainerYoungsterJasonWater:
	trainer YOUNGSTER, JASON3, EVENT_BEAT_YOUNGSTER_JASON, JasonSeenText, JasonWinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext JasonAfterBattleText
	waitbutton
	closetext
	end

	
RyukyuFakeGymGuyScript:
	faceplayer
	opentext
	writetext GymGuyText
	waitbutton
	checkevent EVENT_EXPLODING_TRAP_19
	iftrue .GymGuyFakeGymAfter
	checkevent EVENT_GOT_CHIKORITA_FROM_ELM
	iftrue .GymGuyFire
	checkevent EVENT_GOT_CRUIZE_FROM_ELM
	iftrue .GymGuyGrass
	writetext GymGuyWaterText
	waitbutton
	closetext
	end
.GymGuyFire
	writetext GymGuyFireText
	waitbutton
	closetext
	end
.GymGuyGrass
	writetext GymGuyGrassText
	waitbutton
	closetext
	end
.GymGuyFakeGymAfter
	writetext GymGuyFakeGymAfterText
	waitbutton
	closetext
	end

GymGuyFakeGymAfterText:
	text "It's always fun to"
	line "face off against"
	para "a GYM, whether or"
	line "not you actually"
	cont "get a BADGE."
	done
	
GymGuyText:
	text "What's this?"
	para "A #MON GYM?"
	para "Well, not quite."
	para "TREVOR here has"
	line "always wanted to"
	cont "be a GYM LEADER."
	para "It's a long and"
	line "difficult process"
	para "to make it"
	line "official, though."
	para "But we're here,"
	line "playing the part"
	para "until he can do it"
	line "for real!"
	done
	
GymGuyGrassText:
	text "Oh, yeah. He uses"
	line "GRASS #MON."
	para "I'm sure you know"
	line "what you'd need to"
	cont "do to win."
	done
	
GymGuyFireText:
	text "Oh, yeah. He uses"
	line "FIRE #MON."
	para "I'm sure you know"
	line "what you'd need to"
	cont "do to win."
	done
	
GymGuyWaterText:
	text "Oh, yeah. He uses"
	line "WATER #MON."
	para "I'm sure you know"
	line "what you'd need to"
	cont "do to win."
	done

TakeGoodCareOfStarter2:
	text "Take good care of"
	line "that #MON!"
	para "It's one of my"
	line "favorite kinds!"
	done
	
HaveStarter2Egg:
	text "Wow! That was a"
	line "great battle!"
	para "I feel like a real"
	line "GYM LEADER, even"
	cont "though I lost."
	para "I can't give you"
	line "a badge, but I've"
	para "got an EGG of a"
	line "rare #MON of"
	cont "my favorite type!"
	para "Here, have this!"
	done
	
NoRoomForStarter2:
	text "Oh, wait! You need"
	line "to make room!"
	done


TrevorLossTextFake:
	text "I'm good at this!"
	done
	
TrevorWinTextFake:
	text "Bahah! What a good"
	line "time that was!"
	done
	
TrevorBeforeText:
	text "Hey there!"
	para "Welcome to my GYM!"
	para "…Well, it's not"
	line "an official one."
	para "But one day!"
	para "I'm going to be a"
	line "GYM LEADER!"
	para "As for now though,"
	line "I can at least act"
	cont "the part."
	para "And there's"
	line "nothing more I"
	para "love than a good"
	line "battle!"
	done
	
TrevorGrassText:	
	text "GRASS type #MON"
	line "are my favorite!"
	para "Their vines and"
	line "leaves will beat"
	cont "you down!"
	para "Are you ready?"
	done

TrevorFireText:	
	text "FIRE type #MON"
	line "are my favorite!"
	para "They'll burn you"
	line "if you take them"
	cont "on!"
	para "Are you ready?"
	done
	
TrevorWaterText:	
	text "WATER type #MON"
	line "are my favorite!"
	para "They'll drench you"
	line "if you take them"
	cont "on!"
	para "Are you ready?"
	done
	
JasonSeenText:
	text "Can you handle this"
	line "GYM?"
	done
	
JasonWinText:
	text "I got scorched!"
	done
	
JasonAfterBattleText:
	text "TREVOR is always"
	line "trying to be a"
	cont "GYM LEADER."
	
	para "I hope he can"
	line "become one"
	cont "someday."
	done
	
LindaSeenText:
	text "Isn't it fun in"
	line "here?"
	done
	
LindaWinText:
	text "A pretend GYM is"
	line "so much fun!"
	done
	
LindaAfterBattleText:
	text "TREVOR is tough."
	line "Good luck!"
	done

	
RyukyuFakeGym_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  8, 17, RYUKYU_CITY, 10
	warp_event  9, 17, RYUKYU_CITY, 10


	db 0 ; coord events

	db 0 ; bg events

	db 8 ; object events
	object_event  7, 11, SPRITE_LASS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerLassLindaGrass, 0
	object_event  7, 11, SPRITE_LASS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerLassLindaFire, 0
	object_event  7, 11, SPRITE_LASS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerLassLindaWater, 0
	object_event  7,  6, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerYoungsterJasonGrass, 0
	object_event  7,  6, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerYoungsterJasonFire, 0
	object_event  7,  6, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerYoungsterJasonWater, 0
	object_event  9,  0, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, RyukyuFakeGymPokefanMScript, -1
	object_event 10, 15, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, RyukyuFakeGymGuyScript, -1
