	const_def 2 ; object constants
	const ROUTE8_FRUIT_TREE
	const ROUTE8_YOUNGSTER
	const ROUTE8_SCHOOLBOY
	const ROUTE8_LASS
	const ROUTE8_GRAMPS
	const ROUTE8_FISHER
	const ROUTE8_POKEFANM
	const ROUTE8_TWIN

Route120_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_ROUTE8_NOTHING
	scene_script SceneFoundGirlScript ; SCENE_ROUTE8_GIRL
	
	db 0 ; callbacks
	
.DummyScene0:
	end

SceneFoundGirlScript:
	checkevent EVENT_ROUTE8_GIRL_IN_CAVE
	iftrue .SceneRoute120Nothing
	applymovement PLAYER, WalkDown
	turnobject PLAYER, LEFT
	playsound SFX_ENTER_DOOR
	moveobject ROUTE8_TWIN, 9, 5
	appear ROUTE8_TWIN
	showemote EMOTE_SHOCK, ROUTE8_GRAMPS, 15
	applymovement ROUTE8_TWIN, WalkDownGirl
	turnobject ROUTE8_TWIN, LEFT
	applymovement ROUTE8_GRAMPS, WalkUpGramps
	turnobject ROUTE8_GRAMPS, RIGHT
	opentext
	writetext GrampsRelievedText
	waitbutton
	closetext
	opentext
	writetext GirlText
	waitbutton
	closetext
	applymovement ROUTE8_GRAMPS, WalkDownGramps
	turnobject ROUTE8_GRAMPS, RIGHT
	opentext
	writetext GrampsAnnoyedText
	waitbutton
	closetext
	setevent EVENT_ECRUTEAK_CITY_GRAMPS
	setevent EVENT_ROUTE8_GIRL_SAVED
	setevent EVENT_BURNED_TOWER_MORTY
	setevent EVENT_ROUTE8_GIRL_IN_CAVE
	clearevent EVENT_ECRUTEAK_SCARED_LASS
	setmapscene TEKNOS_CITY, SCENE_ECRUTEAK_ROCKET_TAKEOVER
	special FadeOutPalettes
	wait 10
	warpfacing UP, TEKNOS_GRAMPS_ITEMFINDER_HOUSE, 4, 7
	end
	
.SceneRoute120Nothing:
	end
	
TrainerYoungsterJoey:
	trainer YOUNGSTER, JOEY1, EVENT_BEAT_YOUNGSTER_JOEY, YoungsterJoey1SeenText, YoungsterJoey1BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext YoungsterJoey1AfterText
	waitbutton
	closetext
	end

TrainerSchoolboyDudley:
	trainer SCHOOLBOY, DUDLEY, EVENT_BEAT_SCHOOLBOY_DUDLEY, SchoolboyDudleySeenText, SchoolboyDudleyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SchoolboyDudleyAfterBattleText
	waitbutton
	closetext
	end

TrainerLassConnie:
	trainer LASS, CONNIE1, EVENT_BEAT_LASS_CONNIE, LassConnie1SeenText, LassConnie1BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext LassConnie1AfterBattleText
	waitbutton
	closetext
	end
	
Route120GrampsScript:
	faceplayer
	opentext
	writetext Route120GrampsText
	waitbutton
	closetext
	end
	
TrainerFisherTully:
	trainer FISHER, TULLY1, EVENT_BEAT_FISHER_TULLY, FisherTullySeenText, FisherTullyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FisherTullyAfterBattleText
	waitbutton
	closetext
	end
	
TrainerHikerParry:
	trainer HIKER, PARRY, EVENT_BEAT_HIKER_PARRY, HikerParry3SeenText, HikerParry3BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext HikerParryAfterBattleText
	waitbutton
	closetext
	end

Route120UndergroundPathSign:
	jumptext Route120UndergroundPathSignText

Route120FruitTree:
	fruittree FRUITTREE_ROUTE_8
	
Route120ParlyzHeal:
	itemball PARLYZ_HEAL
	
Route120GrampsText:
	text "Oh, good! You're"
	line "here!"
	para "Please help me"
	line "out."
	para "My granddaughter"
	line "could be trapped"
	cont "in there!"
	done
	

