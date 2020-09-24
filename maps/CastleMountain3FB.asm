	const_def 2
	const CM_3FB_ROCKETEXEC
	const CM3B_ITEMBALL1
	const CM3B_ITEMBALL2
	const CM3B_GRUNT1
	const CM3B_GRUNT2
	const CM3B_GRUNT3
	const CM3B_GRUNT4
	const CM3B_GRUNT5

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
	waitbutton
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
	waitbutton
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

CM3BItemball1:
	itemball SNAKESKIN
	
CM3BItemball2:
	itemball RARE_CANDY

TrainerGruntM40:
	trainer GRUNTM, GRUNTM_40, EVENT_BEAT_ROCKET_GRUNTM_40, GruntM40SeenText, GruntM40BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM40AfterBattleText
	waitbutton
	closetext
	end
	
GruntM40SeenText:
	text "I'm a veteran"
	line "of the great"
	cont "raid of SILPH"
	cont "COMPANY!"
	done
	
GruntM40BeatenText:
	text "Kids these days."
	done
	
GruntM40AfterBattleText:
	text "I wonder what"
	line "became of the 4"
	cont "ROCKET BROTHERS."
	done


TrainerGruntM41:
	trainer GRUNTM, GRUNTM_41, EVENT_BEAT_ROCKET_GRUNTM_41, GruntM41SeenText, GruntM41BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM41AfterBattleText
	waitbutton
	closetext
	end
	
GruntM41SeenText:
	text "I'm totally"
	line "unpredictable!"
	
	para "You'll never"
	line "guess what moves"
	cont "my #MON have!"
	done
	
GruntM41BeatenText:
	text "Outplayed!"
	done
	
GruntM41AfterBattleText:
	text "SMEARGLE is"
	line "marvellous!"
	
	para "It can learn"
	line "any move with"
	cont "a little effort!"
	done


TrainerGruntF14:
	trainer GRUNTF, GRUNTF_14, EVENT_BEAT_ROCKET_GRUNTF_14, GruntF14SeenText, GruntF14BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntF14AfterBattleText
	waitbutton
	closetext
	end
	
GruntF14SeenText:
	text "Your little"
	line "medieval quest"
	cont "ends right here!"
	done
	
GruntF14BeatenText:
	text "Smashed down!"
	done
	
GruntF14AfterBattleText:
	text "If a GREEN DRAGON"
	line "really does exist"
	cont "in here, TEAM"
	cont "ROCKET will catch"
	cont "it and sell it"
	cont "for profit!"
	done

TrainerGruntF15:
	trainer GRUNTF, GRUNTF_15, EVENT_BEAT_ROCKET_GRUNTF_15, GruntF15SeenText, GruntF15BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntF15AfterBattleText
	waitbutton
	closetext
	end
	
GruntF15SeenText:
	text "I'll show you"
	line "this mink's"
	cont "hidden claws!"
	done
	
GruntF15BeatenText:
	text "Worn out like"
	line "an old fur coat!"
	done
	
GruntF15AfterBattleText:
	text "SNEASEL is cute"
	line "but deceptively"
	cont "sneaky, like me!"
	done


TrainerGruntF16:
	trainer GRUNTF, GRUNTF_16, EVENT_BEAT_ROCKET_GRUNTF_16, GruntF16SeenText, GruntF16BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntF16AfterBattleText
	waitbutton
	closetext
	end
	
GruntF16SeenText:
	text "TEAM ROCKET has"
	line "nothing to fear!"
	done
	
GruntF16BeatenText:
	text "Eek!"
	done
	
GruntF16AfterBattleText:
	text "TEAM ROCKET is"
	line "above the law!"
	
	para "Why do you think"
	line "GIOVANNI is still"
	cont "an ELITE FOUR?"
	
	para "Use your brain!"
	line "We run the show!"
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

	db 8 ; object events
	object_event  9,  3, SPRITE_ERIKA, SPRITEMOVEDATA_STANDING_UP, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CastleArianaScript, EVENT_ACTIVATED_TOP_CM_TRAPDOOR
	object_event 17, 63, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, CM3BItemball1, EVENT_CM3B_ITEMBALL1
	object_event  6, 48, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, CM3BItemball2, EVENT_CM3B_ITEMBALL2
	object_event 13, 36, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 4, TrainerGruntM40, EVENT_CASTLE_MTN_EVENTS_COMPLETE
	object_event 10, 26, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 4, TrainerGruntM41, EVENT_CASTLE_MTN_EVENTS_COMPLETE
	object_event  9, 64, SPRITE_ROCKET_GIRL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 4, TrainerGruntF14, EVENT_CASTLE_MTN_EVENTS_COMPLETE
	object_event  5, 42, SPRITE_ROCKET_GIRL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 4, TrainerGruntF15, EVENT_CASTLE_MTN_EVENTS_COMPLETE
	object_event  9, 20, SPRITE_ROCKET_GIRL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 4, TrainerGruntF16, EVENT_CASTLE_MTN_EVENTS_COMPLETE
