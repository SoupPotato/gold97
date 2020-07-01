	const_def 2 ; object constants
	const CIANWOODGYM_CHUCK
	const CIANWOODGYM_GYMGUY2
	const CIANWOODGYM_COOLTRAINER

CianwoodGym_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

CianwoodGymChuckScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_CHUCK
	iftrue .FightDone
	writetext ChuckIntroText1
	waitbutton
	closetext
	winlosstext ChuckLossText, 0
	loadtrainer CHUCK, CHUCK1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_CHUCK
	opentext
	writetext GetStormBadgeText
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_STORMBADGE
	setmapscene FUCHSIA_CITY, SCENE_FUCHSIA_CITY_IMPOSTER
	checkcode VAR_BADGES
;	scall CianwoodGymActivateRockets
.FightDone:
	checkevent EVENT_GOT_TM01_DYNAMICPUNCH
	iftrue .AlreadyGotTM
;	setevent EVENT_BEAT_BLACKBELT_YOSHI
;	setevent EVENT_BEAT_BLACKBELT_LAO
;	setevent EVENT_BEAT_BLACKBELT_NOB
;	setevent EVENT_BEAT_BLACKBELT_LUNG
	writetext ChuckExplainBadgeText
	buttonsound
	verbosegiveitem TM_THIEF
	iffalse .BagFull
	setevent EVENT_GOT_TM01_DYNAMICPUNCH
	writetext ChuckExplainTMText
	waitbutton
	closetext
	end

.AlreadyGotTM:
	writetext ChuckAfterText
	waitbutton
.BagFull:
	closetext
	end

;CianwoodGymActivateRockets:
;	ifequal 7, .RadioTowerRockets
;	ifequal 6, .GoldenrodRockets
;	end

.GoldenrodRockets:
	jumpstd goldenrodrockets

.RadioTowerRockets:
	jumpstd radiotowerrockets



CianwoodGymStatue:
	checkflag ENGINE_STORMBADGE
	iftrue .Beaten
	jumpstd gymstatue1
.Beaten:
	trainertotext CHUCK, CHUCK1, MEM_BUFFER_1
	jumpstd gymstatue2
	

CianwoodGymGuyScript2:
	faceplayer
	checkevent EVENT_BEAT_CHUCK
	iftrue .CianwoodGymGuyWinScript2
	opentext
	writetext CianwoodGymGuyText2
	waitbutton
	closetext
	end

.CianwoodGymGuyWinScript2:
	opentext
	writetext CianwoodGymGuyWinText2
	waitbutton
	closetext
	end
	

TrainerCooltrainermAaron:
	trainer COOLTRAINERM, AARON, EVENT_BEAT_COOLTRAINERM_AARON, CooltrainermAaronSeenText, CooltrainermAaronBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainermAaronAfterBattleText
	waitbutton
	closetext
	end

TrainerCooltrainerfLois:
	trainer COOLTRAINERF, LOIS, EVENT_BEAT_COOLTRAINERF_LOIS, CooltrainerfLoisSeenText, CooltrainerfLoisBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainerfLoisAfterBattleText
	waitbutton
	closetext
	end


TrainerCooltrainerfKelly:
	trainer COOLTRAINERF, KELLY, EVENT_BEAT_COOLTRAINERF_KELLY, CooltrainerfKellySeenText, CooltrainerfKellyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainerfKellyAfterBattleText
	waitbutton
	closetext
	end

;CianwoodGymMovement_ChuckChucksBoulder:
;	set_sliding
;	big_step LEFT
;	big_step UP
;	fast_jump_step RIGHT
;	remove_sliding
;	step_end


CooltrainerfKellySeenText:
	text "What do you see"
	line "when you open"
	para "your eyes in the"
	line "dark?"
	done

CooltrainerfKellyBeatenText:
	text "Fine. I lost."
	done

CooltrainerfKellyAfterBattleText:
	text "Where is the GYM"
	line "LEADER?"
	para "He lives in the"
	line "shadows, beyond"
	cont "what can be seen."
	done

CooltrainermAaronSeenText:
	text "Are you afraid"
	line "of the dark?"
	done

CooltrainermAaronBeatenText:
	text "Whew…"
	line "Good battle."
	done

CooltrainermAaronAfterBattleText:
	text "This GYM isn't"
	line "really that scary."
	para "The lights are"
	line "just turned off."
	done

CianwoodGymGuyText2:
	text "Hey, champ-in-the-"
	line "making!"
	para "It sure is dark in"
	line "here!"
	para "OKERA can be kind"
	line "of moody, and he"
	cont "likes it dark."
	para "But don't let his"
	line "age and behavior"
	cont "fool you."
	para "He's one tough"
	line "trainer!"
	done
	
CianwoodGymGuyWinText2:
	text "I knew you weren't"
	line "afraid of the"
	cont "dark!"
	done

ChuckIntroText1:
	text "Heh."
	para "You've traveled a"
	line "long way from"
	cont "home, haven't you?"
	para "You've experienced"
	line "a lot of new"
	cont "things."
	para "Met a lot of"
	line "people."
	para "Faced a lot of"
	line "challenges."
	para "…"
	para "But have you"
	line "faced the sheer"
	para "power that finds"
	line "its strength in"
	cont "the dark?"
	para "DARK type #MON"
	line "possess a power"
	cont "like none other."
	para "Even in the short"
	line "time that I've"
	cont "been a GYM LEADER,"
	para "I've learned much"
	line "about what they"
	cont "are capable of."
	para "I will show you"
	line "now."
	done


ChuckLossText:
	text "Hm. I lost."

	para "This is"
	line "unexpected."
	para "But it proves you"
	line "are worthy to earn"
	cont "DUSKBADGE."
	done

GetStormBadgeText:
	text "<PLAYER> received"
	line "DUSKBADGE."
	done

ChuckExplainBadgeText:
	text "DUSKBADGE makes"
	line "all #MON up to"

	para "L70 obey, even"
	line "traded ones."

	para "Your #MON can"
	line "now use ROCK SMASH"

	para "when you're not in"
	line "a battle."

	para "Here, have this as"
	line "well."
	done

ChuckExplainTMText:
	text "That move is"
	line "THIEF."

	para "It causes damage,"
	line "and also can steal"
	para "an opponent's held"
	line "item."
	done

ChuckAfterText:
	text "That was a good"
	line "battle."
	para "Your challenge was"
	line "worth my time."
	done

CianwoodGym_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  6, 35, FUCHSIA_CITY, 3
	warp_event  7, 35, FUCHSIA_CITY, 12

	db 0 ; coord events

	db 2 ; bg events
	bg_event  5, 33, BGEVENT_READ, CianwoodGymStatue
	bg_event  8, 33, BGEVENT_READ, CianwoodGymStatue

	db 4 ; object events
	object_event  0,  1, SPRITE_CHUCK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, CianwoodGymChuckScript, -1
	object_event  9, 33, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CianwoodGymGuyScript2, -1
	object_event  8, 17, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerCooltrainermAaron, -1
	object_event  8,  1, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerCooltrainerfKelly, -1

