	const_def 2 ; object constants
	const RYUKYU_HOTEL_3F_PLACEHOLDER_1
	const RYUKYU_HOTEL_3F_PLACEHOLDER_2
	const RYUKYU_HOTEL_3F_PLACEHOLDER_3
	const RYUKYU_HOTEL_3F_COOLTRAINER_F
	const RYUKYU_HOTEL_3F_COOLTRAINER_M

RyukyuHotel3F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	
HotelDoorLockedScript3F:
	jumptextfaceplayer HotelDoorLockedText3F

RyukyuHotel3FCooltrainerM:
	jumptextfaceplayer RyukyuHotel3FCooltrainerMText
	
RyukyuHotel3FCooltrainerMText:
	text "Hmm…"
	para "I need to make"
	line "sure I've packed"
	para "everything before"
	line "I return my ROOM"
	cont "PASS…"
	done
	
RyukyuHotel3FCooltrainerF:
	jumptextfaceplayer RyukyuHotel3FCooltrainerFText
	
RyukyuHotel3FCooltrainerFText:
	text "This place is"
	line "huge!"
	para "I forget where my"
	line "room is…"
	done
	
HotelDoorLockedText3F:
	text "The door is"
	line "locked…"
	done

RyukyuHotel3F_MapEvents:
	db 0, 0 ; filler

	db 5 ; warp events
	warp_event 16,  0, RYUKYU_ELEVATOR, 1
	warp_event 18,  0, RYUKYU_HOTEL_2F, 3
	warp_event 19,  0, RYUKYU_HOTEL_4F, 2
	warp_event  1,  2, RYUKYU_HOTEL_ROOMS, 5
	warp_event 13, 14, RYUKYU_HOTEL_ROOMS, 7

	db 0 ; coord events

	db 0 ; bg events

	db 5 ; object events
	object_event   7,  2, SPRITE_PLACEHOLDER, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, HotelDoorLockedScript3F, -1
	object_event  13,  2, SPRITE_PLACEHOLDER, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, HotelDoorLockedScript3F, -1
	object_event   7, 14, SPRITE_PLACEHOLDER, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, HotelDoorLockedScript3F, -1
	object_event  12,  5, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RyukyuHotel3FCooltrainerF, -1
	object_event   6, 15, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, RyukyuHotel3FCooltrainerM, -1
