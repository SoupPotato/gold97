	const_def 2 ; object constants
	const RADIOTOWER6F_TEACHER
	const RADIOTOWER6F_GENTLEMAN
	const RADIOTOWER6F_CLEFABLE
	const RADIOTOWER6F_CLEFABLE_SCARED
	const RADIOTOWER6F_GIOVANNI
	const RADIOTOWER6F_EXECUTIVE

RadioTower6F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	
RadioTower6fClefable:	
	faceplayer
	opentext
	writetext RadioTower6FClefableText
	cry CLEFABLE
	waitbutton
	closetext
	end
	
RadioTower6fClefableTakeover:
	checkflag ENGINE_ROCKETS_IN_RADIO_TOWER
	iffalse .NormalClefableTemp
	faceplayer
	opentext
	writetext ClefableScaredText
	cry CLEFABLE
	waitbutton
	writetext ClefableScaredText2
	waitbutton
	closetext
	end
	
.NormalClefableTemp
	faceplayer
	opentext
	writetext RadioTower6FClefableText
	cry CLEFABLE
	waitbutton
	closetext
	end

RadioTower6fGentleman:
	faceplayer
	opentext
	checkflag ENGINE_ROCKETS_IN_RADIO_TOWER
	iftrue .MidRocketTakeover6fGentleman
	writetext RadioTower6fGentlemanText
	waitbutton
	closetext
	end
.MidRocketTakeover6fGentleman
	writetext RadioTower6fGentlemanTextTakeover
	waitbutton
	closetext
	end
	

RadioTower6fTeacher:
	faceplayer
	opentext
	checkflag ENGINE_ROCKETS_IN_RADIO_TOWER
	iftrue .MidRocketTakeover6fTeacher
	writetext RadioTower6fTeacherText
	waitbutton
	closetext
	end
.MidRocketTakeover6fTeacher
	writetext RadioTower6fTeacherTextTakeover
	waitbutton
	closetext
	end
	
RadioTower6FDirectorsOfficeSign:
	jumptext RadioTower6FDirectorsOfficeSignText
	
RadioTower6fGiovanni:
	end
	

TrainerExecutive6F:
	trainer EXECUTIVEM, EXECUTIVEM_3, EVENT_BEAT_ROCKET_EXECUTIVEM_3, Executive6FSeenText, Executive6FBeatenText, 0, .Script

.Script:
;	endifjustbattled
	opentext
	writetext Executive6FAfterBattleText
	waitbutton
	closetext
	end
	
GiovanniEncounter:
	special FadeOutMusic
	applymovement PLAYER, TwoStepsToGiovanni
	pause 15
	turnobject RADIOTOWER6F_GIOVANNI, DOWN
	opentext
	writetext GiovanniGreeting
	waitbutton
	closetext
	winlosstext GiovanniWinText, GiovanniLossText
	loadtrainer BROCK, BROCK1
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	opentext
	writetext GiovanniExitingText
	waitbutton
	closetext
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
;	disappear RADIOTOWER6F_CLEFABLE_SCARED
	disappear RADIOTOWER6F_GIOVANNI
	disappear RADIOTOWER6F_EXECUTIVE
;	appear RADIOTOWER6F_CLEFABLE
	pause 15
	special FadeInQuickly
	pause 30
	setevent EVENT_CLEARED_RADIO_TOWER
	clearflag ENGINE_ROCKETS_IN_RADIO_TOWER
	setevent EVENT_GOLDENROD_CITY_ROCKET_TAKEOVER
	setevent EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	clearevent EVENT_GOLDENROD_CITY_CIVILIANS
	clearevent EVENT_RADIO_TOWER_CIVILIANS_AFTER
	setevent EVENT_TEAM_ROCKET_DISBANDED
	clearevent EVENT_ILEX_FOREST_FARFETCHD
	special PlayMapMusic
	moveobject RADIOTOWER6F_GENTLEMAN, 3, 2
	appear RADIOTOWER6F_GENTLEMAN
	applymovement RADIOTOWER6F_GENTLEMAN, DirectorWalks
	showemote EMOTE_SHOCK, RADIOTOWER6F_GENTLEMAN, 15
	applymovement RADIOTOWER6F_GENTLEMAN, DirectorWalks2
	applymovement PLAYER, PlayerWalksToDirector
	opentext
	writetext DirectorThanksText
	buttonsound
	verbosegiveitem HM_ROCK_SMASH
	setevent EVENT_GOT_TM08_ROCK_SMASH
	writetext DirectorThanksText2
	waitbutton
	closetext
	setscene SCENE_RADIOTOWER6F_NOTHING; this scene is also set when you meet silver right at the beginning, then re set as part of the jump to radiotowerrockets
	setmapscene GOLDENROD_CITY, SCENE_GOLDENROD_CITY_RIVAL
	end
	
TwoStepsToGiovanni:
	step DOWN
	step DOWN
	step LEFT
	step DOWN
	step DOWN
	step RIGHT
	turn_head UP
	step_end
	
DirectorWalks:
	step DOWN
	step DOWN
	step_end
	
DirectorWalks2:
	step DOWN
	step RIGHT
	step RIGHT
	step RIGHT
	step DOWN
	turn_head LEFT
	step_end
	
PlayerWalksToDirector:
	step UP
	step RIGHT
	step_end
	
