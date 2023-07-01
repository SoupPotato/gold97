	const_def 2 ; object constants
	const BOARDWALK_BUG_CATCHER
	const BOARDWALK_SUPER_NERD2
	const BOARDWALK_SUPER_NERD3
	const BOARDWALK_FISHER
	const BOARDWALK_LASS
	const BOARDWALK_YOUNGSTER
	const BOARDWALK_INSTRUCTOR
	const BOARDWALK_POKEFAN_M
	const BOARDWALK_ITEMBALL

Boardwalk_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .MoveTutor

.MoveTutor:
	checkevent EVENT_CLEARED_RADIO_TOWER
	iffalse .MoveTutorDisappear
	checkitem COIN_CASE
	iffalse .MoveTutorDisappear
	appear BOARDWALK_POKEFAN_M
	return

.MoveTutorDisappear:
	disappear BOARDWALK_POKEFAN_M
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
	checkcoins 3000
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
	
	

TrainerCamperSpencer:
	trainer CAMPER, SPENCER, EVENT_BEAT_CAMPER_SPENCER, CamperSpencerSeenText, CamperSpencerBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CamperSpencerAfterBattleText
	waitbutton
	closetext
	end
	
TrainerInstructorCliff:
	trainer INSTRUCTOR, CLIFF, EVENT_BEAT_INSTRUCTOR_CLIFF, InstructorCliffSeenText, InstructorCliffBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext InstructorCliffAfterBattleText
	waitbutton
	closetext
	end

TrainerPokemaniacBrent:
	trainer POKEMANIAC, BRENT, EVENT_BEAT_POKEMANIAC_BRENT, PokemaniacBrentSeenText, PokemaniacBrentBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokemaniacBrentAfterBattleText
	waitbutton
	closetext
	end
	
TrainerFledglingHidalgo:
	trainer FLEDGLING, HIDALGO, EVENT_BEAT_FLEDGLING_HIDALGO, FledglingHidalgoSeenText, FledglingHidalgoBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FledglingHidalgoAfterBattleText
	waitbutton
	closetext
	end

TrainerPokemaniacRon:
	trainer POKEMANIAC, RON, EVENT_BEAT_POKEMANIAC_RON, PokemaniacRonSeenText, PokemaniacRonBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokemaniacRonAfterBattleText
	waitbutton
	closetext
	end

TrainerFisherMarvin:
	trainer FISHER, MARVIN, EVENT_BEAT_FISHER_MARVIN, FisherMarvinSeenText, FisherMarvinBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FisherMarvinAfterBattleText
	waitbutton
	closetext
	end

TrainerPicnickerTiffany:
	trainer PICNICKER, TIFFANY, EVENT_BEAT_PICNICKER_TIFFANY, PicnickerTiffanySeenText, PicnickerTiffanyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PicnickerTiffanyWantsPicnicText
	waitbutton
	closetext
	end

BoardwalkRinringGuyScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_TM12_PAY_DAY
	iftrue .GotPayday
	writetext BoardwalkRinringGuyText
	buttonsound
	verbosegiveitem TM_PAY_DAY
	iffalse .NoRoom
	setevent EVENT_GOT_TM12_PAY_DAY
.GotPayday:
	writetext BoardwalkRinringGuyPaydayText
	waitbutton
.NoRoom:
	closetext
	end

BoardwalkRinringScript:
	opentext
	writetext BoardwalkRinringText
	cry RINRING
	waitbutton
	closetext
	end

BoardwalkSign1:
	jumptext BoardwalkSign1Text

BoardwalkSign2:
	jumptext BoardwalkSign2Text

BoardwalkTrainerTips:
	jumptext BoardwalkTrainerTipsText

BoardwalkAmuletCoin:
	itemball AMULET_COIN

FledglingHidalgoSeenText:
	text "Can I try battling"
	line "against you?"
	done
	
FledglingHidalgoBeatenText:
	text "This is tough!"
	done
	
FledglingHidalgoAfterBattleText:
	text "I'll work hard to"
	line "keep getting"
	cont "better at this!"
	done
	

InstructorCliffSeenText:
	text "This new GAME"
	line "CORNER is great!"
	para "It's a fun way to"
	line "take a break from"
	cont "marking papers."
	done

InstructorCliffBeatenText:
	text "Losing at #MON"
	line "is less fun than"
	cont "the slots…"
	done

InstructorCliffAfterBattleText:
	text "There's never"
	line "enough time left"
	para "in the day once"
	line "grading is done."
	done

PokemaniacBrentSeenText:
	text "Hey! Do you have"
	line "any rare #MON?"
	done

PokemaniacBrentBeatenText:
	text "Oh, my poor #-"
	line "MON! Darlings!"
	done

PokemaniacBrentAfterBattleText:
	text "I'd be happy just"
	line "to own a single"
	cont "rare #MON."
	done

PokemaniacRonSeenText:
	text "Would you get"
	line "this?"

	para "Some <RIVAL> guy"
	line "beat my team!"

	para "Darn it! My #-"
	line "MON are great!"
	
	para "Surely I can win"
	line "against you!"
	done

