	const_def 2 ; object constants
	const KARENSROOM_KAREN

KarensRoom_MapScripts:
	db 2 ; scene scripts
	scene_script .LockDoor ; SCENE_DEFAULT
	scene_script .DummyScene ; SCENE_FINISHED

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .KarensRoomDoors

.LockDoor:
	priorityjump .KarensDoorLocksBehindYou
	end

.DummyScene:
	end

.KarensRoomDoors:
	checkevent EVENT_KARENS_ROOM_ENTRANCE_CLOSED
	iffalse .KeepEntranceOpen
	changeblock 4, 14, $2a ; wall
.KeepEntranceOpen:
	checkevent EVENT_KARENS_ROOM_EXIT_OPEN
	iffalse .KeepExitClosed
	changeblock 4, 2, $16 ; open door
.KeepExitClosed:
	return

.KarensDoorLocksBehindYou:
	applymovement PLAYER, KarensRoom_EnterMovement
	refreshscreen $86
	playsound SFX_STRENGTH
	earthquake 80
	changeblock 4, 14, $2a ; wall
	reloadmappart
	closetext
	setscene SCENE_FINISHED
	setevent EVENT_KARENS_ROOM_ENTRANCE_CLOSED
	waitsfx
	end

KarenScript_Battle:
	faceplayer
	opentext
	checkevent EVENT_BEAT_ELITE_4_KAREN
	iftrue KarenScript_AfterBattle
	writetext KarenScript_KarenBeforeText
	waitbutton
	closetext
	winlosstext KarenScript_KarenBeatenText, 0
	loadtrainer KAREN, KAREN1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_ELITE_4_KAREN
	opentext
	writetext KarenScript_KarenDefeatText
	waitbutton
	closetext
	playsound SFX_ENTER_DOOR
	changeblock 4, 2, $16 ; open door
	reloadmappart
	closetext
	setevent EVENT_KARENS_ROOM_EXIT_OPEN
	waitsfx
	end

KarenScript_AfterBattle:
	writetext KarenScript_KarenDefeatText
	waitbutton
	closetext
	end

KarensRoom_EnterMovement:
	step UP
	step UP
	step UP
	step UP
	step_end

KarenScript_KarenBeforeText:
	text "Hi, there!"

	para "I am MISTY of the"
	line "ELITE FOUR."

	para "You're <PLAYER>?"
	line "Well it's nice to"
	cont "meet you."
	
	para "But I'm not just"
	line "here for friendly"
	cont "greetings!"
	
	para "My water #MON"
	line "are ready to"
	cont "battle."
	para "And I'm ready to"
	line "work with them to"
	cont "defeat you!"
	
	para "Ready? I accept"
	line "your challenge!"
	done

KarenScript_KarenBeatenText:
	text "Well, looks like"
	line "you were ready to"
	para "battle alongside"
	line "your #MON as"
	cont "well!"
	done

KarenScript_KarenDefeatText:
	text "The best #MON"
	line "trainers aren't"
	para "the ones who pick"
	line "the strongest"
	cont "#MON."
	para "They're the ones"
	line "who battle with"
	cont "their favorites,"
	para "and build a bond"
	line "between trainer"
	cont "and #MON."
	
	para "And that's how"
	line "they win."
	
	para "I think you've"
	line "figured that out."

	para "Go on--the CHAM-"
	line "PION is waiting."
	done

KarensRoom_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  4, 17, BRUNOS_ROOM, 3
	warp_event  5, 17, BRUNOS_ROOM, 4
	warp_event  4,  2, LANCES_ROOM, 1
	warp_event  5,  2, LANCES_ROOM, 2

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  5,  7, SPRITE_MISTY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, KarenScript_Battle, -1