DirectorThanksText:
	text "Oh, dear!"
	para "Where have those"
	line "nasty TEAM ROCKET"
	cont "members gone?"
	para "Have they left?"
	para "Hello, kid!"
	line "Did you get rid"
	cont "of them?"
	para "Oh, you did?"
	line "I am forever"
	cont "grateful!"
	para "They had kicked me"
	line "out of my office,"
	para "and my poor"
	line "CLEFABLE was left"
	cont "behind!"
	para "I had no way to"
	line "battle my way"
	cont "back up!"
	para "I must give you"
	line "something to show"
	cont "my gratitude!"
	para "Here, take this!"
	done
	
DirectorThanksText2:
	text "With that move,"
	line "your #MON can"
	para "break rocks you"
	line "may find blocking"
	cont "certain locations."
	para "I'm sure you'd"
	line "get more use out"
	cont "of it than me!"
	para "I don't ever want"
	line "to leave this"
	cont "office again!"
	done
	
GiovanniExitingText:
	text "I tell you now."
	para "The world has not"
	line "seen the end of"
	cont "TEAM ROCKET."
	para "We rose from the"
	line "ashes before, and"
	para "one day, we shall"
	line "do it again!"
	done
	
GiovanniWinText:
	text "But how!?"
	done
	
GiovanniLossText:
	text "Heh."
	done
	
GiovanniGreeting:
	text "Ah."
	para "I assume you are"
	line "one of the two"
	para "children I've been"
	line "hearing about."
	para "You must be the"
	line "more courageous"
	para "one if you've made"
	line "your way to me."
	para "Are you <RIVAL>?"
	para "No, you must be"
	line "<PLAY_G>."
	para "Well, <PLAY_G>,"
	line "do you understand"
	para "why you stand here"
	line "before me?"
	para "I know why."
	para "It is because you"
	line "care for #MON"
	para "from deep within"
	line "your heart."
	para "Most might call"
	line "that admirable."
	para "…"
	para "I'd call it"
	line "foolish."
	para "#MON possess a"
	line "power far greater"
	para "than man could"
	line "ever hope to have."
	para "And it is the goal"
	line "of an organization"
	para "such as TEAM"
	line "ROCKET to harness"
	para "that power for its"
	line "full potential."
	para "If one can control"
	line "#MON, one can"
	cont "control the world."
	para "But enough talk."
	para "Prove to me that"
	line "you are a worthy"
	para "opponent, or do"
	line "yourself a favor,"
	para "and GET OUT OF MY"
	line "WAY."
	done
	

	
Executive6FSeenText:
	text "EXECUTIVE: NO!"
	para "NEVER AGAIN!"
	para "You will go no"
	line "further!"
	para "Brats like you do"
	line "not deserve an"
	para "audience with our"
	line "leader!"
	para "You are going down"
	line "RIGHT NOW!"
	done
	
Executive6FBeatenText:
	text "…"
	done
	
Executive6FAfterBattleText:
	text "…"
	para "I have no anger"
	line "left for you."
	para "If you would like"
	line "to see GIOVANNI,"
	para "he's right over"
	line "there."
	done
	
RadioTower6FDirectorsOfficeSignText:
	text "6F DIRECTOR'S"
	line "   OFFICE"
	done
	
RadioTower6FClefableText:
	text "CLEFABLE:"
	line "Cleffa-fa!"
	done

ClefableScaredText:
	text "CLEFABLE:"
	line "Cl..cleffa?"
	done
	
ClefableScaredText2:
	text "It seems to be"
	line "frightened…"
	para "Also there's no"
	line "way to talk to"
	para "the scared cleffa,"
	line "so you never see"
	cont "this text…"
	done

RadioTower6fTeacherText:
	text "This is the office"
	line "of the DIRECTOR"
	para "in charge of this"
	line "whole operation!"
	done
	
RadioTower6fTeacherTextTakeover:
	text "Where'd the"
	line "DIRECTOR go?"
	para "I hope he's okay!"
	done

RadioTower6fGentlemanText:
	text "I started the JOPM"
	line "RADIO COMPANY to"
	para "share my love of"
	line "#MON!"
	para "I hope people and"
	line "#MON alike"
	cont "enjoy our shows."
	done
	
RadioTower6fGentlemanTextTakeover:
	text "I am missing right"
	line "now, so you never"
	cont "see this text"
	done
	

RadioTower6F_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  7,  0, RADIO_TOWER_5F, 2

	db 1 ; coord events
	coord_event  3,  3, SCENE_DEFAULT, GiovanniEncounter

	db 1 ; bg events
	bg_event  3,  0, BGEVENT_READ, RadioTower6FDirectorsOfficeSign

	db 6 ; object events
	object_event  6,  2, SPRITE_TEACHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, RadioTower6fTeacher, -1
	object_event  6,  6, SPRITE_GENTLEMAN, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, RadioTower6fGentleman, EVENT_GOLDENROD_CITY_CIVILIANS
	object_event  1,  6, SPRITE_FAIRY, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, RadioTower6fClefable, EVENT_GOLDENROD_CITY_CIVILIANS
	object_event  0,  5, SPRITE_FAIRY, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, RadioTower6fClefableTakeover, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event  3,  6, SPRITE_BROCK, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, RadioTower6fGiovanni, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event  2,  2, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_RIGHT, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, TrainerExecutive6F, EVENT_RADIO_TOWER_ROCKET_TAKEOVER

