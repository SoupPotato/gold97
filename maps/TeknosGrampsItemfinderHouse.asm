	const_def 2 ; object constants
	const HOUSE_GRAMPS
	const HOUSE_TWIN

TeknosGrampsItemfinderHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

EcruteakItemfinderGuy:
	faceplayer
	opentext
	checkevent EVENT_GOT_ITEMFINDER
	iftrue .itemfinder
	writetext EcruteakItemfinderAdventureText
	yesorno
	iffalse .no
	writetext EcruteakItemfinderTrueSpiritText
	buttonsound
	verbosegiveitem ITEMFINDER
	setevent EVENT_GOT_ITEMFINDER
.itemfinder:
	writetext ItemfinderExplanationText
	waitbutton
	closetext
	end

.no:
	writetext EcruteakItemfinderToEachHisOwnText
	waitbutton
	closetext
	end

EcruteakHistoryBook:
	faceplayer
	opentext
	writetext EcruteakHistoryBookText
	waitbutton
	closetext
	end


ItemFinderHouseRadio:
	jumpstd radio2

EcruteakItemfinderAdventureText:
	text "I can't thank you"
	line "enough for finding"
	cont "my granddaughter!"
	para "She needs to be"
	line "more mindful in"
	para "the future, but"
	line "right now I'm"
	para "just glad she's"
	line "okay!"
	para "You handled"
	line "yourself very well"
	cont "in the MINE."
	para "If you know where"
	line "to look, you can"
	para "find a lot of"
	line "interesting items"
	para "hidden in caves"
	line "like that."
	para "If you want, I can"
	line "give you something"
	para "that could help"
	line "you find more"
	cont "items."
	done

EcruteakItemfinderTrueSpiritText:
	text "Here you go! Take"
	line "this with you."
	done

ItemfinderExplanationText:
	text "There are many"
	line "items lying about"

	para "that aren't ob-"
	line "vious."

	para "Use ITEMFINDER to"
	line "check if there is"

	para "an item on the"
	line "ground near you."

	para "It doesn't show"
	line "the exact spot,"

	para "so you'll have to"
	line "look yourself."
	done

EcruteakItemfinderToEachHisOwnText:
	text "You sure? I think"
	line "you'd find this"
	cont "useful."
	done

EcruteakHistoryBookText:
	text "Grandpa doesn't"
	line "want me playing in"
	cont "the MINE."
	para "I guess that makes"
	line "sense. He just"
	para "wants me to be"
	line "safe."
	done


TeknosGrampsItemfinderHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, TEKNOS_CITY, 8
	warp_event  5,  7, TEKNOS_CITY, 8

	db 0 ; coord events

	db 1 ; bg events
	bg_event  4,  1, BGEVENT_READ, ItemFinderHouseRadio

	db 2 ; object events
	object_event  4,  4, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, EcruteakItemfinderGuy, EVENT_ECRUTEAK_GYM_GRAMPS
	object_event  2,  6, SPRITE_TWIN, SPRITEMOVEDATA_WANDER, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, EcruteakHistoryBook, EVENT_WISE_TRIOS_ROOM_WISE_TRIO_2