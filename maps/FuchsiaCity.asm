	const_def 2 ; object constants
	const FUCHSIACITY_ROCKER
	const FUCHSIACITY_POKEFAN_M
	const FUCHSIACITY_TWIN
	const FUCHSIACITY_TEACHER
	const FUCHSIACITY_FRUIT_TREE
	const FUCHSIACITY_MONSTER1
	const FUCHSIACITY_MONSTER2
	const FUCHSIACITY_MONSTER3
	const FUCHSIACITY_BIRD
	const FUCHSIACITY_FAIRY
	const FUCHSIACITY_BLOCKROCKET1
	const FUCHSIACITY_BLOCKROCKET2
	const FUCHSIACITY_BLOCKROCKET3
	const FUCHSIACITY_BLOCKROCKET4
	const FUCHSIACITY_IMPOSTER
	const FUCHSIACITY_HQBLOCKROCKET
	const FUCHSIACITY_NATIONALBLOCKROCKET

FuchsiaCity_MapScripts:
	db 2 ; scene scripts
	scene_script .SceneFuchsiaCityNothing ; SCENE_DEFAULT
	scene_script .SceneFuchsiaCityImposter ;

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint
	
.SceneFuchsiaCityNothing
	end

.SceneFuchsiaCityImposter
	end


.FlyPoint:
	setflag ENGINE_FLYPOINT_FUCHSIA
	return
	
ImposterIntro1:
	showemote EMOTE_SHOCK, PLAYER, 15
	special FadeOutMusic
	pause 5
	jump ImposterSceneScript
	end
	
ImposterIntro2:
	showemote EMOTE_SHOCK, PLAYER, 15
	special FadeOutMusic
	pause 5
	applymovement PLAYER, ImposterSceneMove1
	jump ImposterSceneScript
	end
	
ImposterSceneScript:
	moveobject FUCHSIACITY_TEACHER, 27, 23
	moveobject FUCHSIACITY_TWIN, 29, 23
	moveobject FUCHSIACITY_ROCKER, 28, 24
	moveobject FUCHSIACITY_POKEFAN_M, 27, 25
	appear FUCHSIACITY_POKEFAN_M
	appear FUCHSIACITY_ROCKER
	appear FUCHSIACITY_TWIN
	applymovement PLAYER, ImposterSceneMove2
	turnobject FUCHSIACITY_POKEFAN_M, RIGHT
	applymovement PLAYER, ImposterSceneMove2_5
	turnobject FUCHSIACITY_TEACHER, LEFT
	applymovement PLAYER, ImposterSceneMove2_7
	showemote EMOTE_SHOCK, FUCHSIACITY_TWIN, 25
	turnobject FUCHSIACITY_TEACHER, UP
	pause 3
	turnobject FUCHSIACITY_ROCKER, UP
	pause 3
	turnobject FUCHSIACITY_POKEFAN_M, UP
	pause 30
	opentext
	writetext ImposterText1
	waitbutton
	closetext
	moveobject FUCHSIACITY_IMPOSTER, 29, 19
	appear FUCHSIACITY_IMPOSTER
	applymovement FUCHSIACITY_IMPOSTER, ImposterWalksDown
	pause 10
	opentext
	writetext ImposterText2
	waitbutton
	closetext
	pause 3
	showemote EMOTE_SHOCK, FUCHSIACITY_ROCKER, 5
	pause 3
	showemote EMOTE_SHOCK, FUCHSIACITY_TWIN, 5
	pause 3
	showemote EMOTE_SHOCK, FUCHSIACITY_TEACHER, 5
	pause 3
	showemote EMOTE_SHOCK, FUCHSIACITY_POKEFAN_M, 5
	pause 15
	opentext
	writetext ImposterText3
	waitbutton
	closetext
	pause 10
	applymovement FUCHSIACITY_IMPOSTER, ImposterWalksUp
	disappear FUCHSIACITY_IMPOSTER
	setevent EVENT_ILEX_FOREST_APPRENTICE
	setscene SCENE_DEFAULT
	playmusic MUSIC_CELADON_CITY
	end


