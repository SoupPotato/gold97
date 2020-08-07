	const_def 2 ; object constants
	const VIOLETKYLESHOUSE_POKEFAN_M
	const VIOLETKYLESHOUSE_KYLE

TeknosKylesHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TeknosKylesHousePokefanMScript:
	jumptextfaceplayer TeknosKylesHousePokefanMText

Kyle:
	faceplayer
	opentext
	trade NPC_TRADE_KYLE
	waitbutton
	closetext
	end

TeknosKylesHousePokefanMText:
	text "A #MON you get"
	line "in a trade grows"
	cont "quickly."

	para "But if you don't"
	line "have the right GYM"

	para "BADGE, they may"
	line "disobey you."
	done

TeknosKylesHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, TEKNOS_CITY, 13
	warp_event  5,  7, TEKNOS_CITY, 13

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  1,  2, SPRITE_POKEFAN_F, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TeknosKylesHousePokefanMScript, -1
	object_event  7,  3, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 2, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Kyle, -1
