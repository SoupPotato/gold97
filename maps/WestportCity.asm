	const_def 2 ; object constants
	const GOLDENRODCITY_YOUNGSTER1
	const GOLDENRODCITY_COOLTRAINER_F
	const GOLDENRODCITY_ROCKER
	const GOLDENRODCITY_YOUNGSTER2
	const GOLDENRODCITY_LASS
	const GOLDENRODCITY_GRAMPS
	const GOLDENRODCITY_ROCKET1
	const GOLDENRODCITY_ROCKET2
	const GOLDENRODCITY_ROCKET3
	const GOLDENRODCITY_ROCKET4
	const GOLDENRODCITY_ROCKET5
	const GOLDENRODCITY_ROCKET6
	const GOLDENRODCITY_MOVETUTOR
	const GOLDENRODCITY_FAIRY
	const GOLDENRODCITY_ROCKETEXTRA
	const GOLDENRODCITY_SILVER

WestportCity_MapScripts:
	db 0 ; scene scripts

	db 2 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint
	callback MAPCALLBACK_OBJECTS, .MoveTutor

.FlyPoint:
	setflag ENGINE_FLYPOINT_GOLDENROD
	setflag ENGINE_REACHED_GOLDENROD
	return

.MoveTutor:
	checkevent EVENT_BEAT_ELITE_FOUR
	iffalse .MoveTutorDone
	checkitem COIN_CASE
	iffalse .MoveTutorDisappear
	checkcode VAR_WEEKDAY
	ifequal WEDNESDAY, .MoveTutorAppear
	ifequal SATURDAY, .MoveTutorAppear
.MoveTutorDisappear:
	disappear GOLDENRODCITY_MOVETUTOR
	return

.MoveTutorAppear:
	checkflag ENGINE_DAILY_MOVE_TUTOR
	iftrue .MoveTutorDone
	appear GOLDENRODCITY_MOVETUTOR
.MoveTutorDone:
	return

MoveTutorScript:
	faceplayer
	opentext
	writetext UnknownText_0x199042
	yesorno
	iffalse .Refused
	special DisplayCoinCaseBalance
	writetext UnknownText_0x199090
	yesorno
	iffalse .Refused2
	checkcoins 4000
	ifequal HAVE_LESS, .NotEnoughMoney
	writetext UnknownText_0x1990ce
	loadmenu .MoveMenuHeader
	verticalmenu
	closewindow
	ifequal MOVETUTOR_FLAMETHROWER, .Flamethrower
	ifequal MOVETUTOR_THUNDERBOLT, .Thunderbolt
	ifequal MOVETUTOR_ICE_BEAM, .IceBeam
	jump .Incompatible

.Flamethrower:
	writebyte MOVETUTOR_FLAMETHROWER
	writetext UnknownText_0x1991cf
	special MoveTutor
	ifequal FALSE, .TeachMove
	jump .Incompatible

.Thunderbolt:
	writebyte MOVETUTOR_THUNDERBOLT
	writetext UnknownText_0x1991cf
	special MoveTutor
	ifequal FALSE, .TeachMove
	jump .Incompatible

.IceBeam:
	writebyte MOVETUTOR_ICE_BEAM
	writetext UnknownText_0x1991cf
	special MoveTutor
	ifequal FALSE, .TeachMove
	jump .Incompatible

.MoveMenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 2, 15, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 4 ; items
	db "FLAMETHROWER@"
	db "THUNDERBOLT@"
	db "ICE BEAM@"
	db "CANCEL@"

.Refused:
	writetext UnknownText_0x1990b4
	waitbutton
	closetext
	end

.Refused2:
	writetext UnknownText_0x199107
	waitbutton
	closetext
	end

.TeachMove:
	writetext UnknownText_0x19913a
	buttonsound
	takecoins 4000
	waitsfx
	playsound SFX_TRANSACTION
	special DisplayCoinCaseBalance
	writetext UnknownText_0x19918b
	waitbutton
	closetext
	checkcode VAR_FACING
	ifequal LEFT, .WalkAroundPlayer
	applymovement GOLDENRODCITY_MOVETUTOR, MovementData_0x198a5f
	jump .GoInside

