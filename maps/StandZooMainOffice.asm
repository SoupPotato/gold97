	const_def 2 ; object constants
	const SAFARIOFFICE_SUPERNERD
	const SAFARIOFFICE_ROCKER
	const SAFARIOFFICE_POKEFAN_M

StandZooMainOffice_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	

SafariOfficeSuperNerdScript:
	faceplayer
	opentext
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .SafariOfficeSuperNerdRocketsGone
	writetext SafariOfficeSuperNerdText
	waitbutton
	closetext
	end
	
.SafariOfficeSuperNerdRocketsGone
	writetext SafariOfficeSuperNerdText2
	waitbutton
	closetext
	end
	
SafariOfficeRockerScript:
	faceplayer
	opentext
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .SafariOfficeRockerRocketsGone
	writetext SafariOfficeRockerText
	waitbutton
	closetext
	end
	
.SafariOfficeRockerRocketsGone
	writetext SafariOfficeRockerText2
	waitbutton
	closetext
	end
	
SafariOfficePokefanMScript:
	faceplayer
	opentext
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .SafariOfficePokefanMRocketsGone
	writetext SafariOfficePokefanMText
	waitbutton
	closetext
	end
	
.SafariOfficePokefanMRocketsGone
	writetext SafariOfficePokefanMText2
	waitbutton
	closetext
	end

SafariOfficeSuperNerdText:
	text "Hello. This is the"
	line "office for the"
	cont "STAND CITY ZOO."
	para "We are very busy"
	line "working on"
	para "researching why"
	line "our #MON are"
	cont "feeling ill."
	para "The ZOO is closed"
	line "until further"
	cont "notice."
	done
	
SafariOfficeSuperNerdText2:
	text "Welcome to the"
	line "STAND CITY ZOO"
	cont "office!"
	para "We are hard at"
	line "work examining the"
	para "data we gather"
	line "from our #MON"
	para "in order to learn"
	line "more about them."
	done
	
SafariOfficeRockerText:
	text "It seems that the"
	line "#MON are"
	para "suffering from"
	line "headaches…"
	para "That's the inital"
	line "symptom."
	done

SafariOfficeRockerText2:
	text "We frequently take"
	line "the #MON over"
	para "to NATIONAL PARK"
	line "so they have a"
	para "chance to spend"
	line "time outside of"
	cont "the exhibit."
	done
	
SafariOfficePokefanMText:
	text "I've never seen"
	line "anything like"
	cont "this…"
	done

SafariOfficePokefanMText2:
	text "The research from"
	line "this ZOO has led"
	para "to many break-"
	line "throughs on proper"
	para "nutrition for"
	line "#MON."
	done

StandZooMainOffice_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, STAND_CITY, 2
	warp_event  3,  7, STAND_CITY, 2

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  5,  6, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SafariOfficeSuperNerdScript, -1
	object_event 14,  4, SPRITE_ROCKER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SafariOfficeRockerScript, -1
	object_event 10,  7, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SafariOfficePokefanMScript, -1

