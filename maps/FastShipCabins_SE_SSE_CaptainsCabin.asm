	const_def 2 ; object constants
	const FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_CAPTAIN
	const FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_POKEFAN_M1
	const FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_TWIN3
	const FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_TWIN4
	const FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_SUPER_NERD1
	const FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_POKEFAN_M2
	const FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_POKEFAN_F
	const FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_SUPER_NERD2

FastShipCabins_SE_SSE_CaptainsCabin_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

.UnreferencedDummyScene:
	end

SSAquaCaptain:
	faceplayer
	opentext
	checkevent EVENT_FAST_SHIP_FIRST_TIME
	iftrue .LaterTrip
	checkevent EVENT_FAST_SHIP_CABINS_TALKED_WITH_CAPTAIN_FIRST_TIME
	iffalse .FirstCaptainTalk
	writetext SSAquaCaptainExhaustingText
	waitbutton
	closetext
	end
.FirstCaptainTalk
	writetext SSAquaCaptainShipIsBrokenText
	waitbutton
	closetext
	setevent EVENT_FAST_SHIP_CABINS_TALKED_WITH_CAPTAIN_FIRST_TIME
	end

.LaterTrip:
	checkevent EVENT_GOT_METAL_COAT_FROM_GRANDPA_ON_SS_AQUA
	iffalse .GiveMetalCoatCaptain
	writetext SSAquaCaptainHowDoYouLikeText
	waitbutton
	closetext
	end
	
.GiveMetalCoatCaptain
	writetext SSAquaCaptainThankYouText
	waitbutton
	verbosegiveitem METAL_COAT
	iffalse SSCaptain_NoRoom
	setevent EVENT_GOT_METAL_COAT_FROM_GRANDPA_ON_SS_AQUA
	writetext SSAquaCaptainHowDoYouLikeText
	waitbutton
	closetext
	end

SSCaptain_NoRoom:
	writetext SSCaptain_NoRoomText
	waitbutton
	closetext
	end

TrainerPokefanmColin:
	trainer POKEFANM, COLIN, EVENT_BEAT_POKEFANM_COLIN, PokefanmColinSeenText, PokefanmColinBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokefanmColinAfterBattleText
	waitbutton
	closetext
	end

TrainerTwinsMegandpeg1:
	trainer TWINS, MEGANDPEG1, EVENT_BEAT_TWINS_MEG_AND_PEG, TwinsMegandpeg1SeenText, TwinsMegandpeg1BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext TwinsMegandpeg1AfterBattleText
	waitbutton
	closetext
	end

TrainerTwinsMegandpeg2:
	trainer TWINS, MEGANDPEG2, EVENT_BEAT_TWINS_MEG_AND_PEG, TwinsMegandpeg2SeenText, TwinsMegandpeg2BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext TwinsMegandpeg2AfterBattleText
	waitbutton
	closetext
	end

TrainerPsychicRodney:
	trainer PSYCHIC_T, RODNEY, EVENT_BEAT_PSYCHIC_RODNEY, PsychicRodneySeenText, PsychicRodneyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PsychicRodneyAfterBattleText
	waitbutton
	closetext
	end

TrainerPokefanmJeremy:
	trainer POKEFANM, JEREMY, EVENT_BEAT_POKEFANM_JEREMY, PokefanmJeremySeenText, PokefanmJeremyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokefanmJeremyAfterBattleText
	waitbutton
	closetext
	end

TrainerPokefanfGeorgia:
	trainer POKEFANF, GEORGIA, EVENT_BEAT_POKEFANF_GEORGIA, PokefanfGeorgiaSeenText, PokefanfGeorgiaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokefanfGeorgiaAfterBattleText
	waitbutton
	closetext
	end

TrainerSupernerdShawn:
	trainer SUPER_NERD, SHAWN, EVENT_BEAT_SUPER_NERD_SHAWN, SupernerdShawnSeenText, SupernerdShawnBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SupernerdShawnAfterBattleText
	waitbutton
	closetext
	end

FastShipCaptainsCabinTrashcan:
	jumpstd trashcan

MovementData_0x76004:
	big_step RIGHT
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	step_end

MovementData_0x7600c:
	step UP
	step UP
	turn_head LEFT
	step_end

MovementData_0x76010:
	step DOWN
	step_end
	
SSCaptain_NoRoomText:
	text "Why, you have no"
	line "room for my gift!"
	done
	
SSAquaCaptainThankYouText:
	text "Ah, it's you!"
	para "The kid who helped"
	line "fix the ship!"
	para "Thank you so very"
	line "much!"
	para "As a token of my"
	line "gratitude, I'd"
	para "like you to have"
	line "this."
	done
	
	
SSAquaCaptainShipIsBrokenText:
	text "Oh, dear."
	para "We're in a serious"
	line "predicament here."
	para "The rough weather"
	line "damaged the ship's"
	cont "main FUEL LINE."
	para "We have reserves"
	line "that can get us"
	cont "to AMAMI TOWN."
	para "But we won't be"
	line "able to make the"
	para "return trip until"
	line "this gets fixed!"
	para "It might be asking"
	line "too much, but"
	para "could you help us"
	line "out?"
	para "There's a guy"
	line "over in KUME CITY"
	cont "who repairs ships."
	para "He'll have the"
	line "part we need."
	para "When we dock,"
	line "could you please"
	para "help us out by"
	line "going to get the"
	cont "part?"
	para "We won't be able"
	line "to return to the"
	para "mainland until it"
	line "gets fixed!"
	done

