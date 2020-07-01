	const_def 2 ; object constants
	const VERMILION_GYM_SQUIRTLE_GIRL
	const VERMILION_GYM_SWIMMER_GUY
	const VERMILION_GYM_SWIMMER_GIRL
	const VERMILION_GYM_GRANNY
	const VERMILION_GYM_BUG_CATCHER
	const VERMILION_GYM_LASS

VermilionGym_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

VermilionGymSwimmerSquirtle:
	faceplayer
	opentext
	checkevent EVENT_EXPLODING_TRAP_13
	iftrue .AlreadyGotSquirtle
	writetext ILoveSquirtleText
	yesorno
	iffalse .DontTakeSquirtle
	checkcode VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .PartyFullSquirtle
	writetext ReceiveSquirtleText
	playsound SFX_CAUGHT_MON
	waitsfx
	givepoke SQUIRTLE, 5
	writetext GiveSquirtleText
	waitbutton
	closetext
	setevent EVENT_EXPLODING_TRAP_13
	end
	
.AlreadyGotSquirtle
	writetext AlreadyGotSquirtleText
	waitbutton
	closetext
	end
	
.DontTakeSquirtle
	writetext NoSquirtleText
	waitbutton
	closetext
	end
	
.PartyFullSquirtle
	writetext PartyFullSquirtleText
	waitbutton
	closetext
	end
	
VermilionGymSwimmerGuyScript:
	jumptextfaceplayer VermilionGymSwimmerGuyText
	
VermilionGymSwimmerGirlScript:
	jumptextfaceplayer VermilionGymSwimmerGirlText
	
VermilionGymGrannyScript:
	jumptextfaceplayer VermilionGymGrannyText
	
VermilionGymBugCatcherScript:
	jumptextfaceplayer VermilionGymBugCatcherText

VermilionGymLassScript:
	jumptextfaceplayer VermilionGymLassText
	
VermilionGymLassText:
	text "A more controlled"
	line "environment like"
	para "an indoor pool can"
	line "be a better place"
	para "to train weaker"
	line "#MON than out"
	cont "on the open sea."
	done
	
VermilionGymBugCatcherText:
	text "I want to go"
	line "swimming!"
	done
	
VermilionGymGrannyText:
	text "I can't really"
	line "swim so well any-"
	cont "more."
	para "But my #MON"
	line "love the water,"
	para "so I bring them"
	line "here frequently."
	done
	
VermilionGymSwimmerGirlText:
	text "Water type #MON"
	line "love being in the"
	cont "water!"
	para "Makes sense,"
	line "right?"
	done
	
VermilionGymSwimmerGuyText:
	text "Swimming is good"
	line "exercise for both"
	para "people and #-"
	line "MON!"
	done
	
ReceiveSquirtleText:
	text "<PLAYER> received"
	line "SQUIRTLE."
	done
	
AlreadyGotSquirtleText:
	text "I come here to"
	line "swim with my"
	para "SQUIRTLE almost"
	line "every day!"
	done
	
PartyFullSquirtleText:
	text "You've already got"
	line "too many #MON"
	cont "with you!"
	done
	
NoSquirtleText:
	text "You sure?"
	para "They're such great"
	line "#MON!"
	done
	
	
ILoveSquirtleText:
	text "SQUIRTLE are great"
	line "swimmers!"
	para "Have you ever gone"
	line "swimming with a"
	cont "SQUIRTLE?"
	para "You have to try"
	line "it!"
	para "They're also great"
	line "#MON to raise!"
	para "I've got a young"
	line "one that needs"
	para "someone to train"
	line "it."
	para "Here, you should"
	line "raise a SQUIRTLE!"
	done
	
GiveSquirtleText:
	text "Help it grow up"
	line "big and strong!"
	done
	
VermilionGym_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  6, 17, VERMILION_CITY, 5
	warp_event  7, 17, VERMILION_CITY, 6

	db 0 ; coord events

	db 0 ; bg events

	db 6 ; object events
	object_event  5,  6, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, VermilionGymSwimmerSquirtle, -1
	object_event  9,  9, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, VermilionGymSwimmerGuyScript, -1
	object_event  11, 10, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, VermilionGymSwimmerGirlScript, -1
	object_event  7, 13, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, VermilionGymGrannyScript, -1
	object_event  3, 14, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, VermilionGymBugCatcherScript, -1
	object_event 18,  5, SPRITE_LASS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, VermilionGymLassScript, -1
