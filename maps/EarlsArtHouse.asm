	const_def 2 ; object constants
	const EarlsArtHouse_GRAMPS
	const EARLMUSEUM_BIRD
	const EARLMUSEUM_DRAGON
	const EARLMUSEUM_LASS
	const EARLMUSEUM_POKEFAN_M

EarlsArtHouse_MapScripts:
	db 0 ; scene scripts

	db 2 ; callbacks
	callback MAPCALLBACK_OBJECTS, .birdstatue
	callback MAPCALLBACK_OBJECTS, .dragonstatue
	
.birdstatue
	checkevent EVENT_SHOWED_PICHU_TO_BILLS_GRANDPA
	iffalse .birdgone
	return
	
.birdgone
	disappear EARLMUSEUM_BIRD
	return
	
.dragonstatue
	checkevent EVENT_SHOWED_GROWLITHE_VULPIX_TO_BILLS_GRANDPA
	iffalse .dragongone
	return
	
.dragongone
	disappear EARLMUSEUM_DRAGON
	disappear EARLMUSEUM_LASS
	disappear EARLMUSEUM_POKEFAN_M
	return
	
BirdScript:
	opentext
	writetext BirdText
	waitbutton
	closetext
	end

DragonScript:
	opentext
	writetext DragonText
	waitbutton
	closetext
	end

BillsGrandpa:
	faceplayer
	opentext
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iftrue .JustShowedSomething
	checkevent EVENT_GOT_THUNDERSTONE_FROM_BILLS_GRANDPA
	iftrue .GotThunderstone
	checkevent EVENT_MET_BILLS_GRANDPA
	iftrue .MetGrandpa
	writetext BillsGrandpaIntroText
	buttonsound
	setevent EVENT_MET_BILLS_GRANDPA
.MetGrandpa:
	checkevent EVENT_SHOWED_ODDISH_TO_BILLS_GRANDPA
	iftrue .ShowedOddish
	checkevent EVENT_SHOWED_LICKITUNG_TO_BILLS_GRANDPA
	iftrue .ShowedLickitung
	writetext BillsGrandpaLickitungText
	buttonsound
	writetext BillsGrandpaAskToSeeMonText
	yesorno
	iffalse .SaidNo
	scall .ExcitedToSee
	special BillsGrandfather
	iffalse .SaidNo
	ifnotequal MADAME, .WrongPokemon
	scall .CorrectPokemon
	setevent EVENT_SHOWED_LICKITUNG_TO_BILLS_GRANDPA
	jump .ShowedLickitung

.GotEverstone:
	writetext BillsGrandpaOddishText
	buttonsound
	writetext BillsGrandpaAskToSeeMonText
	yesorno
	iffalse .SaidNo
	scall .ExcitedToSee
	special BillsGrandfather
	iffalse .SaidNo
	ifnotequal DRATINI, .WrongPokemon; edit here, change back to dratini
	scall .CorrectPokemon
	clearevent EVENT_SHOWED_GROWLITHE_VULPIX_TO_BILLS_GRANDPA
	setevent EVENT_SHOWED_ODDISH_TO_BILLS_GRANDPA
	jump .ShowedOddish


.ShowedOddish:
	scall .ReceiveItem
	verbosegiveitem EXP_SHARE
	iffalse .BagFull
	setevent EVENT_GOT_THUNDERSTONE_FROM_BILLS_GRANDPA
	closetext
	end

.ShowedLickitung:
	checkevent EVENT_GOT_EVERSTONE_FROM_BILLS_GRANDPA
	iftrue .GotEverstone
	scall .ReceiveItem
	verbosegiveitem EVERSTONE
	iffalse .BagFull
	setevent EVENT_GOT_EVERSTONE_FROM_BILLS_GRANDPA
	clearevent EVENT_SHOWED_PICHU_TO_BILLS_GRANDPA
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	closetext
	end

.ExcitedToSee:
	writetext BillsGrandpaExcitedToSeeText
	buttonsound
	end

.SaidNo:
	writetext BillsGrandpaYouDontHaveItTextText
	waitbutton
	closetext
	end

.CorrectPokemon:
	writetext BillsGrandpaShownPokemonText
	buttonsound
	end

.ReceiveItem:
	writetext BillsGrandpaTokenOfAppreciationText
	buttonsound
	end

.JustShowedSomething:
	writetext BillsGrandpaComeAgainText
	waitbutton
	closetext
	end

.GotThunderstone:
	writetext BillsGrandpaShownAllThePokemonText
	waitbutton
	closetext
	end

.WrongPokemon:
	writetext BillsGrandpaWrongPokemonText
	waitbutton
	closetext
	end

