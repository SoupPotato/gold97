	const_def 2 ; object constants
	const SilentTown_TEACHER
	const SilentTown_FISHER
	const SilentTown_SILVER
	const SilentTown_BLUE

SilentTown_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_DEFAULT
	scene_script .DummyScene1 ; SCENE_FINISHED

	db 2 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint
	callback MAPCALLBACK_TILES, .ClearRocks

.ClearRocks:
	checkevent EVENT_BEAT_ERIKA
	iftrue .CheckNewBark2
	changeblock  19, 15, $25 ; rock
	return

.CheckNewBark2:
	checkevent EVENT_RELEASED_THE_BEASTS
	iftrue .NewBarkRocksDone
	changeblock  19, 15, $25 ; rock
	return
	
.NewBarkRocksDone
	return

.DummyScene0:
	end

.DummyScene1:
	end
	
.FlyPoint:
	setflag ENGINE_FLYPOINT_SILENT
	clearevent EVENT_FIRST_TIME_BANKING_WITH_MOM
	return
	
SilentTownPokecenterSign:
	jumpstd pokecentersign
	
SilentTown_RivalGreets:
	applymovement SilentTown_SILVER, RivalMeetsPlayer
	turnobject PLAYER, RIGHT
	special FadeOutMusic
	playmusic MUSIC_RIVAL_ENCOUNTER
	opentext
	writetext SilentTownRivalText1
	waitbutton
	closetext
	showemote EMOTE_SHOCK, SilentTown_SILVER, 15
	opentext
	writetext SilentTownRivalText2
	waitbutton
	closetext
	applymovement SilentTown_SILVER, RivalGoesToLab
	disappear SilentTown_SILVER
	setscene SCENE_TEACHER_STOPS
	special FadeOutMusic
	pause 15
	special RestartMapMusic
	setevent EVENT_RIVAL_SILENT_TOWN
	setevent EVENT_BLUE_ELM_ENTRANCE
	setevent EVENT_DAISY_ELM_ENTRANCE
	setevent EVENT_VIOLET_GYM_FALKNER
	setmapscene RADIO_TOWER_6F, SCENE_RADIOTOWER6F_NOTHING; this makes it so the giovanni scene plays, was missed for a while
	end

BlueStopsYouScene1:
	playmusic MUSIC_SHOW_ME_AROUND
	opentext
	writetext Text_WaitPlayer
	waitbutton
	closetext
	showemote EMOTE_SHOCK, PLAYER, 15
	turnobject PLAYER, RIGHT
	appear SilentTown_BLUE
	applymovement SilentTown_BLUE, BlueStopsPlayer1
	opentext
	writetext Text_ItsDangerousToGoAlone
	waitbutton
	closetext
	setevent EVENT_RIVAL_ELM_ENTRANCE
	setmapscene OAKS_LAB_ENTRANCE, SCENE_HEAD_TO_THE_BACK
	setmapscene OAKS_LAB, SCENE_DEFAULT
	clearevent EVENT_BLUE_ELM_ENTRANCE
	follow SilentTown_BLUE, PLAYER
	applymovement SilentTown_BLUE, BlueTakesPlayerToLab1
	stopfollow
	playsound SFX_ENTER_DOOR
	disappear SilentTown_BLUE
	applymovement PLAYER, PlayerEntersLab
	playsound SFX_ENTER_DOOR
	special FadeOutPalettes
	warpfacing UP, OAKS_LAB_ENTRANCE, 4, 15
	end

BlueStopsYouScene2:
	playmusic MUSIC_SHOW_ME_AROUND
	opentext
	writetext Text_WaitPlayer
	waitbutton
	closetext
	showemote EMOTE_SHOCK, PLAYER, 15
	turnobject PLAYER, RIGHT
	appear SilentTown_BLUE
	applymovement SilentTown_BLUE, BlueStopsPlayer2
	opentext
	writetext Text_ItsDangerousToGoAlone
	waitbutton
	closetext
	setevent EVENT_RIVAL_ELM_ENTRANCE
	setmapscene OAKS_LAB_ENTRANCE, SCENE_HEAD_TO_THE_BACK
	setmapscene OAKS_LAB, SCENE_DEFAULT
	clearevent EVENT_BLUE_ELM_ENTRANCE
	follow SilentTown_BLUE, PLAYER
	applymovement SilentTown_BLUE, BlueTakesPlayerToLab2
	stopfollow
	playsound SFX_ENTER_DOOR
	disappear SilentTown_BLUE
	applymovement PLAYER, PlayerEntersLab
	playsound SFX_ENTER_DOOR
	special FadeOutPalettes
	warpfacing UP, OAKS_LAB_ENTRANCE, 4, 15
	end

SilentTownRivalScript:
	faceplayer
	opentext
	writetext Text_GearIsImpressive
	waitbutton
	closetext
	end
	
SilentTownBlueScript:
	opentext
	writetext Text_Study101
	waitbutton
	closetext
	end

SilentTownTeacherScript:
	faceplayer
	opentext
	checkevent EVENT_TALKED_TO_MOM_AFTER_GETTING_POKEDEX
	iftrue .CallMom
	checkevent EVENT_GOT_A_POKEMON_FROM_OAK
	iftrue .MonIsAdorable
	writetext Text_GearIsImpressive
	waitbutton
	closetext
	end

