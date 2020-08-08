	const_def 2 ; object constants
	const ROUTE35_YOUNGSTER1
	const ROUTE35_LASS2
	const ROUTE35_YOUNGSTER3
	const ROUTE35_SUPER_NERD
	const ROUTE35_FRUIT_TREE
	const ROUTE35_POKE_BALL
	const ROUTE35_FISHER
	const ROUTE35_SLOWPOKE1
	const ROUTE35_SLOWPOKE2

Route103_MapScripts:
	db 2 ; scene scripts
	scene_script .Scene35SlowpokeTail ; SCENE_DEFAULT
	scene_script .Scene35Nothing ;

	db 0 ; callbacks

.Scene35SlowpokeTail
	end

.Scene35Nothing
	end
	
Route103SlowpokeScript:
	opentext
	writetext Route103SlowpokeText1
	pause 60
	writetext Route103SlowpokeText2
	cry SLOWPOKE
	waitbutton
	closetext
	end
	
Route103SlowpokeGuyScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_WHITNEY
	iftrue .slowpokegone
	writetext SlowpokeGuyText1
	waitbutton
	closetext
	end
	
.slowpokegone
	writetext SlowpokeGuyText2
	waitbutton
	closetext
	end

SlowpokeVendor:
	faceplayer
	turnobject PLAYER, UP
	opentext
	writetext Text_MillionDollarSlowpokeTail
	yesorno
	iffalse .scenerefused
	writetext Text_ThoughtKidsWereLoaded
	waitbutton
	closetext
	setscene SCENE_ROUTE_35_NOTHING
	end

.scenerefused
	writetext Text_RefusedToBuySlowpokeTail
	waitbutton
	closetext
	setscene SCENE_ROUTE_35_NOTHING
	end

TrainerBirdKeeperBryan:
	trainer BIRD_KEEPER, BRYAN, EVENT_BEAT_BIRD_KEEPER_BRYAN, BirdKeeperBryanSeenText, BirdKeeperBryanBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BirdKeeperBryanAfterBattleText
	waitbutton
	closetext
	end

TrainerJugglerIrwin:
	trainer JUGGLER, IRWIN1, EVENT_BEAT_JUGGLER_IRWIN, JugglerIrwin1SeenText, JugglerIrwin1BeatenText, 0, .Script

.Script:
	writecode VAR_CALLERID, PHONE_JUGGLER_IRWIN
	endifjustbattled
	opentext
	checkcellnum PHONE_JUGGLER_IRWIN
	iftrue Route103NumberAcceptedM
	checkevent EVENT_IRWIN_ASKED_FOR_PHONE_NUMBER
	iftrue .AskedAlready
	writetext JugglerIrwinAfterBattleText
	buttonsound
	setevent EVENT_IRWIN_ASKED_FOR_PHONE_NUMBER
	scall Route103AskNumber1M
	jump .AskForNumber

.AskedAlready:
	scall Route103AskNumber2M
.AskForNumber:
	askforphonenumber PHONE_JUGGLER_IRWIN
	ifequal PHONE_CONTACTS_FULL, Route103PhoneFullM
	ifequal PHONE_CONTACT_REFUSED, Route103NumberDeclinedM
	trainertotext JUGGLER, IRWIN1, MEM_BUFFER_0
	scall Route103RegisteredNumberM
	jump Route103NumberAcceptedM

Route103AskNumber1M:
	jumpstd asknumber1m
	end

Route103AskNumber2M:
	jumpstd asknumber2m
	end

Route103RegisteredNumberM:
	jumpstd registerednumberm
	end

Route103NumberAcceptedM:
	jumpstd numberacceptedm
	end

Route103NumberDeclinedM:
	jumpstd numberdeclinedm
	end

Route103PhoneFullM:
	jumpstd phonefullm
	end

Route103RematchM:
	jumpstd rematchm
	end

TrainerCamperIvan:
	trainer CAMPER, IVAN, EVENT_BEAT_CAMPER_IVAN, CamperIvanSeenText, CamperIvanBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CamperIvanAfterBattleText
	waitbutton
	closetext
	end


TrainerPicnickerKim:
	trainer PICNICKER, KIM, EVENT_BEAT_PICNICKER_KIM, PicnickerKimSeenText, PicnickerKimBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PicnickerKimAfterBattleText
	waitbutton
	closetext
	end

Route103Sign:
	jumptext Route103SignText

Route103TMRollout:
	itemball TM_ROLLOUT
	
Route103SuperPotion:
	itemball SUPER_POTION

Route103FruitTree:
	fruittree FRUITTREE_ROUTE_35
	

