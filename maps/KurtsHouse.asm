	const_def 2 ; object constants
	const KURTSHOUSE_KURT1
	const KURTSHOUSE_FALKNER

KurtsHouse_MapScripts:
	db 2 ; scene scripts
	scene_script .SceneFalknerVisit1 ; SCENE_DEFAULT
	scene_script .SceneKurtsHouseNothing ;

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .KurtCallback
	
.SceneFalknerVisit1:
	priorityjump .SceneFalknerVisit2
	end
	
.SceneFalknerApproves
	priorityjump .Falknerapproves
	end
	
.SceneFalknerVisit2
	checkevent EVENT_GOT_5F_SAGE_BLESSING
	iftrue .SceneFalknerApproves
	checkevent EVENT_FALKNER_AT_GYM
	iftrue .SceneKurtsHouseNothing
	checkevent EVENT_TALKED_TO_KURT_AND_FALKNER
	iftrue .SceneKurtsHouseNothing
	setevent EVENT_TALKED_TO_KURT_AND_FALKNER
	pause 5
	applymovement PLAYER, WalkUpToKurt
	pause 15
	opentext
	writetext KurtTalks
	waitbutton
	closetext
	turnobject KURTSHOUSE_KURT1, RIGHT
	opentext
	writetext KurttoFalkner
	waitbutton
	closetext
	turnobject KURTSHOUSE_FALKNER, LEFT
	pause 15
	applymovement KURTSHOUSE_FALKNER, FalknerWalksToYou
	turnobject PLAYER, RIGHT
	turnobject KURTSHOUSE_KURT1, DOWN
	faceplayer
	opentext
	writetext FalknerTalks
	waitbutton
	closetext
	applymovement KURTSHOUSE_FALKNER, FalknerWalksBack
	pause 15
	end
	
.Falknerapproves
	pause 5
	applymovement PLAYER, WalkUpToKurt
	pause 15
	turnobject KURTSHOUSE_FALKNER, DOWN
	showemote EMOTE_SHOCK, KURTSHOUSE_FALKNER, 15
	applymovement KURTSHOUSE_FALKNER, FalknerWalksToYou
	turnobject PLAYER, RIGHT
	opentext
	writetext FalknerTalks2
	waitbutton
	closetext	
	turnobject PLAYER, DOWN
	applymovement KURTSHOUSE_FALKNER, FalknerLeaves
	playsound SFX_EXIT_BUILDING
	disappear KURTSHOUSE_FALKNER
	setevent EVENT_FALKNER_AT_GYM
	pause 15
	turnobject PLAYER, UP
	opentext
	writetext KurtICanMakeBalls
	waitbutton
	verbosegiveitem LURE_BALL
	iffalse .NoRoomForLureBall
	closetext
	setevent EVENT_KURT_GAVE_YOU_LURE_BALL
	setevent EVENT_BRASS_TOWER_BLESSING_QUEST_COMPLETE
	end
	
.NoRoomForLureBall:
	closetext
	end
	
.SceneKurtsHouseNothing:
	checkevent EVENT_BRASS_TOWER_BLESSING_QUEST_COMPLETE
	iftrue .endofscene
	checkevent EVENT_GOT_5F_SAGE_BLESSING
	iftrue .SceneFalknerApproves
.endofscene:
	setmapscene KURTS_HOUSE, 1
	end

.KurtCallback:
	checkevent EVENT_FALKNER_AT_GYM
	iftrue .Falknergone
	return

.Falknergone:
	disappear KURTSHOUSE_FALKNER
	return


Kurt1:
	faceplayer
	opentext
	checkevent EVENT_GOT_5F_SAGE_BLESSING
	iffalse .notdonetower
.GotLureBall:
	checkevent EVENT_GAVE_KURT_RED_APRICORN
	iftrue .GiveLevelBall
	checkevent EVENT_GAVE_KURT_BLU_APRICORN
	iftrue .GiveLureBall
	checkevent EVENT_GAVE_KURT_YLW_APRICORN
	iftrue .GiveMoonBall
	checkevent EVENT_GAVE_KURT_GRN_APRICORN
	iftrue .GiveFriendBall
	checkevent EVENT_GAVE_KURT_WHT_APRICORN
	iftrue .GiveFastBall
	checkevent EVENT_GAVE_KURT_BLK_APRICORN
	iftrue .GiveHeavyBall
	checkevent EVENT_GAVE_KURT_PNK_APRICORN
	iftrue .GiveLoveBall
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	iftrue .CheckApricorns
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_3
	iftrue .CheckApricorns
	writetext UnknownText_0x18e6c9
	waitbutton