SSAquaCaptainExhaustingText:
	text "Won't you please"
	line "help us out?"
	done

SSAquaCaptainHowDoYouLikeText:
	text "How do you like"
	line "S.S.AQUA's ride?"

	para "She practically"
	line "skates across the"
	cont "waves."
	done

PokefanmColinSeenText:
	text "Hey, kid! Want to"
	line "battle with me?"
	done

PokefanmColinBeatenText:
	text "You're strong!"
	done

PokefanmColinAfterBattleText:
	text "You're traveling"
	line "all alone?"

	para "Isn't your mom"
	line "worried?"
	done

TwinsMegandpeg1SeenText:
	text "You think I'm a"
	line "baby?"
	cont "That's not fair!"
	done

TwinsMegandpeg1BeatenText:
	text "Oh! We lost!"
	done

TwinsMegandpeg1AfterBattleText:
	text "Baby is a rude"
	line "name to call us"
	cont "girls!"
	done

TwinsMegandpeg2SeenText:
	text "I'm not a baby!"

	para "That's not nice to"
	line "say to a lady!"
	done

TwinsMegandpeg2BeatenText:
	text "Oh! We lost!"
	done

TwinsMegandpeg2AfterBattleText:
	text "Sometimes, kids"
	line "are smarter than"
	cont "grown-ups!"
	done

PsychicRodneySeenText:
	text "Ssh! My brain is"
	line "picking up radio"
	cont "signals!"
	done

PsychicRodneyBeatenText:
	text "…I hear some-"
	line "thing!"
	done

PsychicRodneyAfterBattleText:
	text "I get it. You can"
	line "hear NIHONS's"
	cont "radio on here."
	done

PokefanmJeremySeenText:
	text "What do you think?"
	line "My #MON are"
	cont "beautiful, yes?"
	done

PokefanmJeremyBeatenText:
	text "Oh, no! My beauti-"
	line "ful #MON!"
	done

PokefanmJeremyAfterBattleText:
	text "I must go to the"
	line "#MON SALON and"
	cont "fix them up nice!"
	done

PokefanfGeorgiaSeenText:
	text "I'm going to shop"
	line "at the DEPT.STORE"
	cont "and then…"
	done

PokefanfGeorgiaBeatenText:
	text "What was I going"
	line "to do?"
	done

PokefanfGeorgiaAfterBattleText:
	text "Oh, yes! I have to"
	line "get my #MON out"
	cont "of DAY-CARE!"
	done

SupernerdShawnSeenText:
	text "What kinds of #"
	line "BALLS do you have"
	cont "with you?"
	done

SupernerdShawnBeatenText:
	text "Wait! Stop! Don't!"
	line "Please!"
	done

SupernerdShawnAfterBattleText:
	text "You should use the"
	line "right BALLS to fit"
	cont "the situation."
	done

SSAquaHasArrivedVermilionText:
	text "FAST SHIP S.S.AQUA"
	line "has arrived in"
	cont "AMAMI TOWN."
	done

FastShipCabins_SE_SSE_CaptainsCabin_MapEvents:
	db 0, 0 ; filler

	db 6 ; warp events
	warp_event  2,  7, FAST_SHIP_1F, 8
	warp_event  3,  7, FAST_SHIP_1F, 8
	warp_event  2, 19, FAST_SHIP_1F, 9
	warp_event  3, 19, FAST_SHIP_1F, 9
	warp_event  4, 33, FAST_SHIP_1F, 10
	warp_event  5, 33, FAST_SHIP_1F, 10

	db 0 ; coord events

	db 1 ; bg events
	bg_event  6, 25, BGEVENT_READ, FastShipCaptainsCabinTrashcan

	db 8 ; object events
	object_event  5, 25, SPRITE_CAPTAIN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SSAquaCaptain, -1
	object_event  5,  6, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 5, TrainerPokefanmColin, EVENT_FAST_SHIP_PASSENGERS_FIRST_TRIP
	object_event  2,  4, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerTwinsMegandpeg1, EVENT_FAST_SHIP_PASSENGERS_FIRST_TRIP
	object_event  3,  4, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerTwinsMegandpeg2, EVENT_FAST_SHIP_PASSENGERS_FIRST_TRIP
	object_event  5,  5, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 5, TrainerPsychicRodney, EVENT_FAST_SHIP_PASSENGERS_EASTBOUND
	object_event  2,  3, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerPokefanmJeremy, EVENT_FAST_SHIP_PASSENGERS_WESTBOUND
	object_event  5,  5, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerPokefanfGeorgia, EVENT_FAST_SHIP_PASSENGERS_WESTBOUND
	object_event  1, 15, SPRITE_SUPER_NERD, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 2, TrainerSupernerdShawn, EVENT_FAST_SHIP_PASSENGERS_EASTBOUND
