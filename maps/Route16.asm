Route16_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks




CyclingRoadSign:
	jumptext CyclingRoadSignText

CyclingRoadSignText:
	text "PRIVATE PROPERTY"

	para "…The sign is"
	line "old and faded…"
	done

Route16_MapEvents:
	db 0, 0 ; filler

	db 5 ; warp events
	warp_event  7,  5, UNDERGROUND_PATH, 2
	warp_event  2,  3, ROUTE_16_GATE, 3
	warp_event  2,  4, ROUTE_16_GATE, 4
	warp_event  1, 16, ILEX_FOREST, 5
	warp_event  1, 17, ILEX_FOREST, 6

	db 0 ; coord events

	db 1 ; bg events
	bg_event  9,  7, BGEVENT_READ, CyclingRoadSign

	db 0 ; object events
