	const_def 2 ; object constants
	const RYUKYU_HOTEL_2F_PLACEHOLDER_1
	const RYUKYU_HOTEL_2F_PLACEHOLDER_2
	const RYUKYU_HOTEL_2F_PLACEHOLDER_3
	const RYUKYU_HOTEL_2F_YOUNGSTER
	const RYUKYU_HOTEL_2F_CLERK

RyukyuHotel2F_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .FlipStairs2F

.FlipStairs2F:
	changeblock  19,  1, $32 ; flipped
	return
	
RyukyuHotel2FYoungster:
	jumptextfaceplayer RyukyuHotel2FYoungsterText
	
RyukyuHotel2FClerk:
	jumptextfaceplayer RyukyuHotel2FClerkText
	
HotelDoorLockedScript:
	jumptextfaceplayer HotelDoorLockedText
	
RyukyuHotel2FClerkText:
	text "Welcome, guest!"
	para "Please let me know"
	line "if there is any-"
	cont "thing you need!"
	done
	
RyukyuHotel2FYoungsterText:
	text "Wow! You have"
	line "eight GYM BADGES?"
	para "One day I'd like"
	line "to defeat a GYM"
	cont "LEADER."
	done
	
HotelDoorLockedText:
	text "The door is"
	line "locked…"
	done
	
RyukyuHotel2F_MapEvents:
	db 0, 0 ; filler

	db 5 ; warp events
	warp_event 16,  0, RYUKYU_ELEVATOR, 1
	warp_event 19,  0, RYUKYU_HOTEL, 10
	warp_event 18,  0, RYUKYU_HOTEL_3F, 2
	warp_event  7,  2, RYUKYU_HOTEL_ROOMS, 1
	warp_event  7, 14, RYUKYU_HOTEL_ROOMS, 3

	db 0 ; coord events

	db 0 ; bg events

	db 5 ; object events
	object_event  1,   2, SPRITE_PLACEHOLDER, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, HotelDoorLockedScript, -1
	object_event  13,  2, SPRITE_PLACEHOLDER, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, HotelDoorLockedScript, -1
	object_event  13, 14, SPRITE_PLACEHOLDER, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, HotelDoorLockedScript, -1
	object_event  18,  5, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, RyukyuHotel2FYoungster, -1
	object_event   1, 13, SPRITE_CLERK, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, RyukyuHotel2FClerk, -1