.WalkAroundPlayer:
	applymovement GOLDENRODCITY_MOVETUTOR, MovementData_0x198a63
.GoInside:
	playsound SFX_ENTER_DOOR
	disappear GOLDENRODCITY_MOVETUTOR
	clearevent EVENT_GOLDENROD_GAME_CORNER_MOVE_TUTOR
	setflag ENGINE_DAILY_MOVE_TUTOR
	waitsfx
	end

.Incompatible:
	writetext UnknownText_0x1991a4
	waitbutton
	closetext
	end

.NotEnoughMoney:
	writetext UnknownText_0x1991ac
	waitbutton
	closetext
	end


WestportCityYoungster1Script:
	jumptextfaceplayer WestportCityYoungster1Text

WestportCityCooltrainerF1Script:
	faceplayer
	opentext
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .ClearedRadioTower
	writetext WestportCityCooltrainerF1Text
	waitbutton
	closetext
	end

.ClearedRadioTower:
	writetext WestportCityCooltrainerF1Text_ClearedRadioTower
	waitbutton
	closetext
	end

WestportCityCooltrainerF2Script:
	faceplayer
	opentext
	checkflag ENGINE_RADIO_CARD
	iftrue .GotRadioCard
	writetext WestportCityCooltrainerF2Text
	waitbutton
	closetext
	end

.GotRadioCard:
	writetext WestportCityCooltrainerF2Text_GotRadioCard
	waitbutton
	closetext
	end

WestportCityYoungster2Script:
	jumptextfaceplayer WestportCityYoungster2Text

WestportCityLassScript:
	jumptextfaceplayer WestportCityLassText

WestportCityGrampsScript:
	jumptextfaceplayer WestportCityGrampsText

WestportCityRocketScoutScript:
	opentext
	writetext WestportCityRocketScoutText1
	buttonsound
	faceplayer
	writetext WestportCityRocketScoutText2
	waitbutton
	closetext
	end

WestportCityRocket1Script:
	jumptextfaceplayer WestportCityRocket1Text

WestportCityRocket2Script:
	jumptextfaceplayer WestportCityRocket2Text

WestportCityRocket3Script:
	jumptextfaceplayer WestportCityRocket3Text

WestportCityRocket4Script:
	jumptextfaceplayer WestportCityRocket4Text

WestportCityRocket5Script:
	jumptextfaceplayer WestportCityRocket5Text

WestportCityRocket6Script:
	jumptextfaceplayer WestportCityRocket6Text


WestportCityRadioTowerSign:
	jumptext WestportCityRadioTowerSignText

GoldenrodDeptStoreSign:
	jumptext GoldenrodDeptStoreSignText

GoldenrodGymSign:
	jumptext GoldenrodGymSignText

WestportCitySign:
	jumptext WestportCitySignText


WestportCityNameRaterSign:
;	setevent EVENT_BEAT_ELITE_FOUR
;	giveitem S_S_TICKET
;	setevent EVENT_FAST_SHIP_FIRST_TIME
;	setevent EVENT_OLIVINE_PORT_SPRITES_BEFORE_HALL_OF_FAME
;	clearevent EVENT_OLIVINE_PORT_SPRITES_AFTER_HALL_OF_FAME
	jumptext WestportCityNameRaterSignText


WestportCityPokecenterSign:
	jumpstd pokecentersign
	
WestportCityDocksSign:
	jumptext WestportCityDocksSignText
	
GoldenrodUndergroundSign:
	jumptext GoldenrodUndergroundSignText
	
WestportCityMonScript:
	faceplayer
	opentext
	writetext WestportCityMonText
	cry BLISSEY
	waitbutton
	closetext
	end
	
