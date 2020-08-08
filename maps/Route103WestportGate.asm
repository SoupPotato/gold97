	const_def 2 ; object constants
	const ROUTE35GOLDENRODGATE_OFFICER
	const ROUTE35GOLDENRODGATE_POKEFAN_F
	const ROUTE35GOLDENRODGATE_FISHER

Route103WestportGate_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

RandyScript:
	faceplayer
	opentext
	writetext UnknownText_0x69ddd
	waitbutton
	closetext
	end
	
GiftSpearowMail:
	db FLOWER_MAIL
	db   "DARK CAVE leads"
	next "to another road@"

GiftSpearowName:
	db "KENYA@"

GiftSpearowOTName:
	db "RANDY@"

	db 0 ; filler

Route103WestportGatePokefanFScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_WHITNEY
	iftrue .FoughtBipetal
	writetext Route103WestportGatePokefanFText
	waitbutton
	closetext
	end

.FoughtBipetal
	writetext Route103WestportGatePokefanFText_FoughtBipetal
	waitbutton
	closetext
	end

Route103WestportGateFisherScript:
	jumptextfaceplayer Route103WestportGateFisherText

UnknownText_0x69ddd:
	text "WESTPORT CITY kind"
	line "of bores me."
	para "Everyone loves the"
	line "city, but I'd"
	para "rather live where"
	line "it's quiet."
	done

UnknownText_0x69e48:
	text "You will? Perfect!"
	line "Thanks, kid!"

	para "My pal's a chubby"
	line "guy who snoozes"
	cont "all the time."

	para "You'll recognize"
	line "him right away!"
	done

UnknownText_0x69eb8:
	text "<PLAYER> received a"
	line "#MON with MAIL."
	done

UnknownText_0x69ed6:
	text "You can read it,"
	line "but don't lose it!"
	cont "ROUTE 31!"

	para "Oh, yeah. There"
	line "was a weird tree"
	cont "blocking the road."

	para "I wonder if it's"
	line "been cleared?"
	done

UnknownText_0x69f56:
	text "You can't carry"
	line "another #MON…"
	done

UnknownText_0x69f74:
	text "Oh… Never mind,"
	line "then…"
	done

UnknownText_0x69f8b:
	text "Thanks, kid! You"
	line "made the delivery"
	cont "for me!"

	para "Here's something"
	line "for your trouble!"
	done

UnknownText_0x69fd9:
	text "My pal was snooz-"
	line "ing, right? Heh,"
	cont "what'd I say?"
	done

Route103WestportGatePokefanFText:
	text "The ground north"
	line "of here is prone"
	para "to instability"
	line "due to the lack"
	cont "of foliage."
	para "Some rocks have"
	line "moved and blocked"
	cont "the road ahead."
	para "I don't think"
	line "you'll be able"
	para "to get by right"
	line "now."
	done

Route103WestportGatePokefanFText_FoughtBipetal:
	text "The path ahead has"
	line "been cleared."
	para "That's good, since"
	line "travelers have"
	para "been wanting to"
	line "visit BIRDON TOWN."
	done

Route103WestportGateFisherText:
	text "I wonder how many"
	line "kinds of #MON"

	para "there are in the"
	line "world."

	para "One year ago,"
	line "PROF.OAK said that"

	para "there were 150"
	line "different kinds."
	done

Route103WestportGate_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  4,  0, ROUTE_103, 1
	warp_event  5,  0, ROUTE_103, 2
	warp_event  4,  7, WESTPORT_CITY, 7
	warp_event  5,  7, WESTPORT_CITY, 10

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  0,  4, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route103WestportGatePokefanFScript, -1
	object_event  6,  4, SPRITE_POKEFAN_M, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, RandyScript, -1
	object_event  3,  2, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route103WestportGateFisherScript, -1
