	const_def 2
	const CM2F_ITEMBALL1
	const CM2F_ITEMBALL2
	const CM2F_GRUNT1
	const CM2F_GRUNT2
	const CM2F_GRUNT3
	const CM2F_GRUNT4

CastleMountain2F_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .UnblockStairs
	
.UnblockStairs:
	checkevent EVENT_UNBLOCK_STAIRS_ROOM
	iffalse .Done
	changeblock $E, $12, $70
.Done:
	return

CM2FItemball1:
	itemball ULTRA_BALL

CM2FItemball2:
	itemball STEEL_SHELL


TrainerGruntM35:
	trainer GRUNTM, GRUNTM_35, EVENT_BEAT_ROCKET_GRUNTM_35, GruntM35SeenText, GruntM35BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM35AfterBattleText
	waitbutton
	closetext
	end
	
GruntM35SeenText:
	text "Dark and dingy,"
	line "I couldn't have"
	cont "picked a better"
	cont "hideout spot"
	cont "myself!"
	done
	
GruntM35BeatenText:
	text "Now I'm all"
	line "covered in dust!"
	
	para "I love it!"
	done
	
GruntM35AfterBattleText:
	text "Madame EXECUTIVE"
	line "always plans the"
	cont "best missions."
	
	para "...Even if this"
	line "mission involves"
	cont "hiding as far"
	cont "away from the"
	cont "authorities in"
	cont "NIHON as we can."
	done


TrainerGruntM36:
	trainer GRUNTM, GRUNTM_36, EVENT_BEAT_ROCKET_GRUNTM_36, GruntM36SeenText, GruntM36BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM36AfterBattleText
	waitbutton
	closetext
	end
	
GruntM36SeenText:
	text "We're an elite"
	line "ROCKET unit!"
	done
	
GruntM36BeatenText:
	text "Y-you must be"
	line "elite as well!"
	done
	
GruntM36AfterBattleText:
	text "Hiding in this"
	line "CASTLE makes me"
	cont "feel like we"
	cont "should call"
	cont "ourselves a"
	cont "better name than"
	cont "just TEAM ROCKET."
	
	para "Something like..."
	
	para "TEAM GREAT ROCKET!"
	done


TrainerGruntF10:
	trainer GRUNTF, GRUNTF_10, EVENT_BEAT_ROCKET_GRUNTF_10, GruntF10SeenText, GruntF10BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntF10AfterBattleText
	waitbutton
	closetext
	end
	
GruntF10SeenText:
	text "Madame EXECUTIVE"
	line "is too good to"
	cont "fight some kid"
	cont "like you, so"
	cont "it's up to me!"
	done
	
GruntF10BeatenText:
	text "You're not"
	line "kidding around!"
	done
	
GruntF10AfterBattleText:
	text "There's more girls"
	line "in our unit than"
	cont "most others."
	
	para "That's because"
	line "madame EXECUTIVE"
	cont "picks all the"
	cont "toughest girls"
	cont "in TEAM ROCKET"
	cont "to train herself!"
	done

TrainerGruntF11:
	trainer GRUNTF, GRUNTF_11, EVENT_BEAT_ROCKET_GRUNTF_11, GruntF11SeenText, GruntF11BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntF11AfterBattleText
	waitbutton
	closetext
	end
	
GruntF11SeenText:
	text "I heard that this"
	line "old CASTLE is"
	cont "cursed! As if I"
	cont "would believe in"
	cont "something so"
	cont "stupid!"
	done
	
GruntF11BeatenText:
	text "Curses!"
	done
	
GruntF11AfterBattleText:
	text "Everybody in town"
	line "is afraid to come"
	cont "in here because"
	cont "of some GREEN"
	cont "DRAGON and some"
	cont "sad woman ghost."
	
	para "Well good! It"
	line "means nobody will"
	cont "come bother us!"
	done

HiddenDebris1:
	hiddenitem BRICK_PIECE, EVENT_CM_HIDDENITEM1
	
HiddenDebris2:
	hiddenitem STAR_PIECE, EVENT_CM_HIDDENITEM2
	
HiddenDebris3:
	hiddenitem BRICK_PIECE, EVENT_CM_HIDDENITEM3
	
HiddenDebris4:
	hiddenitem BRICK_PIECE, EVENT_CM_HIDDENITEM4

CastleMountain2F_MapEvents:
	db 0, 0 ; filler

	db 7 ; warp events
	warp_event  5, 13, CASTLE_MOUNTAIN_1F_CAVE, 2
	warp_event 14, 19, CASTLE_MOUNTAIN_1F_STAIRS, 3
	warp_event 15, 19, CASTLE_MOUNTAIN_1F_STAIRS, 4
	warp_event  6,  1, CASTLE_MOUNTAIN_3FA, 1
	warp_event  7,  1, CASTLE_MOUNTAIN_3FA, 1
	warp_event 22,  1, CASTLE_MOUNTAIN_3FB, 1
	warp_event 23,  1, CASTLE_MOUNTAIN_3FB, 1

	db 0 ; coord events

	db 4 ; bg events
	bg_event 20, 14, BGEVENT_ITEM, HiddenDebris1
	bg_event 24,  9, BGEVENT_ITEM, HiddenDebris2
	bg_event 19,  2, BGEVENT_ITEM, HiddenDebris3
	bg_event 10,  9, BGEVENT_ITEM, HiddenDebris4

	db 6 ; object events
	object_event 14,  2, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, CM2FItemball1, EVENT_CM_2F_ITEMBALL1
	object_event 23, 13, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, CM2FItemball2, EVENT_CM_2F_ITEMBALL2
	object_event 19, 11, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_RIGHT, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 4, TrainerGruntM35, EVENT_CASTLE_MTN_EVENTS_COMPLETE
	object_event  6,  6, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_RIGHT, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 4, TrainerGruntM36, EVENT_CASTLE_MTN_EVENTS_COMPLETE
	object_event 24,  3, SPRITE_ROCKET_GIRL, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 2, TrainerGruntF10, EVENT_CASTLE_MTN_EVENTS_COMPLETE
	object_event 23,  6, SPRITE_ROCKET_GIRL, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 4, TrainerGruntF11, EVENT_CASTLE_MTN_EVENTS_COMPLETE
