	const_def 2 ; object constants
	const WILLSROOM_WILL

LoreleisRoom_MapScripts:
	db 2 ; scene scripts
	scene_script .LockDoor ; SCENE_DEFAULT
	scene_script .DummyScene ; SCENE_FINISHED

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .LoreleisRoomDoors

.LockDoor:
	priorityjump .WillsDoorLocksBehindYou
	end

.DummyScene:
	end

.LoreleisRoomDoors:
	checkevent EVENT_WILLS_ROOM_ENTRANCE_CLOSED
	iffalse .KeepEntranceOpen
	changeblock 4, 14, $2a ; wall
.KeepEntranceOpen:
	checkevent EVENT_WILLS_ROOM_EXIT_OPEN
	iffalse .KeepExitClosed
	changeblock 4, 2, $16 ; open door
.KeepExitClosed:
	return

.WillsDoorLocksBehindYou:
	applymovement PLAYER, LoreleisRoom_EnterMovement
	refreshscreen $86
	playsound SFX_STRENGTH
	earthquake 80
	changeblock 4, 14, $2a ; wall
	reloadmappart
	closetext
	setscene SCENE_FINISHED
	setevent EVENT_WILLS_ROOM_ENTRANCE_CLOSED
	waitsfx
	end

WillScript_Battle:
	faceplayer
	opentext
	checkevent EVENT_BEAT_ELITE_4_WILL
	iftrue WillScript_AfterBattle
	writetext WillScript_WillBeforeText
	waitbutton
	closetext
	winlosstext WillScript_WillBeatenText, 0
	loadtrainer WILL, WILL1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_ELITE_4_WILL
	opentext
	writetext WillScript_WillDefeatText
	waitbutton
	closetext
	playsound SFX_ENTER_DOOR
	changeblock 4, 2, $16 ; open door
	reloadmappart
	closetext
	setevent EVENT_WILLS_ROOM_EXIT_OPEN
	waitsfx
	end

WillScript_AfterBattle:
	writetext WillScript_WillDefeatText
	waitbutton
	closetext
	end

LoreleisRoom_EnterMovement:
	step UP
	step UP
	step UP
	step UP
	step_end

WillScript_WillBeforeText:
	text "Welcome to the"
	line "NIHON LEAGUE,"
	cont "<PLAYER>."

	para "Allow me to intro-"
	line "duce myself. I am"
	cont "LORELEI."

	para "My freezing cold"
	line "#MON have left"

	para "many challengers"
	line "frozen with fear."

	para "Ice-types are cold"
	line "and ruthless but"
	cont "also beautiful."

	para "Your #MON"
	line "will be at my"
	cont "mercy when they"
	cont "are frozen solid!"

	para "Hehe..."
	
	para "Let us begin!"
	done

WillScript_WillBeatenText:
	text "I… I can't…"
	line "believe it…"
	done

WillScript_WillDefeatText:
	text "Well done trainer."

	para "But it will only"
	line "get harder from"
	cont "here."

	para "Go."
	
	para "You have only"
	line "experienced a"
	cont "taste of the"
	cont "ELITE FOUR."	
	done

LoreleisRoom_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  5, 17, NIHON_LEAGUE, 4
	warp_event  4,  2, KOGAS_ROOM, 1
	warp_event  5,  2, KOGAS_ROOM, 2

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  5,  7, SPRITE_WILL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, WillScript_Battle, -1