FuchsiaCityRocker:
	faceplayer
	opentext
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .RockerRocketsGone
	checkevent EVENT_ILEX_FOREST_APPRENTICE
	iftrue .RockerAfterImposter
	writetext FuchsiaCityRockerText
	waitbutton
	closetext
	end
	
.RockerRocketsGone
	writetext FuchsiaCityRockerAllGoodText
	waitbutton
	closetext
	end
	
.RockerAfterImposter
	writetext FuchsiaCityRockerImposterText
	waitbutton
	closetext
	end

FuchsiaCityPokefanM:
	faceplayer
	opentext
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .PokefanRocketsGone
	checkevent EVENT_ILEX_FOREST_APPRENTICE
	iftrue .PokefanAfterImposter
	writetext FuchsiaCityPokefanMText
	waitbutton
	closetext
	end
	
.PokefanRocketsGone
	writetext FuchsiaCityPokefanAllGoodText
	waitbutton
	closetext
	end
	
.PokefanAfterImposter
	writetext FuchsiaCityPokefanImposterText
	waitbutton
	closetext
	end


FuchsiaCityTwin:
	faceplayer
	opentext
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .TwinRocketsGone
	checkevent EVENT_ILEX_FOREST_APPRENTICE
	iftrue .TwinAfterImposter
	writetext FuchsiaCityTwinText
	waitbutton
	closetext
	end
	
.TwinRocketsGone
	writetext FuchsiaCityTwinAllGoodText
	waitbutton
	closetext
	end
	
.TwinAfterImposter
	writetext FuchsiaCityTwinImposterText
	waitbutton
	closetext
	end
	
FuchsiaCityTeacher:
	faceplayer
	opentext
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .TeacherRocketsGone
	checkevent EVENT_ILEX_FOREST_APPRENTICE
	iftrue .TeacherAfterImposter
	writetext FuchsiaCityTeacherText
	waitbutton
	closetext
	end
	
.TeacherRocketsGone
	writetext FuchsiaCityTeacherAllGoodText
	waitbutton
	closetext
	end
	
.TeacherAfterImposter
	writetext FuchsiaCityTeacherImposterText
	waitbutton
	closetext
	end
	
FuchsiaCityBlockRocket1:
	faceplayer
	opentext
	checkevent EVENT_BLACKTHORN_CITY_SUPER_NERD_DOES_NOT_BLOCK_GYM
	iftrue .BlockRocket1AfterBase
	checkevent EVENT_ILEX_FOREST_APPRENTICE
	iftrue .BlockRocket1AfterImposter
	writetext BlockRocket1BeforeText
	waitbutton
	closetext
	end
	
.BlockRocket1AfterBase
	writetext BlockRocket1AfterBaseText
	waitbutton
	closetext
	end

.BlockRocket1AfterImposter
	writetext BlockRocket1AfterText
	waitbutton
	closetext
	end
	
FuchsiaCityBlockRocket2:
	faceplayer
	opentext
	checkevent EVENT_BLACKTHORN_CITY_SUPER_NERD_DOES_NOT_BLOCK_GYM
	iftrue .BlockRocket2AfterBase
	checkevent EVENT_ILEX_FOREST_APPRENTICE
	iftrue .BlockRocket2AfterImposter
	writetext BlockRocket2BeforeText
	waitbutton
	closetext
	end
	
.BlockRocket2AfterBase
	writetext BlockRocket2AfterBaseText
	waitbutton
	closetext
	end

	
.BlockRocket2AfterImposter
	writetext BlockRocket2AfterText
	waitbutton
	closetext
	end
	
FuchsiaCityBlockRocket3:
	faceplayer
	opentext
	checkevent EVENT_BLACKTHORN_CITY_SUPER_NERD_DOES_NOT_BLOCK_GYM
	iftrue .BlockRocket3AfterBase
	checkevent EVENT_ILEX_FOREST_APPRENTICE
	iftrue .BlockRocket3AfterImposter
	writetext BlockRocket3BeforeText
	waitbutton
	closetext
	end
	
