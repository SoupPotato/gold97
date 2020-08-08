	const_def 2 ; object constants
	const OLIVINEHOUSEBETA_ELDER
;	const OLIVINEHOUSEBETA_RHYDON

AlloyOldCaptainsHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

AlloyOldCaptainsHouseElderScript:
	checkevent EVENT_FOUGHT_HO_OH
	iftrue .AfterEverythingHoOh
	faceplayer
	opentext
	writetext AlloyOldCaptainsHouseElderIntroText
	buttonsound
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .NoEvilLeft
	writetext AlloyOldCaptainsHouseElderEvilText
	waitbutton
	closetext
	end
	
.NoEvilLeft
	checkevent EVENT_GOT_5F_SAGE_BLESSING
	iffalse .NotBlessed
	writetext AlloyOldCaptainsHouseElderText2
	yesorno
	iffalse OlivineElderNoStory
	writetext OlivineElderStoryText
	waitbutton
	closetext
	special FadeOutMusic
	pause 20
	cry HO_OH
	playsound SFX_FLY
	showemote EMOTE_SHOCK, OLIVINEHOUSEBETA_ELDER, 20
	pause 15
	opentext
	writetext BirdIsTheWordText
	waitbutton
	closetext
	checkcode VAR_FACING
	ifequal UP, .ElderWalkAroundPlayer
	applymovement OLIVINEHOUSEBETA_ELDER, ElderWalksOutMovement
	playsound SFX_EXIT_BUILDING
	disappear OLIVINEHOUSEBETA_ELDER
	setevent EVENT_OLD_CITY_EARL
	setevent EVENT_EARLS_ACADEMY_EARL
	clearevent EVENT_SLOWPOKE_WELL_SLOWPOKES
	setmapscene PAGOTA_CITY, SCENE_KURTS_HOUSE_LOCKED
	setmapscene BRASS_TOWER_5F, SCENE_HO_OH_EVENT
	pause 15
	special RestartMapMusic
	end
	
.ElderWalkAroundPlayer
	applymovement OLIVINEHOUSEBETA_ELDER, ElderWalksAroundPlayerMovement
	playsound SFX_EXIT_BUILDING
	disappear OLIVINEHOUSEBETA_ELDER
	setevent EVENT_OLD_CITY_EARL
	setevent EVENT_EARLS_ACADEMY_EARL
	clearevent EVENT_SLOWPOKE_WELL_SLOWPOKES
	setmapscene PAGOTA_CITY, SCENE_KURTS_HOUSE_LOCKED
	setmapscene BRASS_TOWER_5F, SCENE_HO_OH_EVENT
	pause 15
	special RestartMapMusic
	end
	
.NotBlessed
	writetext AlloyOldCaptainsHouseElderNotBlessedText
	waitbutton
	closetext
	end
	
.AfterEverythingHoOh
	faceplayer
	opentext
	writetext SometimesYouLiveLongEnough
	waitbutton
	closetext
	end
	
OlivineElderNoStory:
	writetext AlloyOldCaptainsHouseElderAnotherTime
	waitbutton
	closetext
	end
	
ElderWalksAroundPlayerMovement:
	step LEFT
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end
	
ElderWalksOutMovement:
	step DOWN
	step DOWN
	step LEFT
	step DOWN
	step DOWN
	step_end
	
SometimesYouLiveLongEnough:
	text "Sometimes you live"
	line "long enough to"
	para "witness things you"
	line "never thought you"
	cont "would see."
	para "I had an encounter"
	line "with the bird of"
	cont "legend."
	para "Truly a magical"
	line "event."
	para "You know, you"
	line "should search"
	para "NIHON for the"
	line "legendary beasts."
	para "If HO-OH returned,"
	line "anything is"
	cont "possible."
	done
	
OlivineElderStoryText:
	text "Listen closely…"
	
	para "Many years ago,"
	line "NIHON was guarded"
	cont "by a noble bird,"
	cont "whose wings were"
	cont "donned a rainbow"
	cont "of color."
	
	para "Legend tells it"
	line "nested at what is"
	cont "now known as the"
	cont "BRASS TOWER."
	
	para "However, the ever"
	line "-growing malice,"
	cont "within the region"
	cont "made the bird grow"
	cont "restless."
	
	para "No longer com"
	line "-pelled to stay,"
	cont "the bird left..."
	
	para "As it flew, ashes"
	line "fell from its"
	cont "wings."
	
	para "From these ashes"
	line "rose three beasts,"
	cont "tasked to keep"
	cont "watch over NIHON"
	cont "in the bird's"
	cont "absence."
	
	para "The beasts then"
	line "scattered, and"
	cont "none have seen"
	cont "them since."
	
	para "But legend says"
	line "that they have"
	cont "remained in NIHON,"
	cont "watching over it"
	cont "in secret,"
	
	para "and that a being"
	line "of pure heart will"
	cont "return the bird."
	
	para "I feel we may be"
	line "upon that day"
	cont "soon..."
	done
	
BirdIsTheWordText:
	text "C-could it be!?"
	
	para "The bird!"
	
	para "Come child, we"
	line "must make haste to"
	cont "the 5 FLOOR TOWER."
	
	para "The legend is"
	line "being realised!"
	done
	
AlloyOldCaptainsHouseElderAnotherTime:
	text "Another time,"
	line "then."
	done

AlloyOldCaptainsHouseElderText2:
	text "Do you want to"
	line "hear the story of"
	cont "the bird?"
	done
	
AlloyOldCaptainsHouseElderIntroText:
	text "One day I hope I"
	line "can experience the"
	para "conclusion of the"
	line "legend."
	done

AlloyOldCaptainsHouseElderEvilText:
	text "I sense an evil"
	line "presence looming"
	cont "over NIHON."
	para "surely the bird"
	line "shall not return"
	cont "until it is gone."
	done
	
AlloyOldCaptainsHouseElderNotBlessedText:
	text "The time could be"
	line "any day now, yet"
	para "I do not sense"
	line "that you are the"
	para "type of trainer"
	line "that the bird"
	para "would present"
	line "itself to."
	done

AlloyOldCaptainsHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, ALLOY_CITY, 9
	warp_event  5,  7, ALLOY_CITY, 9

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  6,  3, SPRITE_CAPTAIN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AlloyOldCaptainsHouseElderScript, EVENT_OLD_CITY_EARL
