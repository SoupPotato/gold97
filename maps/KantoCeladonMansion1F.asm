	const_def 2 ; object constants
	const CELADONMANSION1F_GRANNY
	const CELADONMANSION1F_GROWLITHE1
	const CELADONMANSION1F_CLEFAIRY
	const CELADONMANSION1F_GROWLITHE2

KantoCeladonMansion1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

KantoCeladonMansionManager:
	jumptextfaceplayer KantoCeladonMansionManagerText

KantoCeladonMansion1FMeowth:
	faceplayer
	opentext
	writetext KantoCeladonMansion1FMeowthText
	cry PIDGEY
	waitbutton
	closetext
	end

KantoCeladonMansion1FClefairy:
	faceplayer
	opentext
	writetext KantoCeladonMansion1FClefairyText
	cry CLEFAIRY
	waitbutton
	closetext
	end

KantoCeladonMansion1FNidoranF:
	faceplayer
	opentext
	writetext KantoCeladonMansion1FNidoranFText
	cry NIDORAN_F
	waitbutton
	closetext
	end

KantoCeladonMansionManagersSuiteSign:
	jumptext KantoCeladonMansionManagersSuiteSignText

KantoCeladonMansion1FBookshelf:
	jumpstd picturebookshelf

KantoCeladonMansionManagerText:
	text "My dear #MON"
	line "keep me company,"

	para "so I don't ever"
	line "feel lonely."
	done

KantoCeladonMansion1FMeowthText:
	text "PIDGEY: Pii!"
	done

KantoCeladonMansion1FClefairyText:
	text "CLEFAIRY: Clef"
	line "cleff!"
	done

KantoCeladonMansion1FNidoranFText:
	text "NIDORAN: Kya"
	line "kyaoo!"
	done

KantoCeladonMansionManagersSuiteSignText:
	text "KANTO MANSION"
	line "MANAGER'S SUITE"
	done

KantoCeladonMansion1F_MapEvents:
	db 0, 0 ; filler

	db 5 ; warp events
	warp_event  4, 11, KANTO_REGION, 2
	warp_event  5, 11, KANTO_REGION, 14
	warp_event  4,  0, KANTO_REGION, 3
	warp_event  2,  0, KANTO_CELADON_MANSION_2F, 1
	warp_event  7,  0, KANTO_CELADON_MANSION_2F, 4

	db 0 ; coord events

	db 3 ; bg events
	bg_event  4,  9, BGEVENT_UP, KantoCeladonMansionManagersSuiteSign
	bg_event  3,  3, BGEVENT_READ, KantoCeladonMansion1FBookshelf
	bg_event  2,  3, BGEVENT_READ, KantoCeladonMansion1FBookshelf

	db 4 ; object events
	object_event  1,  5, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KantoCeladonMansionManager, -1
	object_event  2,  7, SPRITE_BIRD, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KantoCeladonMansion1FMeowth, -1
	object_event  4,  5, SPRITE_MONSTER, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KantoCeladonMansion1FNidoranF, -1
	object_event  0,  8, SPRITE_FAIRY, SPRITEMOVEDATA_SPINRANDOM_SLOW, 2, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, KantoCeladonMansion1FClefairy, -1