LassConnie1SeenText:
	text "I don't know why"
	line "I hang out with"
	cont "DUDLEY or JOEY."

	para "You're probably"
	line "cooler than either"
	cont "of them!"
	done

LassConnie1BeatenText:
	text "Aaack! My #MON!"
	done

LassConnie1AfterBattleText:
	text "Well, I lost, but"
	line "that battle was"
	para "more fun than"
	line "anything those"
	para "two could be up"
	line "to."
	done

	
SchoolboyDudleySeenText:
	text "This route is"
	line "where all of my"
	para "friends meet after"
	line "school!"
	done

SchoolboyDudleyBeatenText:
	text "Whoo! Good stuff."
	done

SchoolboyDudleyAfterBattleText:
	text "I did my best."
	line "I have no regrets."
	done
	
YoungsterJoey1SeenText:
	text "It's fun to play"
	line "in the mines."
	para "But don't tell"
	line "our parents!"
	done

YoungsterJoey1BeatenText:
	text "Ack! I lost!"
	line "Doggone it!"
	done

YoungsterJoey1AfterText:
	text "Do I have to have"
	line "more #MON in"

	para "order to battle"
	line "better?"

	para "No! I'm sticking"
	line "with this one no"
	cont "matter what!"
	done

Route120UndergroundPathSignText:
	text "BOULDER MINES"
	para "Dangerous mining"
	line "area!"
	para "Please do not"
	line "enter without"
	para "#MON for"
	line "protection."
	done
	
FisherTullySeenText:
	text "Let me demonstrate"
	line "the power of the"
	cont "#MON I caught!"
	done

FisherTullyBeatenText:
	text "What? That's not"
	line "right."
	done

FisherTullyAfterBattleText:
	text "I want to become"
	line "the trainer CHAMP"

	para "using the #MON"
	line "I caught."

	para "That's the best"
	line "part of fishing!"
	done
	
HikerParry3SeenText:
	text "My #MON are"
	line "power packed!"
	done

HikerParry3BeatenText:
	text "Wahahah! I'm the"
	line "big loser!"
	done

HikerParryAfterBattleText:
	text "I'm not much good"
	line "at thinking, see?"

	para "So, I just plow"
	line "ahead with power!"
	done
	
GrampsRelievedText:
	text "Oh thank heavens!"
	
	para "You're safe!"

	para "How many times do"
	line "I have to tell"
	cont "you..."
	
	para "Don't wander off"
	line "where I can't find"
	cont "you!"
	done
	
GirlText:
	text "Oh Grandpa..."
	
	para "I was only"
	line "playing hide-and"
	cont "-seek!"
	
	para "I had lots of fun!"
	done
	
GrampsAnnoyedText:
	text "Honestly,"
	line "this lass..."
	
	para "But she is safe"
	line "thankfully..."
	
	para "Thank you Trainer,"
	
	para "Let's head back to"
	line "to my house for"
	cont "now..."
	done

WalkDown:
	step DOWN
	step_end
	
WalkDownGirl:
	step DOWN
	step_end
	
WalkUpGramps:
	step UP
	step_end
	
WalkDownGramps:
	step DOWN
	step_end

Route120_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  9,  5, BOULDER_MINES_1F, 1

	db 1 ; coord events
	coord_event  9,  6, SCENE_ROUTE8_GIRL_AND_GRAMPS, SceneFoundGirlScript

	db 1 ; bg events
	bg_event 10,  6, BGEVENT_READ, Route120UndergroundPathSign

	db 9 ; object events
	object_event 40,  6, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route120FruitTree, -1
	object_event 12, 10, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerYoungsterJoey, -1
	object_event 24,  4, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerSchoolboyDudley, -1
	object_event 12,  6, SPRITE_LASS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerLassConnie, -1
	object_event  8,  7, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route120GrampsScript, EVENT_ECRUTEAK_CITY_GRAMPS
	object_event 20, 13, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, TrainerFisherTully, -1
	object_event 36, 12, SPRITE_POKEFAN_M, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 1, TrainerHikerParry, -1
	object_event  9,  0, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_ROUTE8_GIRL_SAVED
	object_event 18,  8, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route120ParlyzHeal, EVENT_ROUTE_8_PARLYZ_HEAL