SlowpokeTailSalesmanScript:
	faceplayer
	opentext
	writetext Text_MillionDollarSlowpokeTail
	yesorno
	iffalse .refused
	writetext Text_ThoughtKidsWereLoaded
	waitbutton
	closetext
	end

.refused
	writetext Text_RefusedToBuySlowpokeTail
	waitbutton
	closetext
	end
	

Text_MillionDollarSlowpokeTail:
	text "Hey, kid!"
	para "How would you like"
	line "to have this"

	para "tasty, nutritious"
	line "SLOWPOKETAIL?"

	para "For you right now,"
	line "just ¥1,000,000!"

	para "You'll want this!"
	done

Text_ThoughtKidsWereLoaded:
	text "Tch! I thought"
	line "kids these days"
	cont "were loaded…"
	done

Text_RefusedToBuySlowpokeTail:
	text "You don't want it?"
	line "Then scram. Shoo!"
	done

CamperIvanSeenText:
	text "I've been getting"
	line "#MON data off"

	para "my radio. I think"
	line "I'm good."
	done

CamperIvanBeatenText:
	text "I give!"
	done

CamperIvanAfterBattleText:
	text "Music on the radio"
	line "changes the moods"
	cont "of wild #MON."
	done



PicnickerKimSeenText:
	text "Have you been to"
	line "any #MON GYMS?"
	done

PicnickerKimBeatenText:
	text "Oh. I couldn't"
	line "win…"
	done

PicnickerKimAfterBattleText:
	text "The GYM BADGES are"
	line "pretty. I collect"
	cont "them."
	done

BirdKeeperBryanSeenText:
	text "What kinds of"
	line "BALLS do you use?"
	done

BirdKeeperBryanBeatenText:
	text "Yikes! Not fast"
	line "enough!"
	done

BirdKeeperBryanAfterBattleText:
	text "Some #MON flee"
	line "right away."

	para "If you can get"
	line "ahold of KURT's"
	para "custom FAST BALLs,"
	line "they're great for"
	cont "quick #MON."
	done

JugglerIrwin1SeenText:
	text "Behold my graceful"
	line "BALL dexterity!"
	done

JugglerIrwin1BeatenText:
	text "Whew! That was a"
	line "jolt!"
	done

JugglerIrwinAfterBattleText:
	text "I was going to"
	line "dazzle you with my"
	cont "prize #MON."

	para "But your prowess"
	line "electrified me!"
	done
	
Route103SlowpokeText1:
	text "SLOWPOKE: …"

	para "<……> <……> <……>"
	done

Route103SlowpokeText2:
	text "<……> <……>Yawn?"
	done

Route103SignText:
	text "ROUTE 103"
	para "WESTPORT CITY -"
	line "BIRDON TOWN"
	done
	
SlowpokeGuyText1:
	text "Yeah..."
	
	para "These SLOWPOKE"
	line "are always lazing"
	cont "around here."
	
	para "It might be a"
	line "while before the"
	cont "road is clear..."
	done
	
SlowpokeGuyText2:
	text "Looks like the"
	line "SLOWPOKE have"
	cont "finally left."
	
	para "You can get to"
	line "BIRDON TOWN now"
	cont "if you want."
	done

Route103_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 12, 49, ROUTE_103_WESTPORT_GATE, 1
	warp_event 13, 49, ROUTE_103_WESTPORT_GATE, 2

	db 1 ; coord events
	coord_event  8, 14, SCENE_DEFAULT, SlowpokeVendor

	db 1 ; bg events
	bg_event  6, 44, BGEVENT_READ, Route103Sign

	db 11 ; object events
	object_event 11,  9, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerCamperIvan, -1
	object_event  6, 23, SPRITE_LASS, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 2, TrainerPicnickerKim, -1
	object_event 10, 44, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerBirdKeeperBryan, -1
	object_event  8, 37, SPRITE_SUPER_NERD, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerJugglerIrwin, -1
	object_event 14, 31, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route103FruitTree, -1
	object_event 15, 30, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route103TMRollout, EVENT_ROUTE_35_TM_ROLLOUT
	object_event  8, 13, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SlowpokeTailSalesmanScript, EVENT_RIVAL_BURNED_TOWER
	object_event 10, 28, SPRITE_SLOWPOKE, SPRITEMOVEDATA_STANDING_DOWN, 1, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route103SlowpokeScript, EVENT_BEAT_WHITNEY
	object_event 11, 28, SPRITE_SLOWPOKE, SPRITEMOVEDATA_STANDING_DOWN, 1, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route103SlowpokeScript, EVENT_BEAT_WHITNEY
	object_event  8, 30, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 1, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route103SlowpokeGuyScript, -1
	object_event 15, 10, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route103SuperPotion, EVENT_ROUTE_35_SUPER_POTION