PokemaniacRonBeatenText:
	text "My team did"
	line "pretty right on!"
	done

PokemaniacRonAfterBattleText:
	text "It's okay for"
	line "people to like"

	para "different types"
	line "of #MON."

	para "#MON isn't just"
	line "about having the"
	cont "most powerful one."
	done

FisherMarvinSeenText:
	text "I'm in a slump."

	para "Maybe it's the"
	line "gear I'm using."

	para "Let's battle for a"
	line "change of pace!"
	done

FisherMarvinBeatenText:
	text "I lost, but I feel"
	line "better anyway."
	done

FisherMarvinAfterBattleText:
	text "KURT's LURE BALL"
	line "is the best for"

	para "catching hooked"
	line "#MON."

	para "It's much more"
	line "effective than a"
	cont "ULTRA BALL."
	done

CamperSpencerSeenText:
	text "I can do so much"
	line "with my #MON--"
	cont "it's super-fun!"
	done

CamperSpencerBeatenText:
	text "Losing isn't fun"
	line "at all…"
	done

CamperSpencerAfterBattleText:
	text "Have you ever been"
	line "to JADE FOREST?"

	para "We were planning"
	line "to camp there."
	done

PicnickerTiffanySeenText:
	text "Are you going to"
	line "the GAME CORNER?"

	para "Let's play for a "
	line "little while!"
	done

PicnickerTiffanyBeatenText:
	text "I played too much!"
	done

PicnickerTiffanyWantsPicnicText:
	text "I'm having a pic-"
	line "nic with #MON."

	para "Won't you join us?"
	done

PicnickerTiffanyClefairyText:
	text "Isn't my CLEFAIRY"
	line "just the most"
	cont "adorable thing?"
	done

BoardwalkSign1Text:
	text "BOARDWALK"

	para "SANSKRIT TOWN -"
	line "TEKNOS CITY"
	done

BoardwalkSign2Text:
	text "BOARDWALK GAME"
	line "CORNER"
	para "Your source for"
	line "fun!"
	done

BoardwalkTrainerTipsText:
	text "TRAINER TIPS"

	para "All #MON have"
	line "pros and cons"

	para "depending on their"
	line "types."

	para "If their types"
	line "differ, a higher-"

	para "level #MON may"
	line "lose in battle."

	para "Learn which types"
	line "are strong and"

	para "weak against your"
	line "#MON's type."
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
	line "Thanks, kid!"
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

BoardwalkRinringGuyText:
	text "I never have a"
	line "dull moment at the"
	cont "GAME CORNER."
	
	para "Any loss I get,"
	line "can become a gain"
	cont "in the long run…"
	
	para "Here, I'll share"
	line "my secret with"
	cont "with you!"
	
	para "…Don't tell!"
	done

BoardwalkRinringGuyPaydayText:
	text "That's PAY DAY."
	
	para "You can use it to"
	line "rack in cash when"
	cont "you need it."
	
	para "But keep it a"
	line "secret between us."
	
	para "You might run the"
	line "GAME CORNER out of"
	cont "business!"
	done

BoardwalkRinringText:
	text "RINRING: Riririri!"
	done

Boardwalk_MapEvents:
	db 0, 0 ; filler

	db 8 ; warp events
	warp_event  6, 51, BOARDWALK_TEKNOS_GATE, 1
	warp_event  7, 51, BOARDWALK_TEKNOS_GATE, 2
	warp_event 14,  9, BOARDWALK_SANSKRIT_GATE, 3
	warp_event 14,  5, BOARDWALK_SANSKRIT_GATE, 1
	warp_event 15,  5, BOARDWALK_SANSKRIT_GATE, 2
	warp_event 15,  9, BOARDWALK_SANSKRIT_GATE, 4
	warp_event 10, 23, BOARDWALK_GAME_CORNER, 1
	warp_event 11, 23, BOARDWALK_GAME_CORNER, 2

	db 0 ; coord events

	db 3 ; bg events
	bg_event 10, 10, BGEVENT_READ, BoardwalkSign1
	bg_event  8, 24, BGEVENT_READ, BoardwalkSign2
	bg_event 12, 40, BGEVENT_READ, BoardwalkTrainerTips

	db 11 ; object events
	object_event 15, 16, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, TrainerFledglingHidalgo, -1
	object_event  9, 32, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 5, TrainerPokemaniacBrent, -1
	object_event  8, 11, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerPokemaniacRon, -1
	object_event  4, 16, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerFisherMarvin, -1
	object_event  7, 23, SPRITE_LASS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerPicnickerTiffany, -1
	object_event  8, 42, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 2, TrainerCamperSpencer, -1
	object_event 13, 24, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 1, TrainerInstructorCliff, -1
	object_event  9, 24, SPRITE_POKEFAN_M, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, MoveTutorScript, 0
	object_event 14, 28, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, BoardwalkAmuletCoin, EVENT_BOARDWALK_AMULET_COIN
	object_event  4, 28, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, BoardwalkRinringGuyScript, -1
	object_event  5, 28, SPRITE_GROWLITHE, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BoardwalkRinringScript, -1
