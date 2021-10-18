	const_def 2 ; object constants
	const GIOVANNISROOM_GIOVANNI

GiovannisRoom_MapScripts:
	db 2 ; scene scripts
	scene_script .LockDoor ; SCENE_DEFAULT
	scene_script .DummyScene ; SCENE_FINISHED

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .GiovannisRoomDoors

.LockDoor:
	priorityjump .GiovannisDoorLocksBehindYou
	end

.DummyScene:
	end

.GiovannisRoomDoors:
	checkevent EVENT_GIOVANNIS_ROOM_ENTRANCE_CLOSED
	iffalse .KeepEntranceOpen
	changeblock 4, 14, $2a ; wall
.KeepEntranceOpen:
	checkevent EVENT_GIOVANNIS_ROOM_EXIT_OPEN
	iffalse .KeepExitClosed
	changeblock 4, 2, $16 ; open door
.KeepExitClosed:
	return

.GiovannisDoorLocksBehindYou:
	applymovement PLAYER, GiovannisRoom_EnterMovement
	refreshscreen $86
	playsound SFX_STRENGTH
	earthquake 80
	changeblock 4, 14, $2a ; wall
	reloadmappart
	closetext
	setscene SCENE_FINISHED
	setevent EVENT_GIOVANNIS_ROOM_ENTRANCE_CLOSED
	waitsfx
	end

GiovanniScript_Battle:
	faceplayer
	opentext
	checkevent EVENT_BEAT_ELITE_4_GIOVANNI
	iftrue GiovanniScript_AfterBattle
	writetext GiovanniScript_GiovanniBeforeText
	waitbutton
	closetext
	winlosstext GiovanniScript_GiovanniBeatenText, 0
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue GiovanniRematchTeam
	loadtrainer GIOVANNI_E4, GIOVANNI_E41
returntomainGiovanni:
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_ELITE_4_GIOVANNI
	opentext
	writetext GiovanniScript_GiovanniDefeatText
	waitbutton
	closetext
	playsound SFX_ENTER_DOOR
	changeblock 4, 2, $16 ; open door
	reloadmappart
	closetext
	setevent EVENT_GIOVANNIS_ROOM_EXIT_OPEN
	waitsfx
	end

GiovanniScript_AfterBattle:
	writetext GiovanniScript_GiovanniDefeatText
	waitbutton
	closetext
	end

GiovanniRematchTeam:
	loadtrainer GIOVANNI_E4, GIOVANNI_E42
	jump returntomainGiovanni

GiovannisRoom_EnterMovement:
	step UP
	step UP
	step UP
	step UP
	step_end

GiovanniScript_GiovanniBeforeText:
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
	cont "organization has"
	cont "not changed,"
	
	para "but until then I"
	line "will do what I"
	cont "must to accomplish"
	cont "it!"
	
	para "Now then,"
	line "<PLAY_G>,"
	
	para "I hope you have"
	line "prepared yourself,"
	
	para "because your"
	line "journey ends here!"
	done

GiovanniScript_GiovanniBeatenText:
	text "Argh!"

	para "It seems you are"
	line "much stronger"
	cont "than last time!"
	done

GiovanniScript_GiovanniDefeatText:
	text "I loathe you."

	para "But you have my"
	line "respect."
	
	para "Perhaps if times"
	line "were different,"
	
	para "we could have been"
	line "allies…"
	
	para "Regardless…"
	
	para "You have defeated"
	line "me."

	para "Proceed ahead."
	
	para "The CHAMPION is"
	line "waiting…"
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
	object_event  5,  7, SPRITE_GIOVANNI, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, GiovanniScript_Battle, -1
