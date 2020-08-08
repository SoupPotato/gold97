	const_def 2 ; object constants
	const SAFFRON_GYM_LASS
	const SAFFRON_GYM_YOUNGSTER
	const SAFFRON_GYM_POKEFAN_M
	const SAFFROM_GYM_GYM_GUY


RyukyuFakeGym_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .RyukyuFakeGymTypeChange
	
.RyukyuFakeGymTypeChange:
	checkevent EVENT_GOT_CRUISE_FROM_ELM
	iftrue .GrassGym
	checkevent EVENT_GOT_CHIKORITA_FROM_ELM
	iftrue .FireGym
	jump .doneGym
.GrassGym:
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
	
.FireGym:
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
	checkevent EVENT_GOT_CHIKORITA_FROM_ELM
	iftrue .GotCHIKORITAGiveFlambear
	checkevent EVENT_GOT_CRUISE_FROM_ELM
	iftrue .GotCruiseGiveCHIKORITA
	checkevent EVENT_EXPLODING_TRAP_19
	iftrue .AfterBattleFakeGymWater
	writetext PokefanMBeforeTextWater
	waitbutton
	closetext
	winlosstext PokefanMWinTextFake, PokefanMLossTextFake
	loadtrainer POKEFANM, TREVOR
	startbattle
	reloadmapafterbattle
	setevent EVENT_EXPLODING_TRAP_19
	opentext
.AfterBattleFakeGymWater
	checkevent EVENT_EXPLODING_TRAP_20
	iftrue .AlreadyGotEgg2Water
	writetext HaveStarter2Egg
	waitbutton
	checkcode VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .PartyFullStarter2
	giveegg CRUISE, 5
	stringtotext .eggname2, MEM_BUFFER_1
	scall .GetStarter2Egg
	setevent EVENT_EXPLODING_TRAP_20
.AlreadyGotEgg2Water
	writetext TakeGoodCareOfStarter2
	waitbutton
	closetext
	end
	
.GotCHIKORITAGiveFlambear
	checkevent EVENT_EXPLODING_TRAP_19
	iftrue .AfterBattleFakeGymFire
	writetext PokefanMBeforeTextFire
	waitbutton
	closetext
	winlosstext PokefanMWinTextFake, PokefanMLossTextFake
	loadtrainer HIKER, BAILEY
	startbattle
	reloadmapafterbattle
	setevent EVENT_EXPLODING_TRAP_19
	opentext
.AfterBattleFakeGymFire
	checkevent EVENT_EXPLODING_TRAP_20
	iftrue .AlreadyGotEgg2Fire
	writetext HaveStarter2Egg
	waitbutton
	checkcode VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .PartyFullStarter2
	giveegg FLAMBEAR, 5
	stringtotext .eggname2, MEM_BUFFER_1
	scall .GetStarter2Egg
	setevent EVENT_EXPLODING_TRAP_20
.AlreadyGotEgg2Fire
	writetext TakeGoodCareOfStarter2
	waitbutton
	closetext
	end
	
.GotCruiseGiveCHIKORITA
	checkevent EVENT_EXPLODING_TRAP_19
	iftrue .AfterBattleFakeGymGrass
	writetext PokefanMBeforeTextGrass
	waitbutton
	closetext
	winlosstext PokefanMWinTextFake, PokefanMLossTextFake
	loadtrainer POKEFANM, CARTER
	startbattle
	reloadmapafterbattle
	setevent EVENT_EXPLODING_TRAP_19
	opentext
.AfterBattleFakeGymGrass
	checkevent EVENT_EXPLODING_TRAP_20
	iftrue .AlreadyGotEgg2Grass
	writetext HaveStarter2Egg
	waitbutton
	checkcode VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .PartyFullStarter2
	giveegg CHIKORITA, 5
	stringtotext .eggname2, MEM_BUFFER_1
	scall .GetStarter2Egg
	setevent EVENT_EXPLODING_TRAP_20
.AlreadyGotEgg2Grass
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
	
