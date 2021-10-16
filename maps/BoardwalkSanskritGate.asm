	const_def 2 ; object constants
	const SANSKRITGATE_OFFICER

BoardwalkSanskritGate_MapScripts:
	db 1 ; scene scripts
	scene_script .DummyScene ; SCENE_FINISHED

	db 0 ; callbacks

.DummyScene:
	end

OfficerScript_GuardWithSleepTalk:
	faceplayer
	opentext
	checkevent EVENT_GOT_TM35_FROM_SANSKRIT_GATE_OFFICER
	iftrue .GotSleepTalk
	writetext OfficerText_FoundTM
	buttonsound
	verbosegiveitem TM_SLEEP_TALK
	iffalse .NoRoomForSleepTalk
	setevent EVENT_GOT_TM35_FROM_SANSKRIT_GATE_OFFICER
	closetext
	end

.GotSleepTalk:
	writetext OfficerText_BeCareful
	waitbutton
.NoRoomForSleepTalk:
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

OfficerText_BeCareful:
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
	object_event  0,  4, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, OfficerScript_GuardWithSleepTalk, -1
