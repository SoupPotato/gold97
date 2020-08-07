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
	writetext RadioTower6fGentlemanText
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
	opentext
	writetext GiovanniGreeting
	waitbutton
	closetext
	applymovement RADIOTOWER6F_GIOVANNI, GiovanniToPlayer
	opentext
	writetext GiovanniSpeech
	waitbutton
	closetext
	winlosstext GiovanniWinText, GiovanniLossText
	loadtrainer BROCK, BROCK1
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	turnobject RADIOTOWER6F_GIOVANNI, DOWN
	opentext
	writetext GiovanniAfterText
	waitbutton
	closetext
	applymovement RADIOTOWER6F_GIOVANNI, GiovanniLeaving
	turnobject PLAYER, UP
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
	setmapscene WESTPORT_CITY, SCENE_GOLDENROD_CITY_RIVAL
	end
	
TwoStepsToGiovanni:
	step DOWN
	step DOWN
	step DOWN
	turn_head RIGHT
	step_end
	
GiovanniToPlayer:
	step UP
	step LEFT
	step LEFT
	step DOWN
	turn_head LEFT
	step_end
	
GiovanniLeaving:
	step UP
	step LEFT
	step UP
	turn_head DOWN
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
	step RIGHT
	step_end
	
DirectorThanksText:
	text "Oh, dear!"
	
	para "Where have those"
	line "nasty TEAM ROCKET"
	cont "members gone?"
	
	para "I was being held"
	line "captive in the"
	cont "basement..."
	
	para "but suddenly those"
	line "goons took off!"

	para "My poor CLEFABLE"
	line "was left all"
	cont "alone!"
	
	para "I must give you"
	line "something to show"
	cont "my gratitude!"
	
	para "Please accept"
	line "this!"
	done
	
DirectorThanksText2:
	text "With that move,"
	line "your #MON can"
	cont "break rocks you"
	cont "may find blocking"
	cont "certain paths."
	
	para "I'm sure you'd"
	line "get more use out"
	cont "of it than me!"
	
	para "I don't ever want"
	line "to leave this"
	cont "office again!"
	done
	
GiovanniWinText:
	text "No! Not again!"
	
	para "My plans..."
	
	para "My efforts..."
	
	para "Was it all for"
	line "naught!?"
	done
	
GiovanniLossText:
	text "Heh."
	done
	
GiovanniGreeting:
	text "GIOVANNI: Ah."
	para "You must be one of"
	line "the two children"
	cont "I've been hearing"
	cont "about."
	done
	
GiovanniSpeech:	
	text "You must be very"
	line "brave..."
	
	para "...or very"
	line "foolish."
	
	para "I am the leader of"
	line "TEAM ROCKET."
	
	para "I have endured"
	line "much to restore"
	cont "my organization to"
	cont "it's former glory."
	
	para "And you, remind me"
	line "of another certain"
	cont "child I once"
	cont "faced."

	para "…"
	
	para "It truly angers"
	line "me."

	para "I know exactly"
	line "what your flawed"
	cont "intentions are."
	
	para "You wish to stop"
	line "my plans."
	
	para "Well I won't allow"
	line "it."
	
	para "Not again!"
	
	para "I, GIOVANNI the"
	line "mighty LEADER of"
	cont "TEAM ROCKET,"	
	cont "will crush you!"	
	done
	
GiovanniAfterText:
	text "T-this can't be"
	line "happening!"
	
	para "I have failed not"
	line "once,"
	
	para "but TWICE!"
	
	para "Twice, I have"
	line "tried to conquer"	
	cont "the world..."
	
	para "Twice, I have"
	line "failed..."	
	
	para "And both times to"
	line "a child no less!"
	
	para "How can I possibly"
	line "face my followers"
	cont "like this?"
	done
	
GiovanniExitingText:
	text "Very well..."
	
	para "You have bested"
	line "me."
	
	para "But TEAM ROCKET"
	line "is not over..."	
	
	para "We will return"
	line "someday."	
	
	para "And my plans will"
	line "succeed."
	
	para "Until that day"
	line "comes..."
	
	para "Prepare yourself"
	line "for our next"
	cont "meeting!"	
	done
	
Executive6FSeenText:
	text "EXECUTIVE: No!"

	para "You will go no"
	line "further!"
	
	para "Brats like you do"
	line "not deserve an"
	cont "audience with our"
	cont "leader!"
	
	para "This ends here!"
	done
	
Executive6FBeatenText:
	text "No!"
	
	para "GIOVANNI,"
	line "forgive me!"
	done
	
Executive6FAfterBattleText:
	text "…"
	
	para "I have no anger"
	line "left for you."
	
	para "If you would like"
	line "to see GIOVANNI,"
	cont "he's right over"
	cont "there."
	done
	
RadioTower6FDirectorsOfficeSignText:
	text "6F DIRECTOR'S"
	line "   OFFICE"
	done
	
RadioTower6FClefableText:
	text "CLEFABLE:"
	line "Cleffa-fa!"
	done

RadioTower6fTeacherText:
	text "This is the office"
	line "of the DIRECTOR"
	para "in charge of this"
	line "whole operation!"
	done
	
RadioTower6fTeacherTextTakeover:
	text "Where did they do"
	line "with the DIRECTOR?"
	
	para "I hope he's ok..."
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
	object_event  6,  6, SPRITE_GENTLEMAN, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, RadioTower6fGentleman, EVENT_GOLDENROD_CITY_CIVILIANS
	object_event  1,  6, SPRITE_FAIRY, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, RadioTower6fClefable, EVENT_GOLDENROD_CITY_CIVILIANS
	object_event  0,  5, SPRITE_FAIRY, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, RadioTower6fClefableTakeover, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event  6,  6, SPRITE_BROCK, SPRITEMOVEDATA_STANDING_LEFT, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, RadioTower6fGiovanni, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event  2,  2, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_RIGHT, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 1, TrainerExecutive6F, EVENT_RADIO_TOWER_ROCKET_TAKEOVER

