	const_def 2 ; object constants
	const BRUNOSROOM_BRUNO

AgathasRoom_MapScripts:
	db 2 ; scene scripts
	scene_script .LockDoor ; SCENE_DEFAULT
	scene_script .DummyScene ; SCENE_FINISHED

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .AgathasRoomDoors

.LockDoor:
	priorityjump .BrunosDoorLocksBehindYou
	end

.DummyScene:
	end

.AgathasRoomDoors:
	checkevent EVENT_BRUNOS_ROOM_ENTRANCE_CLOSED
	iffalse .KeepEntranceOpen
	changeblock 4, 14, $2a ; wall
.KeepEntranceOpen:
	checkevent EVENT_BRUNOS_ROOM_EXIT_OPEN
	iffalse .KeepExitClosed
	changeblock 4, 2, $16 ; open door
.KeepExitClosed:
	return

.BrunosDoorLocksBehindYou:
	applymovement PLAYER, AgathasRoom_EnterMovement
	refreshscreen $86
	playsound SFX_STRENGTH
	earthquake 80
	changeblock 4, 14, $2a ; wall
	reloadmappart
	closetext
	setscene SCENE_FINISHED
	setevent EVENT_BRUNOS_ROOM_ENTRANCE_CLOSED
	waitsfx
	end

BrunoScript_Battle:
	faceplayer
	opentext
	checkevent EVENT_BEAT_ELITE_4_BRUNO
	iftrue BrunoScript_AfterBattle
	writetext BrunoScript_BrunoBeforeText
	waitbutton
	closetext
	winlosstext BrunoScript_BrunoBeatenText, 0
	loadtrainer BRUNO, BRUNO1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_ELITE_4_BRUNO
	opentext
	writetext BrunoScript_BrunoDefeatText
	waitbutton
	closetext
	playsound SFX_ENTER_DOOR
	changeblock 4, 2, $16 ; open door
	reloadmappart
	closetext
	setevent EVENT_BRUNOS_ROOM_EXIT_OPEN
	waitsfx
	end

BrunoScript_AfterBattle:
	writetext BrunoScript_BrunoDefeatText
	waitbutton
	closetext
	end

AgathasRoom_EnterMovement:
	step UP
	step UP
	step UP
	step UP
	step_end

BrunoScript_BrunoBeforeText:
	text "Oho!"

	para "So, old OAK has"
	line "sent another child"
	cont "on one of his"
	cont "foolish errands..."

	para "I am AGATHA of"
	line "the ELITE FOUR."
	
	para "My years have seen"
	line "many travels and"
	cont "turmoil."
	
	para "That old fool OAK"
	line "just lives in his"
	cont "childhood dreams."
	
	para "#MON have"
	line "always been for"
	cont "battling!"

	para "Tell me, child."

	para "How far will your"
	line "resolve take you"
	cont "in your journey"
	cont "to complete the"
	cont "#DEX?"
	
	para "Let's find out."
    line "Fufufufu..."
	done

BrunoScript_BrunoBeatenText:
	text "My gracious!"
	
	para "You certainly have"
	line "it, my child."
	done

BrunoScript_BrunoDefeatText:
	text "Hmm..."
	
	para "Perhaps that old"
	line "fool does know"
	cont "your potential."
	
	para "Run along now."
	
	para "Your journey is"
	line "not yet over."
	done

AgathasRoom_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  4, 17, KOGAS_ROOM, 3
	warp_event  5, 17, KOGAS_ROOM, 4
	warp_event  4,  2, GIOVANNIS_ROOM, 1
	warp_event  5,  2, GIOVANNIS_ROOM, 2

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  5,  7, SPRITE_BLAINE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BrunoScript_Battle, -1