.BlockRocket3AfterBase
	writetext BlockRocket3AfterBaseText
	waitbutton
	closetext
	end

	
.BlockRocket3AfterImposter
	writetext BlockRocket3AfterText
	waitbutton
	closetext
	end
	
FuchsiaCityBlockRocket4:
	faceplayer
	opentext
	checkevent EVENT_BLACKTHORN_CITY_SUPER_NERD_DOES_NOT_BLOCK_GYM
	iftrue .BlockRocket4AfterBase
	checkevent EVENT_ILEX_FOREST_APPRENTICE
	iftrue .BlockRocket4AfterImposter
	writetext BlockRocket4BeforeText
	waitbutton
	closetext
	end
	
.BlockRocket4AfterBase
	writetext BlockRocket4AfterBaseText
	waitbutton
	closetext
	end

	
.BlockRocket4AfterImposter
	writetext BlockRocket4AfterText
	waitbutton
	closetext
	end
	

FuchsiaCitySign:
	jumptext FuchsiaCitySignText

FuchsiaGymSign:
	jumptext FuchsiaGymSignText

SafariZoneOfficeSign:
	jumptext SafariZoneOfficeSignText

WardensHomeSign:
	jumptext WardensHomeSignText

SafariZoneClosedSign:
	jumptext SafariZoneClosedSignText

SafariZoneClefairySign:
	jumptext SafariZoneClefairySignText
	
SafariZoneAmpharosSign:
	jumptext SafariZoneAmpharosSignText
	
SafariZoneSkarmorySign:
	jumptext SafariZoneSkarmorySignText
	
SafariZoneGolduckSign:
	jumptext SafariZoneGolduckSignText

NoLitteringSign:
	jumptext NoLitteringSignText

FuchsiaCityPokecenterSign:
;	setevent EVENT_ILEX_FOREST_FARFETCHD
;	clearevent EVENT_ILEX_FOREST_APPRENTICE
;	clearevent EVENT_ILEX_FOREST_LASS
	jumpstd pokecentersign

FuchsiaCityMartSign:
	jumpstd martsign

FuchsiaCityFruitTree:
	fruittree FRUITTREE_FUCHSIA_CITY
	
FuchsiaCityHQBlockRocket:
	jumptextfaceplayer FuchsiaCityHQBlockRocketText
	
FuchsiaCityNationalBlockRocket:
	faceplayer
	opentext
	checkevent EVENT_BLACKTHORN_CITY_SUPER_NERD_DOES_NOT_BLOCK_GYM
	iftrue .NatioanlBlockRocketAfterBase
	writetext FuchsiaCityNationalBlockRocketText
	waitbutton
	closetext
	end

.NatioanlBlockRocketAfterBase
	writetext FuchsiaCityNationalBlockRocketAfterBaseText
	waitbutton
	closetext
	end

ImposterSceneMove1:
	step LEFT
	step_end
	
ImposterSceneMove2:
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step UP
	step UP
	step_end
	
ImposterSceneMove2_5:
	step UP
	step UP
	step_end
	
ImposterSceneMove2_7:
	step UP
	step UP
	step UP
	step UP
	step_end
	
ImposterWalksDown:
	step DOWN
	step DOWN
	step_end
	
ImposterWalksUp:
	step LEFT
	step LEFT
	step LEFT
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step LEFT
	step LEFT
	step_end
	
FuchsiaCityNationalBlockRocketAfterBaseText:
	text "I always feel left"
	line "out…"
	para "No one tells me"
	line "what's going on"
	cont "over here…"
	done
	
BlockRocket4AfterBaseText:
	text "Everyone else is"
	line "gone?"
	para "You didn't have"
	line "anything to do"
	para "with this, did"
	line "you?"
	done

BlockRocket3AfterBaseText:
	text "Rumor is that the"
	line "gang is over in"
	cont "WEST CITY."
	para "What does that"
	line "mean, though?"
	para "What happened to"
	line "our base?"
	done
	
