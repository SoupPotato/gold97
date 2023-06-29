	const_def 2
	const DANCING_ROCKET_1
	const DANCING_ROCKET_2
	const DANCING_ROCKET_3
	const DANCING_ROCKET_4
	const DANCING_ROCKET_5
	const DANCING_ROCKET_6
	const DANCEHALL_ITEMBALL

CastleMountain1FDanceHall_MapScripts:
	db 1 ; scene scripts
	scene_script .DummyScene ; SCENE_DEFAULT

	db 0 ; callbacks

.DummyScene:
	end

GruntsTopRunOffscreen:
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	step_end
	
GruntsMiddleRunOffscreen:
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	step_end

GruntsBottomRunOffscreen:
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	step_end

RocketGruntsSeeYou:
	checkevent EVENT_DANCE_HALL_ROCKETS_ESCAPED
	iftrue .end
	pause 25
	turnobject DANCING_ROCKET_4, LEFT
	showemote EMOTE_SHOCK, DANCING_ROCKET_4, 10
	pause 10
	turnobject DANCING_ROCKET_1, LEFT
	showemote EMOTE_SHOCK, DANCING_ROCKET_1, 5
	turnobject DANCING_ROCKET_2, LEFT
	showemote EMOTE_SHOCK, DANCING_ROCKET_2, 5
	turnobject DANCING_ROCKET_3, LEFT
	showemote EMOTE_SHOCK, DANCING_ROCKET_3, 5
	turnobject DANCING_ROCKET_5, LEFT
	showemote EMOTE_SHOCK, DANCING_ROCKET_5, 5
	turnobject DANCING_ROCKET_6, LEFT
	showemote EMOTE_SHOCK, DANCING_ROCKET_6, 5
	pause 10
	applymovement DANCING_ROCKET_5, GruntsTopRunOffscreen
	applymovement DANCING_ROCKET_6, GruntsTopRunOffscreen
	disappear DANCING_ROCKET_5
	disappear DANCING_ROCKET_6
	;pause 3
	applymovement DANCING_ROCKET_3, GruntsMiddleRunOffscreen
	applymovement DANCING_ROCKET_4, GruntsMiddleRunOffscreen
	disappear DANCING_ROCKET_3
	disappear DANCING_ROCKET_4
	;pause 3
	applymovement DANCING_ROCKET_1, GruntsBottomRunOffscreen
	applymovement DANCING_ROCKET_2, GruntsBottomRunOffscreen
	disappear DANCING_ROCKET_1
	disappear DANCING_ROCKET_2
	;pause 5
	earthquake 10
	playsound SFX_EGG_BOMB
	setevent EVENT_DANCE_HALL_ROCKETS_ESCAPED
	setevent EVENT_CASTLE_B1F_SPRITES_NOT_SHOWN
	setevent EVENT_CASTLE_DRAGONITE_NOT_SHOWN
	setevent EVENT_DESERTER_ROCKET_GRUNT
.end:
	end
	
	
CMDanceHallItemball:
	itemball LINKING_CORD


CastleMountain1FDanceHall_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  1,  8, CASTLE_MOUNTAIN_1F, 3
	warp_event  1,  9, CASTLE_MOUNTAIN_1F, 4
	warp_event  6,  1, CASTLE_MOUNTAIN_1F_LONG_HALL, 3
	warp_event  7,  1, CASTLE_MOUNTAIN_1F_LONG_HALL, 4

	db 2 ; coord events
	coord_event  2,  8, SCENE_DEFAULT, RocketGruntsSeeYou
	coord_event  2,  9, SCENE_DEFAULT, RocketGruntsSeeYou

	db 0 ; bg events

	db 7 ; object events
	object_event  7, 11, SPRITE_ROCKET, SPRITEMOVEDATA_SPINCLOCKWISE, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_DANCE_HALL_ROCKETS_ESCAPED
	object_event  6, 12, SPRITE_ROCKET_GIRL, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_DANCE_HALL_ROCKETS_ESCAPED
	object_event  7,  9, SPRITE_ROCKET, SPRITEMOVEDATA_SPINCLOCKWISE, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_DANCE_HALL_ROCKETS_ESCAPED
	object_event  6,  9, SPRITE_ROCKET_GIRL, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_DANCE_HALL_ROCKETS_ESCAPED
	object_event  6,  7, SPRITE_ROCKET, SPRITEMOVEDATA_SPINCLOCKWISE, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_DANCE_HALL_ROCKETS_ESCAPED
	object_event  7,  6, SPRITE_ROCKET_GIRL, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_DANCE_HALL_ROCKETS_ESCAPED
	object_event 12, 17, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, CMDanceHallItemball, EVENT_CM_DANCEHALL_ITEMBALL