RivalAfterRadioTower1:
	playmusic MUSIC_RIVAL_ENCOUNTER
	moveobject GOLDENRODCITY_SILVER, 31, 13
	appear GOLDENRODCITY_SILVER
	applymovement GOLDENRODCITY_SILVER, GoldenrodSilverWalksUp1
	jump RivalAfterRadioTowerMain
	end
	
RivalAfterRadioTower2:
	playmusic MUSIC_RIVAL_ENCOUNTER
	moveobject GOLDENRODCITY_SILVER, 31, 13
	appear GOLDENRODCITY_SILVER
	applymovement GOLDENRODCITY_SILVER, GoldenrodSilverWalksUp2
	jump RivalAfterRadioTowerMain
	end
	
RivalAfterRadioTowerMain:
	opentext
	writetext SilverHasItFiguredOut
	waitbutton
	closetext
	showemote EMOTE_SHOCK, GOLDENRODCITY_SILVER, 15
	opentext
	writetext SilverHasItFiguredOut2
	waitbutton
	closetext
	applymovement GOLDENRODCITY_SILVER, GoldenrodSilverGetsOutOfHere
	setscene SCENE_DEFAULT
	special RestartMapMusic
	disappear GOLDENRODCITY_SILVER
	end

GoldenrodSilverGetsOutOfHere:
	step DOWN
	step DOWN
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step_end
	
GoldenrodSilverWalksUp1:
	step UP
;	step UP
	step UP
	step UP
	step UP
	step_end
	
GoldenrodSilverWalksUp2:
	step UP
;	step UP
	step UP
	step UP
	step RIGHT
	step UP
	step_end

MovementData_0x198a5f:
	step RIGHT
	step RIGHT
	step UP
	step_end

MovementData_0x198a63:
	step DOWN
	step RIGHT
	step RIGHT
	step UP
	step UP
	step_end
	
SilverHasItFiguredOut:
	text "<RIVAL>:<PLAY_G>!"
	para "I think I have it"
	line "figured out!"
	para "TEAM ROCKET is"
	line "going to use the"
	para "RADIO TOWER as a"
	line "replacement for"
	para "the antenna we had"
	line "destroyed!"
	done
	
SilverHasItFiguredOut2:
	text "What?"
	
	para "I was right!"
	
	para "But you already"
	line "got rid of them?"
	
	para "Man, I missed out"
	line "on all the fun!"
	
	para "Well, I guess I"
	line "had better get"
	cont "back to training!"
	
	para "I only need one"
	line "more GYM BADGE"
	cont "before I can climb"
	cont "MT.FUJI and take"
	cont "on the LEAGUE!"
	
	para "Bet I can beat you"
	line "to it!"
	
	para "One more thing..."
	
	para "There is an old"
	line "sea captain in"
	cont "ALLOY CITY."
	
	para "He's got some"
	line "relly interesting"
	cont "stories!"
	
	para "Maybe you should"
	line "hear one of them."
	
	para "Well, see you"
	line "around!"
	done
	
WestportCityMonText:
	text "BLISSEY:"
	line "BIBI!"
	done
	
WestportCityDocksSignText:
	text "WESTPORT DOCKS"
	para "Ferries to TEKNOS"
	line "CITY daily."
	done


WestportCityYoungster1Text:
	text "I know there's a"
	line "new BIKE SHOP, but"

	para "I can't find it"
	line "anywhere."
	done

WestportCityCooltrainerF1Text:
	text "The man in this"
	line "house here will"
	para "rate the nicknames"
	line "of your #MON!"
	para "He'll even let you"
	line "rename them."
	para "But know that you"
	line "cannot rename any"
	para "#MON you got"
	line "in trades."
	done

WestportCityCooltrainerF1Text_ClearedRadioTower:
	text "The man in this"
	line "house here will"
	para "rate the nicknames"
	line "of your #MON!"
	para "He'll even let you"
	line "rename them."
	para "But know that you"
	line "cannot rename any"
	para "#MON you got"
	line "in trades."
	done