BlockRocket2AfterBaseText:
	text "Is that right?"
	para "I'm hearing the"
	line "base is empty."
	para "Why are we still"
	line "here, then?"
	done
	
BlockRocket1AfterBaseText:
	text "Is the base empty?"
	para "Where did everyone"
	line "go?"
	done
	
FuchsiaCityHQBlockRocketText:
	text "All of us hate"
	line "guarding the"
	para "entrance to this"
	line "building."
	para "My shift is almost"
	line "over, though."
	para "I hope my"
	line "replacement"
	para "actually shows up"
	line "this time…"
	done
	
FuchsiaCityNationalBlockRocketText:
	text "No one needs to"
	line "enter the NATIONAL"
	cont "PARK right now!"
	para "Not while #MON"
	line "are getting sick."
	para "I care about their"
	line "health, see?"
	done
	
BlockRocket1BeforeText:
	text "Oh boy!"
	para "I can't believe"
	line "how well this plan"
	cont "is going!"
	done
	
BlockRocket1AfterText:
	text "Hey, kid!"
	para "Wasn't that a"
	line "great speech by"
	para "the real, actual"
	line "PROF.OAK?"
	done
	
BlockRocket2BeforeText:
	text "You don't want"
	line "to leave town."
	para "We've got a"
	line "special guest"
	cont "coming soon!"
	done
	
BlockRocket2AfterText:
	text "Our research will"
	line "benefit the world!"
	done
	
BlockRocket3BeforeText:
	text "There's nothing"
	line "south of here!"
	para "You should just"
	line "stay in town!"
	done
	
BlockRocket3AfterText:
	text "The people love"
	line "PROF.OAK!"
	done
	
BlockRocket4BeforeText:
	text "It's almost time"
	line "for the world to"
	cont "hear our plan!"
	done
	
BlockRocket4AfterText:
	text "We're doing great"
	line "things, didn't you"
	cont "hear?"
	done
	
ImposterText1:
	text "Citizens of STAND"
	line "CITY!"
	done
	
ImposterText2:
	text "It is I, the"
	line "world-renowned"
	cont "PROF.OAK!"
	para "I have some"
	line "exciting news"
	para "about a break-"
	line "through in #MON"
	cont "research!"
	para "I have partnered"
	line "with TEAM ROCKET"
	para "to bring to you"
	line "this new"
	cont "technology!"
	done
	
ImposterText3:
	text "Do not be alarmed!"
	para "TEAM ROCKET is"
	line "doing great work"
	para "in developing a"
	line "high-powered radio"
	para "signal that is"
	line "able to read the"
	para "thoughts of"
	line "#MON!"
	para "And this signal is"
	line "being developed"
	para "right here in"
	line "STAND CITY!"
	para "Though the signal"
	line "might have the"
	para "effect of making"
	line "#MON that are"
	para "exposed to it feel"
	line "unwell…"
	para "…"
	para "But just ignore"
	line "that!"
	para "They'll be fine!"
	para "The results of"
	line "this research will"
	para "allow us a greater"
	line "understanding of"
	para "#MON than ever"
	line "before!"
	para "And you can trust"
	line "me, because as you"
	para "can see, I am"
	line "PROF.OAK."
	para "That is all!"
	done

FuchsiaCityRockerText:
	text "The #MON that"
	line "usually are in the"
	para "ZOO over there"
	line "aren't feeling"
	cont "well."
	para "STAND CITY park"
	line "officials are"
	para "keeping them at"
	line "their park #MON"
	cont "CENTER."
	done
	
FuchsiaCityRockerAllGoodText:
	text "That wasn't the"
	line "real PROF.OAK?"
	para "That's crazy!"
	para "I'm so glad the"
	line "#MON are doing"
	cont "better now."
	done
	
FuchsiaCityRockerImposterText:
	text "TEAM ROCKET is"
	line "behind the #MON"
	cont "not feeling well?"
	para "But PROF.OAK tells"
	line "me that they'll be"
	para "okay and it's a"
	line "part of important"
	cont "research…"
	para "And I trust him."
	done

