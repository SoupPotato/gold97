	const_def 2 ; object constants
	const RUINSOFALPHKABUTOITEMROOM_POKE_BALL1
	const RUINSOFALPHKABUTOITEMROOM_POKE_BALL2
	const RUINSOFALPHKABUTOITEMROOM_POKE_BALL3
	const RUINSOFALPHKABUTOITEMROOM_POKE_BALL4

RuinsOfAlphKabutoItemRoom_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks


RuinsOfAlphKabutoItemRoomAncientReplica:
	jumptext RuinsOfAlphKabutoItemRoomAncientReplicaText

RuinsOfAlphKabutoItemRoomAncientReplicaText:
	text "It's a replica of"
	line "an ancient #-"
	cont "MON."
	done

RuinsOfAlphKabutoItemRoom_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  3,  9, RUINS_OF_ALPH_KABUTO_CHAMBER, 5
	warp_event  4,  9, RUINS_OF_ALPH_KABUTO_CHAMBER, 5

	db 0 ; coord events

	db 2 ; bg events
	bg_event  2,  1, BGEVENT_READ, RuinsOfAlphKabutoItemRoomAncientReplica
	bg_event  5,  1, BGEVENT_READ, RuinsOfAlphKabutoItemRoomAncientReplica

	db 4 ; object events