WestportCityCooltrainerF2Text:
	text "The RADIO TOWER in"
	line "WESTPORT CITY is"
	cont "a landmark."

	para "They're running a"
	line "promotional cam- "
	cont "paign right now."

	para "They'll modify"
	line "your #GEAR,"

	para "so it can also"
	line "serve as a radio."
	done

WestportCityCooltrainerF2Text_GotRadioCard:
	text "Oh, your #GEAR"
	line "works as a radio!"
	done

WestportCityYoungster2Text:
	text "E-he-he-he…"

	para "I got in trouble"
	line "for playing in the"

	para "basement of the"
	line "DEPT.STORE."
	done

WestportCityLassText:
	text "My BLISSEY is able"
	line "to heal #MON"
	cont "using a move!"
	para "Some #MON have"
	line "special moves they"
	para "can use outside of"
	line "battle."
	done

WestportCityGrampsText:
	text "Whew! This is one"
	line "big town. I don't"

	para "know where any-"
	line "thing is."
	done

WestportCityRocketScoutText1:
	text "So this is the"
	line "RADIO TOWER…"
	done

WestportCityRocketScoutText2:
	text "What do you want,"
	line "you pest? Scram!"
	done

WestportCityRocket1Text:
	text "Stay out of the"
	line "way! Beat it!"
	done

WestportCityRocket2Text:
	text "Take over the"
	line "RADIO TOWER…"

	para "What? It's none of"
	line "your business!"
	done

WestportCityRocket3Text:
	text "#MON? They're"
	line "nothing more than"

	para "tools for making"
	line "money!"
	done

WestportCityRocket4Text:
	text "Our dream will"
	line "soon come true…"

	para "It was such a long"
	line "struggle…"
	done

WestportCityRocket5Text:
	text "Hey, brat! You"
	line "don't belong here!"
	cont "Get lost!"
	done

WestportCityRocket6Text:
	text "Come taste the"
	line "true terror of"
	cont "TEAM ROCKET!"
	done


WestportCityRadioTowerSignText:
	text "WESTPORT CITY"
	line "RADIO TOWER"
	para "JOPM HQ"
	done

GoldenrodDeptStoreSignText:
	text "Full Selection of"
	line "#MON Goods!"

	para "WESTPORT CITY"
	line "DEPT.STORE"
	done

GoldenrodGymSignText:
	text "WESTPORT CITY"
	line "#MON GYM"
	cont "LEADER: BUGSY"

	para "The high-class"
	line "master of insects!"
	done

WestportCitySignText:
	text "WESTPORT CITY"

	para "NIHON's shining"
	line "coastal metropolis"
	done


WestportCityNameRaterSignText:
	text "NAME RATER"

	para "Get Your #MON"
	line "Nicknames Rated"
	done

GoldenrodUndergroundSignText:
	text "WESTPORT"
	line "UNDERGROUND ENTRY"
	done

UnknownText_0x199042:
	text "I can teach your"
	line "#MON amazing"

	para "moves if you'd"
	line "like."

	para "Should I teach a"
	line "new move?"
	done

UnknownText_0x199090:
	text "It will cost you"
	line "4000 coins. Okay?"
	done

UnknownText_0x1990b4:
	text "Aww… But they're"
	line "amazing…"
	done

UnknownText_0x1990ce:
	text "Wahahah! You won't"
	line "regret it!"

	para "Which move should"
	line "I teach?"
	done

UnknownText_0x199107:
	text "Hm, too bad. I'll"
	line "have to get some"
	cont "cash from home…"
	done

UnknownText_0x19913a:
	text "If you understand"
	line "what's so amazing"

	para "about this move,"
	line "you've made it as"
	cont "a trainer."
	done

UnknownText_0x19918b:
	text "Wahahah!"
	line "Farewell, kid!"
	done

UnknownText_0x1991a4:
	text "B-but…"
	done

UnknownText_0x1991ac:
	text "…You don't have"
	line "enough coins here…"
	done

