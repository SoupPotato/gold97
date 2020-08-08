	const_def 2 ; object constants
	const ECRUTEAKPOKECENTER1F_NURSE
	const ECRUTEAKPOKECENTER1F_POKEFAN_M
	const ECRUTEAKPOKECENTER1F_COOLTRAINER_F
	const ECRUTEAKPOKECENTER1F_GYM_GUY
	const ECRUTEAKPOKECENTER1F_BILL

TeknosPokecenter1F_MapScripts:
	db 2 ; scene scripts
	scene_script .MeetBill ; SCENE_DEFAULT
	scene_script .DummyScene ; SCENE_FINISHED

	db 0 ; callbacks

.MeetBill:
	priorityjump .BillActivatesTimeCapsule
	end

.DummyScene:
	end

.BillActivatesTimeCapsule:
	pause 30
	appear ECRUTEAKPOKECENTER1F_BILL
	applymovement ECRUTEAKPOKECENTER1F_BILL, TeknosPokecenter1FBillMovement1
	opentext
	writetext TeknosPokecenter1F_BillText1
	waitbutton
	closetext
	applymovement ECRUTEAKPOKECENTER1F_BILL, TeknosPokecenter1FBillMovement2
	playsound SFX_EXIT_BUILDING
	disappear ECRUTEAKPOKECENTER1F_BILL
	setflag ENGINE_TIME_CAPSULE
	clearevent EVENT_ECRUTEAK_CITY_GRAMPS
	clearevent EVENT_WISE_TRIOS_ROOM_WISE_TRIO_1
	clearevent EVENT_BURNED_TOWER_MORTY
	setscene SCENE_FINISHED
	waitsfx
	end

TeknosPokecenter1FNurseScript:
	jumpstd pokecenternurse

TeknosPokecenter1FPokefanMScript:
	special Mobile_DummyReturnFalse
	iftrue .mobile
	jumptextfaceplayer TeknosPokecenter1FPokefanMText

.mobile
	jumptextfaceplayer TeknosPokecenter1FPokefanMTextMobile

TeknosPokecenter1FCooltrainerFScript:
	jumptextfaceplayer TeknosPokecenter1FCooltrainerFText

TeknosPokecenter1FGymGuyScript:
	jumptextfaceplayer TeknosPokecenter1FGymGuyText

TeknosPokecenter1FBillMovement1:
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step RIGHT
	step RIGHT
	step DOWN
	step DOWN
	step UP
	step RIGHT
	step LEFT
	step UP
	step RIGHT
	step DOWN
	step LEFT
	step DOWN
	step_end

TeknosPokecenter1FBillMovement2:
	step RIGHT
	step DOWN
	step_end

TeknosPokecenter1FPlayerMovement1:
	step UP
	step UP
	step UP
	step_end

TeknosPokecenter1F_BillText1:
	text "Oh dear, oh dear."
	
	para "She's not here"
	line "either!"
	
	para "Oh dear, oh dear."
	
	para "Excuse me, son."
	line "You wouldn't have"
	cont "happened to see a"
	cont "young girl come"
	cont "through here?"
	
	para "It's my"
	line "granddaughter."
	
	para "I can't find her"
	line "anywhere!"

	para "Oh, no. I hope she"
	line "didn't wander into"
	cont "in that dreaded"
	cont "MINE…"
	
	para "Could you check?"

	para "There is an old"
	line "MINE just outside"
	cont "the city."
	
	para "I pray she didn't"
	line "go there..."

	para "Oh dear, oh dear."
	done

TeknosPokecenter1FPokefanMText:
	text "Your #MON will"
	line "become more"
	para "friendly towards"
	line "you if you treat"
	cont "them well."
	done

TeknosPokecenter1FPokefanMTextMobile:
	text "You must be hoping"
	line "to battle more"

	para "people, right?"
	line "There's apparently"

	para "some place where"
	line "trainers gather."

	para "Where, you ask?"

	para "It's a little past"
	line "OLIVINE CITY."
	done

TeknosPokecenter1FCooltrainerFText:
	text "Your #MON know"
	line "HM moves, right?"
	para "Those moves can"
	line "be used outside of"
	para "battle even if the"
	line "#MON fainted."
	done

TeknosPokecenter1FGymGuyText:
	text "Have you ever been"
	line "to the SUNPOINT"
	cont "CITY DOCKS?"
	para "Forget any other"
	line "port in NIHON,"
	para "that's where the"
	line "most trade"
	cont "happens."
	done

TeknosPokecenter1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  5,  7, TEKNOS_CITY, 3
	warp_event  6,  7, TEKNOS_CITY, 3
	warp_event  0,  7, POKECENTER_2F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 5 ; object events
	object_event  5,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TeknosPokecenter1FNurseScript, -1
	object_event 12,  6, SPRITE_GENTLEMAN, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TeknosPokecenter1FPokefanMScript, -1
	object_event  1,  4, SPRITE_FISHER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TeknosPokecenter1FCooltrainerFScript, -1
	object_event 10,  1, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, TeknosPokecenter1FGymGuyScript, -1
	object_event 11,  4, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_ECRUTEAK_POKE_CENTER_BILL
