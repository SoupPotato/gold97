	const_def 2 ; object constants
	const PAGOTA_TRAINER_SCHOOL_EARL
	const PAGOTA_TRAINER_SCHOOL_GIRL
	const PAGOTA_TRAINER_SCHOOL_GAMEBOY_KID1
	const PAGOTA_TRAINER_SCHOOL_GAMEBOY_KID2
	const PAGOTA_TRAINER_SCHOOL_YOUNGSTER
	const PAGOTA_TRAINER_SCHOOL_POKEDEX

PagotaTrainerSchool_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

AcademyEarl:
	faceplayer
	opentext
	writetext AcademyEarlIntroText
	yesorno
	iffalse .Part1
	writetext AcademyEarlTeachHowToWinText
	yesorno
	iffalse .Done
.Part1:
	writetext AcademyEarlTeachMoreText
	yesorno
	iffalse .Done
	writetext AcademyEarlTeachHowToRaiseWellText
	waitbutton
	closetext
	end

.Done:
	writetext AcademyEarlNoMoreToTeachText
	waitbutton
	closetext
	end

PagotaTrainerSchoolYoungster1Script:
	faceplayer
	opentext
	writetext PagotaTrainerSchoolYoungster1Text
	waitbutton
	closetext
	turnobject PAGOTA_TRAINER_SCHOOL_GIRL, UP
	end

PagotaTrainerSchoolGameboyKid1Script:
	faceplayer
	opentext
	writetext PagotaTrainerSchoolGameboyKid1Text
	waitbutton
	closetext
	turnobject PAGOTA_TRAINER_SCHOOL_GAMEBOY_KID1, DOWN
	end

PagotaTrainerSchoolGameboyKid2Script:
	faceplayer
	opentext
	writetext PagotaTrainerSchoolGameboyKid2Text
	waitbutton
	closetext
	turnobject PAGOTA_TRAINER_SCHOOL_GAMEBOY_KID2, DOWN
	end

PagotaTrainerSchoolYoungster2Script:
	jumptextfaceplayer PagotaTrainerSchoolYoungster2Text

AcademyBlackboard:
	opentext
	writetext AcademyBlackboardText
.Loop:
	loadmenu .BlackboardMenuHeader
	_2dmenu
	closewindow
	ifequal 1, .Poison
	ifequal 2, .Paralysis
	ifequal 3, .Sleep
	ifequal 4, .Burn
	ifequal 5, .Freeze
	closetext
	end

.Poison:
	writetext AcademyPoisonText
	waitbutton
	jump .Loop

.Paralysis:
	writetext AcademyParalysisText
	waitbutton
	jump .Loop

.Sleep:
	writetext AcademySleepText
	waitbutton
	jump .Loop

.Burn:
	writetext AcademyBurnText
	waitbutton
	jump .Loop

.Freeze:
	writetext AcademyFreezeText
	waitbutton
	jump .Loop

.BlackboardMenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 0, 11, 8
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	dn 3, 2 ; rows, columns
	db 5 ; spacing
	dba .Text
	dbw BANK(AcademyBlackboard), 0

.Text:
	db "PSN@"
	db "PAR@"
	db "SLP@"
	db "BRN@"
	db "FRZ@"
	db "QUIT@"

AcademyNotebook:
	opentext
	writetext AcademyNotebookText
	yesorno
	iffalse .Done
	writetext AcademyNotebookText1
	yesorno
	iffalse .Done
	writetext AcademyNotebookText2
	yesorno
	iffalse .Done
	writetext AcademyNotebookText3
	waitbutton
	turnobject PAGOTA_TRAINER_SCHOOL_GIRL, LEFT
	writetext AcademyGirlText_Book
	waitbutton
	turnobject PAGOTA_TRAINER_SCHOOL_GIRL, UP
.Done:
	closetext
	end

AcademyStickerMachine:
; unused
	jumptext AcademyStickerMachineText

AcademyBookshelf:
	jumpstd difficultbookshelf

AcademyEarlSpinMovement:
	turn_head DOWN
	turn_head LEFT
	turn_head UP
	turn_head RIGHT
	turn_head DOWN
	turn_head LEFT
	turn_head UP
	turn_head RIGHT
	turn_head DOWN
	turn_head LEFT
	turn_head UP
	turn_head RIGHT
	turn_head DOWN
	step_end

AcademyEarlIntroText:
	text "Hello!"

	para "Welcome to the"
	line "PAGOTA CITY"
	cont "trainer's school."
	
	para "Want to learn"
	line "how battles work?"
	done

AcademyEarlTeachHowToWinText:
	text "In battle, the"
	line "#MON at the top"
	para "of the list is"
	line "sent out first!"

	para "It's a good"
	line "strategy to put"
	para "some thought into"
	line "which #MON you"
	cont "keep at the top."

	para "Wanna learn more?"
	done

AcademyEarlTeachMoreText:
	text "Do you want to"
	line "know how to raise"
	cont "#MON well?"
	done

