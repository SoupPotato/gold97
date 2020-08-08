	const_def 2 ; object constants
	const KANTOHOUSE_4_FISHING_GURU

KantoHouse4_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	
KantoHouse4FishingGuru:
	faceplayer
	opentext
	checkevent EVENT_LAKE_OF_RAGE_ELIXIR_ON_STANDBY
	iftrue .GetReward
	checkevent EVENT_LAKE_OF_RAGE_ASKED_FOR_MAGIKARP
	iftrue .AskedForMagikarp
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .ClearedRocketHideout
	checkevent EVENT_LAKE_OF_RAGE_EXPLAINED_WEIRD_MAGIKARP
	iftrue .ExplainedHistory
	writetext MagikarpLengthRaterText_LakeOfRageHistory
	waitbutton
	closetext
	setevent EVENT_LAKE_OF_RAGE_EXPLAINED_WEIRD_MAGIKARP
	end

.ExplainedHistory:
	writetext MagikarpLengthRaterText_MenInBlack
	waitbutton
	closetext
	end

.ClearedRocketHideout:
	writetext MagikarpLengthRaterText_WorldsLargestMagikarp
	waitbutton
	closetext
	setevent EVENT_LAKE_OF_RAGE_ASKED_FOR_MAGIKARP
	end

.AskedForMagikarp:
	writebyte MAGIKARP
	special FindPartyMonThatSpecies
	iffalse .ClearedRocketHideout
	writetext MagikarpLengthRaterText_YouHaveAMagikarp
	waitbutton
	special CheckMagikarpLength
	ifequal MAGIKARPLENGTH_NOT_MAGIKARP, .NotMagikarp
	ifequal MAGIKARPLENGTH_REFUSED, .Refused
	ifequal MAGIKARPLENGTH_TOO_SHORT, .TooShort
	; MAGIKARPLENGTH_BEAT_RECORD
	jump .GetReward

.GetReward:
	writetext MagikarpLengthRaterText_Memento
	buttonsound
	verbosegiveitem ELIXER
	iffalse .NoRoom
	writetext MagikarpLengthRaterText_Bonus
	waitbutton
	closetext
	clearevent EVENT_LAKE_OF_RAGE_ELIXIR_ON_STANDBY
	end

.NoRoom:
	closetext
	setevent EVENT_LAKE_OF_RAGE_ELIXIR_ON_STANDBY
	end

.TooShort:
	writetext MagikarpLengthRaterText_TooShort
	waitbutton
	closetext
	end

.NotMagikarp:
	writetext MagikarpLengthRaterText_NotMagikarp
	waitbutton
	closetext
	end

.Refused:
	writetext MagikarpLengthRaterText_Refused
	waitbutton
	closetext
	end

LakeOfRageMagikarpHouseUnusedRecordSign:
; unused
	jumptext LakeOfRageMagikarpHouseUnusedRecordText

MagikarpHouseBookshelf:
	jumpstd difficultbookshelf

MagikarpLengthRaterText_LakeOfRageHistory:
	text "You should never"
	line "see this dialogue."
	para "If you are, you've"
	line "either stumbled"
	para "upon a glitch, or"
	line "you're sequence"
	cont "breaking."
	para "This text only"
	line "displays if you"
	para "talk to this guy"
	line "before beating"
	para "TEAM ROCKET in the"
	line "RADIO TOWER."
	para "And you shouldn't"
	line "be here if you"
	cont "haven't done that."
	para "The developer"
	line "didn't feel like"
	para "changing the"
	line "script for this"
	para "guy since it's not"
	line "really necessary."
	para "So what are you up"
	line "to here?"
	para "You should go back"
	line "and do what you're"
	cont "supposed to do."
	done

MagikarpLengthRaterText_MenInBlack:
	text "Get out of here,"
	line "kid."
	done

MagikarpLengthRaterText_WorldsLargestMagikarp:
	text "Ever since I was a"
	line "boy, I've loved"
	cont "MAGIKARP."

	para "I may yet realize"
	line "my dream of see-"
	cont "ing the world's"
	cont "largest MAGIKARP."

	para "Do you have a ROD?"
	line "Please help me if"
	cont "you do."
	done

MagikarpLengthRaterText_YouHaveAMagikarp:
	text "Ah, you have a"
	line "MAGIKARP! Let's"

	para "see how big that"
	line "baby is."
	done

MagikarpLengthRaterText_Memento:
	text "Wow! This one is"
	line "outstanding!"

	para "I tip my hat to"
	line "you!"

	para "Take this as a"
	line "memento!"
	done

MagikarpLengthRaterText_Bonus:
	text "The record is the"
	line "important thing."

	para "Think of that as"
	line "a bonus!"
	done

MagikarpLengthRaterText_TooShort:
	text "Wow! This one is"
	line "outstanding!"

	para "…I wish I could"
	line "say that, but I've"

	para "seen a bigger one"
	line "before."
	done

MagikarpLengthRaterText_NotMagikarp:
	text "What? That's not a"
	line "MAGIKARP!"
	done

MagikarpLengthRaterText_Refused:
	text "Oh… So you didn't"
	line "get one good"

	para "enough to show me?"
	line "Maybe next time."
	done

LakeOfRageMagikarpHouseUnusedRecordText:
	text "CURRENT RECORD"

	para "@"
	text_ram wStringBuffer3
	text " caught by"
	line "@"
	text_ram wStringBuffer4
	text_end

	text_end ; unused


KantoHouse4_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, KANTO_REGION, 27
	warp_event  5,  7, KANTO_REGION, 27

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  4,  3, SPRITE_FISHING_GURU, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KantoHouse4FishingGuru, -1
