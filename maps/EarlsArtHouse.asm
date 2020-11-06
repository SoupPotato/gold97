	const_def 2 ; object constants
	const EARLMUSEUM_FISHER
	const EARLMUSEUM_BIRD
	const EARLMUSEUM_DRAGON
	const EARLMUSEUM_LASS
	const EARLMUSEUM_POKEFAN_M

EarlsArtHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	
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

EarlScript:
	faceplayer
	opentext
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iftrue .JustShowedSomething
	checkevent EVENT_MET_EARL
	iftrue .MetEarl
	writetext EarlIntroText
	buttonsound
	setevent EVENT_MET_EARL
.MetEarl:
	checkevent EVENT_SHOWED_DRATINI_TO_EARL
	iftrue .ShowedDratini
	checkevent EVENT_SHOWED_MADAME_TO_EARL
	iftrue .ShowedMadame
	writetext EarlMadameText
	buttonsound
	writetext EarlAskToSeeMonText
	yesorno
	iffalse .SaidNo
	scall .ExcitedToSee
	special BillsGrandfather
	iffalse .SaidNo
	ifnotequal MADAME, .WrongPokemon
	scall .CorrectPokemon
	setevent EVENT_SHOWED_MADAME_TO_EARL
	jump .ShowedMadame

.GotEverstone:
	writetext EarlDratiniText
	buttonsound
	writetext EarlAskToSeeMonText
	yesorno
	iffalse .SaidNo
	scall .ExcitedToSee
	special BillsGrandfather
	iffalse .SaidNo
	ifnotequal DRATINI, .WrongPokemon; edit here, change back to dratini
	scall .CorrectPokemon
	clearevent EVENT_EARL_DRATINI_STATUE_GONE
	setevent EVENT_SHOWED_DRATINI_TO_EARL
	jump .ShowedDratini


.ShowedDratini:
	scall .ReceiveItem
	verbosegiveitem EXP_SHARE
	iffalse .BagFull
	setevent EVENT_GOT_EXP_SHARE_FROM_EARL
	closetext
	end

.ShowedMadame:
	checkevent EVENT_GOT_EVERSTONE_FROM_EARL
	iftrue .GotEverstone
	scall .ReceiveItem
	verbosegiveitem EVERSTONE
	iffalse .BagFull
	setevent EVENT_GOT_EVERSTONE_FROM_EARL
	clearevent EVENT_EARL_BIRD_STATUE_GONE
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	closetext
	end

.ExcitedToSee:
	writetext EarlExcitedToSeeText
	buttonsound
	end

.SaidNo:
	writetext EarlYouDontHaveItTextText
	waitbutton
	closetext
	end

.CorrectPokemon:
	writetext EarlShownPokemonText
	buttonsound
	end

.ReceiveItem:
	writetext EarlTokenOfAppreciationText
	buttonsound
	end

.JustShowedSomething:
	writetext EarlComeAgainText
	waitbutton
	closetext
	end

.WrongPokemon:
	writetext EarlWrongPokemonText
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

EarlIntroText:
	text "Oh, boo."
	line "I'm a failure."
	
	para "My name is EARL,"
	line "and I'm an artist."
	
	para "But inspiration"
	line "has left me..."
	
	para "The only sculpture"
	line "I've finished so"
	cont "far is a sculpture"
	cont "of a #MON EGG."
	
	para "I need to do"
	line "something"
	cont "impressive!"
	
	para "I've been working"
	line "on a statue of the"
	cont "#MON MADAME,"
	
	para "but it's not quite"
	line "finished."
	done

EarlAskToSeeMonText:
	text "If you have that"
	line "#MON, may I see"
	cont "it, please?"
	done

EarlExcitedToSeeText:
	text "You will show me?"
	line "How good of you!"
	done

EarlYouDontHaveItTextText:
	text "You don't have it?"
	line "That's too bad…"
	done

EarlShownPokemonText:
	text "Ah, yes! That is"
	line "@"
	text_ram wStringBuffer3
	text "!"

	para "Thank you so much!"
	line "I feel inspired!"
	done

EarlTokenOfAppreciationText:
	text "This is a token of"
	line "my appreciation."
	done

EarlComeAgainText:
	text "Come by again"
	line "sometime."
	done

EarlShownAllThePokemonText:
	text "Thanks for showing"
	line "me those #MON."
	para "With your help,"
	line "I've made great"
	para "progress on my"
	line "dream!"
	done

EarlWrongPokemonText:
	text "Hm?"

	para "That's not the"
	line "#MON that I was"
	cont "thinking about."
	done

EarlMadameText:
	text "If I could only"
	line "see a MADAME in"
	para "person, I might"
	line "feel inspired to"
	cont "finish my statue."
	done
	

EarlDratiniText:
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
	object_event  1,  5, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 2, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, EarlScript, -1
	object_event  5,  4, SPRITE_BIRD, SPRITEMOVEDATA_STANDING_DOWN, 0, 2, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, BirdScript, EVENT_EARL_BIRD_STATUE_GONE
	object_event  9,  4, SPRITE_EKANS, SPRITEMOVEDATA_STANDING_DOWN, 0, 2, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, DragonScript, EVENT_EARL_DRATINI_STATUE_GONE
	object_event 13,  7, SPRITE_LASS, SPRITEMOVEDATA_STANDING_UP, 0, 2, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, ArtHouseLassScript, EVENT_EARL_DRATINI_STATUE_GONE
	object_event  5,  2, SPRITE_POKEFAN_M, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ArtHousePokefanMScript, EVENT_EARL_DRATINI_STATUE_GONE