.BagFull:
	closetext
	end
	
EggStatue:
	jumptext EggStatueText

ArtSign:
	jumptext ArtSignText
	
ArtHouseLassScript:
	jumptextfaceplayer ArtHouseLassText
	
ArtHousePokefanMScript:
	jumptextfaceplayer ArtHousePokefanMText
	
ArtHousePokefanMText:
	text "This guy's work"
	line "is really impress-"
	cont "ive!"
	done
	
ArtHouseLassText:
	text "You know, I like"
	line "this EGG one the"
	cont "best."
	done

EggStatueText:
	text "#MON EGG STATUE"
	line "by EARL"
	done
	
ArtSignText:
	text "EARL'S ART HOUSE"
	para "Please look, but"
	line "do not touch."
	done

BillsGrandpaIntroText:
	text "Oh, boo."
	para "I'm a failure."
	para "Don't ask why!"
	para "Alright, I'll tell"
	line "you."
	para "My name is EARL,"
	line "and I'm an artist."
	para "Or at least, I"
	line "wish I was a"
	cont "decent one."
	para "I never feel"
	line "inspired."
	para "I opened this"
	line "ART HOUSE to"
	para "show off my work,"
	line "but the only"
	para "sculpture I've"
	line "ever finished is"
	para "a sculpture of a"
	line "#MON EGG."
	para "I need to do"
	line "something"
	cont "impressive!"
	para "I've been working"
	line "on a statue of the"
	para "#MON MADAME,"
	line "but it's not quite"
	para "finished."
	done

BillsGrandpaAskToSeeMonText:
	text "If you have that"
	line "#MON, may I see"
	cont "it, please?"
	done

BillsGrandpaExcitedToSeeText:
	text "You will show me?"
	line "How good of you!"
	done

BillsGrandpaYouDontHaveItTextText:
	text "You don't have it?"
	line "That's too bad…"
	done

BillsGrandpaShownPokemonText:
	text "Ah, yes! That is"
	line "@"
	text_ram wStringBuffer3
	text "!"

	para "Thank you so much!"
	line "I feel inspired!"
	done

BillsGrandpaTokenOfAppreciationText:
	text "This is a token of"
	line "my appreciation."
	done

BillsGrandpaComeAgainText:
	text "Come by again"
	line "sometime."
	done

BillsGrandpaShownAllThePokemonText:
	text "Thanks for showing"
	line "me those #MON."
	para "With your help,"
	line "I've made great"
	para "progress on my"
	line "dream!"
	done

BillsGrandpaWrongPokemonText:
	text "Hm?"

	para "That's not the"
	line "#MON that I was"
	cont "thinking about."
	done

BillsGrandpaLickitungText:
	text "If I could only"
	line "see a MADAME in"
	para "person, I might"
	line "feel inspired to"
	cont "finish my statue."
	done
	

BillsGrandpaOddishText:
	text "I've finished my"
	line "MADAME statue!"
	para "Now I'd like to"
	line "finish my statue"
	cont "of a DRATINI."
	para "If I could only"
	line "see a DRATINI in"
	para "person, I might"
	line "feel inspired to"
	cont "finish my statue."
	done

	
BirdText:
	text "MADAME STATUE"
	line "by EARL"
	done
	
DragonText:
	text "DRATINI STATUE"
	line "by EARL"
	done

EarlsArtHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, PAGOTA_CITY, 12
	warp_event  3,  7, PAGOTA_CITY, 13

	db 0 ; coord events

	db 2 ; bg events
	bg_event 13, 4, BGEVENT_READ, EggStatue
	bg_event 2, 3, BGEVENT_READ, ArtSign

	db 5 ; object events
	object_event  1,  5, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 2, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BillsGrandpa, -1
	object_event  5,  4, SPRITE_BIRD, SPRITEMOVEDATA_STANDING_DOWN, 0, 2, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BirdScript, EVENT_SHOWED_PICHU_TO_BILLS_GRANDPA
	object_event  9,  4, SPRITE_EKANS, SPRITEMOVEDATA_STANDING_DOWN, 0, 2, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, DragonScript, EVENT_SHOWED_GROWLITHE_VULPIX_TO_BILLS_GRANDPA
	object_event 13,  7, SPRITE_LASS, SPRITEMOVEDATA_STANDING_UP, 0, 2, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ArtHouseLassScript, EVENT_SHOWED_GROWLITHE_VULPIX_TO_BILLS_GRANDPA
	object_event  5,  2, SPRITE_POKEFAN_M, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ArtHousePokefanMScript, EVENT_SHOWED_GROWLITHE_VULPIX_TO_BILLS_GRANDPA
