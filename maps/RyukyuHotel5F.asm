	const_def 2 ; object constants
	const RYUKYU_HOTEL_5F_PLACEHOLDER_1
	const RYUKYU_HOTEL_5F_PLACEHOLDER_2
	const RYUKYU_HOTEL_5F_PLACEHOLDER_3
	const RYUKYU_HOTEL_5F_GENTLEMAN
	const RYUKYU_HOTEL_5F_JANINE
	const RYUKYU_HOTEL_5F_POKEFAN

RyukyuHotel5F_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .NoUpstairs

.NoUpstairs:
	changeblock  19,  1, $33 ; down only
	return
	
RyukyuHotel5FGentleman:
	jumptextfaceplayer RyukyuHotel5FGentlemanText
	
RyukyuHotel5FJanine:
	jumptextfaceplayer RyukyuHotel5FJanineText
	
HotelDoorLockedScript5F:
	jumptextfaceplayer HotelDoorLockedText5F
	
RyukyuHotel5FPokefanm:
	jumptextfaceplayer RyukyuHotel5FPokefanmText
	
RyukyuHotel5FPokefanmText:
	text "I hear PROF.OAK"
	line "stays somewhere on"
	para "this floor on"
	line "weekends."
	done
	
RyukyuHotel5FGentlemanText:
	text "My, this sure is"
	line "a lovely place"
	cont "to vacation!"
	done
	
RyukyuHotel5FJanineText:
	text "Have you tried"
	line "battling any of"
	cont "the KIMONO GIRLS?"
	done
	
HotelDoorLockedText5F:
	text "The door is"
	line "locked…"
	done

RyukyuHotel5F_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event 16,  0, RYUKYU_ELEVATOR, 1
	warp_event 18,  0, RYUKYU_HOTEL_4F, 3
	warp_event  7,  2, RYUKYU_HOTEL_ROOMS, 13
	warp_event  7, 14, RYUKYU_HOTEL_ROOMS, 15

	db 0 ; coord events

	db 0 ; bg events

	db 6 ; object events
	object_event  13,  2, SPRITE_PLACEHOLDER, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, HotelDoorLockedScript5F, -1
	object_event   1,  2, SPRITE_PLACEHOLDER, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, HotelDoorLockedScript5F, -1
	object_event  13, 14, SPRITE_PLACEHOLDER, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, HotelDoorLockedScript5F, -1
	object_event  16,  8, SPRITE_GENTLEMAN, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, RyukyuHotel5FGentleman, -1
	object_event   9, 17, SPRITE_BETA_GIRL, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, RyukyuHotel5FJanine, -1
	object_event   3,  9, SPRITE_POKEFAN_M, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, RyukyuHotel5FPokefanm, -1