AcademyEarlTeachHowToRaiseWellText:
	text "If #MON come"
	line "out in battle even"

	para "briefly, it will"
	line "get EXP. Points."

	para "You can send out"
	line "a weak #MON"
	para "into battle, then"
	line "immediately switch"
	para "it out for a"
	line "stronger #MON."
	para "This way, it still"
	line "can gain EXP."
	done

AcademyEarlNoMoreToTeachText:
	text "You must already"
	line "be an expert on"
	cont "#MON!"
	done

PagotaTrainerSchoolYoungster1Text:
	text "I'm taking notes"
	line "of the teacher's"
	cont "lecture."

	para "I'd better copy"
	line "the stuff on the"
	cont "blackboard too."
	done

PagotaTrainerSchoolGameboyKid1Text:
	text "I traded my best"
	line "#MON to the"
	cont "guy beside me."
	done

PagotaTrainerSchoolGameboyKid2Text:
	text "A #MON you get"
	line "in a trade grows"
	cont "quickly."

	para "But if you don't"
	line "have the right GYM"

	para "BADGE, they may"
	line "disobey you."
	done

PagotaTrainerSchoolYoungster2Text:
	text "A #MON holding"
	line "a BERRY will heal"
	cont "itself in battle."

	para "Many other items"
	line "can be held by"
	cont "#MON…"

	para "It sure is tough"
	line "taking notes…"
	done

AcademyBlackboardText:
	text "The blackboard"
	line "describes #MON"

	para "status changes in"
	line "battle."
	done

AcademyBlackboardText2:
; unused
	text "Read which topic?"
	done

AcademyPoisonText:
	text "If poisoned, a"
	line "#MON steadily"
	cont "loses HP."

	para "Poison lingers"
	line "after the battle,"

	para "and HP is lost as"
	line "you walk."

	para "To cure it, use an"
	line "ANTIDOTE."
	done

AcademyParalysisText:
	text "Paralysis reduces"
	line "speed and may"
	cont "prevent movement."

	para "It remains after"
	line "battle, so use"
	cont "a PARLYZ HEAL."
	done

AcademySleepText:
	text "If asleep, your"
	line "#MON can't make"
	cont "a move."

	para "A sleeping #MON"
	line "doesn't wake up"
	cont "after battle."

	para "Wake it up with"
	line "an AWAKENING."
	done

AcademyBurnText:
	text "A burn steadily"
	line "consumes HP."

	para "It also reduces"
	line "attack power."

	para "A burn lingers"
	line "after battle."

	para "Use a BURN HEAL as"
	line "the cure."
	done

AcademyFreezeText:
	text "If your #MON is"
	line "frozen, it can't"
	cont "do a thing."

	para "It remains frozen"
	line "after battle."

	para "Thaw it out with"
	line "an ICE HEAL."
	done

AcademyNotebookText:
	text "It's this kid's"
	line "notebook…"

	para "Catch #MON"
	line "using # BALLS."

	para "Up to six can be"
	line "in your party."

	para "Keep reading?"
	done

AcademyNotebookText1:
	text "Before throwing a"
	line "# BALL, weaken"
	cont "the target first."

	para "A poisoned or"
	line "burned #MON is"
	cont "easier to catch."

	para "Keep reading?"
	done

AcademyNotebookText2:
	text "Some moves may"
	line "cause confusion."

	para "Confusion may make"
	line "a #MON attack"
	cont "itself."

	para "Leaving battle"
	line "clears up any"
	cont "confusion."

	para "Keep reading?"
	done

AcademyNotebookText3:
	text "People who catch"
	line "and use #MON"

	para "in battle are"
	line "#MON trainers."

	para "They are expected"
	line "to visit #MON"

	para "GYMS and defeat"
	line "other trainers."

	para "The next page"
	line "is… Blank!"
	done
	
AcademyGirlText_Book:
	text "Girl: E-he-he…"

	para "I haven't written"
	line "anymore…"
	done
	

AcademyStickerMachineText:
	text "This super machine"
	line "prints data out as"

	para "stickers!"
	done

PagotaTrainerSchool_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  3, 15, PAGOTA_CITY, 6
	warp_event  4, 15, PAGOTA_CITY, 6

	db 0 ; coord events

	db 4 ; bg events
	bg_event  0,  1, BGEVENT_READ, AcademyBookshelf
	bg_event  1,  1, BGEVENT_READ, AcademyBookshelf
	bg_event  3,  0, BGEVENT_READ, AcademyBlackboard
	bg_event  4,  0, BGEVENT_READ, AcademyBlackboard

	db 6 ; object events
	object_event  4,  2, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, AcademyEarl, -1
	object_event  2,  5, SPRITE_BETA_GIRL, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, PagotaTrainerSchoolYoungster1Script, -1
	object_event  3, 11, SPRITE_GAMEBOY_KID, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PagotaTrainerSchoolGameboyKid1Script, -1
	object_event  4, 11, SPRITE_GAMEBOY_KID, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, PagotaTrainerSchoolGameboyKid2Script, -1
	object_event  4,  7, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PagotaTrainerSchoolYoungster2Script, -1
	object_event  2,  4, SPRITE_POKEDEX, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AcademyNotebook, -1
