	const_def 2 ; object constants
	const ROUTE32_YOUNGSTER2
	const ROUTE32_YOUNGSTER3
	const ROUTE32_LASS1
	const ROUTE32_POKE_BALL1
	const ROUTE32_FRIEDA
	const ROUTE32_POKE_BALL2
	const ROUTE32_OFFICER
	const ROUTE32_WORKER1
	const ROUTE32_WORKER2
	const ROUTE32_FRUIT_TREE
	const ROUTE32_POKE_BALL3

Route32_MapScripts:
	db 3 ; scene scripts
	scene_script .DummyScene0 ; SCENE_DEFAULT
	scene_script .DummyScene1 ; SCENE_ROUTE32_OFFER_SLOWPOKETAIL
	scene_script .DummyScene2 ; SCENE_ROUTE32_NOTHING

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .Frieda

.DummyScene0:
	end

.DummyScene1:
	end

.DummyScene2:
	end

.Frieda:
	checkcode VAR_WEEKDAY
	ifequal FRIDAY, .FriedaAppears
	disappear ROUTE32_FRIEDA
	return

.FriedaAppears:
	appear ROUTE32_FRIEDA
	return


TrainerCamperRoland:
	trainer CAMPER, ROLAND, EVENT_BEAT_CAMPER_ROLAND, CamperRolandSeenText, CamperRolandBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CamperRolandAfterText
	waitbutton
	closetext
	end

TrainerFisherWilton1:
	trainer FISHER, WILTON1, EVENT_BEAT_FISHER_WILTON, FisherWilton1SeenText, FisherWilton1BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FisherWiltonHugePoliwagText
	waitbutton
	closetext
	end

TrainerPicnickerLiz1:
	trainer PICNICKER, LIZ1, EVENT_BEAT_PICNICKER_LIZ, PicnickerLiz1SeenText, PicnickerLiz1BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PicnickerLiz1AfterText
	waitbutton
	closetext
	end

TrainerYoungsterGordon:
	trainer YOUNGSTER, GORDON, EVENT_BEAT_YOUNGSTER_GORDON, YoungsterGordonSeenText, YoungsterGordonBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext YoungsterGordonAfterText
	waitbutton
	closetext
	end


FriedaScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_POISON_BARB_FROM_FRIEDA
	iftrue .Friday
	checkcode VAR_WEEKDAY
	ifnotequal FRIDAY, .NotFriday
	checkevent EVENT_MET_FRIEDA_OF_FRIDAY
	iftrue .MetFrieda
	writetext MeetFriedaText
	buttonsound
	setevent EVENT_MET_FRIEDA_OF_FRIDAY
.MetFrieda:
	writetext FriedaGivesGiftText
	buttonsound
	verbosegiveitem POISON_BARB
	iffalse .Done
	setevent EVENT_GOT_POISON_BARB_FROM_FRIEDA
	writetext FriedaGaveGiftText
	waitbutton
	closetext
	end

.Friday:
	writetext FriedaFridayText
	waitbutton
.Done:
	closetext
	end

.NotFriday:
	writetext FriedaNotFridayText
	waitbutton
	closetext
	end

Route32UltraBall:
	itemball ULTRA_BALL

Route32MaxRepel:
	itemball MAX_REPEL

Route32Sign:
	jumptext Route32SignText

Route32FruitTree:
	fruittree FRUITTREE_ROUTE_44

Route32HiddenGreatBall:
	hiddenitem GREAT_BALL, EVENT_ROUTE_32_HIDDEN_GREAT_BALL

Route32HiddenSuperPotion:
	hiddenitem SUPER_POTION, EVENT_ROUTE_32_HIDDEN_SUPER_POTION
	
Route32Elixer:
	itemball ELIXER


Route32OfficerScript:
	jumptextfaceplayer Route32OfficerText
	
Route32Worker1Script:
	jumptextfaceplayer Route32Worker1Text

Route32Worker2Script:
	jumptextfaceplayer Route32Worker2Text

Route32OfficerText:
	text "A recent storm has"
	line "damaged this GATE."

	para "We are working on"
	line "getting it fixed."
	
	para "I kindly ask that"
	line "please come back"
	cont "later."
	done
	
Route32Worker1Text:
	text "Whew!"
	para "That storm was too"
	line "much for this gate"
	cont "to handle!"
	done
	
Route32Worker2Text:
	text "Be careful, kid!"
	
	para "There might be"
	line "broken glass"
	cont "around here."
	
	para "You should stay"
	line "back until we're"
	cont "done with repairs."
	done