FuchsiaCityPokefanMText:
	text "I'm disappointed"
	line "the #MON aren't"
	cont "outside."
	para "But it's more"
	line "important that"
	cont "they get well."
	done
	
FuchsiaCityPokefanImposterText:
	text "PROF.OAK is"
	line "responsible for"
	para "the #MON not"
	line "feeling well?"
	para "He must have a"
	line "good reason…"
	done
	
FuchsiaCityPokefanAllGoodText:
	text "I'm so glad all of"
	line "the #MON are"
	cont "well again!"
	done

FuchsiaCityTwinText:
	text "The STAND CITY ZOO"
	line "is closed…"
	
	para "It's sad,"
	line "considering it's"
	para "STAND CITY's main"
	line "attraction."
	
	para "I hope the #MON"
	line "are okay."
	done
	
FuchsiaCityTwinImposterText:
	text "TEAM ROCKET is"
	line "back?"
	para "And with PROF.OAK?"
	para "This can't be"
	line "right…"
	done
	
FuchsiaCityTwinAllGoodText:
	text "Yay! The ZOO is"
	line "open again!"
	done

FuchsiaCityTeacherText:
	text "What are all of"
	line "these TEAM ROCKET"
	para "members doing"
	line "here?"
	para "This can't be"
	line "good!"
	done
	
FuchsiaCityTeacherImposterText:
	text "Something didn't"
	line "seem right about"
	cont "PROF.OAK…"
	done

FuchsiaCityTeacherAllGoodText:
	text "I'm so glad things"
	line "are normal again."
	done

FuchsiaCitySignText:
	text "STAND CITY"

	para "A utopia for"
	line "people and #MON"
	cont "alike"
	done

FuchsiaGymSignText:
	text "STAND CITY"
	line "#MON GYM"
	cont "LEADER: OKERA"

	para "The Kid who"
	line "thrives in the"
	cont "dark"
	done

SafariZoneOfficeSignText:
	text "There's a notice"
	line "here…"

	para "SAFARI ZONE OFFICE"
	line "is closed until"
	cont "further notice."
	done

WardensHomeSignText:
	text "STAND CITY ZOO"
	line "Medical Center"
	done

SafariZoneClosedSignText:
	text "#MON:"
	line "KANGASKHAN"
	para "To avoid"
	line "crushing the"
	para "baby it carries in"
	line "its pouch, it"
	para "always sleeps"
	line "standing up."
	done

SafariZoneClefairySignText:
	text "#MON:"
	line "CLEFAIRY"
	para "Though rarely"
	line "seen, it becomes"
	para "easier to spot,"
	line "for some reason,"
	para "on the night of a "
	line "full moon."
	done
	
SafariZoneAmpharosSignText:
	text "#MON:"
	line "AMPHAROS"
	para "When it gets dark,"
	line "the light from its"
	para "bright, shiny tail"
	line "can be seen from"
	para "far away on the"
	line "ocean's surface."
	done
	
SafariZoneSkarmorySignText:
	text "#MON:"
	line "SKARMORY"
	para "The feathers that"
	line "it sheds are very"
	para "sharp. It is said"
	line "that people once"
	para "used the feathers"
	line "as swords."
	done
	
SafariZoneGolduckSignText:
	text "#MON:"
	line "GOLDUCK"
	para "It swims grace-"
	line "fully along on the"
	para "quiet, slow-moving"
	line "rivers and lakes"
	para "of which it is so"
	line "fond."
	done

NoLitteringSignText:
	text "STAND CITY ZOO"
	line "Main Office"
	done

