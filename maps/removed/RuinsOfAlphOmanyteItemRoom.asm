	const_def 2 ; object constants
	const RUINSOFALPHOMANYTEITEMROOM_POKE_BALL1
	const RUINSOFALPHOMANYTEITEMROOM_POKE_BALL2
	const RUINSOFALPHOMANYTEITEMROOM_POKE_BALL3
	const RUINSOFALPHOMANYTEITEMROOM_POKE_BALL4

RuinsOfAlphOmanyteItemRoom_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks




RuinsOfAlphOmanyteItemRoomAncientReplica:
	jumptext RuinsOfAlphOmanyteItemRoomAncientReplicaText

RuinsOfAlphOmanyteItemRoomAncientReplicaText:
	text "It's a replica of"
	line "an ancient #-"
	cont "MON."
	done

RuinsOfAlphOmanyteItemRoom_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  3,  9, RUINS_OF_ALPH_OMANYTE_CHAMBER, 5
	warp_event  4,  9, RUINS_OF_ALPH_OMANYTE_CHAMBER, 5
	warp_event  3,  1, RUINS_OF_ALPH_OMANYTE_WORD_ROOM, 1
	warp_event  4,  1, RUINS_OF_ALPH_OMANYTE_WORD_ROOM, 2

	db 0 ; coord events

	db 2 ; bg events
	bg_event  2,  1, BGEVENT_READ, RuinsOfAlphOmanyteItemRoomAncientReplica
	bg_event  5,  1, BGEVENT_READ, RuinsOfAlphOmanyteItemRoomAncientReplica

	db 4 ; object events