.CheckApricorns:
	checkitem RED_APRICORN
	iftrue .AskApricorn
	checkitem BLU_APRICORN
	iftrue .AskApricorn
	checkitem YLW_APRICORN
	iftrue .AskApricorn
	checkitem GRN_APRICORN
	iftrue .AskApricorn
	checkitem WHT_APRICORN
	iftrue .AskApricorn
	checkitem BLK_APRICORN
	iftrue .AskApricorn
	checkitem PNK_APRICORN
	iftrue .AskApricorn
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	iftrue .ThatTurnedOutGreat
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_3
	iftrue .IMakeBallsFromApricorns
	closetext
	end
	
.notdonetower
	writetext KurtHeadToTower
	waitbutton
	closetext
	end

.IMakeBallsFromApricorns:
	writetext UnknownText_0x18e6c9
	waitbutton
	closetext
	end

.AskApricorn:
	writetext UnknownText_0x18e736
	buttonsound
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_3
	special SelectApricornForKurt
	ifequal FALSE, .Cancel
	ifequal BLU_APRICORN, .Blu
	ifequal YLW_APRICORN, .Ylw
	ifequal GRN_APRICORN, .Grn
	ifequal WHT_APRICORN, .Wht
	ifequal BLK_APRICORN, .Blk
	ifequal PNK_APRICORN, .Pnk
; .Red
	setevent EVENT_GAVE_KURT_RED_APRICORN
	jump .GaveKurtApricorns

.Blu:
	setevent EVENT_GAVE_KURT_BLU_APRICORN
	jump .GaveKurtApricorns

.Ylw:
	setevent EVENT_GAVE_KURT_YLW_APRICORN
	jump .GaveKurtApricorns

.Grn:
	setevent EVENT_GAVE_KURT_GRN_APRICORN
	jump .GaveKurtApricorns

.Wht:
	setevent EVENT_GAVE_KURT_WHT_APRICORN
	jump .GaveKurtApricorns

.Blk:
	setevent EVENT_GAVE_KURT_BLK_APRICORN
	jump .GaveKurtApricorns

.Pnk:
	setevent EVENT_GAVE_KURT_PNK_APRICORN
	jump .GaveKurtApricorns

.GaveKurtApricorns:
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
.WaitForApricorns:
	writetext UnknownText_0x18e779
	waitbutton
	closetext
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	pause 15
	special FadeInQuickly
	opentext
	jump .GotLureBall
	end

.Cancel:
	writetext UnknownText_0x18e7bc
	waitbutton
	closetext
	end

.ThatTurnedOutGreat:
	writetext UnknownText_0x18e82a
	waitbutton
.NoRoomForBall:
	closetext
	end

.GiveLevelBall:
	writetext UnknownText_0x18e7fb
	buttonsound
	verbosegiveitem2 LEVEL_BALL, VAR_KURT_APRICORNS
	iffalse .NoRoomForBall
	clearevent EVENT_GAVE_KURT_RED_APRICORN
	jump .ThatTurnedOutGreat

.GiveLureBall:
	writetext UnknownText_0x18e7fb
	buttonsound
	verbosegiveitem2 LURE_BALL, VAR_KURT_APRICORNS
	iffalse .NoRoomForBall
	clearevent EVENT_GAVE_KURT_BLU_APRICORN
	jump .ThatTurnedOutGreat

.GiveMoonBall:
	writetext UnknownText_0x18e7fb
	buttonsound
	verbosegiveitem2 MOON_BALL, VAR_KURT_APRICORNS
	iffalse .NoRoomForBall
	clearevent EVENT_GAVE_KURT_YLW_APRICORN
	jump .ThatTurnedOutGreat

.GiveFriendBall:
	writetext UnknownText_0x18e7fb
	buttonsound
	verbosegiveitem2 FRIEND_BALL, VAR_KURT_APRICORNS
	iffalse .NoRoomForBall
	clearevent EVENT_GAVE_KURT_GRN_APRICORN
	jump .ThatTurnedOutGreat

.GiveFastBall:
	writetext UnknownText_0x18e7fb
	buttonsound
	verbosegiveitem2 FAST_BALL, VAR_KURT_APRICORNS
	iffalse .NoRoomForBall
	clearevent EVENT_GAVE_KURT_WHT_APRICORN
	jump .ThatTurnedOutGreat

.GiveHeavyBall:
	writetext UnknownText_0x18e7fb
	buttonsound
	verbosegiveitem2 HEAVY_BALL, VAR_KURT_APRICORNS
	iffalse .NoRoomForBall
	clearevent EVENT_GAVE_KURT_BLK_APRICORN
	jump .ThatTurnedOutGreat

.GiveLoveBall:
	writetext UnknownText_0x18e7fb
	buttonsound
	verbosegiveitem2 LOVE_BALL, VAR_KURT_APRICORNS
	iffalse .NoRoomForBall
	clearevent EVENT_GAVE_KURT_PNK_APRICORN
	jump .ThatTurnedOutGreat

Falkner:
	faceplayer
	opentext
	writetext FalknerNotDoneTower
	waitbutton
	closetext
	end

KurtsHouseOakPhoto:
	jumptext KurtsHouseOakPhotoText