FuchsiaCity_MapEvents:
	db 0, 0 ; filler

	db 13 ; warp events
	warp_event 35, 26, FUCHSIA_MART, 1
	warp_event 16, 21, SAFARI_ZONE_MAIN_OFFICE, 1
	warp_event 34, 31, CIANWOOD_GYM, 1
	warp_event 26, 29, BILLS_BROTHERS_HOUSE, 1
	warp_event 33, 20, FUCHSIA_POKECENTER_1F, 1
	warp_event 17, 31, SAFARI_ZONE_WARDENS_HOME, 1
	warp_event  1,  0, SAFARI_ZONE_FUCHSIA_GATE_BETA, 3 ; inaccessible
	warp_event 30, 13, ROUTE_36_RUINS_OF_ALPH_GATE, 3
	warp_event 31, 13, ROUTE_36_RUINS_OF_ALPH_GATE, 4
	warp_event  6, 17, ROUTE_36_NATIONAL_PARK_GATE, 4
	warp_event  0,  0, ROUTE_19_FUCHSIA_GATE, 2
	warp_event 35, 31, CIANWOOD_GYM, 2
	warp_event 24, 17, STAND_POKE, 1


	db 2 ; coord events
	coord_event  34, 32, SCENE_FUCHSIA_CITY_IMPOSTER, ImposterIntro1
	coord_event  35, 32, SCENE_FUCHSIA_CITY_IMPOSTER, ImposterIntro2

	db 12 ; bg events
	bg_event 36, 20, BGEVENT_READ, FuchsiaCitySign
	bg_event 32, 35, BGEVENT_READ, FuchsiaGymSign
	bg_event 25, 15, BGEVENT_READ, SafariZoneOfficeSign
	bg_event 24, 20, BGEVENT_READ, WardensHomeSign
	bg_event  8,  8, BGEVENT_READ, SafariZoneClosedSign
	bg_event 18, 21, BGEVENT_READ, NoLitteringSign
	bg_event 34, 20, BGEVENT_READ, FuchsiaCityPokecenterSign
	bg_event 36, 26, BGEVENT_READ, FuchsiaCityMartSign
	bg_event 14,  8, BGEVENT_READ, SafariZoneClefairySign
	bg_event 20, 10, BGEVENT_READ, SafariZoneAmpharosSign
	bg_event 16, 16, BGEVENT_READ, SafariZoneSkarmorySign
	bg_event 10, 20, BGEVENT_READ, SafariZoneGolduckSign

	db 17 ; object events
	object_event 28, 21, SPRITE_ROCKER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, FuchsiaCityRocker, -1
	object_event 14, 10, SPRITE_POKEFAN_M, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, FuchsiaCityPokefanM, -1
	object_event 14, 17, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_UP, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, FuchsiaCityTwin, -1
	object_event 28, 30, SPRITE_TEACHER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, FuchsiaCityTeacher, -1
	object_event 26, 11, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, FuchsiaCityFruitTree, -1
	object_event 20,  8, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_ILEX_FOREST_FARFETCHD
	object_event  7, 21, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_ILEX_FOREST_FARFETCHD
	object_event  7,  6, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_ILEX_FOREST_FARFETCHD
	object_event 15, 14, SPRITE_BIRD, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_ILEX_FOREST_FARFETCHD
	object_event 12,  6, SPRITE_FAIRY, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_ILEX_FOREST_FARFETCHD
	object_event 29, 34, SPRITE_ROCKET, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, FuchsiaCityBlockRocket1, EVENT_CLEARED_RADIO_TOWER
	object_event 28, 34, SPRITE_ROCKET, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, FuchsiaCityBlockRocket2, EVENT_CLEARED_RADIO_TOWER
	object_event 30, 35, SPRITE_ROCKET, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, FuchsiaCityBlockRocket3, EVENT_CLEARED_RADIO_TOWER
	object_event 31, 34, SPRITE_ROCKET, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, FuchsiaCityBlockRocket4, EVENT_CLEARED_RADIO_TOWER
	object_event -5, -5, SPRITE_SURGE, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event 17, 32, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, FuchsiaCityHQBlockRocket, EVENT_BEAT_CHUCK
	object_event  6, 18, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, FuchsiaCityNationalBlockRocket, EVENT_CLEARED_RADIO_TOWER