Trainer1Scene:
	playmusic MUSIC_BEAUTY_ENCOUNTER
	showemote EMOTE_SHOCK, SAFFRON_GYM_LASS, 30
	turnobject PLAYER, LEFT
	opentext
	checkevent EVENT_GOT_CHIKORITA_FROM_ELM
	iftrue .Trainer1GotCHIKORITAUseFire
	checkevent EVENT_GOT_CRUISE_FROM_ELM
	iftrue .Trainer1GotCruiseUseGrass
	writetext LassTextBeforeWater
	waitbutton
	closetext
	winlosstext LassWinTextWater, LassLossTextWater
	loadtrainer LASS, LINDA
	startbattle
	reloadmapafterbattle
	setscene SCENE_SAFFRON_GYM_TRAINER_2
	end
	
.Trainer1GotCHIKORITAUseFire
	writetext LassTextBeforeFire
	waitbutton
	closetext
	winlosstext LassWinTextFire, LassLossTextFire
	loadtrainer LASS, ALICE
	startbattle
	reloadmapafterbattle
	setscene SCENE_SAFFRON_GYM_TRAINER_2
	end
	
.Trainer1GotCruiseUseGrass
	writetext LassTextBeforeGrass
	waitbutton
	closetext
	winlosstext LassWinTextGrass, LassLossTextGrass
	loadtrainer PICNICKER, TANYA
	startbattle
	reloadmapafterbattle
	setscene SCENE_SAFFRON_GYM_TRAINER_2
	end
	
Trainer2Scene:
	playmusic MUSIC_YOUNGSTER_ENCOUNTER
	showemote EMOTE_SHOCK, SAFFRON_GYM_YOUNGSTER, 30
	opentext
	checkevent EVENT_GOT_CHIKORITA_FROM_ELM
	iftrue .Trainer2GotCHIKORITAUseFire
	checkevent EVENT_GOT_CRUISE_FROM_ELM
	iftrue .Trainer2GotCruiseUseGrass
	writetext YoungsterTextBeforeWater
	waitbutton
	closetext
	winlosstext YoungsterWinTextWater, YoungsterLossTextWater
	loadtrainer SCHOOLBOY, KIPP
	startbattle
	reloadmapafterbattle
	setscene SCENE_SAFFRON_GYM_NOTHING
	end

.Trainer2GotCHIKORITAUseFire
	writetext YoungsterTextBeforeFire
	waitbutton
	closetext
	winlosstext YoungsterWinTextFire, YoungsterLossTextFire
	loadtrainer YOUNGSTER, JASON
	startbattle
	reloadmapafterbattle
	setscene SCENE_SAFFRON_GYM_NOTHING
	end

.Trainer2GotCruiseUseGrass
	writetext YoungsterTextBeforeGrass
	waitbutton
	closetext
	winlosstext YoungsterWinTextGrass, YoungsterLossTextGrass
	loadtrainer YOUNGSTER, OWEN
	startbattle
	reloadmapafterbattle
	setscene SCENE_SAFFRON_GYM_NOTHING
	end
	
RyukyuFakeGymYoungsterScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_CHIKORITA_FROM_ELM
	iftrue .Trainer2AfterFire
	checkevent EVENT_GOT_CRUISE_FROM_ELM
	iftrue .Trainer2AfterGrass
	writetext Trainer2AfterWaterText
	waitbutton
	closetext
	end
.Trainer2AfterFire
	writetext Trainer2AfterFireText
	waitbutton
	closetext
	end
.Trainer2AfterGrass
	writetext Trainer2AfterGrassText
	waitbutton
	closetext
	end
	
RyukyuFakeGymLassScript:
	jumptextfaceplayer RyukyuFakeGymLassText
	
RyukyuFakeGymGuyScript:
	faceplayer
	opentext
	checkevent EVENT_EXPLODING_TRAP_19
	iftrue .GymGuyFakeGymAfter
	checkevent EVENT_GOT_CHIKORITA_FROM_ELM
	iftrue .GymGuyFire
	checkevent EVENT_GOT_CRUISE_FROM_ELM
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
	
GymGuyFireText:
	text "What's this?"
	para "A #MON GYM?"
	para "Well, not quite."
	para "BAILEY here has"
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
	para "Oh, yeah. He uses"
	line "FIRE #MON."
	para "I'm sure you know"
	line "what you'd need to"
	cont "do to win."
	done
	
GymGuyWaterText:
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
	para "Oh, yeah. He uses"
	line "WATER #MON."
	para "I'm sure you know"
	line "what you'd need to"
	cont "do to win."
	done
	
