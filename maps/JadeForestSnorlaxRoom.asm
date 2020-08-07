	const_def 2 ; object constants
	const CERULEAN_GYM_SNORLAX

JadeForestSnorlaxRoom_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks


VermilionSnorlax:
	opentext
	writetext SnorlaxText
	yesorno
	iffalse DontDisturbSnorlaxScript
	writetext SnorlaxText2
	waitbutton
	closetext
	pause 10
	opentext
	writetext SnorlaxText3
	cry SNORLAX
	pause 15
	closetext
	setevent EVENT_VERMILION_CITY_SNORLAX
	loadwildmon SNORLAX, 30
	startbattle
	disappear CERULEAN_GYM_SNORLAX
	reloadmapafterbattle
	end
	
DontDisturbSnorlaxScript:
	writetext SnorlaxAloneText
	waitbutton
	closetext
	end
	
SnorlaxAloneText:
	text "Better leave it"
	line "alone…"
	done
	
SnorlaxText:
	text "This SNORLAX looks"
	line "kind of restless."
	para "…Want to disturb"
	line "it?"
	done
	
SnorlaxText2:
	text "You pushed against"
	line "the SNORLAX…"
	para "It's awake!"
	done
	
SnorlaxText3:
	text "SNORLAX:"
	line "Snor?"
	done
	

JadeForestSnorlaxRoom_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4, 15, JADE_FOREST, 5
	warp_event  5, 15, JADE_FOREST, 6

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  3,  3, SPRITE_BIG_SNORLAX, SPRITEMOVEDATA_BIGDOLLSYM, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VermilionSnorlax, EVENT_VERMILION_CITY_SNORLAX
