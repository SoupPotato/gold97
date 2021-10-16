	const_def 2 ; object constants
	const ALLOYOLDCAPTAINSHOUSE_CAPTAIN

AlloyOldCaptainsHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

AlloyOldCaptainsHouseCaptainScript:
IF DEF(_GOLD)
	checkevent EVENT_FOUGHT_HO_OH
	iftrue .AfterEverythingBirdFight
	faceplayer
	opentext
	writetext AlloyOldCaptainsHouseCaptainIntroText
	buttonsound
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .NoEvilLeft
	writetext AlloyOldCaptainsHouseCaptainEvilText
	waitbutton
	closetext
	end
	
ELIF DEF(_SILVER)
	checkevent EVENT_FOUGHT_LUGIA
	iftrue .AfterEverythingBirdFight
	faceplayer
	opentext
	writetext AlloyOldCaptainsHouseCaptainIntroText
	buttonsound
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .NoEvilLeft
	writetext AlloyOldCaptainsHouseCaptainEvilText
	waitbutton
	closetext
	end
ENDC
	
.NoEvilLeft
	checkevent EVENT_GOT_HM07_WATERFALL
	iffalse .NoWaterfall
	writetext AlloyOldCaptainsHouseCaptainText2
	yesorno
	iffalse AlloyOldCaptainNoStory
IF DEF(_GOLD)
	writetext AlloyOldCaptainHoOhStoryText
	waitbutton
	closetext
	special FadeOutMusic
	pause 20
	cry HO_OH
	playsound SFX_FLY
	showemote EMOTE_SHOCK, ALLOYOLDCAPTAINSHOUSE_CAPTAIN, 20
	pause 15
	opentext
	writetext HoOhAppearsText
	waitbutton
	closetext
	checkcode VAR_FACING
	ifequal UP, .CaptainWalkAroundPlayerGold
	applymovement ALLOYOLDCAPTAINSHOUSE_CAPTAIN, CaptainWalksOutMovement
	playsound SFX_EXIT_BUILDING
	disappear ALLOYOLDCAPTAINSHOUSE_CAPTAIN
	setevent EVENT_ALLOY_CAPTAIN_AND_TOWER_SAGES_GONE
	setevent EVENT_HO_OH_STAIRS_APPEAR
	clearevent EVENT_BRASS_TOWER_ELDER_SAGE_GONE
	setmapscene PAGOTA_CITY, SCENE_KURTS_HOUSE_LOCKED
	setmapscene BRASS_TOWER_5F, SCENE_HO_OH_EVENT
	pause 15
	special RestartMapMusic
	end
	
.CaptainWalkAroundPlayerGold
	applymovement ALLOYOLDCAPTAINSHOUSE_CAPTAIN, CaptainWalksAroundPlayerMovement
	playsound SFX_EXIT_BUILDING
	disappear ALLOYOLDCAPTAINSHOUSE_CAPTAIN
	setevent EVENT_ALLOY_CAPTAIN_AND_TOWER_SAGES_GONE
	setevent EVENT_HO_OH_STAIRS_APPEAR
	clearevent EVENT_BRASS_TOWER_ELDER_SAGE_GONE
	setmapscene PAGOTA_CITY, SCENE_KURTS_HOUSE_LOCKED
	setmapscene BRASS_TOWER_5F, SCENE_HO_OH_EVENT
	pause 15
	special RestartMapMusic
	end
	
ELIF DEF(_SILVER)
	writetext AlloyOldCaptainLugiaStoryText
	waitbutton
	closetext
	special FadeOutMusic
	pause 20
	cry LUGIA
	playsound SFX_BUBBLEBEAM
	showemote EMOTE_SHOCK, ALLOYOLDCAPTAINSHOUSE_CAPTAIN, 20
	pause 15
	opentext
	writetext LugiaAppearsText
	waitbutton
	closetext
	checkcode VAR_FACING
	ifequal UP, .CaptainWalkAroundPlayerSilver
	applymovement ALLOYOLDCAPTAINSHOUSE_CAPTAIN, CaptainWalksOutMovement
	playsound SFX_EXIT_BUILDING
	disappear ALLOYOLDCAPTAINSHOUSE_CAPTAIN
	setevent EVENT_ALLOY_CAPTAIN_AND_TOWER_SAGES_GONE
	setevent EVENT_LUGIA_CAVE_OPEN
	clearevent EVENT_WHIRL_ISLANDS_SAGE_GONE
	setmapscene PAGOTA_CITY, SCENE_KURTS_HOUSE_LOCKED
	setmapscene WHIRL_ISLAND_B3F, SCENE_LUGIA_EVENT
	pause 15
	special RestartMapMusic
	end

	
