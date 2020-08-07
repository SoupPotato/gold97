	const_def 2 ; object constants
	const VERMILION_CHARMANDER_1
	const VERMILION_CHARMANDER_2
	const VERMILION_CHARMANDER_3
	const VERMILION_CHARMANDER_4
	const VERMILION_CHARMANDER_5
	const VERMILION_CHARMANDER_6

NagoCharmanderHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
NagoCharmanderHouseCharmander:
	opentext
	writetext NagoCharmanderHouseCharmanderText
	cry CHARMANDER
	waitbutton
	closetext
	end
	
NagoCharmanderHouseTeacher:
	faceplayer
	opentext
	checkevent EVENT_EXPLODING_TRAP_6
	iftrue .AlreadyGotCharmander
	writetext ILoveCharmanderText
	yesorno
	iffalse .DontTakeCharmander
	checkcode VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .PartyFullCharmander
	writetext UnknownText_0x7e355a
	playsound SFX_CAUGHT_MON
	waitsfx
	givepoke CHARMANDER, 5
	writetext GiveCharmanderText
	waitbutton
	closetext
	setevent EVENT_EXPLODING_TRAP_6
	end
	
.AlreadyGotCharmander
	writetext AlreadyGotCharmanderText
	waitbutton
	closetext
	end
	
.DontTakeCharmander
	writetext NoCharmanderText
	waitbutton
	closetext
	end
	
.PartyFullCharmander
	writetext PartyFullCharmanderText
	waitbutton
	closetext
	end
	
UnknownText_0x7e355a:
	text "<PLAYER> received"
	line "CHARMANDER."
	done
	
AlreadyGotCharmanderText:
	text "My sweet"
	line "CHARMANDER are my"
	cont "favorite thing!"
	done
	
PartyFullCharmanderText:
	text "You've already got"
	line "too many #MON"
	cont "with you!"
	done
	
NoCharmanderText:
	text "Aw, you don't like"
	line "them as much as I"
	cont "do?"
	done
	

NagoCharmanderHouseCharmanderText:
	text "CHARMANDER: Char!"
	done
	
ILoveCharmanderText:
	text "Oooh I just love"
	line "CHARMANDER!"
	para "They're absolutely"
	line "adorable!"
	para "My goal in life is"
	line "to share my love"
	para "of CHARMANDER with"
	line "the world."
	para "Would you like"
	line "one?"
	done
	
GiveCharmanderText:
	text "Take good care of"
	line "it, dearie!"
	done

NagoCharmanderHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, NAGO_VILLAGE, 3
	warp_event  5,  7, NAGO_VILLAGE, 3

	db 0 ; coord events

	db 0 ; bg events

	db 7 ; object events
	object_event  9,  7, SPRITE_CHARMANDER, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, NagoCharmanderHouseCharmander, -1
	object_event  6,  2, SPRITE_CHARMANDER, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, NagoCharmanderHouseCharmander, -1
	object_event  8,  1, SPRITE_CHARMANDER, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, NagoCharmanderHouseCharmander, -1
	object_event  4,  5, SPRITE_CHARMANDER, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, NagoCharmanderHouseCharmander, -1
	object_event  2,  3, SPRITE_CHARMANDER, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, NagoCharmanderHouseCharmander, -1
	object_event  1,  4, SPRITE_CHARMANDER, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, NagoCharmanderHouseCharmander, -1
	object_event  7,  4, SPRITE_TEACHER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, NagoCharmanderHouseTeacher, -1