YoungsterGordonSeenText:
	text "I found some good"
	line "#MON in the"
	cont "grass!"

	para "I think they'll do"
	line "it for me!"
	done

YoungsterGordonBeatenText:
	text "Darn. I thought I"
	line "could win."
	done

YoungsterGordonAfterText:
	text "The grass is full"
	line "of clingy things."
	done

CamperRolandSeenText:
	text "I'm spending my"
	line "day camping at"
	para "the base of this"
	line "snowy hill."
	done

CamperRolandBeatenText:
	text "Hmmm. This is"
	line "disappointing."
	done

CamperRolandAfterText:
	text "The farther up"
	line "this route you go,"
	para "the more snow"
	line "there is."
	done

PicnickerLiz1SeenText:
	text "Uh-huh. Yeah, and"
	line "you know…"

	para "Pardon? Battle?"
	line "I'm on the phone."

	para "Oh, all right. But"
	line "make it fast."
	done

PicnickerLiz1BeatenText:
	text "Oh! I've got to"
	line "relieve my anger!"
	done

PicnickerLiz1AfterText:
	text "I was having a"
	line "nice chat too."
	done

FisherWilton1SeenText:
	text "Aack! You made me"
	line "lose a POLIWAG!"

	para "What are you going"
	line "to do about it?"
	done

FisherWilton1BeatenText:
	text "Just forget about"
	line "it."
	done

FisherWiltonHugePoliwagText:
	text "That POLIWAG that"
	line "got away…"
	cont "It was huge."

	para "I swear it must've"
	line "been 16 feet long!"
	done

MeetFriedaText:
	text "FRIEDA: Yahoo!"
	line "It's Friday!"

	para "I'm FRIEDA of"
	line "Friday!"

	para "Nice to meet you!"
	done

FriedaGivesGiftText:
	text "Here's a POISON"
	line "BARB for you!"
	done

FriedaGaveGiftText:
	text "FRIEDA: Give it to"
	line "a #MON that has"
	cont "poison-type moves."

	para "Oh!"

	para "It's wicked!"

	para "You'll be shocked"
	line "how good it makes"
	cont "poison moves!"
	done

FriedaFridayText:
	text "FRIEDA: Hiya! What"
	line "day do you like?"

	para "I love Friday. No"
	line "doubt about it!"

	para "Don't you think"
	line "it's great too?"
	done

FriedaNotFridayText:
	text "FRIEDA: Isn't it"
	line "Friday today?"

	para "It's so boring"
	line "when it's not!"
	done

Route32SignText:
	text "ROUTE 112"

	para "BLUE FOREST -"
	line "STAND CITY"
	done


Route32_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 10, 47, ROUTE_36_RUINS_OF_ALPH_GATE, 1
	warp_event 11, 47, ROUTE_36_RUINS_OF_ALPH_GATE, 2


	db 0 ; coord events


	db 3 ; bg events
	bg_event  8,  2, BGEVENT_READ, Route32Sign
	bg_event 14, 47, BGEVENT_ITEM, Route32HiddenGreatBall
	bg_event 16, 18, BGEVENT_ITEM, Route32HiddenSuperPotion

	db 13 ; object events
	object_event 10,  6, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerYoungsterGordon, -1
	object_event  8, 36, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerCamperRoland, -1
	object_event 13, 28, SPRITE_LASS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, TrainerPicnickerLiz1, -1
	object_event  5, 38, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route32UltraBall, EVENT_ROUTE_32_GREAT_BALL
	object_event  7, 22, SPRITE_LASS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, FriedaScript, EVENT_ROUTE_32_FRIEDA_OF_FRIDAY
	object_event 13, 12, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route32MaxRepel, EVENT_ROUTE_32_REPEL
	object_event 10, 46, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 3, Route32OfficerScript, EVENT_BLACKTHORN_CITY_SUPER_NERD_BLOCKS_GYM
	object_event 11, 47, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 3, Route32Worker1Script, EVENT_BLACKTHORN_CITY_SUPER_NERD_BLOCKS_GYM
	object_event 13, 47, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 3, Route32Worker2Script, EVENT_BLACKTHORN_CITY_SUPER_NERD_BLOCKS_GYM
	object_event  3, 16, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route32FruitTree, -1
	object_event 11, 42, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route32Elixer, EVENT_ROUTE_32_REPEL
	object_event  4, 36, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, TrainerFisherWilton1, -1
