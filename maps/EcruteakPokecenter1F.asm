	const_def 2 ; object constants
	const ECRUTEAKPOKECENTER1F_NURSE
	const ECRUTEAKPOKECENTER1F_POKEFAN_M
	const ECRUTEAKPOKECENTER1F_COOLTRAINER_F
	const ECRUTEAKPOKECENTER1F_GYM_GUY
	const ECRUTEAKPOKECENTER1F_BILL

EcruteakPokecenter1F_MapScripts:
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
	applymovement ECRUTEAKPOKECENTER1F_BILL, EcruteakPokecenter1FBillMovement1
	opentext
	writetext EcruteakPokecenter1F_BillText1
	waitbutton
	closetext
	applymovement ECRUTEAKPOKECENTER1F_BILL, EcruteakPokecenter1FBillMovement2
	playsound SFX_EXIT_BUILDING
	disappear ECRUTEAKPOKECENTER1F_BILL
	setflag ENGINE_TIME_CAPSULE
	clearevent EVENT_ECRUTEAK_CITY_GRAMPS
	clearevent EVENT_WISE_TRIOS_ROOM_WISE_TRIO_1
	clearevent EVENT_BURNED_TOWER_MORTY
	setscene SCENE_FINISHED
	waitsfx
	end

EcruteakPokecenter1FNurseScript:
	jumpstd pokecenternurse

EcruteakPokecenter1FPokefanMScript:
	special Mobile_DummyReturnFalse
	iftrue .mobile
	jumptextfaceplayer EcruteakPokecenter1FPokefanMText

.mobile
	jumptextfaceplayer EcruteakPokecenter1FPokefanMTextMobile

EcruteakPokecenter1FCooltrainerFScript:
	jumptextfaceplayer EcruteakPokecenter1FCooltrainerFText

EcruteakPokecenter1FGymGuyScript:
	jumptextfaceplayer EcruteakPokecenter1FGymGuyText

EcruteakPokecenter1FBillMovement1:
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

EcruteakPokecenter1FBillMovement2:
	step RIGHT
	step DOWN
	step_end

EcruteakPokecenter1FPlayerMovement1:
	step UP
	step UP
	step UP
	step_end

EcruteakPokecenter1F_BillText1:
	text "Oh dear, oh dear."
	para "She's not here"
	line "either!"
	para "I've looked"
	line "everywhere!"
	para "Oh dear, oh dear."
	para "Excuse me, son."
	line "You wouldn't have"
	para "happened to see"
	line "a young girl come"
	para "through here,"
	line "have you?"
	para "It's my"
	line "granddaughter."
	para "I can't find her"
	line "anywhere!"
	para "She's gone missing"
	line "and I can't find"
	cont "her."
	para "…"
	para "Oh, no. I hope she"
	line "didn't get trapped"
	cont "in the MINE…"
	para "Listen, there's an"
	line "old MINE just west"
	para "of town that has"
	line "become a popular"
	para "spot for kids to"
	line "run off to play"
	cont "at."
	para "But it's obviously"
	line "not safe!"
	para "Could you go look"
	line "there to see if"
	para "my granddaughter"
	line "could be stuck"
	cont "inside?"
	para "I don't know where"
	line "else she could be."
	para "Oh dear, oh dear."
	done

EcruteakPokecenter1F_BillText2:
	text "I made the #MON"
	line "storage system!"

	para "I truly hope you"
	line "find it useful."
	
	para "It's a great tool"
	line "if you want to"
	para "catch every single"
	line "#MON! Anyways,"

	para "I have to hurry on"
	line "back to GOLDENROD"
	cont "and see my folks."

	para "Buh-bye!"
	done

EcruteakPokecenter1FPokefanMText:
	text "Your #MON will"
	line "become more"
	para "friendly towards"
	line "you if you treat"
	cont "them well."
	done

EcruteakPokecenter1FPokefanMTextMobile:
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

EcruteakPokecenter1FCooltrainerFText:
	text "Your #MON know"
	line "HM moves, right?"
	para "Those moves can"
	line "be used outside of"
	para "battle even if the"
	line "#MON fainted."
	done

EcruteakPokecenter1FGymGuyText:
	text "Have you ever been"
	line "to the SOUTH POINT"
	cont "DOCKS?"
	para "Forget any other"
	line "port in NIHON,"
	para "that's where the"
	line "most trade"
	cont "happens."
	done

EcruteakPokecenter1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  5,  7, ECRUTEAK_CITY, 3
	warp_event  6,  7, ECRUTEAK_CITY, 3
	warp_event  0,  7, POKECENTER_2F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 5 ; object events
	object_event  5,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakPokecenter1FNurseScript, -1
	object_event 12,  6, SPRITE_GENTLEMAN, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakPokecenter1FPokefanMScript, -1
	object_event  1,  4, SPRITE_FISHER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakPokecenter1FCooltrainerFScript, -1
	object_event 10,  1, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, EcruteakPokecenter1FGymGuyScript, -1
	object_event 11,  4, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_ECRUTEAK_POKE_CENTER_BILL