.CaptainWalkAroundPlayerSilver
	applymovement ALLOYOLDCAPTAINSHOUSE_CAPTAIN, CaptainWalksAroundPlayerMovement
	playsound SFX_EXIT_BUILDING
	disappear ALLOYOLDCAPTAINSHOUSE_CAPTAIN
	setevent EVENT_ALLOY_CAPTAIN_AND_TOWER_SAGES_GONE
	setevent EVENT_LUGIA_CAVE_OPEN
	clearevent EVENT_WHIRL_ISLANDS_SAGE_GONE
	setmapscene PAGOTA_CITY, SCENE_KURTS_HOUSE_LOCKED
	setmapscene WHIRL_ISLAND_B3F, SCENE_LUGIA_EVENT
	pause 15
	special RestartMapMusic
	end
ENDC
	
.NoWaterfall
	writetext AlloyOldCaptainsHouseCaptainNoWaterfallText
	waitbutton
	closetext
	end
	
.AfterEverythingBirdFight
	faceplayer
	opentext
IF DEF(_GOLD)
	writetext SometimesYouLiveLongEnoughGold
	closetext
	end
	
ELIF DEF(_SILVER)
	writetext SometimesYouLiveLongEnoughSilver
	waitbutton
	closetext
	end
ENDC
	
AlloyOldCaptainNoStory:
	writetext AlloyOldCaptainsHouseCaptainAnotherTime
	waitbutton
	closetext
	end
	
CaptainWalksAroundPlayerMovement:
	step LEFT
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end
	
CaptainWalksOutMovement:
	step DOWN
	step DOWN
	step LEFT
	step DOWN
	step DOWN
	step_end
	
SometimesYouLiveLongEnoughGold:
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

SometimesYouLiveLongEnoughSilver:
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
	para "If LUGIA returned,"
	line "anything is"
	cont "possible."
	done

AlloyOldCaptainHoOhStoryText:
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
	
	para "However, the ever-"
	line "growing malice,"
	cont "within the region"
	cont "made the bird grow"
	cont "restless."
	
	para "No longer com"
	line "-pelled to stay,"
	cont "the bird left…"
	
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
	cont "soon…"
	done
	
AlloyOldCaptainLugiaStoryText:
	text "Listen closely…"
	
	para "Many years ago,"
	line "NIHON was guarded"
	cont "by a noble bird,"
	cont "whose wings"
	cont "shimmerred with"
	cont "a color of silver."
	
	para "Legend tells it"
	line "nested at what is"
	cont "known as the"
	cont "WHIRL ISLAND."
	
	para "However, the lack"
	line "of respect for the"
	cont "ocean environment"
	cont "made the bird grow"
	cont "restless."
	
	para "No longer com-"
	line "pelled to stay,"
	cont "the bird left…"
	
	para "As it dived, its"
	line "song created many"
	cont "whirlpools."
	
	para "These whirlpools"
	line "kept the sea safe"
	cont "and clean from"
	cont "human actions."
	
	para "Three beasts were"
	line "tasked to keep"
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
	line "with a kind soul"
	cont "will return the"
	cont "bird."
	
	para "I feel we may be"
	line "upon that day"
	cont "soon…"
	done
	
HoOhAppearsText:
	text "C-could it be!?"
	
	para "The bird!"
	
	para "Come child, we"
	line "must make haste to"
	cont "the BRASS TOWER."
	
	para "The legend is"
	line "being realised!"
	done
	
LugiaAppearsText:
	text "C-could it be!?"
	
	para "The bird!"
	
	para "Come child, we"
	line "must make haste to"
	cont "the WHIRL ISLAND."
	
	para "The legend is"
	line "being realised!"
	done
	
AlloyOldCaptainsHouseCaptainAnotherTime:
	text "Another time,"
	line "then."
	done

AlloyOldCaptainsHouseCaptainText2:
	text "Do you want to"
	line "hear the story of"
	cont "the bird?"
	done
	
AlloyOldCaptainsHouseCaptainIntroText:
	text "One day I hope I"
	line "can experience the"
	para "conclusion of the"
	line "legend."
	done

AlloyOldCaptainsHouseCaptainEvilText:
	text "I sense an evil"
	line "presence looming"
	cont "over NIHON."
	para "Surely the bird"
	line "shall not return"
	cont "until it is gone."
	done
	
AlloyOldCaptainsHouseCaptainNoWaterfallText:
	text "The time could be"
	line "any day now, yet"
	para "I do not beleive"
	line "you are quite"
	para "ready yet."
	done

AlloyOldCaptainsHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, ALLOY_CITY, 9
	warp_event  5,  7, ALLOY_CITY, 9

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  6,  3, SPRITE_CAPTAIN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AlloyOldCaptainsHouseCaptainScript, EVENT_ALLOY_CAPTAIN_AND_TOWER_SAGES_GONE
