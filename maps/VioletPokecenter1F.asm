	const_def 2 ; object constants
	const VIOLETPOKECENTER1F_NURSE
	const VIOLETPOKECENTER1F_GAMEBOY_KID
	const VIOLETPOKECENTER1F_GENTLEMAN
	const VIOLETPOKECENTER1F_YOUNGSTER
	const VIOLETPOKECENTER1F_SCIENTIST

VioletPokecenter1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

VioletPokecenterNurse:
	jumpstd pokecenternurse

VioletPokecenter1F_ElmsAideScript:
	faceplayer
	opentext
	checkevent EVENT_REFUSED_TO_TAKE_EGG_FROM_ELMS_AIDE
	iftrue .SecondTimeAsking
	writetext UnknownText_0x69555
.AskTakeEgg:
	yesorno
	iffalse .RefusedEgg
	checkcode VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .PartyFull
	special GiveOddEgg
	stringtotext .eggname, MEM_BUFFER_1
	scall .AideGivesEgg
	setevent EVENT_GOT_TOGEPI_EGG_FROM_ELMS_AIDE
	;setevent EVENT_TOGEPI_HATCHED
	clearevent EVENT_ELMS_AIDE_IN_LAB
	clearevent EVENT_TOGEPI_HATCHED
	;setmapscene ROUTE_32, SCENE_ROUTE32_OFFER_SLOWPOKETAIL
	writetext UnknownText_0x695c5
	waitbutton
	closetext
	checkcode VAR_FACING
	ifequal UP, .AideWalksAroundPlayer
	turnobject PLAYER, DOWN
	applymovement VIOLETPOKECENTER1F_SCIENTIST, MovementData_AideWalksStraightOutOfPokecenter
	playsound SFX_EXIT_BUILDING
	disappear VIOLETPOKECENTER1F_SCIENTIST
	waitsfx
	clearevent EVENT_MET_BILL
	end

.AideWalksAroundPlayer:
	applymovement VIOLETPOKECENTER1F_SCIENTIST, MovementData_AideWalksLeftToExitPokecenter
	turnobject PLAYER, DOWN
	applymovement VIOLETPOKECENTER1F_SCIENTIST, MovementData_AideFinishesLeavingPokecenter
	playsound SFX_EXIT_BUILDING
	disappear VIOLETPOKECENTER1F_SCIENTIST
	clearevent EVENT_MET_BILL
	waitsfx
	end

.eggname
	db "EGG@"

.AideGivesEgg:
	jumpstd receivetogepiegg
	end

.PartyFull:
	writetext UnknownText_0x69693
	waitbutton
	closetext
	end

.RefusedEgg:
	writetext UnknownText_0x696f2
	waitbutton
	closetext
	setevent EVENT_REFUSED_TO_TAKE_EGG_FROM_ELMS_AIDE
	end

.SecondTimeAsking:
	writetext UnknownText_0x69712
	jump .AskTakeEgg

VioletPokecenter1FGameboyKidScript:
	jumptextfaceplayer VioletPokecenter1FGameboyKidText

VioletPokecenter1FGentlemanScript:
	jumptextfaceplayer VioletPokecenter1FGentlemanText

VioletPokecenter1FYoungsterScript:
	jumptextfaceplayer VioletPokecenter1FYoungsterText

MovementData_AideWalksStraightOutOfPokecenter:
	step DOWN
	step DOWN
	step DOWN
	step RIGHT
	step DOWN
	step_end

MovementData_AideWalksLeftToExitPokecenter:
	step LEFT
	step DOWN
	step_end

MovementData_AideFinishesLeavingPokecenter:
	step DOWN
	step DOWN
	step RIGHT
	step RIGHT
	step DOWN
	step_end

UnknownText_0x69555:
	text "<PLAY_G>, long"
	line "time, no see."

	para "PROF.OAK asked me"
	line "to find you."

	para "He has another"
	line "favor to ask."

	para "Would you take"
	line "this #MON EGG?"
	
	para "It would benefit"
	line "our research to"
	para "learn a bit more"
	line "about how baby"
	para "#MON interact"
	line "with other"
	para "#MON and how"
	line "this affects their"
	cont "growth."
	para "So could you keep"
	line "this egg with you?"
	done

UnknownText_0x695c5:
	text "What's in the egg?"
	para "Well, we thought"
	line "we'd keep that a"
	cont "surprise!"
	para "I'm sure it could"
	line "be a helpful"
	para "addition to your"
	line "party!"
	para "Consider it a"
	line "gift!"
	para "Also, did you hear"
	line "that BILL is in"
	cont "town?"
	para "If you don't know,"
	line "BILL created the"
	cont "PC storage system!"
	para "He's highly"
	line "respected among"
	para "#MON"
	line "researchers."
	para "You should pay him"
	line "a visit if you've"
	cont "got a chance."
	para "Anyways, I'm off!"
	line "See you around!"
	done

UnknownText_0x69693:
	text "Oh, no. You can't"
	line "carry any more"
	cont "#MON with you."

	para "I'll wait here"
	line "while you make"
	cont "room for the EGG."
	done

UnknownText_0x696f2:
	text "B-but… PROF.OAK"
	line "asked for you…"
	done

UnknownText_0x69712:
	text "<PLAY_G>, will you"
	line "take the EGG?"
	done

UnknownText_0x6972d:
	text "I've been thinking"
	line "it'd be great to"

	para "be able to link up"
	line "and battle with my"

	para "friends who live"
	line "far away."
	done

UnknownText_0x69791:
	text "I just battled a"
	line "friend in CIANWOOD"
	cont "over a link."

	para "If you connect a"
	line "MOBILE ADAPTER,"

	para "you can link with"
	line "a friend far away."
	done

VioletPokecenter1FGameboyKidText:
	text "A guy named BILL"
	line "made the #MON"
	cont "PC storage system."
	done

VioletPokecenter1FGentlemanText:
	text "It was around"
	line "a year or so ago."

	para "TEAM ROCKET was up"
	line "to no good with"
	cont "#MON."

	para "But justice pre-"
	line "vailed--a young"
	cont "kid broke 'em up."
	done

VioletPokecenter1FYoungsterText:
	text "#MON are smart."
	line "They won't obey a"

	para "trainer they don't"
	line "respect."

	para "Without the right"
	line "GYM BADGES, they"

	para "will just do as"
	line "they please."
	done

VioletPokecenter1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  5,  7, OLD_CITY, 5
	warp_event  6,  7, OLD_CITY, 5
	warp_event  0,  7, POKECENTER_2F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 5 ; object events
	object_event  5,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VioletPokecenterNurse, -1
	object_event  11,  4, SPRITE_GAMEBOY_KID, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, VioletPokecenter1FGameboyKidScript, -1
	object_event  1,  4, SPRITE_GENTLEMAN, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VioletPokecenter1FGentlemanScript, -1
	object_event  8,  1, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, VioletPokecenter1FYoungsterScript, -1
	object_event  4,  3, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, VioletPokecenter1F_ElmsAideScript, EVENT_ELMS_AIDE_IN_VIOLET_POKEMON_CENTER
