	const_def 2 ; object constants
	const Route110SandstormHouse_GRANNY

Route110SandstormHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

SandstormHouseWoman:
	faceplayer
	opentext
	checkevent EVENT_GOT_TM37_SANDSTORM
	iftrue .AlreadyGotItem
	special GetFirstPokemonHappiness
	writetext SandstormHouseWomanText1
	buttonsound
	ifgreater 150 - 1, .Loyal
	jump .Disloyal

.Loyal:
	writetext SandstormHouseWomanLoyalText
	buttonsound
	verbosegiveitem TM_SANDSTORM
	iffalse .Done
	setevent EVENT_GOT_TM37_SANDSTORM
.AlreadyGotItem:
	writetext SandstormHouseSandstormDescription
	waitbutton
.Done:
	closetext
	end

.Disloyal:
	writetext SandstormHouseWomanDisloyalText
	waitbutton
	closetext
	end

SandstormHouseBookshelf:
	jumpstd magazinebookshelf

SandstormHouseWomanText1:
	text "What is the"
	line "ultimate goal for"
	para "you and your"
	line "#MON?"

	para "NIHON LEAGUE?"

	para "Are your #MON"
	line "loyal enough for"
	cont "you to win?"

	para "Let me see…"
	done

SandstormHouseWomanLoyalText:
	text "Ah! Your #MON"
	line "trusts you very"
	cont "much."

	para "It's nice to see a"
	line "good trainer."

	para "Here. A gift for"
	line "your journey."
	done

SandstormHouseSandstormDescription:
	text "TM37 happens to be"
	line "SANDSTORM."

	para "It's a move that"
	line "inflicts damage on"
	cont "both battlers."

	para "It's for advanced"
	line "trainers only."

	para "Use it if you"
	line "dare. Good luck!"
	done

SandstormHouseWomanDisloyalText:
	text "If it doesn't come"
	line "to trust you some"

	para "more, it could be"
	line "tough going."

	para "Trust is the tie"
	line "that binds #MON"
	cont "and trainers."
	done

Route110SandstormHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, ROUTE_110, 3
	warp_event  5,  7, ROUTE_110, 3

	db 0 ; coord events

	db 2 ; bg events
	bg_event  0,  0, BGEVENT_READ, SandstormHouseBookshelf
	bg_event  0,  0, BGEVENT_READ, SandstormHouseBookshelf

	db 1 ; object events
	object_event  2,  4, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SandstormHouseWoman, -1