.MonIsAdorable:
	writetext Text_YourMonIsAdorable
	waitbutton
	closetext
	end

.CallMom:
	writetext Text_CallMomOnGear
	waitbutton
	closetext
	end

SilentTownFisherScript:
	jumptextfaceplayer Text_OakDiscoveredNewMon

SilentTownSign:
	jumptext SilentTownSignText

SilentTownPlayersHouseSign:
	jumptext SilentTownPlayersHouseSignText

SilentTownOaksLabSign:
	jumptext SilentTownOaksLabSignText

SilentTownRivalsHouseSign:
	jumptext SilentTownRivalsHouseSignText
	
BlueTakesPlayerToLab1:
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step UP
	step_end
	
BlueTakesPlayerToLab2:
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step DOWN
	step DOWN
	step DOWN
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step UP
	step_end
	
BlueStopsPlayer1:
	step UP
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step_end

BlueStopsPlayer2:
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step_end

RivalMeetsPlayer:
	step UP
	step UP
	step UP
	step UP
	step UP
	step LEFT
	step_end
	
RivalGoesToLab:
	step RIGHT
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end
	
PlayerEntersLab:
	step UP
	step_end
	
Text_Study101:
	text "…And if we spend"
	line "just a few more"
	para "days observing the"
	line "#MON living in"
	para "ROUTE 101…"
	
	para "…"
	para "He seems to be"
	line "completely"
	cont "occupied…"
	
	done

Text_GearIsImpressive:
	text "Wow, your #GEAR"
	line "is impressive!"

	para "Did your mom get"
	line "it for you?"
	done

Text_WaitPlayer:
	text "Wait! Stop!"
	done

Text_ItsDangerousToGoAlone:
	text "What do you think"
	line "you're doing?"
	
	para "It's dangerous to"
	line "go out without a"
	cont "#MON!"

	para "Wild #MON"
	line "might attack you!"
	
	para "You need your own"
	line "#MON for"
	cont "protection!"
	
	para "Oh?"
	
	para "Are you perhaps…?"
	
	para "…Come with me!"
	done

Text_YourMonIsAdorable:
	text "Oh! Your #MON"
	line "is adorable!"
	cont "I wish I had one!"
	done

Text_CallMomOnGear:
	text "Call your mom on"
	line "your #GEAR to"

	para "let her know how"
	line "you're doing."
	done

Text_OakDiscoveredNewMon:
	text "Yo, <PLAYER>!"

	para "I hear PROF.OAK"
	line "discovered some"
	cont "new #MON."
	done

SilentTownRivalText1:
	text "<RIVAL>: Hey,"
	line "<PLAYER>!"
	para "There's something"
	line "I gotta brag to"
	cont "you about!"
	
	para "I got an email"
	line "from PROF.OAK!"

	para "Yeah, the famous"
	line "one!"
	done

SilentTownRivalText2:
	text "..."
	para "You got one too?!"
	para "Man, that's no"
	line "fun!"
	
	para "Hmph!"
	
	para "Well, I'm off to"
	line "OAK's!"
	cont "See you there!"
	done

SilentTownSignText:
	text "Forever Peaceful"
	line "SILENT TOWN"
	done

SilentTownPlayersHouseSignText:
	text "<PLAYER>'s House"
	done

SilentTownOaksLabSignText:
	text "OAK #MON LAB"
	done

SilentTownRivalsHouseSignText:
	text "<RIVAL>'s House"
	done

SilentTown_MapEvents:
	db 0, 0 ; filler

	db 7 ; warp events
	warp_event 14, 19, KANTO_REGION, 1 ; OAKS_LAB_ENTRANCE
	warp_event  5, 12, PLAYERS_HOUSE_1F, 1
	warp_event 13, 12, SILENT_POKECENTER_1F, 1
	warp_event  3, 20, SILENT_HOUSE, 1
	warp_event 15, 19, OAKS_LAB_ENTRANCE, 2
	warp_event  9, 18, AMAMI_POKECENTER_1F, 1
	warp_event  9,  5, VICTORY_ROAD_GATE, 1


	db 3 ; coord events
	coord_event  1, 16, SCENE_TEACHER_STOPS, BlueStopsYouScene1
	coord_event  1, 17, SCENE_TEACHER_STOPS, BlueStopsYouScene2
	coord_event  5, 13, SCENE_DEFAULT, SilentTown_RivalGreets

	db 5 ; bg events
	bg_event 16, 13, BGEVENT_READ, SilentTownSign
	bg_event  8, 12, BGEVENT_READ, SilentTownPlayersHouseSign
	bg_event 10, 19, BGEVENT_READ, SilentTownOaksLabSign
	bg_event  6, 20, BGEVENT_READ, SilentTownRivalsHouseSign
	bg_event 14, 12, BGEVENT_READ, SilentTownPokecenterSign

	db 4 ; object events
	object_event  9, 14, SPRITE_TEACHER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SilentTownTeacherScript, -1
	object_event 12, 21, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1,  0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, SilentTownFisherScript, -1
	object_event  7, 18, SPRITE_SILVER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SilentTownRivalScript, EVENT_RIVAL_SILENT_TOWN
	object_event  7, 17, SPRITE_BLUE, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SilentTownBlueScript, EVENT_BLUE_SILENT_TOWN
