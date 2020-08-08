	const_def 2 ; object constants
	const CERULEANTRADESPEECHHOUSE_GRANNY
	const CERULEANTRADESPEECHHOUSE_GRAMPS
	const CERULEANTRADESPEECHHOUSE_RHYDON
	const CERULEANTRADESPEECHHOUSE_ZUBAT

RyukyuTradeSpeechHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

RyukyuTradeSpeechHouseGrannyScript:
	jumptextfaceplayer RyukyuTradeSpeechHouseGrannyText

RyukyuTradeSpeechHouseGrampsScript:
	jumptextfaceplayer RyukyuTradeSpeechHouseGrampsText

RyukyuTradeSpeechHouseRhydonScript:
	opentext
	writetext RyukyuTradeSpeechHouseRhydonText
	cry KANGASKHAN
	waitbutton
	closetext
	end

RyukyuTradeSpeechHouseZubatScript:
	opentext
	writetext RyukyuTradeSpeechHouseZubatText
	cry ZUBAT
	waitbutton
	;verbosegiveitem RED_SCALE;
	;waitbutton;
	closetext
	end

RyukyuTradeSpeechHouseGrannyText:
	text "My husband lives"
	line "happily with #-"
	cont "MON he got through"
	cont "trades."
	done

RyukyuTradeSpeechHouseGrampsText:
	text "Ah… I'm so happy…"
	done

RyukyuTradeSpeechHouseRhydonText:
	text "KANGASKHAN: Garu"
	line "garuu."
	done

RyukyuTradeSpeechHouseZubatText:
	text "ZUBAT: Zuba zubaa."
	done

RyukyuTradeSpeechHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, RYUKYU_CITY, 7
	warp_event  5,  7, RYUKYU_CITY, 7

	db 0 ; coord events

	db 0 ; bg events

	db 4 ; object events
	object_event  2,  4, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, RyukyuTradeSpeechHouseGrannyScript, -1
	object_event  1,  2, SPRITE_GRAMPS, SPRITEMOVEDATA_WANDER, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, RyukyuTradeSpeechHouseGrampsScript, -1
	object_event  5,  2, SPRITE_RHYDON, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, RyukyuTradeSpeechHouseRhydonScript, -1
	object_event  8,  6, SPRITE_ZUBAT, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RyukyuTradeSpeechHouseZubatScript, -1