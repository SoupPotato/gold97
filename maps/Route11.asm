	const_def 2 ; object constants


Route11_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks




Route11Sign:
	jumptext Route11SignText



Route11HiddenRevive:
	hiddenitem REVIVE, EVENT_ROUTE_11_HIDDEN_REVIVE


Route11SignText:
	text "ROUTE 11"
	done

Route11_MapEvents:
	db 0, 0 ; filler

	db 0 ; warp events

	db 0 ; coord events

	db 2 ; bg events
	bg_event  3,  7, BGEVENT_READ, Route11Sign
	bg_event 32,  5, BGEVENT_ITEM, Route11HiddenRevive

	db 0 ; object events
