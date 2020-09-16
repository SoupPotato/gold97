	const_def 2
	const CM_3FB_ROCKETEXEC

CastleMountain3FB_MapScripts:
	db 1 ; scene scripts
	scene_script .DummyScene ; SCENE_DEFAULT

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .KeepLeftHole
	
.DummyScene:
	end
	
.KeepLeftHole:
	checkevent EVENT_ACTIVATED_LEFT_CM_TRAPDOOR
	iffalse .DoneA
	changeblock $8, $4, $6C
.DoneA:
	jump .KeepRightHole

.KeepRightHole:
	checkevent EVENT_ACTIVATED_RIGHT_CM_TRAPDOOR
	iffalse .DoneB
	changeblock $A, $4, $6B
.DoneB:
	jump .KeepTopHole
	
.KeepTopHole
	checkevent EVENT_ACTIVATED_TOP_CM_TRAPDOOR
	iffalse .DoneC
	changeblock $8, $2, $6D
.DoneC
	return


Exec1Left:
	checkevent EVENT_BEAT_CM_ROCKET_EXECUTIVE
	iftrue .end1
	showemote EMOTE_SHOCK, CM_3FB_ROCKETEXEC, 10
	pause 10
	turnobject CM_3FB_ROCKETEXEC, DOWN
	opentext
	
	writetext Exec1BeforeText
	waitbutton
	closetext
	winlosstext Exec1BeatenText, 0
	loadtrainer EXECUTIVEF, EXECUTIVEF_1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_CM_ROCKET_EXECUTIVE
	opentext
	writetext IllSendUToTheDungeonText
	closetext
	turnobject CM_3FB_ROCKETEXEC, LEFT
	pause 10
	setevent EVENT_ACTIVATED_LEFT_CM_TRAPDOOR
	setevent EVENT_UNBLOCK_STAIRS_ROOM
	playsound SFX_WALL_OPEN
	changeblock $8, $4, $6C
	reloadmappart
	showemote EMOTE_SHOCK, PLAYER, 10
	pause 5
	warpcheck
.end1:
	end

Exec1Right:
	checkevent EVENT_BEAT_CM_ROCKET_EXECUTIVE
	iftrue .end2
	showemote EMOTE_SHOCK, CM_3FB_ROCKETEXEC, 10
	pause 10
	turnobject CM_3FB_ROCKETEXEC, DOWN
	opentext
	
	writetext Exec1BeforeText
	waitbutton
	closetext
	winlosstext Exec1BeatenText, 0
	loadtrainer EXECUTIVEF, EXECUTIVEF_1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_CM_ROCKET_EXECUTIVE
	opentext
	writetext IllSendUToTheDungeonText
	closetext
	turnobject CM_3FB_ROCKETEXEC, LEFT
	pause 10
	setevent EVENT_ACTIVATED_RIGHT_CM_TRAPDOOR
	setevent EVENT_UNBLOCK_STAIRS_ROOM
	playsound SFX_WALL_OPEN
	changeblock $A, $4, $6B
	reloadmappart
	showemote EMOTE_SHOCK, PLAYER, 10
	pause 5
	warpcheck
.end2:
	end


Exec1BeforeText:
	text "So you made it"
	line "all the way to"
	cont "me, hm?"
	
	para "Just because you"
	line "made it past my"
	cont "underlings, don't"
	cont "think you'll last"
	cont "even a second in"
	cont "battle with me!"
	
	para "I'll show you why"
	line "I'm GIOVANNI's"
	cont "top EXECUTIVE!"
	done

Exec1BeatenText:
	text "Impossible!"
	line "Improbable!"
	
	para "No child should"
	line "have such power!"
	done

IllSendUToTheDungeonText:
	text "Ha! Don't think"
	line "you've won yet!"
	
	para "This tower room is"
	line "boobytrapped!"
	
	para "Now, down into the"
	line "dungeon you go!"
	cont "Ohohoho!"
	done


CastleArianaScript:
	faceplayer
	opentext
	writetext HowDidUGetBackText
	waitbutton
	closetext
	pause 10
	turnobject CM_3FB_ROCKETEXEC, LEFT
	opentext
	writetext BackToTheDungeonUGoText
	waitbutton
	closetext
	playsound SFX_WALL_OPEN
	changeblock $8, $2, $6D
	reloadmappart
	showemote EMOTE_SHOCK, CM_3FB_ROCKETEXEC, 10
	playsound SFX_WARP_FROM
	disappear CM_3FB_ROCKETEXEC
	opentext
	writetext AhhhhText
	pause 15
	closetext
	setevent EVENT_ACTIVATED_TOP_CM_TRAPDOOR
	clearevent EVENT_CASTLE_B1F_SPRITES_NOT_SHOWN
	end
	

HowDidUGetBackText:
	text "W-what!?"
	line "How did you make"
	cont "it out of the"
	cont "dungeon alive!?"
	done
	
BackToTheDungeonUGoText:
	text "It's no matter!"
	
	para "This room is still"
	line "full of traps!"
	
	para "I'll send you"
	line "right back down!"
	done

AhhhhText:
	text "AHHHHHHHH!"
	done

CastleMountain3FB_MapEvents:
	db 0, 0 ; filler

	db 10 ; warp events
	warp_event 11, 56, CASTLE_MOUNTAIN_2F, 6
	warp_event 11, 69, CASTLE_MOUNTAIN_3FB, 3
	
	warp_event 11, 49, CASTLE_MOUNTAIN_3FB, 2
	warp_event 11, 36, CASTLE_MOUNTAIN_3FB, 5
	
	warp_event 11, 16, CASTLE_MOUNTAIN_3FB, 4
	warp_event 11, 29, CASTLE_MOUNTAIN_3FB, 7
	
	warp_event 11,  9, CASTLE_MOUNTAIN_3FB, 6
	
	warp_event 10,  4, CASTLE_MOUNTAIN_B1F, 2
	warp_event  9,  4, CASTLE_MOUNTAIN_B1F, 2
	warp_event  9,  3, CASTLE_MOUNTAIN_B1F, 3

	db 2 ; coord events
	coord_event  9,  4, SCENE_DEFAULT, Exec1Left
	coord_event 10,  4, SCENE_DEFAULT, Exec1Right

	db 0 ; bg events

	db 1 ; object events
	object_event  9,  3, SPRITE_ERIKA, SPRITEMOVEDATA_STANDING_UP, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CastleArianaScript, EVENT_ACTIVATED_TOP_CM_TRAPDOOR