GymGuyGrassText:
	text "What's this?"
	para "A #MON GYM?"
	para "Well, not quite."
	para "CARTER here has"
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
	para "Oh, yeah. He uses"
	line "GRASS #MON."
	para "I'm sure you know"
	line "what you'd need to"
	cont "do to win."
	done
	
RyukyuFakeGymLassText:
	text "Isn't this fun?"
	para "It's just like a"
	line "real GYM!"
	done
	
Trainer2AfterFireText:
	text "BAILEY has always"
	line "wanted to be a GYM"
	cont "LEADER."
	para "But it's tough to"
	line "get the proper"
	cont "accreditation."
	done
	
Trainer2AfterGrassText:
	text "CARTER has always"
	line "wanted to be a GYM"
	cont "LEADER."
	para "But it's tough to"
	line "get the proper"
	cont "accreditation."
	done
	
Trainer2AfterWaterText:
	text "TREVOR has always"
	line "wanted to be a GYM"
	cont "LEADER."
	para "But it's tough to"
	line "get the proper"
	cont "accreditation."
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
	
	
PokefanMBeforeTextWater:
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
	para "WATER type #MON"
	line "are my favorite!"
	para "They'll drench you"
	line "if you take them"
	cont "on!"
	para "Are you ready?"
	done

PokefanMLossTextFake:
	text "I'm good at this!"
	done
	
PokefanMWinTextFake:
	text "Bahah! What a good"
	line "time that was!"
	done

	
PokefanMBeforeTextGrass:
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
	para "GRASS type #MON"
	line "are my favorite!"
	para "Their vines and"
	line "leaves will beat"
	cont "you down!"
	para "Are you ready?"
	done


	
PokefanMBeforeTextFire:
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
	para "FIRE type #MON"
	line "are my favorite!"
	para "They'll burn you"
	line "if you take them"
	cont "on!"
	para "Are you ready?"
	done
	
YoungsterTextBeforeWater:
	text "You ever been"
	line "swimming?"
	para "My #MON have."
	done
	
YoungsterLossTextWater:
	text "Wahoo!"
	done
	
YoungsterWinTextWater:
	text "Looks like you can"
	line "tread water!"
	done

YoungsterTextBeforeFire:
	text "Can you handle the"
	line "heat in here?"
	done
	
YoungsterLossTextFire:
	text "Wahoo!"
	done
	
YoungsterWinTextFire:
	text "Looks like I got"
	line "scorched!"
	done

YoungsterTextBeforeGrass:
	text "Don't trip over"
	line "my #MON's"
	cont "vines!"
	done
	
YoungsterLossTextGrass:
	text "Wahoo!"
	done
	
YoungsterWinTextGrass:
	text "I stumbled!"
	done
	
LassTextBeforeGrass:
	text "Isn't it lovely"
	line "in here?"
	para "I brought snacks"
	line "for a picnic!"
	done
	
LassLossTextGrass:
	text "Wahoo!"
	
LassWinTextGrass:
	text "At least the air"
	line "is still sweet."
	done
	
LassTextBeforeWater:
	text "Careful, the floor"
	line "can get slick!"
	done
	
LassLossTextWater:
	text "Wahoo!"
	
LassWinTextWater:
	text "I slipped!"
	done
	
LassTextBeforeFire:
	text "Nothing is better"
	line "for a hot room"
	cont "than a hot battle!"
	done
	
LassLossTextFire:
	text "Wahoo!"
	
LassWinTextFire:
	text "Too hot!"
	done
	
RyukyuFakeGym_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  8, 17, RYUKYU_CITY, 10
	warp_event  9, 17, RYUKYU_CITY, 10


	db 2 ; coord events
	coord_event  8, 11, SCENE_DEFAULT, Trainer1Scene
	coord_event  7,  7, SCENE_SAFFRON_GYM_TRAINER_2, Trainer2Scene

	db 0 ; bg events

	db 4 ; object events
	object_event  7, 11, SPRITE_LASS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, RyukyuFakeGymLassScript, -1
	object_event  7,  6, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, RyukyuFakeGymYoungsterScript, -1
	object_event  9,  0, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, RyukyuFakeGymPokefanMScript, -1
	object_event 10, 15, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, RyukyuFakeGymGuyScript, -1
