	const_def 2 ; object constants
	const PLAYERSHOUSE2F_CONSOLE
	const PLAYERSHOUSE2F_DOLL_1
	const PLAYERSHOUSE2F_DOLL_2
	const PLAYERSHOUSE2F_BIG_DOLL

PlayersHouse2F_MapScripts:
	db 0 ; scene scripts

	db 2 ; callbacks
	callback MAPCALLBACK_NEWMAP, .InitializeRoom
	callback MAPCALLBACK_TILES, .SetSpawn

; unused
.Null:
	end

.InitializeRoom:
	special ToggleDecorationsVisibility
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_8
	checkevent EVENT_INITIALIZED_EVENTS
	iftrue .SkipInitialization
	jumpstd initializeevents
	return

.SkipInitialization:
	return

.SetSpawn:
	special ToggleMaptileDecorations
	return

	db 0, 0, 0 ; filler

Doll1Script:
	describedecoration DECODESC_LEFT_DOLL

Doll2Script:
	describedecoration DECODESC_RIGHT_DOLL

BigDollScript:
	describedecoration DECODESC_BIG_DOLL

GameConsoleScript:
	describedecoration DECODESC_CONSOLE

PlayersHousePosterScript:
	conditional_event EVENT_PLAYERS_ROOM_POSTER, .Script

.Script:
	describedecoration DECODESC_POSTER

PlayersHouseRadioScript:
	checkevent EVENT_GOT_A_POKEMON_FROM_OAK
	iftrue .NormalRadio
	opentext
	writetext PlayersRadioText1
	waitbutton
	closetext
	end

.NormalRadio:
	jumpstd radio1

.AbbreviatedRadio:
	opentext
	writetext PlayersRadioText4
	pause 45
	closetext
	end

PlayersHouseBookshelfScript:
	jumpstd picturebookshelf

PlayersHousePCScript:
	checkevent EVENT_GOT_A_POKEMON_FROM_OAK
	iftrue .PlayersHousePC2
	opentext
	writetext PlayersRadioText2
	waitbutton
	closetext
	end
.Warp:
	warp NONE, 0, 0
	end

.PlayersHousePC2
	opentext
	special PlayersHousePC
	iftrue .Warp
	closetext
	end
PlayersRadioText1:
	text "<PLAY_G> turned"
	line "on the radio."
	
	para "…"

	para "You're listening"
	line "to JOPM, the"
	para "#MON broadcast"
	line "station!"
	
	para "Coming up next is"
	line "#MON News!"
	
	para "… World famous"
	line "#MON researcher"
	para "PROF. OAK has"
	line "disappeared from"
	cont "KANTO!"
	
	para "Although some"
	line "consider he may"
	para "have moved in"
	line "search of a new"
	para "place to study,"
	line "there is also"
	para "the possibility"
	line "he was involved"
	para "in some sort of"
	line "incident."
	
	para "Concerned parties"
	line "are very worried."
	
	para "…"
	
	para "And that was"
	line "#MON News."
	
	para "…"
	
	
	
	done

PlayersRadioText2:
	text "<PLAY_G> turned"
	line "on the PC."
	
	para "What's this?"
	line "A new email?"
	
	para "…"
	
	para "I hope you'll"
	line "excuse the sudden"
	para "email, but there's"
	line "something that I"
	para "would like to"
	line "entrust you with."
	
	para "Won't you come by"
	line "to collect it?"
	
	para "#MON researcher"
	line "OAK"
	
	done

PlayersRadioText3:
	text "This is DJ MARY,"
	line "your co-host!"
	done

PlayersRadioText4:
	text "#MON!"
	line "#MON CHANNEL…"
	done

PlayersHouse2F_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  7,  0, PLAYERS_HOUSE_1F, 3

	db 0 ; coord events

	db 4 ; bg events
	bg_event  2,  1, BGEVENT_UP, PlayersHousePCScript
	bg_event  3,  1, BGEVENT_READ, PlayersHouseRadioScript
	bg_event  5,  1, BGEVENT_READ, PlayersHouseBookshelfScript
	bg_event  6,  0, BGEVENT_IFSET, PlayersHousePosterScript

	db 4 ; object events
	object_event  4,  2, SPRITE_CONSOLE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GameConsoleScript, EVENT_PLAYERS_HOUSE_2F_CONSOLE
	object_event  4,  4, SPRITE_DOLL_1, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Doll1Script, EVENT_PLAYERS_HOUSE_2F_DOLL_1
	object_event  5,  4, SPRITE_DOLL_2, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Doll2Script, EVENT_PLAYERS_HOUSE_2F_DOLL_2
	object_event  0,  1, SPRITE_BIG_DOLL, SPRITEMOVEDATA_BIGDOLL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BigDollScript, EVENT_PLAYERS_HOUSE_2F_BIG_DOLL
