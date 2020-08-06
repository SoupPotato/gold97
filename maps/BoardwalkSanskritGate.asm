

	const_def 2 ; object constants
	const ROUTE43GATE_OFFICER

BoardwalkSanskritGate_MapScripts:
	db 1 ; scene scripts
	scene_script .DummyScene ; SCENE_FINISHED

	db 0 ; callbacks


.DummyScene:
	end



OfficerScript_GuardWithSnore:
	faceplayer
	opentext
	checkevent EVENT_GOT_TM13_SNORE_FROM_MOOMOO_FARM
	iftrue .GotSnore
	writetext OfficerText_FoundTM
	buttonsound
	verbosegiveitem TM_SLEEP_TALK
	iffalse .NoRoomForSnore
	setevent EVENT_GOT_TM13_SNORE_FROM_MOOMOO_FARM
	closetext
	end

.GotSnore:
	writetext OfficerText_AvoidGrass
	waitbutton
.NoRoomForSnore:
	closetext
	end


OfficerText_FoundTM:
	text "Zzzz…."
	para "Hm?"
	para "Oh, yeah, I can"
	line "still keep watch"
	para "when I'm asleep,"
	line "trust me."
	para "Your #MON can"
	line "also attack while"
	cont "asleep, with this."
	done

Text_ReceivedTM30:
	text "<PLAYER> received"
	line "TM35."
	done

OfficerText_AvoidGrass:
	text "Zzz…"
	para "Be careful out"
	line "there…"
	done

BoardwalkSanskritGate_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  4,  0, BOARDWALK, 4
	warp_event  5,  0, BOARDWALK, 5
	warp_event  4,  7, BOARDWALK, 3
	warp_event  5,  7, BOARDWALK, 6

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  0,  4, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, OfficerScript_GuardWithSnore, -1
