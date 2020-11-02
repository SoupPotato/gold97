	const_def 2 ; object_event constants
	const SKATEBOARDERHOUSE_GRAMPS

SkateboarderHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

SkateboarderHouseSkateboarderDude:
	faceplayer
	opentext
	checkevent EVENT_GOT_BICYCLE
	iffalse .nobicycleyet
	checkevent EVENT_GOT_SKATEBOARD
	iftrue .alreadygotskateboard
	writetext SkateboarderHouseSkateboarderDudeText
	waitbutton
	verbosegiveitem SKATEBOARD
	setevent EVENT_GOT_SKATEBOARD
	writetext SkateboarderHouseSkateboarderDudeText2
	waitbutton
	closetext
	end
	
.alreadygotskateboard
	writetext SkateboarderHouseSkateboarderDudeText2
	waitbutton
	closetext
	end

.nobicycleyet
	writetext SkateboarderHouseSkateboarderDudeTextNoBike
	waitbutton
	closetext
	end

SkateboarderHouseBookshelf:
	jumpstd magazinebookshelf

SkateboarderHouseSkateboarderDudeText:
	text "Woah dude!"
	para "You still riding"
	line "around on a bike?"
	para "Get with the"
	line "times!"
	para "And it's time for"
	line "you to shred!"
	para "Here, take this!"
	done
	
SkateboarderHouseSkateboarderDudeText2:
	text "Woah dude!"
	para "With that board,"
	line "you can get around"
	para "quickly in even"
	line "more places than"
	cont "on a bike!"
	done
	
SkateboarderHouseSkateboarderDudeTextNoBike:
	text "Woah dude!"
	para "What are you doing"
	line "walking around"
	cont "on your feet?"
	para "If you're not used"
	line "to riding a bike,"
	para "there's no way"
	line "you're ready to"
	cont "shred!"
	done
	

SkateboarderHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, SUNPOINT_CITY, 11
	warp_event  5,  7, SUNPOINT_CITY, 11

	db 0 ; coord events

	db 2 ; bg events
	bg_event  0,  1, BGEVENT_READ, SkateboarderHouseBookshelf
	bg_event  1,  1, BGEVENT_READ, SkateboarderHouseBookshelf

	db 1 ; object events
	object_event  2,  3, SPRITE_ROCKER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SkateboarderHouseSkateboarderDude, -1
