	const_def 2 ; object constants
	const OLIVINEPORTPASSAGE_POKEFAN_M
	const OLIVINEPORTPASSAGE_GRAMPS
	const OLIVINEPORTPASSAGE_ABRA

WestportPortPassage_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

WestportPortPassagePokefanMScript:
	jumptextfaceplayer WestportPortPassagePokefanMText
	
	
TeleportGuyScript2:
	faceplayer
	opentext
	checkevent EVENT_EXPLODING_TRAP_2
	iftrue .SkipTeleportTextWest
	writetext TeleportGuyText12
	buttonsound
	setevent EVENT_EXPLODING_TRAP_2
.SkipTeleportTextWest
	writetext TeleportGuyText12_2	
	yesorno
	iffalse .No2
	writetext TeleportGuyYesText2
	waitbutton
	closetext
	playsound SFX_WARP_TO
	special FadeOutPalettes
	waitsfx
	warp AMAMI_PORT_PASSAGE, 13, 2
	end

.No2:
	writetext TeleportGuyNoText2
	waitbutton
	closetext
	end

AbraScript2:
	opentext
	writetext AbraText2
	cry ABRA
	waitbutton
	closetext
	end


	

TeleportGuyText12:
	text "Don't feel like"
	line "taking the ship?"
	para "Or maybe it isn't"
	line "running today?"
	para "Well look here!"
	para "My beloved ABRA"
	line "can send you over"
	para "to the islands in"
	line "an instant!"
	para "I got a buddy"
	line "waiting at the"
	cont "AMAMI TOWN DOCKS."
	para "I'll send you to"
	line "him!"
	para "How about it?"
	done
	
TeleportGuyText12_2:
	text "Want to go to"
	line "AMAMI TOWN?"
	done

TeleportGuyYesText2:
	text "OK, OK. Picture"
	line "AMAMI TOWN in your"
	cont "mind…"
	done

TeleportGuyNoText2:
	text "OK, OK. I'll be"
	line "here!"
	done

AbraText2:
	text "ABRA: Aabra…"
	done


WestportPortPassagePokefanMText:
	text "FAST SHIP S.S.AQUA"
	line "sails to AMAMI"
	para "TOWN on Mondays"
	line "and Fridays."
	done

WestportPortPassage_MapEvents:
	db 0, 0 ; filler

	db 5 ; warp events
	warp_event 19,  4, WESTPORT_CITY, 14
	warp_event 19,  5, WESTPORT_CITY, 15
	warp_event 15,  4, WESTPORT_PORT_PASSAGE, 4
	warp_event  3,  2, WESTPORT_PORT_PASSAGE, 3
	warp_event  3, 14, WESTPORT_PORT, 1

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event 18,  2, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WestportPortPassagePokefanMScript, EVENT_OLIVINE_PORT_PASSAGE_POKEFAN_M
	object_event 13,  1, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, TeleportGuyScript2, EVENT_TELEPORT_GUY
	object_event 14,  1, SPRITE_JYNX, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, AbraScript2, EVENT_TELEPORT_GUY