UnknownText_0x1991cf:
	text_start
	done

WestportCity_MapEvents:
	db 0, 0 ; filler

	db 16 ; warp events
	warp_event 14, 19, WESTPORT_GYM, 1
	warp_event 32, 19, WESTPORT_HAPPINESS_RATER, 1
	warp_event 35, 15, ROUTE_102_WESTPORT_GATE, 1
	warp_event 26, 19, WESTPORT_NAME_RATER, 1
	warp_event 13,  5, WESTPORT_DEPT_STORE_1F, 1
	warp_event 31,  7, RADIO_TOWER_1F, 1
	warp_event 22,  5, ROUTE_103_WESTPORT_GATE, 3
	warp_event 25, 14, WESTPORT_POKECENTER_1F, 1
	warp_event 14,  5, WESTPORT_DEPT_STORE_1F, 2
	warp_event 23,  5, ROUTE_103_WESTPORT_GATE, 4
	warp_event 32,  7, RADIO_TOWER_1F, 2
	warp_event 15, 19, WESTPORT_GYM, 2
	warp_event 18, 12, WESTPORT_PP_SPEECH_HOUSE, 1
	warp_event  4,  8, WESTPORT_PORT_PASSAGE, 1
	warp_event  4,  9, WESTPORT_PORT_PASSAGE, 2
	warp_event 11, 14, WESTPORT_UNDERGROUND, 12

	db 2 ; coord events
	coord_event 31,  8, SCENE_GOLDENROD_CITY_RIVAL, RivalAfterRadioTower1
	coord_event 32,  8, SCENE_GOLDENROD_CITY_RIVAL, RivalAfterRadioTower2

	db 8 ; bg events

	bg_event 28,  9, BGEVENT_READ, WestportCityRadioTowerSign
	bg_event 16,  7, BGEVENT_READ, GoldenrodDeptStoreSign
	bg_event 18, 20, BGEVENT_READ, GoldenrodGymSign
	bg_event 32, 12, BGEVENT_READ, WestportCitySign
	bg_event 24, 20, BGEVENT_READ, WestportCityNameRaterSign
	bg_event 26, 14, BGEVENT_UP, WestportCityPokecenterSign
	bg_event 10,  7, BGEVENT_READ, WestportCityDocksSign
	bg_event 14, 14, BGEVENT_READ, GoldenrodUndergroundSign

	db 16 ; object events
	object_event 21, 21, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WestportCityYoungster1Script, EVENT_GOLDENROD_CITY_CIVILIANS
	object_event 23, 16, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, WestportCityCooltrainerF1Script, EVENT_GOLDENROD_CITY_CIVILIANS
	object_event 27, 10, SPRITE_ROCKER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, WestportCityCooltrainerF2Script, EVENT_GOLDENROD_CITY_CIVILIANS
	object_event 12,  7, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, WestportCityYoungster2Script, EVENT_GOLDENROD_CITY_CIVILIANS
	object_event 29, 14, SPRITE_LASS, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, WestportCityLassScript, EVENT_GOLDENROD_CITY_CIVILIANS
	object_event 21,  8, SPRITE_GRAMPS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WestportCityGrampsScript, EVENT_GOLDENROD_CITY_CIVILIANS
	object_event 13,  6, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WestportCityRocket1Script, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event 26, 20, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WestportCityRocket2Script, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event 14,  6, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WestportCityRocket3Script, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event 14, 20, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WestportCityRocket4Script, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event 15, 20, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WestportCityRocket5Script, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event 32, 20, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WestportCityRocket6Script, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event 15, 22, SPRITE_POKEFAN_M, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, MoveTutorScript, EVENT_GOLDENROD_CITY_MOVE_TUTOR
	object_event 28, 14, SPRITE_FAIRY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, WestportCityMonScript, EVENT_GOLDENROD_CITY_CIVILIANS
	object_event 18, 13, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WestportCityRocket5Script, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event -5, -5, SPRITE_SILVER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
