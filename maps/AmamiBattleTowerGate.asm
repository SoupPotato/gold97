	const_def 2 ; object constants
	const AMAMIBATTLETOWERGATE_ROCKER
	const AMAMIBATTLETOWERGATE_TWIN

AmamiBattleTowerGate_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .ShowSailor

.ShowSailor:
	clearevent EVENT_BATTLE_TOWER_OUTSIDE_SAILOR_NEW
	return

AmamiBattleTowerGateRockerScript:
	jumptextfaceplayer AmamiBattleTowerGateRockerText

AmamiBattleTowerGateTwinScript:
	jumptextfaceplayer AmamiBattleTowerGateTwinText

UnknownText_0x9f66f:
	text "Did you come to"
	line "see the BATTLE"
	cont "TOWER too?"

	para "But I guess you"
	line "can't go in yet."
	done

UnknownText_0x9f6ba:
	text "BATTLE TOWER has"
	line "opened."

	para "I want to go, but"
	line "I haven't thought"

	para "up a cool line for"
	line "when I win."
	done

AmamiBattleTowerGateRockerText:
	text "Are you going to"
	line "the BATTLE TOWER?"

	para "This is a secret,"
	line "but if you win a"

	para "whole lot, you can"
	line "win special gifts."
	done

UnknownText_0x9f783:
	text "I'm going to train"
	line "my #MON so I'll"

	para "be all ready for"
	line "the BATTLE TOWER."
	done

AmamiBattleTowerGateTwinText:
	text "The levels of the"
	line "#MON I want to"

	para "use are all"
	line "different."

	para "I have to go train"
	line "them now!"
	done

AmamiBattleTowerGate_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  0,  4, AMAMI_TOWN, 11
	warp_event  0,  5, AMAMI_TOWN, 10
	warp_event  7,  0, BATTLE_TOWER_OUTSIDE, 3
	warp_event  8,  0, BATTLE_TOWER_OUTSIDE, 4

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  3,  3, SPRITE_ROCKER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, AmamiBattleTowerGateRockerScript, EVENT_BATTLE_TOWER_OUTSIDE_SAILOR
	object_event  7,  5, SPRITE_TWIN, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, AmamiBattleTowerGateTwinScript, -1
