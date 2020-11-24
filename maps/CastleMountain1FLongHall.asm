	const_def 2
	const CM_LONGHALL_ITEMBALL1
	const CM_LONGHALL_ITEMBALL2
	const CM_LONGHALL_GRUNT1
	const CM_LONGHALL_GRUNT2
	const CM_LONGHALL_GRUNT3
	

CastleMountain1FLongHall_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .UnblockStairs
	
.UnblockStairs:
	checkevent EVENT_UNBLOCK_STAIRS_ROOM
	iffalse .Done
	changeblock $1E, $2, $46
.Done:
	return

CMLongHallItem1:
	itemball REVIVE
	
CMLongHallItem2:
	itemball ESCAPE_ROPE


TrainerGruntM31:
	trainer GRUNTM, GRUNTM_31, EVENT_BEAT_ROCKET_GRUNTM_31, GruntM31SeenText, GruntM31BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM31AfterBattleText
	waitbutton
	closetext
	end
	
GruntM31SeenText:
	text "Yeowch! I tripped"
	line "while running out"
	cont "of the dancing"
	cont "hall!"
	done
	
GruntM31BeatenText:
	text "Party's over…"
	done
	
GruntM31AfterBattleText:
	text "Why'd you have"
	line "to go and bust"
	cont "in on our fun?"
	done


TrainerGruntF9:
	trainer GRUNTF, GRUNTF_9, EVENT_BEAT_ROCKET_GRUNTF_9, GruntF9SeenText, GruntF9BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntF9AfterBattleText
	waitbutton
	closetext
	end
	
GruntF9SeenText:
	text "I'm so totally"
	line "like, not letting"
	cont "you get any"
	cont "further in here."
	done
	
GruntF9BeatenText:
	text "Like, dang!"
	done
	
GruntF9AfterBattleText:
	text "Our commander will"
	line "get you! If you"
	cont "even make it to"
	cont "the top of this"
	cont "stinky old place!"
	done

TrainerGruntM34:
	trainer GRUNTM, GRUNTM_34, EVENT_BEAT_ROCKET_GRUNTM_34, GruntM34SeenText, GruntM34BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM34AfterBattleText
	waitbutton
	closetext
	end
	
GruntM34SeenText:
	text "Halt before the"
	line "black knight of"
	cont "CASTLE MOUNTAIN!"
	done
	
GruntM34BeatenText:
	text "A knight keeps"
	line "his honor!"
	done
	
GruntM34AfterBattleText:
	text "What do you mean"
	line "TEAM ROCKET has"
	cont "no honor?"
	
	para "Honor among"
	line "thieves!"
	done

HiddenDebris9:
	hiddenitem BRICK_PIECE, EVENT_CM_HIDDENITEM9
	
HiddenDebris10:
	hiddenitem STAR_PIECE, EVENT_CM_HIDDENITEM10
	
HiddenDebris11:
	hiddenitem BRICK_PIECE, EVENT_CM_HIDDENITEM11
	
HiddenDebris12:
	hiddenitem BRICK_PIECE, EVENT_CM_HIDDENITEM12


CastleMountain1FLongHall_MapEvents:
	db 0, 0 ; filler

	db 9 ; warp events
	warp_event 30,  9, CASTLE_MOUNTAIN_1F, 7
	warp_event 31,  9, CASTLE_MOUNTAIN_1F, 8
	warp_event 52,  9, CASTLE_MOUNTAIN_1F_DANCE_HALL, 3
	warp_event 53,  9, CASTLE_MOUNTAIN_1F_DANCE_HALL, 4
	warp_event  8,  9, CASTLE_MOUNTAIN_1F_DINING_HALL, 3
	warp_event  9,  9, CASTLE_MOUNTAIN_1F_DINING_HALL, 4
	warp_event 30,  1, CASTLE_MOUNTAIN_1F_STAIRS, 1
	warp_event 31,  1, CASTLE_MOUNTAIN_1F_STAIRS, 2
	warp_event  8,  1, CASTLE_MOUNTAIN_1F_CAVE, 1

	db 0 ; coord events

	db 4 ; bg events
	bg_event 36,  5, BGEVENT_ITEM, HiddenDebris9
	bg_event 48,  7, BGEVENT_ITEM, HiddenDebris10
	bg_event 25,  7, BGEVENT_ITEM, HiddenDebris11
	bg_event 12,  7, BGEVENT_ITEM, HiddenDebris12

	db 5 ; object events
	object_event 56,  5, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, CMLongHallItem1, EVENT_CM_LONGHALL_ITEMBALL1
	object_event 21,  2, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, CMLongHallItem2, EVENT_CM_LONGHALL_ITEMBALL2
	object_event 49,  4, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerGruntM31, EVENT_CASTLE_MTN_EVENTS_COMPLETE
	object_event 19,  5, SPRITE_ROCKET_GIRL, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 4, TrainerGruntF9, EVENT_CASTLE_MTN_EVENTS_COMPLETE
	object_event 11,  2, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 4, TrainerGruntM34, EVENT_CASTLE_MTN_EVENTS_COMPLETE
