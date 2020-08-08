	const_def 2 ; object constants
	const BATTLECLUB_BOUNCER

KantoBattleClub1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	
EntranceCheckClub:
	checkevent EVENT_GOT_PASS_FROM_COPYCAT
	iffalse .GivePass
	checkitem PASS
	iffalse .NoPass
	checkflag ENGINE_MT_MOON_SQUARE_CLEFAIRY
	iftrue .AlreadyApproved
	turnobject PLAYER, LEFT
	turnobject BATTLECLUB_BOUNCER, RIGHT
	jump BouncerScript2
	end
	
.AlreadyApproved
	end
	
.NoPass
	turnobject PLAYER, LEFT
	turnobject BATTLECLUB_BOUNCER, RIGHT
	opentext
	writetext NoPassText
	waitbutton	
	closetext
	applymovement PLAYER, NoEntryAllowed
	end
	
.GivePass
	turnobject PLAYER, LEFT
	turnobject BATTLECLUB_BOUNCER, RIGHT
	jump GivePassFullScript
	
GivePassFullScript:
	faceplayer
	opentext
	writetext PassGiveText
	waitbutton
	verbosegiveitem PASS
	closetext
	setevent EVENT_GOT_PASS_FROM_COPYCAT
	checkcode VAR_FACING
	ifequal LEFT, .FullSceneTime
	end
	
.FullSceneTime
	jump EntranceCheckClub
	end

BouncerScript:
	checkevent EVENT_GOT_PASS_FROM_COPYCAT
	iffalse .GivePass2
	checkitem PASS
	iffalse .NoPass2
	checkflag ENGINE_MT_MOON_SQUARE_CLEFAIRY
	iftrue .AlreadyApproved2
	faceplayer
	jump BouncerScript2
	end
	
.GivePass2
	jump GivePassFullScript
	
.NoPass2
	faceplayer
	opentext
	writetext NoPassText
	waitbutton	
	closetext
	end
	
.AlreadyApproved2
	faceplayer
	opentext
	writetext AlreadyApprovedText
	waitbutton
	closetext
	end
	
BouncerScript2:
	opentext
	writetext BouncerChecksYou
	waitbutton
	closetext
	setflag ENGINE_MT_MOON_SQUARE_CLEFAIRY
	checkcode VAR_WEEKDAY
	ifequal MONDAY, .MondayBC
	ifequal TUESDAY, .TuesdayBC
	ifequal WEDNESDAY, .WednesdayBC
	ifequal THURSDAY, .ThursdayBC
	ifequal FRIDAY, .FridayBC
	ifequal SATURDAY, .SaturdayBC
.SundayBC
	clearevent EVENT_SWITCH_1
	setevent EVENT_SWITCH_2
	setevent EVENT_SWITCH_3
	setevent EVENT_SWITCH_4
	setevent EVENT_SWITCH_5
	setevent EVENT_SWITCH_6
	setevent EVENT_SWITCH_7
	end
	
.MondayBC
	setevent EVENT_SWITCH_1
	clearevent EVENT_SWITCH_2
	setevent EVENT_SWITCH_3
	setevent EVENT_SWITCH_4
	setevent EVENT_SWITCH_5
	setevent EVENT_SWITCH_6
	setevent EVENT_SWITCH_7
	end
	
.TuesdayBC
	setevent EVENT_SWITCH_1
	setevent EVENT_SWITCH_2
	clearevent EVENT_SWITCH_3
	setevent EVENT_SWITCH_4
	setevent EVENT_SWITCH_5
	setevent EVENT_SWITCH_6
	setevent EVENT_SWITCH_7
	end
	
.WednesdayBC
	setevent EVENT_SWITCH_1
	setevent EVENT_SWITCH_2
	setevent EVENT_SWITCH_3
	clearevent EVENT_SWITCH_4
	setevent EVENT_SWITCH_5
	setevent EVENT_SWITCH_6
	setevent EVENT_SWITCH_7
	end
	
.ThursdayBC
	setevent EVENT_SWITCH_1
	setevent EVENT_SWITCH_2
	setevent EVENT_SWITCH_3
	setevent EVENT_SWITCH_4
	clearevent EVENT_SWITCH_5
	setevent EVENT_SWITCH_6
	setevent EVENT_SWITCH_7
	end
	
.FridayBC
	setevent EVENT_SWITCH_1
	setevent EVENT_SWITCH_2
	setevent EVENT_SWITCH_3
	setevent EVENT_SWITCH_4
	setevent EVENT_SWITCH_5
	clearevent EVENT_SWITCH_6
	setevent EVENT_SWITCH_7
	end
	
.SaturdayBC
	setevent EVENT_SWITCH_1
	setevent EVENT_SWITCH_2
	setevent EVENT_SWITCH_3
	setevent EVENT_SWITCH_4
	setevent EVENT_SWITCH_5
	setevent EVENT_SWITCH_6
	clearevent EVENT_SWITCH_7
	end
	
NoEntryAllowed:
	step DOWN
	step_end
	
NoPassText:
	text "I'm sorry, but no"
	line "one can enter"
	para "without a BATTLE"
	line "PASS."
	done

PassGiveText:
	text "Hello and welcome"
	line "to the KANTO"
	cont "BATTLE CLUB!"
	para "This is a high-"
	line "tier establishment"
	para "for serious"
	line "trainers!"
	para "And judging by how"
	line "many BADGEs you"
	para "have, I can tell"
	line "you're quite the"
	cont "serious trainer!"
	para "This establishment"
	line "is members-only."
	para "And I'm offering"
	line "you membership!"
	done

AlreadyApprovedText:
	text "Go ahead in for"
	line "the day!"
	done
	
BouncerChecksYou:
	text "Ah, a BATTLE PASS!"
	line "Welcome, member!"
	done

KantoBattleClub1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  4,  7, KANTO_REGION, 23
	warp_event  5,  7, KANTO_REGION, 23
	warp_event  5,  0, KANTO_BATTLE_CLUB_B1F, 1

	db 1 ; coord events
	coord_event  5,  1, SCENE_DEFAULT, EntranceCheckClub

	db 0 ; bg events

	db 1 ; object events
	object_event  4,  1, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, BouncerScript, -1
