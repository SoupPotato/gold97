	const_def 2 ; object constants
	const ROUTE19_SWIMMER_GIRL
	const ROUTE19_SWIMMER_GUY2
	const ROUTE19_SWIMMER_GUY3
	const ROUTE19_FISHER1
	const ROUTE19_FISHER2

Route19_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TrainerSwimmerfDawn:
	trainer SWIMMERF, DAWN, EVENT_BEAT_SWIMMERF_DAWN, SwimmerfDawnSeenText, SwimmerfDawnBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerfDawnAfterBattleText
	waitbutton
	closetext
	end


TrainerSwimmermJerome:
	trainer SWIMMERM, JEROME, EVENT_BEAT_SWIMMERM_JEROME, SwimmermJeromeSeenText, SwimmermJeromeBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermJeromeAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmermTucker:
	trainer SWIMMERM, TUCKER, EVENT_BEAT_SWIMMERM_TUCKER, SwimmermTuckerSeenText, SwimmermTuckerBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermTuckerAfterBattleText
	waitbutton
	closetext
	end

Route19Fisher1Script:
	jumptextfaceplayer Route19Fisher1Text


Route19Fisher2Script:
	jumptextfaceplayer Route19Fisher2Text


Route19Sign:
	jumptext Route19SignText


SwimmermTuckerSeenText:
	text "Pant, pant…"
	line "Just… a little…"

	para "farther… to…"
	line "YORON…"
	done

SwimmermTuckerBeatenText:
	text "I'm drowning!"
	done

SwimmermTuckerAfterBattleText:
	text "I… asked my girl-"
	line "friend to swim to"
	cont "YORON… Gasp…"
	done

SwimmerfDawnSeenText:
	text "I'm disgusted by"
	line "wimpy people!"
	done

SwimmerfDawnBeatenText:
	text "I could beat you"
	line "at swimming…"
	done

SwimmerfDawnAfterBattleText:
	text "It's a quick swim"
	line "to YORON CITY…"

	para "Sheesh, some big"
	line "man my boyfriend"

	para "is! What a wimp!"
	done

SwimmermJeromeSeenText:
	text "Swimming?"
	line "It's my favorite"
	cont "thing."
	done

SwimmermJeromeBeatenText:
	text "I thought I could"
	line "win."
	done

SwimmermJeromeAfterBattleText:
	text "I'm great at"
	line "swimming, and I"
	cont "love the sea!"
	done

Route19Fisher1Text:
	text "The FISHERS who"
	line "say the east side"
	para "of the STRAIT is"
	line "the best fishing"
	cont "spot are wrong."
	para "The FISHERS who"
	line "say the west side"
	para "of the STRAIT is"
	line "the best fishing"
	cont "spot are wrong."
	para "It's here in the"
	line "middle that's the"
	cont "best spot!"
	done

Route19Fisher2Text:
	text "This here is"
	line "definitely the"
	cont "best spot."
	done


Route19SignText:
	text "KERAMA STRAIT"

	para "West to YORON CITY"
	done


Route19_MapEvents:
	db 0, 0 ; filler

	db 0 ; warp events

	db 0 ; coord events

	db 1 ; bg events
	bg_event 58, 11, BGEVENT_READ, Route19Sign

	db 5 ; object events
	object_event 19,  9, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerSwimmerfDawn, -1
	object_event 46,  5, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerSwimmermJerome, -1
	object_event 11, 11, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerSwimmermTucker, -1
	object_event 27,  7, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 1, Route19Fisher1Script, -1
	object_event 29,  6, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_RIGHT, 1, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 1, Route19Fisher2Script, -1