KurtsHouseLeafeonStatue:
	jumptext KurtsHouseLeafeonStatueText

KurtsHouseBookshelf:
	jumpstd difficultbookshelf

KurtsHouseRadio:
	jumpstd radio2
	
WalkUpToKurt:
	step UP
	step UP
	step RIGHT
	step UP
	step UP
	step_end
	
FalknerWalksToYou:
	step DOWN
	step LEFT
	step_end
	
FalknerWalksBack:
	step RIGHT
	step UP
	step_end
	
FalknerLeaves:
	step DOWN
	step LEFT
	step DOWN
	step DOWN
	step DOWN
	step_end

UnknownText_0x18e6c9:
	text "KURT: I make BALLS"
	line "from APRICORNS."

	para "Collect them from"
	line "trees and bring"
	cont "'em to me."

	para "I'll make BALLS"
	line "out of them."
	done

UnknownText_0x18e736:
	text "KURT: You have an"
	line "APRICORN for me?"

	para "Fine! I'll turn it"
	line "into a BALL."
	done

UnknownText_0x18e779:
	text "KURT: Splendid!"

	para "I'll start working"
	line "right away."
	done

UnknownText_0x18e7bc:
	text "KURT: Oh…"
	line "That's a letdown."
	done

UnknownText_0x18e7fb:
	text "KURT: Ah, <PLAYER>!"
	line "I just finished"
	cont "your BALL. Here!"
	done

UnknownText_0x18e82a:
	text "KURT: That turned"
	line "out great."

	para "Try catching"
	line "#MON with it."
	done


KurtsHouseOakPhotoText:
	text "It's KURT standing"
	line "in the tower with"
	para "a SAGE and a man"
	line "in a CAPTAIN's"
	cont "hat."
	done

KurtsHouseLeafeonStatueText:
	text "It's a statue of"
	line "the forest's pro-"
	cont "tector."
	done
	
FalknerNotDoneTower:
	text "Receive the"
	line "ELDER's blessing"
	cont "and then I will"
	cont "accept your"
	cont "challenge."	
	done
	
KurtTalks:
	text "KURT: Hmm?"
	para "<PLAY_G>,"
	line "I presume?"
	
	para "PROF.OAK told me"
	line "you would be"
	cont "coming."
		
	para "That old coot"
	line "always acts before"
	cont "he thinks…"
	
	para "Anyhow, OAK has"
	line "said good things"
	cont "about you…"
	cont "So that's all I"
	cont "need to know."
	
	para "The best way to"
	line "complete the"
	cont "#DEX would be"
	cont "to take the"
	cont "#MON LEAGUE"
	cont "challenge."
	
	para "There are many"
	line "GYMS across NIHON"

	para "and taking on each"
	line "one will be a"
	cont "difficult task."
	done
	
KurttoFalkner:
	text "FALKNER here"
	line "happens to own the"
	cont "GYM in this town."
	done
	
FalknerTalks:	
	text "FALKNER: Well who"
	line "might you be?"
	
	para "<PLAY_G>, hm?"
	line "What brings you"
	cont "here?"
	
	para "…"
	
	para "Ah, so you're tak-"
	line "ing the #MON"
	cont "League challenge."
	
	para "My name is"
	line "FALKNER."
	
	para "I'm the GYM LEADER"
	line "of this town."
	
	para "If you wish to"
	line "challenge me, you"
	cont "must first prove"
	cont "yourself at the"
	cont "BRASS TOWER."
	
	para "If you receive the"
	line "ELDER's blessing,"
	cont "I will accept your"
	cont "challenge."	
	done
	
FalknerTalks2:
	text "FALKNER: Oh good,"
	line "The ELDER has"
	cont "given you his"
	cont "blessing."
	
	para "Very well, I"
	line "accept your chal-"
	cont "lenge."
	
	para "I shall return to"
	line "the GYM and await"
	cont "for your arrival."
	done
	
KurtHeadToTower:
	text "Head to the"
	line "TOWER."
	
	para "It is north"
	line "from here."
	done

	
KurtICanMakeBalls:
	text "Well done com-"
	line "pleting the tower."
	
	para "OAK was right"
	line "about you…"
	
	para "So I will make"
	line "special #BALLS"
	cont "for you if you"
	cont "bring me APRICORN."
	
	para "Here, I'll give"
	line "one to you now."
	done

KurtsHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  3,  7, PAGOTA_CITY, 10
	warp_event  4,  7, PAGOTA_CITY, 10

	db 0 ; coord events

	db 1 ; bg events
	bg_event  5,  1, BGEVENT_READ, KurtsHouseBookshelf

	db 2 ; object events
	object_event  4,  2, SPRITE_KURT, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Kurt1, EVENT_KURTS_HOUSE_KURT_1
	object_event  6,  2, SPRITE_FALKNER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Falkner, EVENT_KURTS_HOUSE_FALKNER
