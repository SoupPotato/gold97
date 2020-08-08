	const_def 2 ; object constants
	const CELADONCAFE_SUPER_NERD
	const CELADONCAFE_FISHER1

KantoLeftoversHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

KantoLeftoversHouseChef:
	checkevent EVENT_JASMINE_EXPLAINED_AMPHYS_SICKNESS
	iftrue .TrashEmpty
	faceplayer
	opentext
	writetext KantoLeftoversHouseChefText1
	waitbutton
	verbosegiveitem LEFTOVERS
	iffalse .PackFull
	closetext
	setevent EVENT_JASMINE_EXPLAINED_AMPHYS_SICKNESS
	end

.PackFull:
	closetext
	end

.TrashEmpty:
	faceplayer
	opentext
	writetext AlreadyGotLeftovers
	waitbutton
	closetext
	end
	
KantoLeftoversHouseFisher1:
	jumptextfaceplayer KantoLeftoversHouseFisher1Text
	
KantoLeftoversHouseFisher1Text:
	text "I run the GAME"
	line "CORNER."
	para "Test your luck and"
	line "you could be a big"
	cont "winner!"
	done
	
KantoLeftoversHouseChefText1:
	text "I couldn't finish"
	line "my lunch."
	para "Your #MON might"
	line "want it."
	done

AlreadyGotLeftovers:
	text "I don't have"
	line "anything else to"
	cont "give you."
	done

FoundLeftoversText:
	text "<PLAYER> found"
	line "@"
	text_ram wStringBuffer3
	text "!"
	done

NoRoomForLeftoversText:
	text "But <PLAYER> can't"
	line "hold another item…"
	done

KantoLeftoversHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, KANTO_REGION, 9
	warp_event  5,  7, KANTO_REGION, 9

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  8,  3, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, KantoLeftoversHouseChef, -1
	object_event  6,  5, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KantoLeftoversHouseFisher1, -1
	