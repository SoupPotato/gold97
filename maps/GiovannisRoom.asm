	const_def 2 ; object constants
	const KARENSROOM_KAREN

GiovannisRoom_MapScripts:
	db 2 ; scene scripts
	scene_script .LockDoor ; SCENE_DEFAULT
	scene_script .DummyScene ; SCENE_FINISHED

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .GiovannisRoomDoors

.LockDoor:
	priorityjump .KarensDoorLocksBehindYou
	end

.DummyScene:
	end

.GiovannisRoomDoors:
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
	applymovement PLAYER, GiovannisRoom_EnterMovement
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

GiovannisRoom_EnterMovement:
	step UP
	step UP
	step UP
	step UP
	step_end

KarenScript_KarenBeforeText:
	text "Fwahaha!"

	para "Your eyes do not"
	line "deceive you!"

	para "It is I, GIOVANNI!"

	para "While you may know"
	line "my true identity,"
	
	para "I am also a valid"
	line "member of the"
	cont "ELITE FOUR!"
	
	para "My ambition to"
	line "restore my "
	cont "organisation has"
	cont "not changed,"
	
	para "but until then I"
	line "will do what I"
	cont "must to accomplish"
	cont "it!"
	
	para "Now then,"
	line "<PLAY_G>,"
	
	para "I hope you have"
	line "prepared yourself."
	
	para "because your"
	line "journey ends here!"
	done

KarenScript_KarenBeatenText:
	text "Argh!"

	para "It seems you are"
	line "much stronger"
	cont "than last time!"
	done

KarenScript_KarenDefeatText:
	text "I loathe you."

	para "But you have my"
	line "respect."
	
	para "Perhaps if times"
	line "were different,"
	
	para "we could have been"
	line "allies..."
	
	para "Regardless..."
	
	para "You have defeated"
	line "me."

	para "Proceed ahead."
	
	para "The CHAMPION is"
	line "waiting..."
	done

GiovannisRoom_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  4, 17, AGATHAS_ROOM, 3
	warp_event  5, 17, AGATHAS_ROOM, 4
	warp_event  4,  2, LANCES_ROOM, 1
	warp_event  5,  2, LANCES_ROOM, 2

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  5,  7, SPRITE_BROCK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, KarenScript_Battle, -1
